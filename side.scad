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

module side(size, bar_thickness, bearing_radius, bearing_rim,
            bearing_thickness, spacer_hole_width, spacer_hole_radius,
            top_hole)
{
	difference() {
		// Main body
		union() {
			// Main circle around the bearing
			cylinder(r = bearing_radius + bar_thickness, h = size[2]);

			// Horizontal bar at the top of the bearing circle
			translate([-size[0]/2, bearing_radius,
                       0])
			cube([size[0], size[1] - bar_thickness - 2*bearing_radius,
                  size[2]]);

			// Blocks to fill the space where the bearing meets the bar
			translate([-2*bearing_radius - bar_thickness, 0, 0])
			cube([bar_thickness + bearing_radius, bearing_radius, size[2]]);

			translate([bearing_radius, 0, 0])
			cube([bar_thickness + bearing_radius, bearing_radius, size[2]]);
		}
*		translate([-size[0]/2, -bar_thickness - bearing_radius, 0])
		cube(size);

		// Smaller bearing hole
		translate([0, 0, -1])
		cylinder(r = bearing_radius - bearing_rim, h = size[2] + 2);

		// Larger bearing hole
		translate([0, 0, (size[2] - bearing_thickness)/2])
		cylinder(r = bearing_radius, h = size[2]);

		// Cutouts where the bearing meets the bar
		translate([2*bearing_radius + bar_thickness, 0, -1])
		cylinder(r = bearing_radius, h = size[2] + 2);

		translate([-2*bearing_radius - bar_thickness, 0, -1])
		cylinder(r = bearing_radius, h = size[2] + 2);

		// Cutout to form the bars around the top
		minkowski() {
			translate([-size[0]/2 + 1.5*bar_thickness,
                       bearing_radius + 1.5*bar_thickness, 0])
			cube([size[0] - 3*bar_thickness,
                  size[1] - 2.5*bar_thickness - 2*bearing_radius, size[2]]);

			cylinder(r = 0.5*bar_thickness, h = size[2], center=true);
		}

		// H-beam holes
		for (x = [(-size[0] + bar_thickness)/2, (size[0] - bar_thickness)/2]) {
			for (y = [bearing_radius +
                      bar_thickness/2, bearing_radius
                      + bar_thickness/2 + top_hole]) {
				translate([x, y, -1])
				rotate([0, 0, 30])
				cylinder(r = spacer_hole_radius, h = size[2] + 2);
			}
		}
	}
}

side(size = [90, 60, 7], bar_thickness = 10, bearing_radius = 8,
     bearing_rim = 1, bearing_thickness = 5, spacer_hole_width = 80,
     spacer_hole_radius = 1.7, top_hole = 20);
