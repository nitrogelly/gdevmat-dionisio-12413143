Walker[] walkers = new Walker[100];

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

  float mx = mouseX - width/2;
  float my = height/2 - mouseY;
  
  PVector mouse = new PVector(mx, my);

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].update(mouse);
    walkers[i].render();
  }
}
