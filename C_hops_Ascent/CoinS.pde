class CoinS extends Collectable
{
 PImage coinS = loadImage("coin1.png");

 CoinS(float x, float y, float size, int value)
 {
   super(x, y, size, value);
 }
 
 @Override
 public void render()
 {
   image(coinS, getX(), getY());
 }
 
 public void update()
  {
   super.update();
  }
 public int amount()
 {
  return getAmount(); 
 }
}
