import java.util.*;

public class Level{
    private boolean win;
    private int candiesCrushed;
    private int objective;
    private Candy type;
    
    public Level(int howMany, Candy flavour){
      win = false;
      candiesCrushed = 0;
      objective = howMany;
      type = flavour;
    }
    
    public int getScore(){
      return candiesCrushed;
    }
    
    public int getObjective(){
      return objective;
    }
    
    public String getType(){
      return type.getName();
    }
    
    public int addScore(int num){
      return candiesCrushed += num;
    }
    
    private boolean passLevel(){
      if (candiesCrushed >= objective){
        win = true;
        println("Congrats! :)");
        return true;
      } else return false;
    }
}
