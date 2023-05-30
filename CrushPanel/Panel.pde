import java.util.*;

public class Panel{
  private Candy[][] board;
  private int row;
  private int col;
  private Level one;
  
  public Panel(int r, int c, int howMany, Candy flavour){
    board = new Candy[r][c];
    row = r;
    col = c;
    one = new Level (howMany, flavour);
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
    names.add("green");
    //fill board with randomly generated candiess
    for (int i = 0; i < board.length; i++){
      for (int j = 0; j < board.length; j++){
        board[i][j] = new Candy(names.get((int)(Math.random() * 6)));
      }
    }
    for (int i = 0; i < board.length - 2; i++){
      for (int j = 0; j < board.length; j++){
        if (board[i][j].getName().equals(board[i + 1][j].getName()) && 
            board[i][j].getName().equals(board[i + 2][j].getName())){ //3 in a col
            String temp = board[i][j].getName();
            names.remove(temp);
            board[i][j] = new Candy(names.get((int)(Math.random() * 4)));
            names.add(temp);
            }
      }
    }
    for (int i = 0; i < board.length; i++){
      for (int j = 0; j < board.length - 2; j++){
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
  
  public void moveDown(){
    for (int i = board.length-1; i >= 0 ; i--){
      for (int j = board[0].length -1; j >=0; j--){
        if(board[i][j].getName().equals("blank")){
          for(int p = i-1; p>=0; p-- ){
            if(!board[p][j].getName().equals("blank")){
              board[i][j] = board[p][j];
              board[p][j] = new Candy("blank");
              p = -1;
            }
          }
        }
      }
    }
  }
  
  public boolean eliminate (){
    boolean result = true;
    if(eliminate5()) result = true;
    if(eliminate4()) result = true;;
    for (int i = 0; i < board.length - 2; i++){
      for (int j = 0; j < board[0].length; j++){
        if (board[i][j].getName().equals(board[i + 1][j].getName()) && 
            board[i][j].getName().equals(board[i + 2][j].getName())){ //3 in a col
            if (board[i][j].getName().equals(one.getType())){
              one.addScore(3);
            }
            board[i][j] = new Candy ("blank");
            board[i + 1][j] = new Candy ("blank");
            board[i + 2][j] = new Candy ("blank");
            }
        else result = false;
      }
    }
    for (int i = 0; i < board.length; i++){
      for (int j = 0; j < board[0].length - 2; j++){
         if (board[i][j].getName().equals(board[i][j + 1].getName()) && 
            board[i][j].getName().equals(board[i][j + 2].getName())){ //3 in a row
             if (board[i][j].getName().equals(one.getType())){
              one.addScore(3);
            }
            board[i][j] = new Candy ("blank");
            board[i][j + 1] = new Candy ("blank");
            board[i][j + 2] = new Candy ("blank");
            result = true;
            }
            //println(toString());
      }
    }
    return result;
  }
  
  
  
  public void dropNew(){
    for(int i = 0; i < board.length; i ++){
      for(int j = 0; j < board[0].length; j++){
        if(board[i][j].getName().equals("blank")){
          ArrayList <String> names = new ArrayList <String> ();
          names.add("red");
          names.add("orange");
          names.add("yellow");
          names.add("blue");
          names.add("purple");
          names.add("green");
          board[i][j] = new Candy(names.get((int)(Math.random() * 6)));
        }
      }
    }
  }

  private boolean eliminate4 (){
    boolean result = true;
    for (int i = 0; i < board.length -3; i++){
      for (int j = 0; j < board[0].length; j++){
        if (board[i][j].getName().equals(board[i + 1][j].getName()) && 
            board[i][j].getName().equals(board[i + 2][j].getName()) &&
            board[i][j].getName().equals(board[i + 3][j].getName())){ //4 in a col
           if (board[i][j].getName().equals(one.getType())){
              one.addScore(4);
            }
           board[i][j] = new Candy ("blank");
           board[i + 1][j] = new Candy ("blank");
           board[i + 2][j] = new Candy ("blank");
           board[i + 3][j] = new Candy ("blank");
        }
        else result = false;
      }
    }
    for (int i = 0; i < board.length; i++){
      for (int j = 0; j < board[0].length - 3; j++){
         if (board[i][j].getName().equals(board[i][j + 1].getName()) && 
             board[i][j].getName().equals(board[i][j + 2].getName()) &&
             board[i][j].getName().equals(board[i][j + 3].getName())){ //4 in a row
            if (board[i][j].getName().equals(one.getType())){
              one.addScore(4);
            }
            board[i][j] = new Candy ("blank");
            board[i][j + 1] = new Candy ("blank");
            board[i][j + 2] = new Candy ("blank");
            board[i][j + 3] = new Candy ("blank");
            result = true;
         }
      }
      
    }
    return result;
  }
  
  private boolean eliminate5 (){
    boolean result = true;
    for (int i = 0; i < board.length - 4; i++){
      for (int j = 0; j < board[0].length; j++){
        if (board[i][j].getName().equals(board[i + 1][j].getName()) && 
            board[i][j].getName().equals(board[i + 2][j].getName()) &&
            board[i][j].getName().equals(board[i + 3][j].getName()) &&
            board[i][j].getName().equals(board[i + 4][j].getName())){ //5 in a col
            if (board[i][j].getName().equals(one.getType())){
              one.addScore(5);
            }
           board[i][j] = new Candy ("blank");
           board[i + 1][j] = new Candy ("blank");
           board[i + 2][j] = new Candy ("blank");
           board[i + 3][j] = new Candy ("blank");
           board[i + 4][j] = new Candy ("blank");
        }
        else result = false;
      }
    }
    for (int i = 0; i < board.length; i++){
      for (int j = 0; j < board[0].length - 4; j++){
         if (board[i][j].getName().equals(board[i][j + 1].getName()) && 
             board[i][j].getName().equals(board[i][j + 2].getName()) &&
             board[i][j].getName().equals(board[i][j + 3].getName()) &&
             board[i][j].getName().equals(board[i][j + 4].getName())){ //5 in a row
            if (board[i][j].getName().equals(one.getType())){
              one.addScore(5);
            }
           board[i][j] = new Candy ("blank");
           board[i][j + 1] = new Candy ("blank");
           board[i][j + 2] = new Candy ("blank");
           board[i][j + 3] = new Candy ("blank");
           board[i][j + 4] = new Candy ("blank");
           result = true;
         }
      }
    }
    return result;
  }
  
}
