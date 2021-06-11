## Copyright (C) 2021 user
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
## @deftypefn {} {@var{retval} =} hist_spec (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: user <user@DESKTOP-M0FLA96>
## Created: 2021-05-05

function [out_img, spec_values] = hist_spec (input_img, target_img)
  L = 256;
  ## Equalized input and target images with correosponding values
  [eq_img1, values1] = hist_eq(input_img);
  [eq_img2, values2] = hist_eq(target_img);
  tran_new = zeros(size(values1));
  
  ## Find closest pixels if the value doesn't exist in the specified image
  closest_pixels = [0, 1, -1];
  for i = 1:L
    for k = closest_pixels
      try
        tran_new(i) = find(values2 == values1(i)+k)(1);
        break
      catch err
        warning(err.identifier, err.message);
      end_try_catch
    endfor
  endfor
  
  ## Modify the final enhanced image with the new specified values
  for i = 1:size(eq_img1, 1)
   for j = 1:size(eq_img1, 2)
      input_img(i, j) = tran_new(input_img(i, j)+1);
    endfor
  endfor
  out_img = input_img;
  spec_values = values2;
endfunction
