Walker walker;

void setup()
{
  size(800, 600);
  background(30);

  walker = new Walker(); // create walker
}

void draw()
{
  background(30); // clear screen each frame

  walker.moveAndBounce(); // update position + bounce
  walker.render();        // draw walker
}
