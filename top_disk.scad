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

module top_disk(radius, height, axle_radius, axle_depth, holes, hole_distances,
                hole_radius, hole_circles)
{
	hole_lkp = [[0, hole_distances[0]], [holes-1, hole_distances[1]]];
	hole_angle = 360*hole_circles/(holes - 1);
	difference() {
		union() {
			cylinder(r = radius, h = height);
		}

		translate([0, 0, -1])
		cylinder(r = axle_radius, h = axle_depth + 2);

		for (x = [0:holes - 1]) {
			translate([lookup(x, hole_lkp)*cos(hole_angle*x),
                       lookup(x, hole_lkp)*sin(hole_angle*x), 1])
			cylinder(r = axle_radius, h = height);
		}
	}
}

top_disk(radius = 35, height = 7, axle_radius = 3.96875, axle_depth = 5,
         holes = 17, hole_distances = [10, 30], hole_radius = 3.96875,
         hole_circles = 2);
