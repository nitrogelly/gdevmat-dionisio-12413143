class Walker
{
  PVector position;
  float size;
  color c;

  Walker()
  {
    // gaussian spawn (clustered around center)
    float x = randomGaussian() * 100 + width/2;
    float y = randomGaussian() * 100 + height/2;

    position = new PVector(x, y);

    size = random(5, 15);
    c = color(random(255), random(255), random(255), random(50, 100));
  }

  void move(PVector target)
  {
    PVector dir = PVector.sub(target, position);
    dir.normalize();
    dir.mult(1.5); // speed

    position.add(dir);
  }

  void render()
  {
    noStroke();
    fill(c);
    circle(position.x, position.y, size);
  }
}
