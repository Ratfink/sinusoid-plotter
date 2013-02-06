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

module wheel_axle(radius, height, rim_thickness, rim_height, axle_radius,
                   axle_length, holes=6, hole_radius_factor=4/3) {
	middle_radius = (radius - rim_thickness + axle_radius + rim_height)/2;
	hole_radius = hole_radius_factor*pi*middle_radius/(holes*2);

	difference() {
		// Wheel body
		cylinder(r = radius, h = height);

		// Cutout on axle side to save plastic
		translate([0, 0, height - rim_height])
		cylinder(r = radius - rim_thickness, h = height);

		// Holes through the wheel to save plastic
		for(x = [0:holes-1]) {
			translate([cos(360*x/holes)*middle_radius,
                       sin(360*x/holes)*middle_radius, -.5])
			cylinder(r = hole_radius, h = height + 1);
		}
	}

	// Axle flange
	translate([0, 0, height - rim_height])
	cylinder(r1 = axle_radius + rim_height, r2 = axle_radius,
             h = rim_height);

	// Axle shaft
	translate([0, 0, height])
	cylinder(r = axle_radius, h = axle_length);
}

wheel_axle(radius = 33, height = 7, rim_thickness = 6, rim_height = 2.5,
            axle_radius = 4, axle_length = 55);

// vim: ts=4 sw=4 noet
