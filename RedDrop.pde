class Reddrop
{
  float x;
  float y;
  float w;
  float h;

  //Default Constructor
  Reddrop()
  {
    x = random (0, 800);
    y = random (0, 800);
    w = random (3, 7);    
    h = random (3, 7);
  }
//render raindrops
  void Render()
  {
    fill(255, 0, 0);
    ellipse(x, y, w, h);
  }
  //movement
  void Move()
  {
    x = x + .25;
    y = y + 2.25;

    if (y>height)
    {
      y=0;
      x = random (0, 800);
    }
  }
}
