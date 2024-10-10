$fn = 64;

h = 4.5;
id = 3.9;
od = 6.2;
drill_d = 2;

module outer() {
  cylinder(h = h, d = od);
  translate([0, 0, h]) { 
    cube([8, 8, 3], center = true);;
  }
}

module drill() {
  translate([0, 0, -1]) {
    cylinder(h = 100, d = drill_d); 
    cylinder(h = h + 6, d = id); 
  }
}

module bracket_drill() {
  translate([0, 0, -h]) {
    outer();
    drill();
  }
}

difference() {
  outer();
  drill();
}
