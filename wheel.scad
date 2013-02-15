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

module wheel(radius, height, rim_thickness, rim_height, axle_radius,
             axle_depth, axle_wall, axle_closed=false, axle_pin, nut_radius,
             nut_thickness, holes=6, hole_radius_factor=4/3)
{
	// Calculations for the holes in the disk
	middle_radius = (radius - rim_thickness + axle_radius + axle_wall +
                     rim_height)/2;
	hole_radius = hole_radius_factor*pi*middle_radius/(holes*2);

	difference() {
		union() {
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

			// Axle shaft
			if (axle_closed == false) {
				cylinder(r = axle_radius + axle_wall, h = axle_depth);
			} else {
				cylinder(r = axle_radius + axle_wall,
                         h = axle_depth + axle_wall);
			}

			// Axle flange
			translate([0, 0, height - rim_height])
			cylinder(r1 = axle_radius + axle_wall + rim_height,
                     r2 = axle_radius + axle_wall, h = rim_height);

			// Nut trap body
			translate([-nut_radius - 1, axle_radius, 0])
			if (axle_closed == false) {
				cube([2*nut_radius + 2, axle_wall + nut_thickness, axle_depth]);
			} else {
				cube([2*nut_radius + 2, axle_wall + nut_thickness,
                      axle_depth + axle_wall]);
			}
		}

		// Axle hole
		translate([0, 0, -1])
		if (axle_closed == false) {
			cylinder(r = axle_radius, h = axle_depth + 2);
		} else {
			cylinder(r = axle_radius, h = axle_depth + 1);
		}

		// Perpendicular axle hole
		translate([0, 0, (axle_depth - height)/2 + height])
		rotate([90, 0, 0])
		cylinder(r = axle_pin, h = 2*(axle_radius + axle_wall)+1, center=true);

		// Axle nut trap
		translate([0, axle_radius + axle_wall,
                   (axle_depth - height)/2 + height])
		rotate([-90, 30, 0])
		cylinder(r = nut_radius, h = nut_thickness + 1, $fn=6);
	}
}

wheel(radius = 33, height = 7, rim_thickness = 6, rim_height = 2.5,
      axle_radius = 3.96875, axle_depth = 15, axle_wall = 2, axle_pin = 1.7,
      nut_radius = 3.13, nut_thickness = 3);

// vim: ts=4 sw=4 noet
