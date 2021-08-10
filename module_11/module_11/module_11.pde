Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  setupWalkers();
}

void setupWalkers()
{
  float randomMass = random (1, 5);

  for (int i = 0; i < walkers.length; i++)
  {
    
    // initialize 10 walkers
    walkers[i] = new Walker();
    
    // random mass and increasing scale
    walkers[i].mass = i + randomMass; // random mass
    walkers[i].scale = walkers[i].mass * 10; // increasing scale
    
    // random colors
    walkers[i].col = color(int(random(1, 256)), int(random(1, 256)), int(random(1, 256)), 255);


   walkers[i].position.y = int(random(-Window.windowWidth, Window.windowHeight));
   
   float gaussianX = randomGaussian();
  
   float stDeviationX = 350;
   float meanX = 0;

   walkers[i].position.x = stDeviationX * gaussianX + meanX;
  }
}


void draw()
{
  background (255);
  
  for (int i = 0; i < walkers.length; i++)
  {
    for (int j = 0; j < walkers.length; j++)
    {
      if (i != j)
      {
        walkers[i].applyForce(walkers[j].calculateAttraction(walkers[i]));
      }
    }
    walkers[i].update();
    walkers[i].render();
  }
}
