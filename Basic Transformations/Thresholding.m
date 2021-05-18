## Copyright (C) 2021 Ahmed Sayed
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{out_img} =} Thresholding (@var{img})
##
## @seealso{}
## @end deftypefn

## Author: Ahmed Sayed
## Created: 2021-04-21

function out_img = Thresholding (img)  
  r1 = 0.2;
  r2 = 0.8;
  s1 = 0;
  s2 = 255 / 256;
  out_img = ConstantStretching(img, r1, r2, s1, s2);
endfunction
