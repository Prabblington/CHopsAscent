class Score
{
  private int currentScore = 0;

 
  public void setCurrentScore(int score)
  {
   this.currentScore=score;
  }
  
  public int getCurrentScore()
  {
   return currentScore; 
  }

  Score(int score)
  {
   this.currentScore=score;
  }
  
  
  public void displayScore()
  {
   textAlign(RIGHT);
   textSize(22);
   fill(level.getWHITE());
   text("Score: " + currentScore, 1175, 30);
  }
  
  public void increase(int increase)
  {
   currentScore += increase;
  }
}
