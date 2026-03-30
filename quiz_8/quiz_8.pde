Walker[] walkers = new Walker[10];

PVector gravity;
PVector wind;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  gravity = new PVector(0, -0.4);
  wind = new PVector(0.15, 0);
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
  }
}

void draw()
{
  background(30);
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].applyForce(gravity);
    walkers[i].applyForce(wind);
    walkers[i].update();
    walkers[i].checkEdges();
    walkers[i].render();
  }
}
