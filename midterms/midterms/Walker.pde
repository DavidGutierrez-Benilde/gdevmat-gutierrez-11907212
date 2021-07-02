public class Walker
{
  public PVector position = new PVector();
  float gaussianX, gaussianScale;
  float stDeviationX, meanX;
  float stDeviationScale, meanScale;
  float scale;
  color col;
  
  void spawnOtherMatter()
  {
  gaussianX = randomGaussian();
  gaussianScale = randomGaussian();
  position.y = int(random(-Window.windowWidth, Window.windowHeight));
  
  stDeviationX = 350;
  meanX = 0;
  
  stDeviationScale = 35;
  meanScale = 0;
  
  position.x = stDeviationX * gaussianX + meanX;
  scale = stDeviationScale * gaussianScale + meanScale;
  
  col = color(int(random(1, 256)), int(random(1, 256)), int(random(1, 256)), int(random(50, 100)));
  }
  
  void spawnBlackhole()
  {
      scale = 50;
      col = color(255);
      position.x = int(random(-Window.windowWidth, Window.windowHeight));
      position.y = int(random(-Window.windowWidth, Window.windowHeight));
  }
  
  void render()
  {
  noStroke();
  fill (col);
  circle (position.x, position.y, scale);
  }
}
