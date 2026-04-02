class Walker
{
  PVector position;
  PVector velocity;
  PVector acceleration;

  float mass;
  float size;
  color col;

  Walker(float x, float y)
  {
    position = new PVector(x, y);

    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);

    mass = random(1, 10); // random weight
    size = mass * 15;     // size based on mass

    col = color(random(255), random(255), random(255)); // random color
  }

  void applyForce(PVector force)
  {
    // F = ma → a = F / m
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update()
  {
    velocity.add(acceleration); // apply acceleration
    position.add(velocity);     // move

    acceleration.mult(0); // reset forces
  }

  void render()
  {
    fill(col);
    noStroke();
    circle(position.x, position.y, size);
  }
}
