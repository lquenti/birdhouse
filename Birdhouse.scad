birdbox_width = 1500;
birdbox_depth = 600;
birdbox_height = 400;
birdbox_thickness = (60-46)/2*10;



// Main Birdbox

open_box(
    birdbox_width,
    birdbox_depth,
    birdbox_height,
    birdbox_thickness
);


// First side box
// The translate is always from the geometric center
// this means that we have to move the half birdbox width to move
// the center of the side box to the border
// but since we want border on border, we move it further along
color("#38A3A5") union() {
    translate([(birdbox_width/2)+birdbox_depth/2, 0, 0])
        open_box(
            birdbox_depth,
            birdbox_depth,
            birdbox_height,
            birdbox_thickness
        );
        
translate([(birdbox_width/2-birdbox_thickness/2), 0, birdbox_height-birdbox_thickness/2]) 
        hook(
            birdbox_thickness,
            birdbox_depth - 2*birdbox_thickness,
            birdbox_height/2,
            birdbox_thickness
        );
};
    
// Second Side box

color("#38A3A5") union() {
    translate([-((birdbox_width/2)+birdbox_depth/2), 0, 0])
        open_box(
            birdbox_depth,
            birdbox_depth,
            birdbox_height,
            birdbox_thickness
        );


    translate([-(birdbox_width/2-birdbox_thickness/2), 0, birdbox_height-birdbox_thickness/2]) 
        hook(
            birdbox_thickness,
            birdbox_depth - 2*birdbox_thickness,
            birdbox_height/2,
            birdbox_thickness
        );
}


module hook(inner_width, inner_depth, inner_height, thickness) {
    // We want to have a U-shape
    
    // For debug, let us first have a debug cube
    // color("#ff0000") cube([inner_width, inner_depth, inner_height], center = true);
    
    union() {
        // Let us put the left part of the U thingy
        translate([-(inner_width/2+thickness/2), 0, 0])
            cube([thickness, inner_depth, inner_height], center = true);
        
        // The middle part
        translate([0, 0, (inner_width/2+thickness/2)])
            cube([inner_width+2*thickness, inner_depth, thickness], center = true);
        
        // The right part analagously
        translate([inner_width/2+thickness/2, 0, 0])
            cube([thickness, inner_depth, inner_height], center = true);
    }
}


module open_box(outer_width, outer_depth, outer_height, thickness) {
  inner_width = outer_width - 2 * thickness;
  inner_depth = outer_depth - 2 * thickness;
  inner_height = outer_height - thickness; // top is open
    
  difference() {
      // Outer box centered at width/depth
      translate([-outer_width/2,-outer_depth/2,0])
        cube([
        outer_width,
        outer_depth,
        outer_height
      ]);
      
      // Inner box
      // +10 to not make it literally same mm
      translate([-inner_width/2, -inner_depth/2, thickness])
        cube([inner_width, inner_depth, inner_height+10]);
  }
}