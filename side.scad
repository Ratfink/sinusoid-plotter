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

module side(size, bearing_radius, bearing_rim, bearing_thickness, axle_height,
            spacer_hole_width, spacer_hole_radius, spacer_hole_heights)
{
	difference() {
		// Main body
		translate([-size[0]/2, -size[1]/2, 0])
		cube(size);

		// Smaller bearing hole
		translate([0, axle_height - size[1]/2, -1])
		cylinder(r = bearing_radius - bearing_rim, h = size[2] + 2);

		// Larger bearing hole
		translate([0, axle_height - size[1]/2, (size[2] - bearing_thickness)/2])
		cylinder(r = bearing_radius, h = size[2]);

		// H-beam holes
		for (x = [-spacer_hole_width/2, spacer_hole_width/2]) {
			for (y = spacer_hole_heights) {
				translate([x, y, -1])
				rotate([0, 0, 30])
				cylinder(r = spacer_hole_radius, h = size[2] + 2);
			}
		}
	}
}

side(size = [80, 60, 7], bearing_radius = 8, bearing_rim = 1,
     bearing_thickness = 5, axle_height = 12, spacer_hole_width = 70,
     spacer_hole_radius = 1.7, spacer_hole_heights = [-5, 15]);
