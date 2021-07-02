public class Walker
{
  public PVector position = new PVector();
  public PVector speed = new PVector (5, 10);
  public float tr = 128, tg = 64, tb = 32;
  
  void render()
  {
    float r = map(noise(tr), 0, 1, 0, 255);
    float g = map(noise(tg), 0, 1, 0, 255);
    float b = map(noise(tb), 0, 1, 0, 255);
    
    noStroke();
    fill (r, g, b, 255);
    circle (position.x, position.y, 50);
  }
    
  void moveAndBounce()
  {   
   position.add(speed);
   
   if ((position.x > Window.right) || (position.x < Window.left)) 
   {
     speed.x *= -1;
   }
   if ((position.y > Window.top) || (position.y < Window.bottom)) 
   {
     speed.y *= -1;
   }
  }
  
   void changeColor()
  {
    tr += 0.01f;
    tg += 0.01f;
    tb += 0.01f;
  }
  
}
