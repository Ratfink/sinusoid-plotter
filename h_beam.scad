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

module h_beam(size, bar_thickness, bearing_radius, bearing_rim,
              bearing_thickness, bearing_circle, hole_radius, hole_depth,
              nut_radius, nut_thickness, nut_depth)
{
	difference() {
		union() {
			// Main beams
			translate([-size[0]/2, -size[1]/2, 0])
			cube([bar_thickness, size[1], size[2]]);

			translate([size[0]/2 - bar_thickness, -size[1]/2, 0])
			cube([bar_thickness, size[1], size[2]]);

			translate([-size[0]/2 + bar_thickness, -bar_thickness/2, 0])
			cube([size[0] - bar_thickness*2, bar_thickness, size[2]]);

			// Circle around the bearing hole
			cylinder(r = bearing_radius + bearing_circle, h = size[2]);
		}

		// Smaller bearing hole
		translate([0, 0, -1])
		cylinder(r = bearing_radius - bearing_rim, h = size[2] + 2);

		// Larger bearing hole
		translate([0, 0, (size[2] - bearing_thickness)/2])
		cylinder(r = bearing_radius, h = size[2]);

		// Screw holes and nut traps
		for (x = [(-size[0] + bar_thickness)/2, (size[0] - bar_thickness)/2]) {
			for (y = [-size[1]/2, size[1]/2]) {
				translate([x, y, size[2]/2])
				rotate([90, 30, 0])
				cylinder(r = hole_radius, h = hole_depth*2, center=true);
			}
			for (y = [-size[1]/2 + nut_depth, size[1]/2 - nut_depth]) {
				hull() {
					translate([x, y, size[2]/2])
					rotate([90, 30, 0])
					cylinder(r = nut_radius, h = nut_thickness, center=true,
                             $fn=6);

					translate([x, y, size[2] + nut_radius])
					rotate([90, 30, 0])
					cylinder(r = nut_radius, h = nut_thickness, center=true,
                             $fn=6);
				}
			}
		}
	}
}

h_beam(size = [90, 76, 7], bar_thickness = 10, bearing_radius = 8,
       bearing_rim = 1, bearing_thickness = 5, bearing_circle = 6,
       hole_radius = 1.7, hole_depth = 10, nut_radius = 3.13,
       nut_thickness = 3, nut_depth = 7);
