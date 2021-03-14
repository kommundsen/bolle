thickness = 2;
$fn = 128;

module plate(width = 80, depth = 165, height = 4) {
    cube([width, depth, height], center = true);
}

module screws(size = 80, height = 4, radius = 2) {
    halfSize = size / 2;
    distance = 12;
    radius = halfSize - distance;
    translate([-radius, -radius, 0]) {
        cylinder(8, 2, 2, center = true);
    }
    translate([radius, -radius, 0]) {
        cylinder(8, 2, 2, center = true);
    }
    translate([radius, radius, 0]) {
        cylinder(8, 2, 2, center = true);
    }
    translate([-radius, radius, 0]) {
        cylinder(8, 2, 2, center = true);
    }
}

module bolt(radius = 4) {
    cylinder(8, radius, radius, center = true);
}

module stand(size = 80, height = 4) {
    
    union() {
        difference() {
            translate([0, 42.5, 0]) {
                plate();
            }
            bolt();
            screws(size, height, 2);
        }
        rotate([90, 0, 0]) {
            translate([0, 35, -125]) {
                cube([size, 100, 4], center = true);
            }
        }
    }

}


stand();
