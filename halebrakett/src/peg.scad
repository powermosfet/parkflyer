$fn = 64;

h = 4.5;
id = 3.8;
od = 6;
drill_d = 2;

module outer() {
  cylinder(h = h, d = od);
  translate([0, 0, h]) { 
    cylinder(h = od, d1 = od, d2 = 0);
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
