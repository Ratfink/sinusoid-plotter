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

module slider(sin_size, slide_size, slot_radius, slot_length, ext_length,
              clip_edge, hole_pos, hole_radius, nut_radius)
{
	difference() {
		union() {
			translate([-sin_size[0]/2, -sin_size[1]/2, 0])
			cube(sin_size);

			translate([-sin_size[0]/2 - slide_size[0], -slide_size[1]/2, 0])
			cube(slide_size);

			translate([sin_size[0]/2, -slide_size[1]/2, 0])
			cube(slide_size);

			translate([sin_size[0]/2 + slide_size[0], -slide_size[1]/2, 0])
			cube([ext_length, slide_size[1], sin_size[2]]);

			translate([sin_size[0]/2 + slide_size[0] + ext_length,
                      -slide_size[1]/2, 0])
			cube([clip_edge[0], slide_size[1], clip_edge[1]]);
		}

		hull() {
			translate([-slot_length/2, 0, -1])
			cylinder(r = slot_radius, h = sin_size[2] + 2);

			translate([slot_length/2, 0, -1])
			cylinder(r = slot_radius, h = sin_size[2] + 2);
		}

		translate([sin_size[0]/2 + slide_size[0] + ext_length - 1, hole_pos,
                   clip_edge[1]/2])
		rotate([0, 90, 0])
		cylinder(r = hole_radius, h = clip_edge[0] + 2);

		translate([sin_size[0]/2 + slide_size[0] + ext_length - 1, hole_pos,
                   clip_edge[1]/2])
		rotate([0, 90, 0])
		cylinder(r = nut_radius, h = nut_thickness + 1, $fn = 6);

		translate([sin_size[0]/2 + slide_size[0] + ext_length - 1, -hole_pos,
                   clip_edge[1]/2])
		rotate([0, 90, 0])
		cylinder(r = hole_radius, h = clip_edge[0] + 2);

		translate([sin_size[0]/2 + slide_size[0] + ext_length - 1, -hole_pos,
                   clip_edge[1]/2])
		rotate([0, 90, 0])
		cylinder(r = nut_radius, h = nut_thickness + 1, $fn = 6);
	}
}

slider(sin_size = [95, 14, 5], slide_size = [4, 28, 11], slot_radius = 3.96875,
       slot_length = 70, ext_length = 8, clip_edge = [6, 40], hole_pos = 9,
       hole_radius = 1.7, nut_radius = 3.13, nut_thickness = 3);
