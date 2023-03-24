birdbox_width = 150;
birdbox_depth = 60;
birdbox_height = 40;
birdbox_thickness = (60-46)/2;




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
color("#38A3A5") 
    translate([(birdbox_width/2)+birdbox_depth/2, 0, 0])
        open_box(
            birdbox_depth,
            birdbox_depth,
            birdbox_height,
            birdbox_thickness
        );
    
// Second Side box
color("#38A3A5") 
    translate([-((birdbox_width/2)+birdbox_depth/2), 0, 0])
        open_box(
            birdbox_depth,
            birdbox_depth,
            birdbox_height,
            birdbox_thickness
        );



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