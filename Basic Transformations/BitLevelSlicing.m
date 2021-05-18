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
## @deftypefn {} {@var{out_img} =} IntensityLevelSlicing (@var{img}, @var{bitLevel})
##
## @seealso{}
## @end deftypefn

## Author: Ahmed Sayed
## Created: 2021-04-21

function out_img = BitLevelSlicing(img, bitLevel)
  out_img = bitget(img, bitLevel);
endfunction
