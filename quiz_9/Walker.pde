class Walker
{
  PVector position;
  PVector velocity;
  PVector acceleration;

  float mass;
  float size;
  color col;

  Walker(float posY, int index)
  {
    // start at left side
    position = new PVector(Window.left, posY);

    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);

    // increasing mass
    mass = index + 1;

    // size based on mass
    size = mass * 15;

    // random color
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

  void render()
  {
    fill(col);
    noStroke();
    circle(position.x, position.y, size);
  }
}
