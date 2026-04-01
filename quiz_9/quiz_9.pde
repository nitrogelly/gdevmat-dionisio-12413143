Walker[] walkers = new Walker[8];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  // initialize walkers
  for (int i = 0; i < walkers.length; i++)
  {
    float posY = 2 * (Window.windowHeight / walkers.length) * (i - walkers.length/2);
    walkers[i] = new Walker(posY, i);
  }
}

void draw()
{
  background(30);

  for (int i = 0; i < walkers.length; i++)
  {
    // constant force to the right
    PVector force = new PVector(0.2, 0);
    walkers[i].applyForce(force);

    // determine friction strength
    float mu;
    if (walkers[i].position.x > 0)
    {
      mu = 0.4; // strong friction (braking zone)
    }
    else
    {
      mu = 0.01; // weak friction
    }

    // friction force
    PVector friction = walkers[i].velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(mu);

    walkers[i].applyForce(friction);

    // update and draw
    walkers[i].update();
    walkers[i].render();
  }
}

// reset on mouse click
void mousePressed()
{
  for (int i = 0; i < walkers.length; i++)
  {
    float posY = 2 * (Window.windowHeight / walkers.length) * (i - walkers.length/2);
    walkers[i] = new Walker(posY, i);
  }
}
