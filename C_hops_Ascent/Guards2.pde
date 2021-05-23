class Guards2 extends Enemy
{
  PImage guard2 = loadImage("guard2.png"); 
 
  Guards2(float x, float y, float size)
  {
   super(x, y, size); 
  }
  
  @Override
  public void render()
  {
   image(guard2, getX(), getY());
  }
}
