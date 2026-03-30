class Walker
{
  PVector position;
  PVector velocity;
  PVector acceleration;

  float mass;
  float size;
  color col;
  
  Walker()
  {
    position = new PVector(-500, 200);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(1, 10);
    size = mass * 15;
    col = color(random(255), random(255), random(255));
  }
  
  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void update()
  {
    velocity.add(acceleration);
    position.add(velocity);
  
    acceleration.mult(0);
  }
  
  void checkEdges()
  {
    if (position.x > Window.right)
    {
      position.x = Window.right;
      velocity.x *= -1;
    }
    if (position.x < Window.left)
    {
      position.x = Window.left;
      velocity.x *= -1;
    }
    
    if (position.y > Window.top)
    {
      position.y = Window.top;
      velocity.y *= -1;
    }
    if (position.y < Window.bottom)
    {
      position.y = Window.bottom;
      velocity.y *= -1;
    }
  }
  
  void render()
  {
    fill(col);
    noStroke();
    circle(position.x, position.y, size);
  }
}
