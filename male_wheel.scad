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
use <wheel_axle.scad>;

module male_wheel(radius, height, rim_thickness, rim_height, axle_radius,
                   axle_length, male_length, gear_thickness, holes=6,
                   hole_radius_factor=4/3) {
	difference() {
		union() {
			difference() {
				// Wheel with specified parameters and an extra-long axle (the
				// extra part is cut apart to make the attachment to the female
				// wheel)
				wheel_axle(radius=radius, height=height,
                           rim_thickness=rim_thickness,
                           rim_height=rim_height, axle_radius=axle_radius,
                           axle_length=axle_length+gear_thickness+male_length,
                           holes=holes, hole_radius_factor=hole_radius_factor);

				// Cut out the sides of the male part
				translate([axle_radius/4, -axle_radius, height + axle_length])
				cube([axle_radius, axle_radius*2,
                      male_length + gear_thickness + 1]);
				translate([-5*axle_radius/4, -axle_radius,
                           height + axle_length])
				cube([axle_radius, axle_radius*2,
                      male_length + gear_thickness + 1]);
			}
			// Add the center prism to the male part
			translate([-axle_radius/2, -axle_radius/3, height + axle_length])
			cube([axle_radius, 2*axle_radius/3, male_length + gear_thickness]);
		}

		// Cut out a screw hole from the male part
		translate([0, 0, height + axle_length + gear_thickness + male_length/2])
		rotate([0, 90, 0])
		cylinder(r = 1.5, h = axle_radius*2, center = true);
	}
}

male_wheel(radius = 33, height = 7, rim_thickness = 6, rim_height = 2.5,
           axle_radius = 4, axle_length = 50, male_length = 10,
           gear_thickness = 6);
