Walker walker;

void setup()
{
  size(800, 600);
  background(30);

  walker = new Walker();
}

void draw()
{
  walker.step();
  walker.render();
}
