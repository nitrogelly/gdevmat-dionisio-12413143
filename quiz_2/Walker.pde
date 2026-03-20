class Walker
{
  float x = 400;
  float y = 300;

  // 8-direction movement
  void randomWalk()
  {
    int rng = int(random(8));

    if (rng == 0) y += 10;
    else if (rng == 1) y -= 10;
    else if (rng == 2) x += 10;
    else if (rng == 3) x -= 10;
    else if (rng == 4) { x += 10; y += 10; }
    else if (rng == 5) { x -= 10; y += 10; }
    else if (rng == 6) { x += 10; y -= 10; }
    else if (rng == 7) { x -= 10; y -= 10; }
  }

  // biased movement
  void randomWalkBiased()
  {
    float rng = random(1);

    if (rng < 0.4) x += 10;        // 40% right
    else if (rng < 0.6) x -= 10;   // 20% left
    else if (rng < 0.8) y += 10;   // 20% up
    else y -= 10;                  // 20% down
  }

  // rendering with random color
  void render()
  {
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(50, 100);

    fill(r, g, b, a);
    noStroke();

    circle(x, y, 20);
  }
}
