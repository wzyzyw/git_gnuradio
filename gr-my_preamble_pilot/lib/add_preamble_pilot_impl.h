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

#ifndef INCLUDED_MY_PREAMBLE_PILOT_ADD_PREAMBLE_PILOT_IMPL_H
#define INCLUDED_MY_PREAMBLE_PILOT_ADD_PREAMBLE_PILOT_IMPL_H

#include <my_preamble_pilot/add_preamble_pilot.h>

namespace gr {
  namespace my_preamble_pilot {

    class add_preamble_pilot_impl : public add_preamble_pilot
    {
     private:
      // Nothing to declare in this block.
        int pilot_length;
        gr_complex pilot_symbol[4];
        int pilots_sent;
        int symbol_length;
        int symbol_sent;
        int state;
        int preamble_length;
        int preamble[64];
        int preamble_sent;


        void send_pilot(int &generated_outputs,const int noutput_items,gr_complex *out);

        void send_preamble(int &generated_outputs, const int noutput_items,
                           gr_complex *out);

     public:
      add_preamble_pilot_impl(int frame_width);
      ~add_preamble_pilot_impl();

      // Where all the action really happens
      void forecast (int noutput_items, gr_vector_int &ninput_items_required);

      int general_work(int noutput_items,
           gr_vector_int &ninput_items,
           gr_vector_const_void_star &input_items,
           gr_vector_void_star &output_items);
    };

  } // namespace my_preamble_pilot
} // namespace gr

#endif /* INCLUDED_MY_PREAMBLE_PILOT_ADD_PREAMBLE_PILOT_IMPL_H */

