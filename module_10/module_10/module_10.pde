Walker[] walkers = new Walker[10]; // create 10 walkers
Liquid ocean = new Liquid (0, -100, Window.right, Window.bottom, 0.1f);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  setupWalkers();
}

void setupWalkers()
{
  float posX = 0;
  float randomMass = random (1, 5);

  for (int i = 0; i < walkers.length; i++)
  {
    // spaced out equally side-by-side
    posX = 3 * (Window.windowHeight / walkers.length)  * (i - (walkers.length / 2));
    
    // initialize 10 walkers
    walkers[i] = new Walker();
    
    // random mass and increasing scale
    walkers[i].mass = i + randomMass; // random mass
    walkers[i].scale = walkers[i].mass * 10; // increasing scale
    
    // random colors
    walkers[i].col = color(int(random(1, 256)), int(random(1, 256)), int(random(1, 256)), 255);
   
    // positioned slightly above the screen
    walkers[i].position = new PVector (-posX, 300);
  }
}

void draw()
{
  background (255);
  ocean.render();
  for (Walker myWalkers: walkers)
  {
    myWalkers.render();
    myWalkers.update();
    
    PVector wind = new PVector (0.1, 0);
    PVector gravity = new PVector (0, -0.15f * myWalkers.mass);
    myWalkers.applyForce(wind); // apply wind to walker
    myWalkers.applyForce(gravity); // apply gravity to walker
    
    float mew = 0.1f;
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = myWalkers.velocity.copy();
    
    myWalkers.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude)); // apply friction to walker
    
    myWalkers.moveAndBounce();
    
    if (ocean.isCollidingWith(myWalkers)) // check if walkers hits liquid
    {
      PVector dragForce = ocean.calculateDragForce(myWalkers); 
      myWalkers.applyForce(dragForce); // apply dragForce to walkers
    }     
    
  }

}
