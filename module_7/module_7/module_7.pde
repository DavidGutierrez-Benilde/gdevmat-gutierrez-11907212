Walker[] walkers = new Walker[100];

void setup()
{
 size(1280, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 
 for (int i = 0; i < walkers.length; i++)
 {
   walkers[i] = new Walker();
   walkers[i].velocityLimit = 10;
   walkers[i].position.y = int(random(-Window.windowWidth, Window.windowHeight));
   
  float gaussianX = randomGaussian();
  
  float stDeviationX = 360;
  float meanX = 0;

  walkers[i].position.x = stDeviationX * gaussianX + meanX;
 }
 
}

/* vector motion 101
1. Add Velocity to Position
2. Draw the Object at Position
*/


PVector mouseDirection()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  
  return new PVector(x, y);
}


void draw()
{
  background(80);
  
  PVector mouse = mouseDirection();

  for (int i = 0; i < walkers.length; i++)
  {
    // get and normalize the direction
    PVector direction = PVector.sub(mouse, walkers[i].position);
    direction.normalize();
    
    // assign direction and multiply it by 0.2
    walkers[i].acceleration = direction;
    direction.mult(0.2);
    
    walkers[i].update();
    walkers[i].render();
    
    // dont use // walkers[i].checkEdge();
  }
  
}
