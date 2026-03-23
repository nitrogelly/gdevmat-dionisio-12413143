class Walker
{
  PVector position; // current position
  PVector velocity; // movement direction + speed

  Walker()
  {
    position = new PVector(width/2, height/2); // start at center
    velocity = new PVector(5, 3);              // initial movement
  }

  void moveAndBounce()
  {
    position.add(velocity); // move

    // bounce horizontally
    if (position.x > width || position.x < 0)
    {
      velocity.x *= -1; // reverse x direction
    }

    // bounce vertically
    if (position.y > height || position.y < 0)
    {
      velocity.y *= -1; // reverse y direction
    }
  }

  void render()
  {
    fill(255); // white color
    circle(position.x, position.y, 20); // draw walker
  }
}
