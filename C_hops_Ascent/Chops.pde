class CHops extends Sprite
{
 PImage cAttack = loadImage("cAttack.png");
 PImage cAttack2 = loadImage("cAttack2.png");
 PImage cBumped = loadImage("cBumped.png");
 PImage cBumped2 = loadImage("cBumped2.png");
 PImage cStill = loadImage("cStill1.png");
 PImage cMove1 = loadImage("cMove1.png");
 PImage cMove2 = loadImage("cMove2.png");
 PImage cMove3 = loadImage("cMove3.png");
 PImage cMoveL1 = loadImage("cMoveL1.png");
 PImage cMoveL2 = loadImage("cMoveL2.png");
 PImage cMoveL3 = loadImage("cMoveL3.png");
  
 CHops(float x, float y, float size)
 {
  super(x, y, size); 
 }
 
 @Override
 public void update()
 {
  render();
  move();
  super.collide();
 }
 
 public void render()
 {
  if(getCounter() < 10)  
  {
   image(cMove1, getX(), getY());
  } 
  else if(getCounter() < 20)  
  {
   image(cMove2, getX(), getY());
  } 
  else if(getCounter() < 30)  
  {
   image(cMove3, getX(), getY());
  } 
  else 
  {
   resetCounter();
  } 
  incrementCounter();
 }    
}
