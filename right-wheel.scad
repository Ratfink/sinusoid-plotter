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

module right_wheel(radius, height, rim_thickness, rim_height, holes) {
	half_ir = (radius - rim_thickness)/2;
	hole_radius = pi*half_ir/(holes*2);

	difference() {
		cylinder(r = radius, h = height);

		translate([0, 0, height - rim_height])
		cylinder(r = radius - rim_thickness, h = height);

		for(x = [0:holes-1]) {
			translate([cos(360*x/holes)*half_ir, sin(360*x/holes)*half_ir, -.5])
			cylinder(r = hole_radius, h = height + 1);
		}
	}
}

right_wheel(radius = 33, height = 7, rim_thickness = 6, rim_height = 2.5,
            holes = 6);
