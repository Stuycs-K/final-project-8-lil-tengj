import java.util.*;

public class Panel{
  private Candy[][] board;
  private boolean objective;
  
  public Panel (){
    board = new Candy[20][20];
    objective = false;
  }
  
  private void fillPanel(){
    String [] names = {"red", "blue", "orange", "yellow", "purple"};
    //fill board with randomly generated candiess
    for (int i = 0; i < board.length; i++){
      for (int j = 0; j < board.length; j++){
        board[i][j] = new Candy(names[(int)(Math.random() * 5]));
      }
    }
  }
  
  private void swapCandy(){
    
  }
  
  
  
}
