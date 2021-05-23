class Projectile extends Sprite
{
  PImage fireball1 = loadImage("fireball1.png");
  PImage fireball2 = loadImage("fireball2.png");
  PImage fireball3 = loadImage("fireball3.png");
  PImage fireball4 = loadImage("fireball4.png");
  PImage explosion1 = loadImage("explosion1.png");
  PImage explosion2 = loadImage("explosion2.png");
  PImage explosion3 = loadImage("explosion3.png");
  PImage explosion4 = loadImage("explosion4.png");
  PImage explosion5 = loadImage("explosion5.png");
  PImage explosion6 = loadImage("explosion6.png");
  
  private float mx, my; 
  
 
  public void setMX(float mx)
  {
   this.mx=mx;
  }
  public void setMY(float my)
  {
   this.my=my;
  }
  public float getMX()
  {
   return this.mx; 
  }
  public float getMY()
  {
   return this.my; 
  }
  
   
  Projectile(float size, int velocity)
  {
   super(size, velocity);
   setX(chops.getX()+chops.getSize()/2);
   setY(chops.getY());
   setVelX(velocity);
   setVelY(getVelX());
   setSize(size);
  }
  
  Projectile(float x, float y)
  {
   super(x, y); 
  }
  
  public void render()
  {
   if(getCounter() <= 10)  
   {
    image(fireball1, getX(), getY());
   }
   else if(getCounter() > 10 && getCounter() <= 20)
   {
    image(fireball2, getX(), getY());
   }
   else if(getCounter() > 20 && getCounter() <= 30)
   {
    image(fireball3, getX(), getY());
   }
   else if(getCounter() > 30 && getCounter() <= 40)
   {
    image(fireball4, getX(), getY());
   } 
   else 
   {
    setCounter(0); 
   }
   setCounter(getCounter()+1);
  }
  
  public void decay()
  {
   if(getCounter() <= 5)  
   {
    image(explosion1, getX(), getY());
   }
   else if(getCounter() > 5 && getCounter() <= 10)
   {
    image(explosion2, getX(), getY());
   }
   else if(getCounter() > 10 && getCounter() <= 15)
   {
    image(explosion3, getX(), getY());
   }
   else if(getCounter() > 15 && getCounter() <= 20)
   {
    image(explosion4, getX(), getY());
   }
   else if(getCounter() > 20 && getCounter() <= 25)
   {
    image(explosion5, getX(), getY());
   } 
   else if(getCounter() > 30 && getCounter() <= 35)
   {
    image(explosion6, getX(), getY());
   } 
   else 
   {
    resetCounter(); 
   }
   incrementCounter();
  }
  
  @Override
  public void update()
  {
   render();
   fire();
  }
  
  public void aim()
  {
   stroke(255,0,0);
   strokeWeight(3);
   noFill();
   rectMode(CENTER);
   circle(mouseX, mouseY, 10);
  }

  public void fire()
  {
   if(getX() <= getMX())
   {
    setDX(1);
    move();
   }
   else if(getX() >= getMX())
   {
    setDX(-1);
    move();
   }
   if(getY() <= getMY())
   {
    setDY(1);
    move();
   }
   else if(getY() >= getMY())
   {
    setDY(-1);
    move();
   }
  }
 }
