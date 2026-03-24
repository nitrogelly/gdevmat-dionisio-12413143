PVector blackHole;          //  target position (attractor)
Walker[] walkers = new Walker[100]; //  100 particles
int counter = 0;            //  reset timer

void setup()
{
  size(800, 600);

  //  initialize black hole (will be overridden by mouse)
  blackHole = new PVector(random(width), random(height));

  //  create all walkers
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
  }
}

void draw()
{
  background(30);

  //  update black hole to follow mouse
  blackHole.set(mouseX, mouseY);

  //  draw black hole
  fill(255);
  noStroke();
  circle(blackHole.x, blackHole.y, 50);

  //  update and draw all walkers
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].move(blackHole);  //  move toward target
    walkers[i].render();         //  draw particle
  }

  // timer for reset
  counter++;

  if (counter > 600)
  {
    //  respawn all walkers
    for (int i = 0; i < walkers.length; i++)
    {
      walkers[i] = new Walker();
    }

    counter = 0;
  }
}
