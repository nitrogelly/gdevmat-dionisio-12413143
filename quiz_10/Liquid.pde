class Liquid
{
  float x, y;
  float horizon, depth;
  float c;

  Liquid(float x, float y, float horizon, float depth, float c)
  {
    this.x = x;
    this.y = y;
    this.horizon = horizon;
    this.depth = depth;
    this.c = c; // drag coefficient
  }

  void render()
  {
    noStroke();
    fill(28, 120, 186);

    // draw water rectangle
    beginShape();
    vertex(x - horizon, y);
    vertex(x + horizon, y);
    vertex(x + horizon, y + depth);
    vertex(x - horizon, y + depth);
    endShape(CLOSE);
  }

  boolean isColliding(Walker w)
  {
    PVector pos = w.position;

    // check if inside water area
    return pos.x > x - horizon &&
           pos.x < x + horizon &&
           pos.y < y;
  }

  PVector calculateDragForce(Walker w)
  {
    float speed = w.velocity.mag();         // get speed
    float dragMag = c * speed * speed;      // drag velocity²

    PVector drag = w.velocity.copy();
    drag.mult(-1);                          // opposite direction
    drag.normalize();
    drag.mult(dragMag);                     // apply strength

    return drag;
  }
}
