// The rectangular base
base_length = 60;          // The length of the base plate
base_width = 180;          // The width of the base plate
base_height = 5;          // The height of the base plate
base_curvature = 2.5;      // The radius of the rounded corners of the base plate.

hook_count = 3;            // Number of hooks

// The angled hooks
hook_angle = 30;           // The angle at which the hook points up
hook_base_diameter = 15;   // The diameter of the base of the hook
hook_tip_diameter = 10;    // The diameter of the rounded tip of the hook
hook_length = 35;          // Length of the hook, is inclusive of the rounded tip
hook_off_center = 0;       // Offset the hook from the center the plate towards the bottom

// The screw holes
holes_corners = false;     // Put holes in corner?
holes_x = true;            // Put holes along the X axis (width)?
holes_y = false;           // Put holes along the Y axis (length)?

holes_inset_x = 15;        // Distance between center of the hole and the X-axis edge
holes_inset_y = 15;        // Distance between center of the hole and the Y-axis edge
holes_inner_diameter = 4;  // Inside diameter of the holes
holes_outer_diameter = 8;  // Outside diameter of the holes, for countersink

// The higher the number, the higher the quality, and the slower this is to render.
$fn = 64;


difference() {
    difference() {
        union() {

            // Base plate
            minkowski() {
                // The height is doubled initially, and reduced in the final step to give a flat bottom
                cube(size = [
                    base_width - (base_curvature * 2),
                    base_length - (base_curvature * 2),
                    (base_height - base_curvature) * 2
                ], center=true);

                sphere(r = base_curvature);
            }

            hook_gap = base_width / hook_count;
            for ( i = [1 : hook_count] ) {
                hook_x_position = i * base_width/(hook_count+1) - base_width/2;

                // Hook
                translate([hook_x_position, hook_off_center, base_height - sin(hook_angle) * hook_base_diameter/2])
                rotate([hook_angle, 0, 0])
                union() {
                    cylinder(r1 = hook_base_diameter/2,
                             r2 = hook_tip_diameter/2,
                             h = hook_length - hook_tip_diameter / 2);

                    translate([0, 0, hook_length - hook_tip_diameter / 2])
                    sphere(d = hook_tip_diameter);
                }
            }

        }

        if ( holes_corners ) {
            translate([base_width/2 - holes_inset_x, base_length/2 - holes_inset_y, 0])
            cylinder(r1 = holes_inner_diameter, r2 = holes_outer_diameter, h = base_height);


            translate([holes_inset_x - base_width/2, base_length/2 - holes_inset_y, 0])
            cylinder(r1 = holes_inner_diameter, r2 = holes_outer_diameter, h = base_height);


            translate([base_width/2 - holes_inset_x, holes_inset_y - base_length/2, 0])
            cylinder(r1 = holes_inner_diameter, r2 = holes_outer_diameter, h = base_height);


            translate([holes_inset_x - base_width/2, holes_inset_y - base_length/2, 0])
            cylinder(r1 = holes_inner_diameter, r2 = holes_outer_diameter, h = base_height);
        }

        if ( holes_x) {
            translate([base_width/2 - holes_inset_x, 0, 0])
            cylinder(r1 = holes_inner_diameter, r2 = holes_outer_diameter, h = base_height);

            translate([holes_inset_x - base_width/2, 0, 0])
            cylinder(r1 = holes_inner_diameter, r2 = holes_outer_diameter, h = base_height);
        }

        if ( holes_y ) {
            translate([0,  base_length/2 - holes_inset_y, 0])
            cylinder(r1 = holes_inner_diameter, r2 = holes_outer_diameter, h = base_height);

            translate([0, holes_inset_y - base_length/2, 0])
            cylinder(r1 = holes_inner_diameter, r2 = holes_outer_diameter, h = base_height);
        }

     // Cut off bottom part of the doubled-up base plate, to get a flat bottom
        translate([-base_width / 2 - 1, -base_length / 2 - 1, -base_height - 2 - hook_base_diameter])
        cube([base_width + 2, base_length + 2, base_height + 2 + hook_base_diameter]);
    }


}