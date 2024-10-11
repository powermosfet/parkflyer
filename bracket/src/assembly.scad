$fn = 64;

tube_d = 11.2;
wall_thickness = 1.5;
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
peg_h = 4.5;
peg_cube_w = 8;
peg_cube_h = 3;
peg_id = 4;
peg_od = 6.2;
peg_drill_d = 2.5;


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
  translate([l / 2, 0, tube_d / 2 + plate_thickness]) {
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

module bracket_1() {
  translate([bracket_1_pos, 0, 0]) {
    bracket(bracket_1_l);
  }
}

module bracket_2() {
  translate([bracket_2_pos, 0, 0]) {
    bracket(bracket_2_l);
  }
}

module outer() {
  cylinder(h = peg_h, d = peg_od);
  translate([0, 0, peg_h + peg_cube_h / 2]) { 
    cube([peg_cube_w, peg_cube_w, peg_cube_h], center = true);;
  }
}

module drill() {
  translate([0, 0, -1]) {
    cylinder(h = 100, d = peg_drill_d); 
    cylinder(h = peg_h + 6, d = peg_id); 
  }
}

module bracket_drill() {
  translate([0, 0, -peg_h]) {
    outer();
    drill();
  }
}

module hole_1() {
  translate([hole_1_pos, 0, 0]) {
    bracket_drill();
  }
}

module hole_2() {
  translate([hole_2_pos, 0, 0]) {
    bracket_drill();
  }
}

plate();
bracket_1();
bracket_2();
hole_1();
hole_2();