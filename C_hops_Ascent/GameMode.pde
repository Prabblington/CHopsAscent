public enum GameMode
{
 MENU, PLAY, LEVEL1, LEVEL2, RESTART, WINLEVEL, GAMEOVER, HELP; 
}

class Mode
{
  PImage level1 = loadImage("level1.png");
  PImage level2 = loadImage("level2.png");
  PImage menu = loadImage("gate.png");
  PImage winScreen = loadImage("winScreen.png");
  PImage gameOverScreen = loadImage("gameOverScreen.png");
  PFont gameStateFont = loadFont("OldEnglishTextMT-80.vlw");
  PFont infoFont = loadFont("Algerian-48.vlw");
  
  private int modulusDiv, scoreMin;
  private float xRange, upperBound, lowerBound;
  private final color RED = color(#FF0303);
  private final color WHITE = color(255);
  private final color DGREY = color(10);
  
  
  //========================================= Getters and setters =============================================
  
  public void setModD(int mod)
  {
   this.modulusDiv = mod;
  }
  public void setScoreMin(int score)
  {
   this.scoreMin = score; 
  }
  public int getModD()
  {
   return this.modulusDiv; 
  }
  public int getScoreMin()
  {
   return this.scoreMin; 
  }
  public color getWHITE()
  {
   return this.WHITE;
  }
  
  //========================================= Methods & Constructors ==========================================
  
  Mode()
  {
    
  }
   
  public void displayMenu()
  {
   background(DGREY);
   imageMode(CENTER);
   image(menu, width/2, height/2);
   textAlign(CENTER);
   textSize(100);
   textFont(gameStateFont);
   fill(WHITE);
   text("Press SPACE to begin", width/2, height - height/8);
   textSize(20);
   textAlign(LEFT);
   textFont(infoFont);
   text("C - Help", 0 + 20, height/16);
   if(keyPressed)  
   {
    if(key == ' ' && gameMode == GameMode.MENU)
    {
     gameMode = GameMode.PLAY;
     levelCounter++;
    }
    else if(key == 'c' || key == 'C')
    {
     gameMode = GameMode.HELP; 
    }
   }
  }
  
  public void help()
  {
   background(DGREY);
   textAlign(LEFT);
   textSize(80);
   textFont(infoFont);
   fill(RED);
   text("Move: WASD, or ARROW KEYS" + 
         "\n\n\nFire: E or 0 - Fires fireballs using mouse \n             accuracy at enemies" 
           + "\n\n\nAim: Use Mouse position" 
             + "\n\n\nRules: You must score over " + level.getScoreMin() + " to continue \n            to the next level", 0+20, height/8);
   textAlign(LEFT);
   textSize(30);
   text("X - Main Menu", 0+20, height-20);
   
    
   if(keyPressed)
   {
    if(key == 'x' || key == 'X')
    {
     gameMode = GameMode.MENU;
    }
   }
  }

  public void restart()
  { 
   setup();
   timer.resetTime();
   score.setCurrentScore(0);
   
   gameMode = GameMode.PLAY;
  }
  
  public void setUpLvlUp() 
  {
   setup();
   timer.resetTime();
   score.setCurrentScore(0);
  }

  public void gameOver()
  {
   textAlign(CENTER);
   textSize(80);
   textFont(gameStateFont);
   image(gameOverScreen, width/2, height/2);
   fill(RED);
   text("GAME OVER", width/2, height/12); 
   textSize(30);
   fill(WHITE);
   text("The guards caught you and threw you " + "\nin a dragon sized bin, named 'prison'!", width/2, height/8);
   textSize(50);
   fill(RED);
   text("Press ENTER to restart the level", width/2, height - height/12);
   if(keyPressed)
   {
    if(key == ENTER)
    {
     gameMode = GameMode.RESTART; 
    }
   }
  }

  public void checkWin()
  {
   if(timer.getRemainingTime() == 0 && score.getCurrentScore() >= level.getScoreMin())
   {
    gameMode = GameMode.WINLEVEL;
   }
   else if(timer.getRemainingTime() == 0 && score.getCurrentScore() < level.getScoreMin())
   {
    gameMode = GameMode.GAMEOVER; 
   }
  }

  public void won()
  {
   int levelCap = 2;
   int level = levelCounter + 1;
   background(DGREY);
   imageMode(CENTER);
   image(winScreen, width/2, height/2);
   textAlign(CENTER);
   textSize(50);
   textFont(gameStateFont);
   fill(WHITE);
   text("CONGRATULATIONS! You helped " + chops.getName() + " escape!", width/2, height/3.5);
   textSize(40);
   text("SCORE: " + score.getCurrentScore(), width/2, height/2.7);
   
   textSize(60);
   if(level <= levelCap)
   {
    text("Press ENTER to start level " + level, width/2, height/2);
    if(keyPressed)
    {
     if(key == ENTER)
     {
      levelCounter++;
      gameMode = GameMode.PLAY;
     }
    }
   }
   else if(level >= levelCap)
   {
    text("Press ENTER to restart the game", width/2, height/2);
    if(keyPressed)
    {
     if(key == ENTER)
     {
      setLevelCounter(0);
      gameMode = GameMode.MENU;
     }
    }
   }
  }
  
  public void level1Background()
  {
   imageMode(CENTER);
   image(level1, width/2, height/1.8);
  }
  
  public void level2Background()
  {
   imageMode(CENTER);
   image(level2, width/2, height/2);
  }
  
  private void gameBasics()
  {
   chops.update();
   crosshair.aim();
   loadCharBehaviour(smallC);
   loadCharBehaviour(mediumC);
   loadCharBehaviour(largeC);
   loadCharBehaviour(stalkers);
   loadCharBehaviour(guards1);
   loadCharBehaviour(guards2);
   loadCharBehaviour(fireBall);
   spawn();
   timer.displayTimer();
   score.displayScore();
   checkWin();
  }
  
  public void level1()
  {  
   level.level1Background(); 
   gameBasics();
  }
  
  public void level2()
  {
   level.level2Background();
   gameBasics();
  } 
 
 public void spawn()
 {
  xRange = random(105, 1000);
  upperBound = 95;
  lowerBound = 685;
  int oobLimit = 150;
  
  if(smallC.size() <= 10 && timer.timePassed(8000) || smallC.size() <= 10 && score.getCurrentScore()%(getModD()/5) == 0)
  {
   limit = (int)random(1, 3);
   for(i=0 ; i < limit ; i++)
   {
    smallC.add(new CoinS(xRange, random(upperBound, lowerBound), 40, 100));
    smallC.add(new CoinS(xRange, random(upperBound, lowerBound), 40, 100));
   }
  } 
  else if(mediumC.size() <= 5 && score.getCurrentScore()%(getModD()+getModD()/10) == 0 )
  {
   limit = (int)random(1,2);
   for(i=0 ; i < limit ; i++)
   {
    mediumC.add(new CoinM(xRange, upperBound/2, 40, 200));
    mediumC.add(new CoinM(xRange, lowerBound, 40, 200));
   }
  }
  else if(largeC.size() <= 3 && score.getCurrentScore()%(getModD()/2+(getModD()/2*2)) == 0)
  {
   limit = (int)random(1,2); 
   for(i=0 ; i < limit ; i++)
   {
    largeC.add(new CoinL(xRange, upperBound/2, 40, 300));
    largeC.add(new CoinL(xRange, random(lowerBound-lowerBound/20, lowerBound), 40, 300));
   }
  }
  else if(score.getCurrentScore()%(getModD()/2) == 0)
  {
   xRange = random(100, 1100);
   upperBound = 100;
   lowerBound = 700;
   int max = 30;
   
   if(stalkers.size() <= max && timer.timePassed(5000) == true ||
       stalkers.size() <= max && stalkers.size() <= limit+score.getCurrentScore()/1000)
   {
    for(i=0 ; i < limit ; i++)
    {
     limit = (int)random(1,5);
     
     switch(limit)
     {
      case 1 : stalkers.add(new Stalkers(random(width), random(0, 0 - oobLimit), 40));   //top
      case 2 : stalkers.add(new Stalkers(random(width + oobLimit, width), random(height), 40));   //right
      break;
      case 3 : stalkers.add(new Stalkers(random(width), random(height + oobLimit, height), 40));   //down
      break;
      case 4 : stalkers.add(new Stalkers(random(0, 0 - oobLimit), random(height), 40));   //left
      break;
      default : stalkers.add(new Stalkers(random(0, 0 - oobLimit), random(height), 40));
     }
    }
   }
  }
 }
}
