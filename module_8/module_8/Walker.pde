public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale;
  
  public float mass;
  
  public color col;
  
  public Walker()
  {
    
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
    
  }

  public void update()
  {
    //this.acceleration = PVector.random2D();
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void render()
  {
    fill(col);
    circle(position.x, position.y, scale);
  }
  
  public void checkEdge()
  {
    if (this.position.x > Window.right)
    {
      this.position.x = Window.left;
    }
    else if (this.position.x < Window.left)
    {
      this.position.x = Window.right;
    }
    
    if (this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    else if (this.position.y < Window.bottom)
    {
      this.position.y = Window.top;
    }
  }
  
  public void moveAndBounce()
  {
   if (this.position.y < Window.bottom)
    {
      this.position.y = Window.bottom;
      this.velocity.y *= -1;
    }
    
   if (this.position.y > Window.top)
    {
      this.position.y = Window.top;
      this.velocity.y *= -1;
    }
    
   if (this.position.x > Window.right)
    {
     this.position.x = Window.right;
     this.velocity.x *= -1;
    }
    
  if (this.position.x < Window.left)
    {
      this.position.x = Window.left;
      this.velocity.x *= -1;
    }
    
  }
 }
