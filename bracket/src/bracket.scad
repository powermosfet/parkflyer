$fn = 64;

tube_d = 11;
wall_thickness = 1.2;
plate_thickness = 1.5;
plate_width = 21;
plate_length = 70;
plate_radius = 3;
bracket_1_l = 15;
bracket_2_l = 14.7;
bracket_1_pos = 10;
bracket_2_pos = 47.7;
hole_1_pos = 15;
hole_2_pos = 54.5;

use <peg.scad>

module plate() {
  translate([plate_radius, -plate_width / 2 + plate_radius, 0]) {
    linear_extrude(plate_thickness) {
      minkowski() {
        square([plate_length - plate_radius * 2, plate_width - plate_radius * 2]);
        circle(r = plate_radius);
      }
    }
  }
}

module bracket(l) {
translate([l / 2, 0, tube_d / 2 + wall_thickness + plate_thickness]) {
  rotate([0, 90, 0]) {
    difference() {
      hull() {
        cylinder(l, r = tube_d / 2 + wall_thickness, center = true);
        translate([wall_thickness / 2 + tube_d / 2, 0, 0]) {
          cube([wall_thickness, tube_d + (wall_thickness * 2), l], center = true);
        }
      }
      cylinder(l + 2, d = tube_d, center = true);
    }
  }
}
}

difference() {
  union() {
    plate();
    translate([bracket_1_pos, 0, 0]) {
      bracket(bracket_1_l);
    }
    translate([bracket_2_pos, 0, 0]) {
      bracket(bracket_2_l);
    }
  }
  
  translate([hole_1_pos, 0, 0]) {
    bracket_drill();
  }
  translate([hole_2_pos, 0, 0]) {
    bracket_drill();
  }
}