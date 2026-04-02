Walker[] walkers = new Walker[10];
Liquid ocean;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  // create water area
  ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1);

  // space walkers horizontally
  float spacing = (Window.right - Window.left) / walkers.length;

  for (int i = 0; i < walkers.length; i++)
  {
    float x = Window.left + spacing * i;
    float y = Window.top + 50; // start above screen

    walkers[i] = new Walker(x, y);
  }
}

void draw()
{
  background(30);

  ocean.render(); // draw water

  for (int i = 0; i < walkers.length; i++)
  {
    // gravity (scaled by mass)
    PVector gravity = new PVector(0, -0.15 * walkers[i].mass);
    walkers[i].applyForce(gravity);

    // wind (constant push right)
    PVector wind = new PVector(0.1, 0);
    walkers[i].applyForce(wind);

    // apply drag only inside liquid
    if (ocean.isColliding(walkers[i]))
    {
      PVector drag = ocean.calculateDragForce(walkers[i]);
      walkers[i].applyForce(drag);
    }

    walkers[i].update();

    // stop at bottom of screen
    if (walkers[i].position.y < Window.bottom)
    {
      walkers[i].position.y = Window.bottom;
      walkers[i].velocity.y = 0;
    }

    walkers[i].render();
  }
}
