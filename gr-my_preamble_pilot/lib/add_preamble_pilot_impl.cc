/* -*- c++ -*- */
/* 
 * Copyright 2018 <+YOU OR YOUR COMPANY+>.
 * 
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 * 
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <gnuradio/io_signature.h>
#include "add_preamble_pilot_impl.h"
#include <fstream>
#define pilot 1
#define data 0
#define PREAMBLE 2

namespace gr {
  namespace my_preamble_pilot {

    add_preamble_pilot::sptr
    add_preamble_pilot::make(int frame_width)
    {
      return gnuradio::get_initial_sptr
        (new add_preamble_pilot_impl(frame_width));
    }

    /*
     * The private constructor
     */
    add_preamble_pilot_impl::add_preamble_pilot_impl(int frame_width)
      : gr::block("add_preamble_pilot",
                  gr::io_signature::make(1, 1, sizeof(gr_complex)),
                  gr::io_signature::make(1, 1, sizeof(gr_complex)))
    {
        pilot_length=128;
        pilot_symbol[0]=gr_complex(1,-1);
        pilot_symbol[1]=gr_complex(-1,1);
        pilot_symbol[2]=gr_complex(1,1);
        pilot_symbol[3]=gr_complex(-1,-1);
        symbol_length=frame_width;
        state=PREAMBLE;

        preamble_length=64;
        preamble_sent=0;
        // GOLD Sequence for preamble
        int temp[64]={1 , 0 , 0 , 1 , 1 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 ,
                      1 , 1 , 0 , 1 , 0 , 0 , 0 , 1 , 1 , 1 , 1 , 1 , 0 , 1 , 0 , 0 , 1 , 1 , 1 ,
                      0 , 0 , 0 , 0 , 1 , 1 , 0 , 1 , 1 , 1 , 1 , 1 , 1 , 0 , 0 , 1 , 0 , 0 , 1 ,
                      1 , 1 , 0 , 1 , 1 , 1 , 1};
        for(int i=0;i<64;i++)
            preamble[i] = 2*temp[i] - 1;


        pilots_sent=0;
        symbol_sent=0;
    }

    /*
     * Our virtual destructor.
     */
    add_preamble_pilot_impl::~add_preamble_pilot_impl()
    {
    }

    void
    add_preamble_pilot_impl::forecast (int noutput_items, gr_vector_int &ninput_items_required)
    {
      /* <+forecast+> e.g. ninput_items_required[0] = noutput_items */
        ninput_items_required[0] = noutput_items;
    }

      void
      add_preamble_pilot_impl::send_preamble(int &generated_outputs, const int noutput_items, gr_complex *out)
      {
          // as long as we have space in output buffer we send symbols
          for (; generated_outputs < noutput_items; generated_outputs++){
              if (preamble_sent == preamble_length){
                  state = pilot;	// now it is time to send pilots
                  preamble_sent = 0;
                  break;
              }
              //  sequence of 1 and -1 is converted to 1+j1 and -1-j1
              out[generated_outputs] = gr_complex(preamble[preamble_sent],preamble[preamble_sent]);
              preamble_sent++;
          }
          return;
      }

      void add_preamble_pilot_impl::send_pilot(int &generated_outputs, const int noutput_items, gr_complex *out)
      {
          for(;generated_outputs<noutput_items;generated_outputs++)
          {
              if (pilots_sent==pilot_length)
              {
                  if(state==pilot)
                      state=data;
                  pilots_sent=0;
                  break;
              }
              if(state==pilot)
              {
                  out[generated_outputs]=pilot_symbol[pilots_sent%4];
                  pilots_sent++;
              }

          }
          return;
      }

    int
    add_preamble_pilot_impl::general_work (int noutput_items,
                       gr_vector_int &ninput_items,
                       gr_vector_const_void_star &input_items,
                       gr_vector_void_star &output_items)
    {
        const gr_complex *in = (const gr_complex *) input_items[0];
        gr_complex *out = (gr_complex *) output_items[0];

        int generated_outputs=0;
        int consumed_inputs=0;

        if(state==PREAMBLE)
        {
            send_preamble(generated_outputs,noutput_items,out);
        }
        if(state==pilot)
            send_pilot(generated_outputs,noutput_items,out);
        if(state==data)
        {
            for(;generated_outputs<noutput_items;generated_outputs++)
            {
                if(symbol_sent==symbol_length)
                {
                    symbol_sent=0;
                    state=PREAMBLE;
                    break;
                }
                int i=consumed_inputs;
                int o=generated_outputs;

                out[o]=in[i];
                symbol_sent++;
                consumed_inputs++;

            }
        }

        /*std::ofstream openfile("/home/wzy/result/add_data.txt", std::ios::app);
        openfile<<"noutput_items="<<noutput_items<<std::endl;
        openfile<<"ninput_items="<<ninput_items[0]<<std::endl;
        openfile<<"consumed_inputs="<<consumed_inputs<<std::endl;
        openfile<<"generated_outputs="<<generated_outputs<<std::endl;
        openfile.close();*/
        // Do <+signal processing+>
        // Tell runtime system how many input items we consumed on
        // each input stream.

        consume_each (consumed_inputs);

        // Tell runtime system how many output items we produced.
        return generated_outputs;
    }

  } /* namespace my_preamble_pilot */
} /* namespace gr */

