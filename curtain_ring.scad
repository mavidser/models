$fn=256;
a=25.5;
height=18.5;
inside_diameter=26.5;

difference() {
    cylinder(d = inside_diameter + 4, h=height);

    translate([0,0,-1])
        cylinder(d = inside_diameter, h=height+2);
    
}