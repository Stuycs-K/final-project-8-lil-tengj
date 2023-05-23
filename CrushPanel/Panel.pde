import java.util.*;

public class Panel{
  private Candy[][] board;
  private boolean objective;
  private int row;
  private int col;
  
  public Panel(int r, int c){
    board = new Candy[r][c];
    row = r;
    col = c;
    objective = false;
    fillPanel();
  }
  
  public int getRow(){
    return row;
  }
  
  public int getCol(){
    return col;
  }
  
  public Candy getCandy(int r, int c){
    return board[r][c];
  }  
  
  private void fillPanel(){
    String [] names = {"red", "blue", "orange", "yellow", "purple"};
    //fill board with randomly generated candiess
    for (int i = 0; i < board.length; i++){
      for (int j = 0; j < board.length; j++){
        board[i][j] = new Candy(names[(int)(Math.random() * 5)]);
      }
    }
  }
  
  private void swapCandy(){
    
  }
  
  
  
  
}
