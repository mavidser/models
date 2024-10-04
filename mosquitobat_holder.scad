y_size = 36;
z_size = 67;
x_size = 42 + 5 + 5;

// Basic shape
union() {
    cube([x_size, 5, z_size], center = false);
    
    translate([ x_size,0,0])
    rotate([0,270,0])
    linear_extrude(5)
        polygon([[0,0],[0,y_size],[z_size+10,y_size],[z_size,0]]);
    
    
    translate([ 5,0,0])
    rotate([0,270,0])
    linear_extrude(5)
        polygon([[0,0],[0,y_size],[z_size+10,y_size],[z_size,0]]);
}
