public class Walker 
{
 
  public PVector position = new PVector();
  public int strokeWeight = 0, scalar = 0;
  public color col;

 PVector mousePos()
 {
  position.x = mouseX  - Window.windowWidth / 2;
  position.y = -(mouseY - Window.windowHeight / 2);
  
  return new PVector(position.x, position.y);
 }
 
 public void render()
 {
   strokeWeight(strokeWeight);
   stroke (col);
   position.normalize().mult(scalar);
   line (0, 0, position.x, position.y);
   line (0, 0, -position.x, -position.y);
 }
}
