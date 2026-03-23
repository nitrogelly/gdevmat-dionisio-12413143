void setup()
{
  size(800, 600);
}

void draw()
{
  background(30);

  PVector center = new PVector(width/2, height/2);
  PVector mouse = new PVector(mouseX, mouseY);

  //  original vector (for magnitude)
  PVector original = PVector.sub(mouse, center);
  println(original.mag());

  //  direction
  PVector dir = original.copy();
  dir.normalize();
  dir.mult(200);
  
  PVector handleDir = dir.copy();
  handleDir.normalize();
  handleDir.mult(20);
  
  PVector h1 = PVector.add(center, handleDir);
  PVector h2 = PVector.sub(center, handleDir);
  
  //  endpoints
  PVector end1 = PVector.add(center, dir);
  PVector end2 = PVector.sub(center, dir);

  //  outer glow
  stroke(255, 0, 0);
  strokeWeight(10);
  line(end1.x, end1.y, end2.x, end2.y);

  //  inner glow
  stroke(255);
  strokeWeight(4);
  line(end1.x, end1.y, end2.x, end2.y);

  //  handle
  stroke(0);
  strokeWeight(12);
  line(h1.x, h1.y, h2.x, h2.y);
}
