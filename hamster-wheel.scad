Diameter = 210;
TrackWidth = 50;
Thickness = 2;

HasMagnet = true;
MagnetDiameter = 10;
MagnetHeight = 3;

module magnetMount(position) {
    if (HasMagnet) {
        $fn = 64;
        innerRadius = MagnetDiameter / 2;
        outerRadius = innerRadius + Thickness;
        innerHeight = MagnetHeight;
        outerHeight = innerHeight + Thickness;
        
        translate([position, position, 0]) {
            difference() {
                cylinder(outerHeight, outerRadius, outerRadius);
                translate([0, 0, - Thickness]) {
                    cylinder(innerHeight + Thickness, innerRadius, innerRadius);
                }
            }
        }
    }
}

module wheel() {
    $fa = 1;
    diameter = max(Diameter, 210); // minimum recommended diameter for dwarf hamsters
    trackWidth = max(TrackWidth, 50); 
    outerRadius = diameter / 2;
    innerRadius = outerRadius - Thickness;    
    magnetPosition = - 25;
    
    difference() {
        halfThickness = Thickness / 2;
        cylinder(trackWidth, outerRadius, outerRadius);
        translate([0, 0, Thickness]) {
            cylinder(trackWidth, innerRadius, innerRadius);
        }
        translate([0, - outerRadius + halfThickness, halfThickness]) {
            cube([diameter, diameter * 2, trackWidth * 2]);
        }
        translate([Thickness, - diameter, - halfThickness]) {
            cube([diameter, diameter * 2, trackWidth * 2]);
        }
        translate([- outerRadius + Thickness, 0, Thickness]) {
            cube([diameter * 2, diameter, trackWidth * 2]);
        }
        translate([- diameter, Thickness, - Thickness]) {
            cube([diameter * 2, diameter, trackWidth * 2]);
        }
        translate([- diameter + halfThickness, 0, - Thickness]) {
            cube([outerRadius, outerRadius, trackWidth * 2]);
        }
        translate([- Diameter, 0, - (TrackWidth *  2) + halfThickness]) {
            cube([diameter * 2, diameter, trackWidth * 2]);
        }
        
        {
            $fn = 64;
            cylinder(10, 8, 8, center = true);
        }

        if (HasMagnet) {
            translate([magnetPosition, magnetPosition, - MagnetHeight]) {
                h = (MagnetHeight + Thickness)* 2;
                r = (MagnetDiameter / 2) + Thickness;
                cylinder(h, r, r);
            }
        }
    }

    magnetMount(magnetPosition);
}

wheel();




