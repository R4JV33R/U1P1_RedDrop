import processing.sound.*;
SoundFile file;
//datatypes
Reddrop red;
float Xs [] = new float [100];
float Ys [] = new float [100];
float speed[] = new float [100];
float rectY=700;
float rectH=100;
Reddrop[] thunder = new Reddrop [100];
int screen = 1;
void setup () 
{
  size (800, 800);
  noStroke();
   //song
  file = new SoundFile(this, "paradise.mp3");
  file.play();
  red = new Reddrop();
  for (int i=0; i < 100; i++)
  {
    Xs[i] = random(0, 800);
    Ys[i] = random(0, 800);
    //speed of red dots
    speed[i]=random(2, 5);
    thunder[i] = new Reddrop();
  }
}

void draw ()
{
  if (screen == 1)
  {
//movement and rendering of raindrops
    background(0);
    red.Render();
    red.Move();
    //red level rises
    if (millis()>5000)
    {
      fill (255, 0, 0);
      rect (0, rectY, 800, rectH);
      rectY=rectY-0.5;
      rectH=rectH+0.5;
    }
    if (rectY==100)
    {
      rectY = rectY +0.5;

      screen = 2;
    }

    for (int i=0; i < 100; i++)
    {
      thunder[i].Render();
      thunder[i].Move();
      //color of reddrops
      fill(255, 0, 0);
      ellipse(Xs[i], Ys[i], 15, 15);
      //left.right movement of red  
      Ys[i] = Ys[i] + 2;
      if (key ==CODED)
      {
        if (keyCode == RIGHT)
        {
          Xs[i] = Xs[i] +speed[i];
        }
        if (keyCode == LEFT)
        {
          Xs[i] = Xs[i] - speed[i]*3;
        }
      }

      //red repeating
      if (Ys[i] > height)
      {
        Ys[i] = 0;
        Xs[i] = random(width);
      }
    }
    //drainage of red 
  } else if (screen == 2)
  {
    background (0);
    fill (255, 0, 0);
    rect (0, rectY, 800, rectH);
    rectY = rectY  + 1;
    rectH = rectH +1;
  }
}
