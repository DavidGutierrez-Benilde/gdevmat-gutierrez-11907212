Walker[] walkers = new Walker[100];
Walker blackhole = new Walker();

void setup()
{
  size(1920, 1080, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  background(0);
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    walkers[i].spawnOtherMatter();
    walkers[i].render();
  }
  blackhole.spawnBlackhole();
}

void draw()
{
  if (frameCount <= 300)
  {
    background(0);    
    
    blackhole.position.x = mouseX  - Window.windowWidth;
    blackhole.position.y = -(mouseY - Window.windowHeight);
    
    blackhole.render();
    for (int i = 0; i < walkers.length; i++)
    {
      PVector direction = PVector.sub(blackhole.position, walkers[i].position);
      walkers[i].position.add(direction.normalize().mult(5));
      walkers[i].render();
    }
  }
  else 
  {
    frameCount = 0;
    setup();
  }
}
