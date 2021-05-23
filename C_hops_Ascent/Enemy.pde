abstract class Enemy extends Sprite
{ 
 Enemy(float x, float y, float size)
 {
  super(x, y, size); 
 }
 
 public void update()
 {
  super.update();
  for(int i=0 ; i < fireBall.size() ; i++)
  {
  collide(fireBall.get(i));
  }
 }
 
 //Simple algorithm for enemies to chase player
 public void chase(CHops player)
 {
  if(getX() < player.getX())  
  {
   setX(getX() + getVelX());
   } 
   else if (getX() > player.getX())  
   {
    setX(getX() - getVelX());
   }
  if(getY() < player.getY())  
  {
   setY(getY() + getVelY());
  } 
  else if (getY() > player.getY())  
  {
   setY(getY() - getVelY());
  }
 }
}
