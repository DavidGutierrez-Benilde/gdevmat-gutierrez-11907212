void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}
  
void draw()
{
  background (0);  
  
  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  drawSineWave();
}

void drawCartesianPlane()
{
    
  strokeWeight(3);
  color white = color (255, 255, 255);
  fill(white);
  stroke(white);
  
  // Cartesian Plane
  line(-300, -0, 300, 0);
  line(0, -300, 0, 300);
  
  // X and Y Lines
  strokeWeight(1);
  fill(white);
  stroke(white);
  for (int i = -300; i <= 300; i += 10)
  {
    line (i, -5, i, 5);
    line (-5, i, 5, i);
  }
}

void drawLinearFunction()
{
  /*
  f(x) = x + number
  f(x) = y
  
  */
  
  color purple = color (128, 0 ,128);
  fill(purple);
  noStroke();
  
  for (int x = -300; x < 300; x++)
  {
    circle(x, -5*(x) + 30, 5);
  }
}

void drawQuadraticFunction()
{
  /*
  f(x) = x^2 - 15x - 3
  f(x) = y
  */
  
  color yellow = color (255, 255, 0);
  fill(yellow);
  noStroke();
  
  for (float x = -300; x <= 300; x+= 0.1f)
  {
    circle(x, ((float)Math.pow(x, 2) - 15*(x) - 3), 5);
  }
  
}

void drawSineWave()
{
  /*
  sin(x)
  */
  
  color blue = color (0, 0, 255);
  fill(blue);
  noStroke();
  
  for (float x = -300; x <= 300; x+= 0.1f)
  {
    circle(x, (float)Math.sin(x*0.1)*25, 3); 
  }
}
