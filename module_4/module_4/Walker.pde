public class Walker
{
  public float x, y, s;
  public float tx = 0, ty = 360, ts = 5, tr = 0, tg = 0, tb = 0;
  

  void render()
  {
    s = map(noise(ts), 0, 1, 5, 150);
    float r = map(noise(tr), 0, 1, 0, 255);
    float g = map(noise(tg), 0, 1, 0, 255);
    float b = map(noise(tb), 0, 1, 0, 255);
      

    noStroke();
    fill(r, g, b, 255);
    circle(x, y, s); 
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);

    // position and size
    tx += 0.01f;
    ty += 0.01f;
    ts += 0.01f;
    
  }  
  
  void changeColor()
  {
    tr += 0.05f;
    tg += 0.10f;
    tb += 0.15f;
  }
}
