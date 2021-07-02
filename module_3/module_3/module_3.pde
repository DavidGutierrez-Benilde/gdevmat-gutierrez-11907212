void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

void draw()
{
  float gaussianX = randomGaussian();
  float gaussianScale = randomGaussian();
  int screenPosition = int(random(-640, 360));
  
  float stDeviationX = 350;
  float meanX = 0;
  
  float stDeviationScale = 35;
  float meanScale = 0;
  
  float x = stDeviationX * gaussianX + meanX;
  float scale = stDeviationScale * gaussianScale + meanScale;
  
  int randomR = int(random(1, 256));
  int randomG = int(random(1, 256));
  int randomB = int(random(1, 256));
  int randomA = int(random(10, 100));
  
  noStroke();
  
  fill (randomR, randomG, randomB, randomA);
  circle (x, screenPosition, scale);
  
  if (frameCount == 300)
  {
    background(255);
    frameCount = 0;
  }
}
