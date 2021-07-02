class Walker
{
  float x;
  float y;
  
  void render()
  {
    circle (x, y, 30);
    
    int rngRColor = int(random(256));
    int rngGColor = int(random(256));
    int rngBColor = int(random(256));
    int rngAlpha = int(random(50, 101));
    noStroke();
    fill (rngRColor, rngGColor, rngBColor, rngAlpha);
  }
    
  void randomWalk()
  {
    int rng = int(random(8));
  
  if (rng == 0) y++; // UP
  else if (rng == 1) y--; // DOWN
  else if (rng == 2) x++; // RIGHT
  else if (rng == 3) x--; // LEFT
  else if (rng == 4) // UP - RIGHT
  {
    y+=10; 
    x+=10; 
  }
  else if (rng == 5) // UP - LEFT
  {
    y+=10;
    x-=10; 
  } 
  else if (rng == 6) // DOWN - RIGHT
  {
    y-=10;
    x+=10;
  }
  else if (rng == 7) // DOWN - LEFT
  {
    y-=10;
    x-=10;
  }
  }
  
  void randomWalkBiased()
  {
    int rng = int(random(5));
    
    if (rng == 1) y--; // DOWN
    else if (rng == 2) x++; // RIGHT
    else if (rng == 3) x--; // LEFT
    else y++; // UP
  }
}
