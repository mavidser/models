$fn=64;

import("saturn_bulb_socket_plate.stl");
d=38.6;
h=30;

translate([0,0,-h+2])
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