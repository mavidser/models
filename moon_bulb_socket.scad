$fn=64;

import("moon_bulb_socket_ceiling-adapter.stl");
d=35.5;
h=30;

translate([0,0,-16.1])
difference() {
    cylinder(d = d+10, h = h);
    translate([0, 0, -0.5]) cylinder(d = d, h = h + 1);
}

//linear_extrude(10){
//    difference(){
//        circle(h=h,d=d+10);
//        circle(d=d,h=h);
//    }
//}