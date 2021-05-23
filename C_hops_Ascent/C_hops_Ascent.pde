CHops chops;
GameMode gameMode = GameMode.MENU;
CountDown timer;
Score score;
Mode level;
Projectile crosshair;
ArrayList<Stalkers> stalkers;
ArrayList<Guards> guards1;
ArrayList<Guards2> guards2;
ArrayList<CoinS> smallC;
ArrayList<CoinM> mediumC;
ArrayList<CoinL> largeC;
ArrayList<Projectile> fireBall;

private int i, j, limit, levelCounter;


public void setLevelCounter(int level)
{
 this.levelCounter = level;
}
public int getLevelCounter()
{
 return this.levelCounter; 
}



void setup()
{
  size(1200, 800);
  smooth(2);
  frameRate(60);
  
  timer = new CountDown(60);
  timer.setSavedTime(millis());
  
  level = new Mode();
  level.setModD(1000);
  level.setScoreMin(7000);
  
  score = new Score(0);
  
  chops = new CHops(width/2, height/2, 40);
  chops.setName("Choppy");
  chops.setVelX(5);
  chops.setVelY(chops.getVelX()); 
  keyPressed();
  
  fireBall = new ArrayList<Projectile>();
  crosshair = new Projectile(mouseX, mouseY);
  
  stalkers = new ArrayList<Stalkers>();
  stalkers.add(new Stalkers(random(105, 685), 100, 40));
  stalkers.add(new Stalkers(random(105, 685), 700, 40));
  
  guards1 = new ArrayList<Guards>();
  guards1.add(new Guards(random(105, 1000), 50 ,40));
  
  for(i=0 ; i < 2 ; i++)
  {
   for(j=0 ; j <= 2 ; j++)
   {
    guards1.add(new Guards(guards1.get(i).getX() +  guards1.get(i).getSize()*2, guards1.get(i).getY(), 40));
   }
  }
  
  
  guards2 = new ArrayList<Guards2>();
  guards2.add(new Guards2(random(105, 1000), 700, 40));
  for(i=0 ; i < 2 ; i++)
  {
   for(j=0 ; j <= 2 ; j++)
   {
    guards2.add(new Guards2(guards2.get(i).getX() +  guards2.get(i).getSize()*2, guards2.get(i).getY(), 40));
   }
  }
  
  smallC = new ArrayList<CoinS>();
  smallC.add(new CoinS(random(95, 1100), random(75, 685), 40, 100));
  smallC.add(new CoinS(random(95, 1100), random(75, 685), 40, 100));
  smallC.add(new CoinS(random(95, 1100), random(75, 685), 40, 100));
  smallC.add(new CoinS(random(95, 1100), random(75, 685), 40, 100));
  
  mediumC = new ArrayList<CoinM>();
  mediumC.add(new CoinM(random(95, 700), 50, 40, 200));
  mediumC.add(new CoinM(random(95, 700), 680, 40, 200));
  
  largeC = new ArrayList<CoinL>();
  largeC.add(new CoinL(random(95, 700), 50, 40, 300));
}

void draw()
{
  switch (gameMode) 
  {
   case MENU : level.displayMenu();
   break;
   case PLAY : level.setUpLvlUp(); 
               
               switch(levelCounter)
               {
                case 1 : gameMode = GameMode.LEVEL1;
                break;
                case 2 : gameMode = GameMode.LEVEL2;
                break;
               }
   break;
   case LEVEL1 : level.level1();
   break;
   case LEVEL2 : level.level2();
   break;
   case HELP : level.help();
   break;
   case RESTART : level.restart();
   break;
   case WINLEVEL : level.won();
   break;
   case GAMEOVER : level.gameOver();
   break;
  }
}

public void loadCharBehaviour(ArrayList<? extends Sprite> thing)
{
 //loads basic behaviour: updates, speed, values, collision consequences for ArrayLists loaded in
 for(i=0 ; i < thing.size() ; i++)
 {
  thing.get(i).update();
  if(thing.get(i) instanceof Enemy)
  {
   thing.get(i).setVelX(1);
   thing.get(i).setVelY(thing.get(i).getVelX());
  }

  if(thing.get(i).getCollected() == true)
  {
   score.increase(thing.get(i).getAmount());
   thing.remove(i);
  }
  else if(thing.get(i).getShotStatus() == true)
  {
   thing.get(i).setAmount(200);
   score.increase(thing.get(i).getAmount());
   thing.remove(i);
  }
  else if(thing.get(i).getCollided() == true)
  {
   gameMode = GameMode.GAMEOVER;
  }
 }
 for(i=0 ; i < fireBall.size() ; i++)
 {
  if(timer.timePassed(700) == true)
  {
   fireBall.get(i).decay();
   fireBall.remove(i);
   timer.setSavedTime(millis());
  }
  if(timer.timePassed(1000) == true)
  {
   fireBall.remove(i);
   timer.setSavedTime(millis());
  }
 }
}


public void keyPressed() 
{
 chops.pressedKey((key == 'w' || key == 'W' || keyCode == UP),(key == 's' || key == 'S' || keyCode == DOWN),
                   (key == 'a' || key == 'A' || keyCode == LEFT),(key == 'd' || key == 'D' || keyCode == RIGHT));
 if(key == 'e' || key == 'E' || key == '0')
 {
  fireBall.add(new Projectile(20, 10));
  for(i=0 ; i < fireBall.size() ; i++)
  {
   fireBall.get(i).setVelX(20);
   fireBall.get(i).setVelY(fireBall.get(i).getVelX());
   //Set firing position and angle to previous mouse position
   fireBall.get(i).setMX(pmouseX);
   fireBall.get(i).setMY(pmouseY);
   fireBall.get(i).fire();
  }
 }
}
  
public void keyReleased()
{
  chops.releasedKey((key == 'w' || key == 'W' || keyCode == UP),(key == 's' || key == 'S' || keyCode == DOWN),
                     (key == 'a' || key == 'A' || keyCode == LEFT),(key == 'd' || key == 'D' || keyCode == RIGHT));
  
}
