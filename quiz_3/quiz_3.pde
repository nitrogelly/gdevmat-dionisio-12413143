int counter = 0;

void setup()
{
  size(800, 600);
  background(30);
}

void draw()
{
  noStroke();

  //  Color (RGB 0 – 255, Alpha 10 – 100)
  fill(random(255), random(255), random(255), random(10, 100));

  //  Position
  float gaussian = randomGaussian();  //  clustered horizontally
  float x = 50 * gaussian + width / 2;
  float y = random(height);  //  vertical spread

  //  Size (Gaussian-based variation)
  float size = abs(randomGaussian() * 15 + 5);

  //  Draw
  circle(x, y, size);

  //  Reset canvas every 300 frames
  counter++;
  if (counter > 300)
  {
    background(30);
    counter = 0;
  }
}
