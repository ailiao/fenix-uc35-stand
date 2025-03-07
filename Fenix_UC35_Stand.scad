module fenix_uc35_stand() {
    //uc35_cutout_diameter = 26; // UC35 v1
    uc35_cutout_diameter = 25.5; // UC35 v2
    button_cutout_diameter = 15;
    leg_dimensions = [25, 15, 2];
    leg_count = 4;
    //wall_height = 28; // UC35 v1
    wall_height = 29; // UC35 v2
    wall_thickness = 3;
    //bottom_shelf_z = 2; // UC35 v1
    bottom_shelf_z = 3; // UC35 v2

    w = 15;
    h = 5;
    l = 25;

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
                        translate([0,0,2]) {
                        polyhedron(
                            points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [0,0,h]],
                            faces=[[0,1,2,3],[5,4,2,1],[4,5,0,3],[0,5,1],[2,4,3]]
                        );}                           
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

module test() {
    

    leg_dimensions = [25, 15, 2];
    cube(leg_dimensions);

    w = 15;
    h = 5;
    l = 25;
polyhedron(
               points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [0,0,h]],
               faces=[[0,1,2,3],[5,4,2,1],[4,5,0,3],[0,5,1],[2,4,3]]
               );                        

}

fenix_uc35_stand();
//test();
