class Walker
{
  float tx = 0;
  float ty = 1000;

  float ts = 2000;

  float tr = 3000;
  float tg = 4000;
  float tb = 5000;

  void step()
  {
    tx += 0.01;
    ty += 0.01;

    ts += 0.01;

    tr += 0.01;
    tg += 0.01;
    tb += 0.01;
  }

  void render()
  {
    float x = map(noise(tx), 0, 1, 0, width);
    float y = map(noise(ty), 0, 1, 0, height);

    float size = map(noise(ts), 0, 1, 5, 150);

    float r = map(noise(tr), 0, 1, 0, 255);
    float g = map(noise(tg), 0, 1, 0, 255);
    float b = map(noise(tb), 0, 1, 0, 255);

    noStroke();
    fill(r, g, b, 80);

    circle(x, y, size);
  }
}
