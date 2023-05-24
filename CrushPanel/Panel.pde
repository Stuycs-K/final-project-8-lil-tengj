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
    ArrayList <String> names = new ArrayList <String> ();
    names.add("red");
    names.add("orange");
    names.add("yellow");
    names.add("blue");
    names.add("purple");
    //fill board with randomly generated candiess
    for (int i = 0; i < board.length; i++){
      for (int j = 0; j < board.length; j++){
        board[i][j] = new Candy(names.get((int)(Math.random() * 5)));
      }
    }
    for (int i = 0; i < board.length - 2; i++){
      for (int j = 0; j < board.length - 2; j++){
        if (board[i][j].getName().equals(board[i + 1][j].getName()) && 
            board[i][j].getName().equals(board[i + 2][j].getName())){ //3 in a col
            String temp = board[i][j].getName();
            names.remove(temp);
            board[i][j] = new Candy(names.get((int)(Math.random() * 4)));
            names.add(temp);
            }
         if (board[i][j].getName().equals(board[i][j + 1].getName()) && 
            board[i][j].getName().equals(board[i][j + 2].getName())){ //3 in a row
            String temp = board[i][j].getName();
            names.remove(temp);
            board[i][j] = new Candy(names.get((int)(Math.random() * 4)));
            names.add(temp);
            }
      }
    }
  }
  
  public void swapCandy(int row1, int col1, int row2, int col2){
     if (col1 >= 0 && col1 < getCol() && row1 >= 0 && row1 < getRow() &&
     col2 >= 0 && col2 <getCol() && row2 >= 0 && row2 < getRow()) {
    Candy cur = board[row1][col1];
    board[row1][col1] = board[row2][col2];
    board[row2][col2] = cur;}
  }
  
  public String toString(){
    String result = "";
    for (int i = 0; i < board.length; i++){
      for (int j = 0; j < board.length; j++){
        result += board[i][j].getName();
        
        if(j == board.length-1) result += "\n";
        else{
          result+= ", ";
        }
      }
    }
    return result;
  }
  
  public void eliminate (){
    for (int i = 0; i < board.length - 2; i++){
      for (int j = 0; j < board[0].length - 2; j++){
        if (board[i][j].getName().equals(board[i + 1][j].getName()) && 
            board[i][j].getName().equals(board[i + 2][j].getName())){ //3 in a col
            board[i][j] = new Candy ("blank");
            board[i + 1][j] = new Candy ("blank");
            board[i + 2][j] = new Candy ("blank");
            }
         if (board[i][j].getName().equals(board[i][j + 1].getName()) && 
            board[i][j].getName().equals(board[i][j + 2].getName())){ //3 in a row
            board[i][j] = new Candy ("blank");
            board[i][j + 1] = new Candy ("blank");
            board[i][j + 2] = new Candy ("blank");
            }
            println(toString());
      }
    }
    
  }
  
}
