import java.util.*;

public class Level{
    private int candiesCrushed;
    private int objective;
    private Candy type;
    
    public Level(int howMany, Candy flavour){
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
      return candiesCrushed = candiesCrushed + num;
    }
    
    private boolean passLevel(){
      if (candiesCrushed >= objective){
        println("Congrats! :)");
        return true;
      } else return false;
    }
}
