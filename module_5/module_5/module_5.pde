void setup()
{
 size(1280, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

Walker bouncingBall = new Walker();

void draw()
{
  background(255);
  bouncingBall.moveAndBounce();
  bouncingBall.changeColor();
  bouncingBall.render();
 
}
