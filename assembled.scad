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

use <wheel.scad>;
use <side.scad>;
use <h_beam.scad>;

translate([0, 45, 51])
rotate([90, 0, 0])
side(size = [80, 60, 7], bearing_radius = 8, bearing_rim = 1,
     bearing_thickness = 5, axle_height = 12, spacer_hole_width = 70,
     spacer_hole_radius = 1.7, spacer_hole_heights = [-5, 15]);

translate([0, 46, 33])
rotate([-90, 0, 0])
wheel(radius = 33, height = 7, rim_thickness = 6, rim_height = 2.5,
      axle_radius = 3.96875, axle_depth = 15, axle_wall = 2, axle_pin = 1.7,
      nut_radius = 3.13, nut_thickness = 3);

translate([0, -45, 51])
rotate([90, 0, 180])
side(size = [80, 60, 7], bearing_radius = 8, bearing_rim = 1,
     bearing_thickness = 5, axle_height = 12, spacer_hole_width = 70,
     spacer_hole_radius = 1.7, spacer_hole_heights = [-5, 15]);

translate([0, -46, 33])
rotate([90, 180, 0])
wheel(radius = 33, height = 7, rim_thickness = 6, rim_height = 2.5,
      axle_radius = 3.96875, axle_depth = 15, axle_wall = 2, axle_pin = 1.7,
      nut_radius = 3.13, nut_thickness = 3);

%translate([0, 0, 33])
rotate([90, 0, 0])
cylinder(r = 3.96875, h = 125, center=true);

translate([0, 0, 42.5])
h_beam(size = [80, 76, 7], bar_thickness = 10, bearing_radius = 8,
       bearing_rim = 1, bearing_thickness = 5, hole_radius = 1.7,
       hole_depth = 10, nut_radius = 3.13, nut_thickness = 3, nut_depth = 7);

translate([0, 0, 62.5])
h_beam(size = [80, 76, 7], bar_thickness = 10, bearing_radius = 8,
       bearing_rim = 1, bearing_thickness = 5, hole_radius = 1.7,
       hole_depth = 10, nut_radius = 3.13, nut_thickness = 3, nut_depth = 7);

%translate([0, 0, 40])
cylinder(r = 3.96875, h = 40);
