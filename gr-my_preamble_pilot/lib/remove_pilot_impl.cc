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
#include "remove_pilot_impl.h"
#include <fstream>
#include <time.h>
#define pilot 1
#define data 0

namespace gr {
  namespace my_preamble_pilot {

    remove_pilot::sptr
    remove_pilot::make(int frame_width)
    {
      return gnuradio::get_initial_sptr
        (new remove_pilot_impl(frame_width));
    }

    /*
     * The private constructor
     */
    remove_pilot_impl::remove_pilot_impl(int frame_width)
      : gr::block("remove_pilot",
                  gr::io_signature::make(1, 1, sizeof(gr_complex)),
                  gr::io_signature::make(1, 1, sizeof(gr_complex)))
    {
        pilot_length=128;
        pilot_symbol[0]=gr_complex(1,-1);
        pilot_symbol[1]=gr_complex(1,-1);
        pilot_symbol[2]=gr_complex(1,1);
        pilot_symbol[3]=gr_complex(-1,-1);
        symbol_length=frame_width;
        state=pilot;

        pilots_received=0;
        symbol_received=0;
        rcvd_pilot=gr_complex(0,0);
        h=0;
        norm=h*conj(h);

        time_t timep;
        time(&timep);
        char tmp[64];
        strftime(tmp, sizeof(tmp),"%Y-%m-%d %H:%M:%S",localtime(&timep));
        std::ofstream openfile("/home/wzy/grc_result/channel_response.txt",std::ios::app);
        openfile<<"start time is:  "<<tmp<<std::endl;
        openfile.close();
    }

    /*
     * Our virtual destructor.
     */
    remove_pilot_impl::~remove_pilot_impl()
    {
    }

    void
    remove_pilot_impl::forecast (int noutput_items, gr_vector_int &ninput_items_required)
    {
      /* <+forecast+> e.g. ninput_items_required[0] = noutput_items */
        ninput_items_required[0]=noutput_items;
    }

      void
      remove_pilot_impl::receive_piloit(int &consumed_inputs, const int noutput_items, const gr_complex *in)
      {
          for(;consumed_inputs<noutput_items;consumed_inputs++)
          {
              if(pilots_received==pilot_length)
              {
                  //std::cout<<"已移除导频"<<std::endl;
                  pilots_received=0;
                  if(state==pilot)
                  {
                      state=data;
                  }
                  rcvd_pilot=rcvd_pilot/gr_complex(pilot_length,0);
                  h=rcvd_pilot;
                  std::ofstream openfile("/home/wzy/grc_result/channel_response.txt",std::ios::app);
                  openfile<<"channel response is:  "<<h<<std::endl;
                  openfile.close();
                  norm=h*conj(h);
                  rcvd_pilot=gr_complex(0,0);
                  break;
              }
              rcvd_pilot+=in[consumed_inputs]/pilot_symbol[pilots_received%4];
              pilots_received++;
              //std::cout<<"现在移除导频"<<std::endl;
          }
          return;
      }

    int
    remove_pilot_impl::general_work (int noutput_items,
                       gr_vector_int &ninput_items,
                       gr_vector_const_void_star &input_items,
                       gr_vector_void_star &output_items)
    {
        const gr_complex *in = (const gr_complex *) input_items[0];
        gr_complex *out = (gr_complex *) output_items[0];

        int generated_outputs=0;
        int consumed_inputs=0;
        if(state==pilot)
            this->receive_piloit(consumed_inputs,noutput_items,in);
        if(state==data)
        {
            for (; consumed_inputs <noutput_items ; consumed_inputs++)
            {
                if(symbol_received==symbol_length)
                {
                    //std::cout<<"数据已发送完"<<std::endl;
                    symbol_received=0;
                    state=pilot;
                    break;
                }
                int i=consumed_inputs;
                int o=generated_outputs;

                out[o]=in[i];
                generated_outputs++;
                symbol_received++;
                //std::cout<<"现在正在发送数据"<<std::endl;
            }
        }


        /*std::ofstream openfile("/home/wzy/result/remove_data.txt",std::ios::app);
        openfile<<"noutput_items="<<noutput_items<<std::endl;
        openfile<<"ninput_items="<<ninput_items[0]<<std::endl;
        openfile<<"consumed_inputs="<<consumed_inputs<<std::endl;
        openfile<<"generated_outputs="<<generated_outputs<<std::endl;
        openfile.close();*/
        /*std::cout<<"noutput_items="<<noutput_items<<std::endl;
        std::cout<<"ninput_items="<<ninput_items[0]<<std::endl;
        std::cout<<"consumed_inputs="<<consumed_inputs<<std::endl;
        std::cout<<"generated_outputs="<<generated_outputs<<std::endl;*/
        // Do <+signal processing+>
        // Tell runtime system how many input items we consumed on
        // each input stream.
        consume_each (consumed_inputs);

        // Tell runtime system how many output items we produced.
        return generated_outputs;
    }

  } /* namespace my_preamble_pilot */
} /* namespace gr */

