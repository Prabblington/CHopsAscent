class Stalkers extends Enemy
{
  PImage stalkD1 = loadImage("stalkerD1.png");
  PImage stalkD2 = loadImage("stalkerD2.png");
  PImage stalkD3 = loadImage("stalkerD3.png");
  PImage stalkD4 = loadImage("stalkerD4.png");
  PImage stalkD5 = loadImage("stalkerD5.png"); 
  
  Stalkers(float x, float y, float size)
  {
   super(x, y, size); 
  }
  
  public void update()
  {
   super.update();
   chase(chops);
  }
  
  public void render()
  {
   if(getCounter() <= 10)
   {
    image(stalkD1, getX(), getY());
   } 
   else if(getCounter() > 10 && getCounter() <= 20)  
   {
    image(stalkD2, getX(), getY());
   } 
   else if(getCounter() > 20 && getCounter() <= 30)  
   {
    image(stalkD3, getX(), getY());
   } 
   else if(getCounter() > 30 && getCounter() <= 40)  
   {
    image(stalkD4, getX(), getY());
   } 
   else if(getCounter() > 40 && getCounter() <= 50)  
   {
    image(stalkD5, getX(), getY());
   } 
   else 
   { 
    resetCounter(); 
   }
   incrementCounter();   
  }
}
