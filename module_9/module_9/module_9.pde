// create and initialize 8 walkers
Walker[] walkers = new Walker[8];
PVector wind = new PVector (0.15, 0);
PVector acceleration = new PVector(0.2, 0.0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  setupWalkers();
}
  
void setupWalkers()
{
  int posY = 0;

  for (int i = 0; i < walkers.length; i++)
  {
    // position them from top to bottom
    posY = 2 * (Window.windowHeight / walkers.length)  * (i - (walkers.length / 2));
    walkers[i] = new Walker();
    
    // increasing mass and scale
    walkers[i].mass = i + 1;
    walkers[i].scale = walkers[i].mass * 15;
    
    // random colors
    walkers[i].col = color(int(random(1, 256)), int(random(1, 256)), int(random(1, 256)), 200);
   
    walkers[i].position = new PVector (-500, -posY);
  }
}
  
void mousePressed()
  {
    setupWalkers();
  }
  
void draw()
{
  background (0);
  for (Walker w: walkers)
  {
    // Friction = -1 * mew * normal * velocity 
    // assume that normal = 1
    
    w.applyForce(acceleration);
    
    // initial coefficient of 0.01
    float mew = 0.01f;
    
    // if goes beyond the middle of the screen, coefficient(mew) = 0.4f
    if (w.position.x > 0)
    {
     mew = 0.4f; 
    }
    
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    w.applyForce(friction);
    
    w.render();
    w.update();
    // w.applyForce(wind);
    // w.applyForce(gravity);
    // w.moveAndBounce();
  }

}
