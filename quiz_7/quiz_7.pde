Walker[] walkers = new Walker[100];

void setup()
{
  size(800, 600);

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
  }
}

void draw()
{
  background(30);

  PVector mouse = new PVector(mouseX, mouseY);

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].update(mouse);
    walkers[i].render();
  }
}
