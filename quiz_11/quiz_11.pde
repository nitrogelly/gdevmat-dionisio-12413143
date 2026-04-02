Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
  }
}

void draw()
{
  background(30);

  // mutual attraction
  for (int i = 0; i < walkers.length; i++)
  {
    for (int j = 0; j < walkers.length; j++)
    {
      if (i != j)
      {
        PVector force = walkers[j].calculateAttraction(walkers[i]);
        walkers[i].applyForce(force);
      }
    }
  }

  // update and render
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].update();
    walkers[i].render();
  }
}
