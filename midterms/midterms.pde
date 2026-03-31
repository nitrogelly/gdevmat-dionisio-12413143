PVector blackHole;          //  target position (attractor)
Walker[] walkers = new Walker[100]; //  100 particles
int counter = 0;            //  reset timer

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  //  initialize black hole (will be overridden by mouse)
  blackHole = new PVector(
    random(Window.left, Window.right),
    random(Window.bottom, Window.top)
  );

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
  float mx = mouseX - width/2;
  float my = height/2 - mouseY;
  
  blackHole.set(mx, my);

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
