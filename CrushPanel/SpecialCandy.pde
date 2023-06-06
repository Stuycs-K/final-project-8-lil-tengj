import java.util.*;
public class SpecialCandy extends Candy{
  private String power;
  
  public SpecialCandy(String n, String p){
    super(n);
  }
  
  public String getPower(){
    return power;
  }
  
  public void buildCandy(){
    if(power.equals("verticalStripe")){
      fill(255, 0 ,0);
    }
    if(power.equals("horizontalStripe")){
      fill(0,0,255);
    }
    if(power.equals("colourBomb")){
      fill(255, 128, 0);
    }
    if(power.equals("wrappedCandy")){
      fill(255,255,0);
    }
  }
  
}
