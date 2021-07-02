void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}


Walker walker8 = new Walker();
Walker walkerBiased = new Walker();

void draw()
{
  walker8.randomWalk();
  walker8.render();
  
  walkerBiased.randomWalkBiased();
  walkerBiased.render();
}
