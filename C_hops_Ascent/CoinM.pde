class CoinM extends Collectable
{
 PImage coinM = loadImage("coin2.png");
 
 CoinM(float x, float y, float size, int value)
 {
   super(x, y, size, value);
 }
 
 @Override
 public void render()
 {
   image(coinM, getX(), getY());
 }
 
 public void update()
 {
  super.update();
 }
}
