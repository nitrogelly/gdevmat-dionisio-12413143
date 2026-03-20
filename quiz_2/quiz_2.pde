Walker walker1;
Walker walker2;

void setup()
{
  size(800, 600);

  walker1 = new Walker(); //  random walk
  walker2 = new Walker(); //  random biased walk

  walker2.x = 200; // separate position
}

void draw()
{  
  walker1.randomWalk();
  walker1.render();

  walker2.randomWalkBiased();
  walker2.render();
}
