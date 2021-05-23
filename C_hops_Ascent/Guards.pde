class Guards extends Enemy
{
  PImage guard1 = loadImage("guard1.png");
  
  Guards(float x, float y, float size)
  {
   super(x, y, size); 
  }
  
  @Override
  public void render()
  {
   image(guard1, getX(), getY());
  }
}
