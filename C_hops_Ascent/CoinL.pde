class CoinL extends Collectable
{
 PImage coinL = loadImage("goldBar.png"); 
 
 CoinL(float x, float y, float size, int value)
 {
   super(x, y, size, value);
 }
 
 @Override
 public void render()
 {
   image(coinL, getX(), getY());
 }
 
 public void update()
 {
  super.update();
 }
}
