birdhouse();

module birdhouse() {
  outer_width = 150;
  outer_depth = 60;
  outer_height = 40;
  thickness = (60-46)/2;
  
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
