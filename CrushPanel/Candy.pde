import java.util.*;
public class Candy{
  private String name;
  
  
  public Candy(String n){
   name = n;
  }
  
  public String getName(){
    return name;
  }
  
  public void buildCandy(){
    if(name.equals("red")){
      fill(255, 0 ,0);
    }
    if(name.equals("blue")){
      fill(0,0,255);
    }
    if(name.equals("orange")){
      fill(255, 128, 0);
    }
    if(name.equals("yellow")){
      fill(255,255,0);
    }
    if(name.equals("purple")){
      fill(255,0,255);
    }
    if(name.equals("blank")){
      fill(255);
    }
  }
}
