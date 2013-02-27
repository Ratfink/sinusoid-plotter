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

module channel(size, channel_depth, channel_width, mount_width, mount_radius)
{
	difference() {
		union() {
			translate([-size[0]/2, -size[1]/2, 0])
			cube(size);

			translate([-size[0]/2, -size[1]/2, size[2]])
			cube([mount_width, size[1], mount_width + mount_radius]);

			translate([size[0]/2 - mount_width, -size[1]/2, size[2]])
			cube([mount_width, size[1], mount_width + mount_radius]);
		}

		translate([-size[0]/2 - 1, -channel_width/2, -1])
		cube([size[0] + 2, channel_width, channel_depth + 1]);

		translate([(mount_width - size[0])/2, size[1]/2 + mount_radius, -1])
		cylinder(r = mount_radius, h = size[2] + 2);

		translate([(size[0] - mount_width)/2, size[1]/2 + mount_radius, -1])
		cylinder(r = mount_radius, h = size[2] + 2);
	}
}

channel(size = [90, 10, 8], channel_depth = 5, channel_width = 5,
        mount_width = 7, mount_radius = 1.7);
