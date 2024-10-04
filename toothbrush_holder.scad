l = 63.5;
w = 47;
h = 80;

hh = 24;

difference() {
    cube([l+10,w+10,h]);
    
    translate([5,5,5])
        cube([l,w,h+10]);
    
    translate([l+4,w/2+2.5,-1])
        cube([l, 5, h+2]);
    
    translate([-1,w/2,5])
        cube([l, 10, h+2]);

}