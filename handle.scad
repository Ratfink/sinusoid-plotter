/* sinusoid-plotter: A parametric sinusoid plotter made with OpenSCAD.
 * Copyright (C) 2013  Clayton G. Hobbs
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

include <constants.scad>;

module handle(handle_size, side_size, hole_pos, hole_radius)
{
	translate([handle_size[0]/2, 0, 0])
	cube(side_size);

	translate([-handle_size[0]/2 - side_size[0], 0, 0])
	cube(side_size);

	translate([-handle_size[0]/2, side_size[1] - handle_size[1], 0])
	cube(handle_size);
}

handle(handle_size = [90, 15, 20], side_size = [5, 30, 20], hole_pos = 6,
       hole_radius = 3.13);
