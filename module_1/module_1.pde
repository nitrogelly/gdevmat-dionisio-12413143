//  GLOBAL VARIABLES
float time = 0;
float amplitude = 50;
float frequency = 0.05;

//  SCREEN CENTER (for graphing)
float centerX = 400;
float centerY = 300;

void setup()
{
  size(800, 600);
  smooth(8);
  strokeWeight(2);
}

void draw()
{
  background(30);
  
  time += 0.05;
  
  drawAxes();
  drawLinear();
  drawQuadratic();
  drawSine();
}

//  KEY INPUT (BONUS)
void keyPressed()
{
  if (key == 'w') amplitude += 5;
  if (key == 's') amplitude -= 5;

  if (key == 'd') frequency += 0.01;
  if (key == 'a') frequency -= 0.01;
}

//  AXES
void drawAxes()
{
  stroke(150);

  //  X-axis
  line(0, centerY, width, centerY);

  //  Y-axis
  line(centerX, 0, centerX, height);
}

//  LINEAR FUNCTION
//  f(x) = -5x + 30
void drawLinear()
{
  stroke(150, 0, 255); // purple

  for (float x = -300; x < 300; x += 0.5)
  {
    float y1 = -5 * x + 30;
    float y2 = -5 * (x + 0.5) + 30;

    line(centerX + x, centerY - y1,
         centerX + (x + 0.5), centerY - y2);
  }
}

//  QUADRATIC FUNCTION
//  f(x) = x^2 - 15x - 3
void drawQuadratic()
{
  stroke(255, 255, 0); // yellow

  for (float x = -300; x < 300; x += 0.5)
  {
    float y1 = (x * x - 15 * x - 3) * 0.05;
    float y2 = ((x + 0.5) * (x + 0.5) - 15 * (x + 0.5) - 3) * 0.05;

    line(centerX + x, centerY - y1,
         centerX + (x + 0.5), centerY - y2);
  }
}

//  SINE FUNCTION
//  f(x) = A * sin(Fx + time)
void drawSine()
{
  stroke(0, 100, 255); // blue

  for (float x = -300; x < 300; x += 0.5)
  {
    float y1 = amplitude * sin(frequency * x + time);
    float y2 = amplitude * sin(frequency * (x + 0.5) + time);

    line(centerX + x, centerY - y1,
         centerX + (x + 0.5), centerY - y2);
  }
}
