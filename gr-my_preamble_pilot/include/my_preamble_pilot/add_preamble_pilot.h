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


#ifndef INCLUDED_MY_PREAMBLE_PILOT_ADD_PREAMBLE_PILOT_H
#define INCLUDED_MY_PREAMBLE_PILOT_ADD_PREAMBLE_PILOT_H

#include <my_preamble_pilot/api.h>
#include <gnuradio/block.h>

namespace gr {
  namespace my_preamble_pilot {

    /*!
     * \brief <+description of block+>
     * \ingroup my_preamble_pilot
     *
     */
    class MY_PREAMBLE_PILOT_API add_preamble_pilot : virtual public gr::block
    {
     public:
      typedef boost::shared_ptr<add_preamble_pilot> sptr;

      /*!
       * \brief Return a shared_ptr to a new instance of my_preamble_pilot::add_preamble_pilot.
       *
       * To avoid accidental use of raw pointers, my_preamble_pilot::add_preamble_pilot's
       * constructor is in a private implementation
       * class. my_preamble_pilot::add_preamble_pilot::make is the public interface for
       * creating new instances.
       */
      static sptr make(int frame_width);
    };

  } // namespace my_preamble_pilot
} // namespace gr

#endif /* INCLUDED_MY_PREAMBLE_PILOT_ADD_PREAMBLE_PILOT_H */

