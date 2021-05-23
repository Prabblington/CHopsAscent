class CountDown
{
  
 private int durationSeconds;
 private long savedTime, decayTime;
 private int timeReset = millis()/1000;


 public void setDuration(int duration)
 {
  this.durationSeconds = duration;
 }
 public void setDecayTime(long time)
 {
  this.decayTime = time; 
 }
 public void setSavedTime(long time)
 {
  this.savedTime = time; 
 }
 public int getDuration()
 {
  return durationSeconds;
 }
 public long getDecayTime()
 {
  return this.decayTime;
 }
 public long getSavedTime()
 {
  return this.savedTime;
 }
 
 
 public CountDown(int duration)
 {
  this.durationSeconds = duration;
 }
 
 public void displayTimer()
 {
  textAlign(LEFT);
  textSize(22);
  fill(level.getWHITE());
  text("Time remaining: " + getRemainingTime(), 10,30);
 }
 
 public int resetTime()
 {
  setDuration(durationSeconds + timeReset);
  return getDuration();
 }
 
 public int getRemainingTime()                  
 {
  return max(0, durationSeconds - millis()/1000) ;
 }
 
 public boolean timePassed(long decayTime)
 {
  setDecayTime(decayTime);
  long passedTime = millis() - timer.getSavedTime();
  
  if(passedTime > decayTime)
  {
   timer.savedTime = millis();
   return true; 
  }
  else
  {
   return false; 
  }
 }
}
