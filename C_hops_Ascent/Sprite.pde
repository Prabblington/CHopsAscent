abstract class Sprite
{
  private float x, y, size;
  private String name;
  private int velocityX, velocityY, dx, dy, value, counter;
  private boolean collected, collided, shot;
  
  //========================================= Getters and setters ============================================= 

  public void setX(float x)  
  {
   this.x=x;
  }
  public void setY(float y)  
  {
   this.y=y;
  }
  public void setSize(float s)  
  {
   this.size=s;
  }
  public void setVelX(int vx)  
  {
   this.velocityX=vx;
  }
  public void setVelY(int vy)  
  {
   this.velocityY=vy;
  }
  public void setDX(int dx)
  {
   this.dx=dx;
  }
  public void setDY(int dy)
  {
   this.dy=dy;
  }
  public void setAmount(int value)
  {
   this.value=value;
  }
  public void setCounter(int number)
  {
   this.counter = number; 
  }
  public void setCollected(boolean collected)
  {
   this.collected = collected;
  }
   public void setCollide(boolean collided)
  {
   this.collided=collided;
  }
  public void setShotStatus(boolean shot)
  {
   this.shot=shot; 
  }
  public void setName(String name)  
  {
   this.name=name;
  }
  public String getName()  
  {
   return this.name;
  }
  public float getX() 
  {
   return this.x;
  }
  public float getY() 
  {
   return this.y;
  }
  public float getSize() 
  {
   return this.size;
  }
  public int getVelX() 
  {
   return this.velocityX;
  }
  public int getVelY()  
  {
   return this.velocityY;
  }
  public int getDX() 
  {
   return this.dx;
  }
  public int getDY() 
  {
   return this.dy;
  }
  public int getAmount()
  {
   return this.value; 
  }
  public int getCounter()
  {
   return this.counter; 
  }
  public boolean getCollected()
  {
   return this.collected; 
  }
  public boolean getCollided()  
  {
   return this.collided; 
  }
  public boolean getShotStatus()
  {
   return this.shot; 
  }
  
 //========================================= Methods & Constructors ==========================================
 
 Sprite()
 {
   
 }
 
 Sprite(float x, float y)
 {  
  this.x=x;
  this.y=y;
 }

 Sprite(float x, float y, float size)
 {  
  this.x=x;
  this.y=y;
  this.size=size;
 }
 Sprite(float x, float y, float size, int value)
 {  
  this.x=x;
  this.y=y;
  this.size=size;
  this.value=value;
 }
 
 Sprite(float size, int velocity)
 {
  this.size=size;
  this.velocityX=velocity;
  this.velocityY=velocity;
 }
  
 public void render()
 {
   
 }
  
 public void update()
 {
  render(); 
  collide(chops);
 }
 
 private void collide()
 {
  if(getX() - getSize()/2 < 0)   
  {    
   setX(0 + getSize()/2);
  } 
  else if(getX() + getSize()/2 > width)   
  {
   setX(width - getSize()/2);  
  }  
  else if(getY() - getSize()/2 < 0)  
  {
   setY(0 + getSize()/2);
  } 
  else if(getY() + getSize()/2 > height)  
  {
   setY(height - getSize()/2);
  } 
 }
 
 public void collide(Sprite thing)
 {
  float a = getX()-thing.getX();
  float b = getY()-thing.getY();
  double c = Math.sqrt((double)a*a + (double)b*b); //cast floats to doubles
  float collide = getSize()/2 + thing.getSize()/2;      //distance between object centers
  
  if (c < collide)
  {
   if(this instanceof Projectile || this instanceof Enemy && thing instanceof Projectile)
   {
    print(" BULLET HIT ");
    shot = true;
    if(shot == true)
    {
     fireBall.remove(0); 
    }
   }
   else if(this instanceof Enemy)
   {
    print(" COLLIDED ");
    collided = true;
   }
   else if(this instanceof Collectable )
   {
    print(" COLLECTED ");
    collected = true;
   }
  }
  else
  {
   collided = false;
   collected = false; 
   shot = false;
  }
 }

 public void resetCounter()
 {
  setCounter(0); 
 }

 public void incrementCounter()
 {
  setCounter(getCounter()+1);
 }
 
 public void move()
 {
  setX(x += dx * getVelX()); 
  setY(y += dy * getVelY());
 }
 
 public void pressedKey(boolean up, boolean down, boolean left, boolean right)
 {
  if(up)
  {
   dy = -1;
  }
  if(down)
  {
   dy = 1; 
  }
  if(left)
  {
    dx = -1;
  }
  if(right)
  {
   dx = 1;
  }
 }
 
 public void releasedKey(boolean up, boolean down, boolean left, boolean right)
 {
  if(up)
  {
   dy = 0;
  }
  if(down)
  {
   dy = 0; 
  }
  if(left)
  {
    dx = 0;
  }
  if(right)
  {
   dx = 0;
  }
 }
}
