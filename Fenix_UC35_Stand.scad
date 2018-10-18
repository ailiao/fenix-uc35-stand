module fenix_uc35_stand() {
    uc35_cutout_diameter = 26;
    button_cutout_diameter = 15;
    leg_dimensions = [40, 10, 2];
    leg_count = 8;
    wall_height = 28;
    wall_thickness = 3;
    bottom_shelf_z = leg_dimensions.z;


    difference() {
        union() {
            // main holder body
            cylinder(h = leg_dimensions.z + wall_height, d = uc35_cutout_diameter + wall_thickness, $fn = 256);

            // legs
            leg_angle_step = 360 / leg_count;
            for(pos = [0:leg_angle_step:360-leg_angle_step]) {
                rotate([0, 0, pos]) {
                    translate([0, -(leg_dimensions.y / 2), 0]) {
                        cube(leg_dimensions);
                    }
                }
            }
        }

        union() {
            // hole for the main button
            cylinder(h = bottom_shelf_z, d = button_cutout_diameter, $fn = 128);

            // uc35 cutout
            translate([0, 0, bottom_shelf_z]) {
                cylinder(h = leg_dimensions.z + wall_height - bottom_shelf_z, d = uc35_cutout_diameter, $fn = 256);
            }
        }
    }
}

fenix_uc35_stand();
