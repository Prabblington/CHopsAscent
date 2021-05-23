abstract class Collectable extends Sprite
{
  Collectable()
  {
   super(); 
  }
  Collectable(float x, float y, float size)
  {
   super(x, y, size); 
  }
  
  Collectable(float x, float y, float size, int value)
  {
   super(x, y, size, value); 
  }
  
  public void update()
  {
   super.update(); 
  }
}
