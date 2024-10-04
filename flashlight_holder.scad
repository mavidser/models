glue_base = 35;
box_size = 102;

diameter = 28;
height = 24;
depth = 15;
wall = 6;
opening = 28;

$fn = 64;

outer_diameter = diameter + 2 * wall;

difference() {
    // Basic shape
    union() {
        cylinder(d = outer_diameter, h = height);
        translate([0, -outer_diameter / 2]) cube([outer_diameter / 2 + depth, outer_diameter, height]);
        translate([0,10,0]) cube([35,12,height]); 
    }

    // Flashlight hole
    translate([0, 0, -1]) cylinder(d1 = diameter, d2 = diameter + wall * 1.5, h = height + 2);
    translate([-outer_diameter / 2, -opening / 2, -1]) cube([outer_diameter / 2 + 1, opening, height + 2]);
}