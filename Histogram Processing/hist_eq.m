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
## @deftypefn {} {@var{retval} =} hist_eq (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: user <user@DESKTOP-M0FLA96>
## Created: 2021-05-05

function [out_img, eq_values] = hist_eq (img)
  L = 256;
  MN = size(img, 1) * size(img, 2);
  [counts, values] = hist(img(:), 0:L - 1);
  % The following data from book just for testing you can remove it
  %MN = 64*64;
  %counts = [790, 1023, 850, 656, 329, 245, 122, 81];
  %values = [0, 1, 2, 3, 4, 5, 7];
  
  ## Propability distribution function
  PDF = counts/MN;
  ## Communlative distribution function
  CDF = zeros(size(counts));
  
  ## Calculate CDF
  for i = 1:size(counts, 2)
    CDF(i) = sum(PDF(1:i));
  endfor

  ## Equalized pixel values
  Sk = round(CDF * (L - 1));
  
  ## Modify the image with the equalized pixels
  for i = 1:size(img, 1)
    for j = 1:size(img, 2)
      img(i, j) = Sk(img(i, j)+1);
    endfor
  endfor
  out_img = img;
  eq_values = Sk;
endfunction
