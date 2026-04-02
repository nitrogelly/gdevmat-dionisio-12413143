class Walker
{
  PVector position;
  PVector velocity;
  PVector acceleration;

  float mass;
  float size;
  color col;

  float G = 1; // gravitational constant

  Walker()
  {
    position = new PVector(
      random(Window.left, Window.right),
      random(Window.bottom, Window.top)
    );

    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);

    mass = random(1, 10);
    size = mass * 10;

    col = color(random(255), random(255), random(255), random(80, 150));
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

  PVector calculateAttraction(Walker other)
  {
    PVector force = PVector.sub(position, other.position);

    float distance = force.mag();

    // prevent extreme values
    distance = constrain(distance, 5, 25);

    force.normalize();

    float strength = (G * mass * other.mass) / (distance * distance);

    force.mult(strength);

    return force;
  }
}
