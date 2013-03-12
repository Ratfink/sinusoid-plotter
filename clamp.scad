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
use <oshw.scad>;

module clamp(size, pen_pos, pen_radius, hole_pos, hole_radius, logo_depth)
{
	difference() {
		translate([-size[0]/2, -size[1]/2, 0])
		cube(size);

		translate([size[0]/2 + pen_pos, 0, -1])
		cylinder(r = pen_radius, h = size[2] + 2);

		translate([0, hole_pos, size[2]/2])
		rotate([0, 90, 0])
		cylinder(r = hole_radius, h = size[0] + 2, center=true);

		translate([0, -hole_pos, size[2]/2])
		rotate([0, 90, 0])
		cylinder(r = hole_radius, h = size[0] + 2, center=true);

		translate([-size[0]/2 - 1, 0, size[2]/2])
		rotate([90, 0, 0])
		rotate([0, 90, 0])
		linear_extrude(height = logo_depth + 1)
		oshw_logo_2d(2*logo_radius);
	}
}

clamp(size = [8, 28, 14], pen_pos = 1, pen_radius = 4, hole_pos = 9,
      hole_radius = 1.7, logo_depth = 0.75, logo_radius = 6);
