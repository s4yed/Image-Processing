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
## @deftypefn {} {@var{out_img} =} ConstantStretching (@var{img}, @var{r1}, @var{r2}, @var{s1}, @var{s2})
##
## @seealso{}
## @end deftypefn

## Author: Ahmed Sayed
## Created: 2021-04-21

function out_img = ConstantStretching (img, r1, r2, s1, s2)
  val = (s2 - s1)/(r2 - r1);
  for i=1:size(img, 1)
    for j=1:size(img, 2)
      if(img(i, j) >= r1 && img(i, j) <= r2)
        out_img(i, j) = s1 + val * (img(i, j) - L);
      else
        out_img(i, j) = img(i,j);
      endif
    endfor
  endfor
endfunction
