void setup()
{
 size(1080, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

Walker outerGlow = new Walker();
Walker innerGlow = new Walker();
Walker handle = new Walker();

void draw()
{
  background(155);
  outerGlow.mousePos();
  outerGlow.strokeWeight = 15;
  outerGlow.scalar = 350;
  outerGlow.col = color(255, 0, 0);
  outerGlow.render();
  
  innerGlow.mousePos();
  innerGlow.strokeWeight = 5;
  innerGlow.scalar = 350;
  innerGlow.col = 255;
  innerGlow.render();
 
  handle.mousePos();
  handle.strokeWeight = 20;
  handle.scalar = 75;
  handle.col = 0;
  handle.render();
}
