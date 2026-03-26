class Walker
{
  PVector position;
  PVector velocity;
  PVector acceleration;

  float size;
  
  Walker()
  {
    position = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);

    size = random(5, 15);
  }
  
  void update(PVector target)
  {
    //  direction to mouse
    PVector dir = PVector.sub(target, position);

    //  normalize (direction only)
    dir.normalize();

    //  control strength
    dir.mult(0.2);

    //  apply as acceleration
    acceleration = dir;

    //  apply physics chain
    velocity.add(acceleration);
    velocity.limit(5);
    position.add(velocity);
  }
  void render()
  {
    noStroke();
    fill(255, 150);
    circle(position.x, position.y, size);
  }
}
