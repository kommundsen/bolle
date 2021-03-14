epsilon = 0.01;

thickness = 2;

bearingWidth = 7;
bearingOuterDiameter = 22;
bearingInnerDiameter = 8;

diameter = bearingOuterDiameter + thickness;

length = bearingWidth + thickness;

$fn = 128;

module bearing(width = bearingWidth, outerRadius = bearingOuterDiameter / 2, innerRadius = bearingInnerDiameter / 2) {
    difference() {
        $fn = 128;
        cylinder(width, outerRadius, outerRadius);
        translate([0, 0, -epsilon/2])
            cylinder(width + epsilon, innerRadius, innerRadius);
    }
}

module plate(size = 80, height = 4) {
    union() {
        cube([size, size, height]);
        for (i = [1 : size / 2]) {
            translate([(i * 2) - 1.5, 0, height]) {
                cube([1, size, 1]);
            }
        }
    }
}

module screws(size = 80, height = 4, radius = 2) {
    translate([size - 12, size - 12, -height / 2]) {
        cylinder(8, 2, 2);
    }
    translate([size - 12, height * 3, -height / 2]) {
        cylinder(8, 2, 2);
    }
    translate([12, size - 12, -height / 2]) {
        cylinder(8, 2, 2);
    }
    translate([12, 12, -height / 2]) {
        cylinder(8, 2, 2);
    }
}

module mount(size = 80, height = 4) {
    
    translate([0 - size, 0, 0]) {
        difference() {
            plate(size, height);
            translate([size / 2, size/2, 0]) {
                bolt();
            }
            screws(size, height, 2);
        }
    }

}


module bolt(radius = 4) {
    cylinder(length * 2, radius, radius);
}

translate([-2, 0, 0]) {
    mount();
}

translate([82, 0, 0]) {
    mount();
}
