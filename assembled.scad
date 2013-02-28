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
use <top_disk.scad>;
use <channel.scad>;

color([0.5, 1.0, 1.0])
translate([0, 45, 33])
rotate([90, 0, 0])
side(size = [90, 70, 7], bar_thickness = 10, bearing_radius = 8,
     bearing_rim = 1, bearing_thickness = 5, spacer_hole_width = 80,
     spacer_hole_radius = 1.7, top_hole = 20, channel_hole = 25.5,
     nut_radius = 3.13, nut_thickness = 3);

color([0.7, 0.7, 0.7])
translate([0, 44, 33])
rotate([90, 0, 0])
cylinder(r = 8, h = 5);

color([1.0, 1.0, 0.5])
translate([0, 46, 33])
rotate([-90, 0, 0])
wheel(radius = 33, height = 7, rim_thickness = 6, rim_height = 2.5,
      axle_radius = 3.96875, axle_depth = 15, axle_wall = 2, axle_screw = 1.7,
      nut_radius = 0, nut_thickness = -1);

color([0.5, 1.0, 1.0])
translate([0, -45, 33])
rotate([90, 0, 180])
side(size = [90, 70, 7], bar_thickness = 10, bearing_radius = 8,
     bearing_rim = 1, bearing_thickness = 5, spacer_hole_width = 80,
     spacer_hole_radius = 1.7, top_hole = 20, channel_hole = 25.5,
     nut_radius = 3.13, nut_thickness = 3);

color([0.7, 0.7, 0.7])
translate([0, -44, 33])
rotate([-90, 0, 0])
cylinder(r = 8, h = 5);

color([1.0, 1.0, 0.5])
translate([0, -46, 33])
rotate([90, 180, 0])
wheel(radius = 33, height = 7, rim_thickness = 6, rim_height = 2.5,
      axle_radius = 3.96875, axle_depth = 15, axle_wall = 2, axle_screw = 1.7,
      nut_radius = 0, nut_thickness = -1);

color([0.6, 0.4, 0.0])
translate([0, 0, 33])
rotate([90, 0, 0])
cylinder(r = 3.96875, h = 125, center=true);

color([0.8, 1.0, 0.5])
translate([0, 0, 42.5])
h_beam(size = [90, 76, 7], bar_thickness = 10, bearing_radius = 8,
       bearing_rim = 1, bearing_thickness = 5, bearing_circle = 6,
       hole_radius = 1.7, hole_depth = 10, nut_radius = 3.13,
       nut_thickness = 3, nut_depth = 7);

color([0.7, 0.7, 0.7])
translate([0, 0, 43.5])
cylinder(r = 8, h = 5);

color([0.8, 1.0, 0.5])
translate([0, 0, 62.5])
h_beam(size = [90, 76, 7], bar_thickness = 10, bearing_radius = 8,
       bearing_rim = 1, bearing_thickness = 5, bearing_circle = 6,
       hole_radius = 1.7, hole_depth = 10, nut_radius = 3.13,
       nut_thickness = 3, nut_depth = 7);

color([0.7, 0.7, 0.7])
translate([0, 0, 63.5])
cylinder(r = 8, h = 5);

color([0.6, 0.4, 0.0])
translate([0, 0, 40])
cylinder(r = 3.96875, h = 37);

color([1.0, 0.7, 0.6])
translate([0, 0, 72])
top_disk(radius = 35, height = 7, axle_radius = 3.96875, axle_depth = 5,
         holes = 17, hole_distances = [10, 30], hole_radius = 3.96875,
         hole_circles = 2);

color([0.6, 0.4, 0.0])
translate([20, 0, 74])
cylinder(r = 3.96875, h = 14);

color([0.9, 0.8, 1.0])
translate([50, 0, 68])
rotate([0, 0, 90])
channel(size = [90, 10, 12], channel_depth = 5, channel_width = 5,
        mount_width = 7, mount_radius = 1.7);

color([0.9, 0.8, 1.0])
translate([-50, 0, 68])
rotate([0, 0, 90])
channel(size = [90, 10, 12], channel_depth = 5, channel_width = 5,
        mount_width = 7, mount_radius = 1.7);
