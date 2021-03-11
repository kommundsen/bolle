Diameter = 210;
TrackWidth = 50;
TaperWidth = 20;
Thickness = 2;

MagnetDiameter = 00;
MagnetHeight = 3;

QuaterCut = false;

module magnetMount(position) {
    if (MagnetDiameter > 0) {
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

diameter = max(Diameter, 210); // minimum recommended diameter for dwarf hamsters
trackWidth = max(TrackWidth, 50); 
outerRadius = diameter / 2;
innerRadius = outerRadius - Thickness;    
magnetPosition = 25;
halfThickness = Thickness / 2;

module wheelAxelOpening(r = 15) {
    $fn = 64;
    cylinder(10, r, r, center = true);
}

module magnetOpening() {
    if (MagnetDiameter > 0) {
        translate([magnetPosition, magnetPosition, 0]) {
            cylinder(
                MagnetHeight + Thickness,
                (MagnetDiameter / 2) + Thickness,
                (MagnetDiameter / 2) + Thickness,
                center = true
            );
        }
        translate([-magnetPosition, -magnetPosition, 0]) {
            cylinder(
                MagnetHeight + Thickness,
                (MagnetDiameter / 2) + Thickness,
                (MagnetDiameter / 2) + Thickness,
                center = true
            );
        }
    }
}

module wheelTrack() {
    difference() {
        cylinder(trackWidth, outerRadius, outerRadius);
        translate([0, 0, Thickness]) {
            cylinder(trackWidth, innerRadius, innerRadius);
        }
        
            
        wheelAxelOpening();
        magnetOpening();
    }
}

module wheelTaper(h = TaperWidth, r1 = outerRadius) {
    r2 = r1 - 4;
    translate([0, 0, trackWidth]) {
        difference() {
            cylinder(h, r1, r2);   
            cylinder(h, r1 - Thickness, r2 - Thickness);
        }
    }
}

module quaterCut() {
    difference() {
        children();
        if (QuaterCut) {
            translate([-outerRadius, 0, 0]) {
                cube([diameter, outerRadius, trackWidth + TaperWidth]);
            }
            translate([Thickness, -outerRadius, 0]) {
                cube([outerRadius, diameter, trackWidth + TaperWidth]);
            }
            
            translate([0, -outerRadius + halfThickness, halfThickness]) {
                cube([outerRadius, diameter, trackWidth - halfThickness]);
            }
            
            
            difference() {
                wheelTaper(r1 = outerRadius - halfThickness);
                translate([- outerRadius, -outerRadius, trackWidth]) {
                    cube([outerRadius, diameter, TaperWidth]);
                }
                translate([0, 0, trackWidth]) {
                    cube([diameter, outerRadius, TaperWidth]);
                }
            }

            translate([- outerRadius, - Thickness, 0]) {
                cube([halfThickness, Thickness, trackWidth]);
            }            

            translate([- outerRadius, - Thickness, 0]) {
                cube([outerRadius, Thickness, halfThickness]);
            }            
            
            
            difference() {
                wheelTaper(r1 = outerRadius + halfThickness);
                translate([0, -outerRadius, trackWidth]) {
                    cube([outerRadius, diameter, TaperWidth]);
                }
                translate([-outerRadius, -outerRadius - Thickness, trackWidth]) {
                    cube([diameter, outerRadius, TaperWidth]);
                }
            }
           
        }
    }
}


module wheel() {
    $fa = 1;
    
    quaterCut() {
        wheelTrack();
        wheelTaper();
        
        magnetMount(magnetPosition);
        magnetMount(-magnetPosition);
    }
    

}

wheel();






