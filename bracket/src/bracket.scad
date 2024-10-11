$fn = 64;

use <assembly.scad>

difference() {
  union() {
    plate();
    bracket_1();
    bracket_2();
  }
  
  hole_1();
  hole_2();
}