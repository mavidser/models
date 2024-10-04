$fn=64;

//import("spiralbase.stl");
d=36;
h=55;

translate([0,0,-h-38])
difference() {
    cylinder(d = d+4, h = h);
    translate([0, 0, -0.5]) cylinder(d = d, h = h + 1);
}
//difference() {
//    cylinder(d = d+6, h = h);
//    translate([0, 0, -0.5]) cylinder(d = d, h = h + 1);
//}

//linear_extrude(10){
//    difference(){
//        circle(h=h,d=d+10);
//        circle(d=d,h=h);
//    }
//}