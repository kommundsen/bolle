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

module axel1(radius = 15 + thickness) {
    union() {
        difference() {
            cylinder(length, radius, radius);
            bearing();
        }
        translate([0, 0, bearingWidth + thickness]) {
            difference() {
                cylinder(thickness, 15, 15);
                cylinder(thickness, 15 - thickness, 15 - thickness);
            }
        }
    }
}

module axel2(radius = 15 + thickness) {
    union() {
        difference() {
            cylinder(length, radius, radius);
            bearing();
        }
        translate([0, 0, bearingWidth + thickness]) {
            difference() {
                cylinder(thickness, 15 - thickness, 15 - thickness);
            }
        }
    }
}

module bolt(radius = 4) {
    cylinder(length * 2, radius, radius);
}

translate([20, 0, 11]) {
    rotate([0, 180, 0]) {
        difference() {
            axel1();
            bolt();    
        }
    }
}

translate([-20, 0, 11]) {
    rotate([0, 180, 0]) {
        difference() {
            axel2();
            bolt();    
        }
    }
}