thickness = 2;
$fn = 128;

module plate(size = 80, height = 4) {
    union() {
        cube([size, size, height], center = true);
        for (i = [1 : size / 2]) {
            translate([(i * 2) - (size / 2) - 1, 0, height / 2]) {
                cube([1, size, 1], center = true);
            }
        }
    }
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

module mount(size = 80, height = 4) {
    
    difference() {
        plate(size, height);
        bolt();
        screws(size, height, 2);
    }

}


module bolt(radius = 4) {
    cylinder(8, radius, radius, center = true);
}

mount();
