public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  
  //declare acceleration 
  public PVector acceleration =  new PVector();
  public float velocityLimit = 10;
  public float scale;
  
  public float mass;
  
  public color col;
  
  public float gravitationalConstant = 1;
  
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
    noStroke();
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
  
  public PVector calculateAttraction (Walker walker)
  {
    PVector force = PVector.sub(this.position, walker.position); // direction
    float distance = force.mag();
    force.normalize(); // normalize to accurately get direction
    
    distance = constrain(distance, 5, 25); // solves divide by 0, and divide by really tiny values
    
    float strength = (this.gravitationalConstant * this.mass * walker.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  
}
