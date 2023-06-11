import java.util.*;

public class Panel {
  private Candy[][] board;
  private int row;
  private int col;
  private Level one;

  public Panel(int r, int c, int howMany, Candy flavour) {
    board = new Candy[r][c];
    row = r;
    col = c;
    one = new Level (howMany, flavour);
    fillPanel();
  }

  public int getRow() {
    return row;
  }

  public int getCol() {
    return col;
  }

  public Candy getCandy(int r, int c) {
    return board[r][c];
  }

  private void fillPanel() {
    ArrayList <String> names = new ArrayList <String> ();
    names.add("red");
    names.add("orange");
    names.add("yellow");
    names.add("blue");
    names.add("purple");
    names.add("green");
    //fill board with randomly generated candiess
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board.length; j++) {
        board[i][j] = new Candy(names.get((int)(Math.random() * 6)), "powerless");
      }
    }
    for (int i = 0; i < board.length - 2; i++) {
      for (int j = 0; j < board.length; j++) {
        if (board[i][j].getName().equals(board[i + 1][j].getName()) &&
          board[i][j].getName().equals(board[i + 2][j].getName())) { //3 in a col
          String temp = board[i][j].getName();
          names.remove(temp);
          board[i][j] = new Candy(names.get((int)(Math.random() * 4)), "powerless");
          names.add(temp);
        }
      }
    }
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board.length - 2; j++) {
        if (board[i][j].getName().equals(board[i][j + 1].getName()) &&
          board[i][j].getName().equals(board[i][j + 2].getName())) { //3 in a row
          String temp = board[i][j].getName();
          names.remove(temp);
          board[i][j] = new Candy(names.get((int)(Math.random() * 4)), "powerless");
          names.add(temp);
        }
      }
    }
  }
  
  public void swapCandy(int row1, int col1, int row2, int col2) {
    if (col1 >= 0 && col1 < getCol() && row1 >= 0 && row1 < getRow() &&
      col2 >= 0 && col2 <getCol() && row2 >= 0 && row2 < getRow()) {
      if (((col1 == col2 +1 || col1 == col2 -1)&& row1 == row2) || ((row1 == row2+1 || row1 == row2-1) && col1==col2)) {
        //if(!(power(row1,col1) || power(row2, col2))){
        Candy cur = board[row1][col1];
        Candy swap = board[row2][col2];
        board[row1][col1] = board[row2][col2];
        board[row2][col2] = cur;
      //}
      if(cur.getPower().equals("colourBomb")){
        bomb(swap);
        board[row2][col2] = new Candy("blank", "powerless");
      }
      if(swap.getPower().equals("colourBomb")){
        bomb(cur);
        board[row1][col1] = new Candy("blank", "powerless");
      }
      if(cur.getPower().equals("verticalStripe")){
        eliminateCol(cur, col2);
      }
      if(swap.getPower().equals("verticalStripe")){
        eliminateCol(swap, col1);
      }
      if(cur.getPower().equals("horizontalStripe")){
        eliminateRow(cur,row2);
      }
      if(swap.getPower().equals("horizontalStripe")){
        eliminateRow(swap,row1);
      }
      }
    }
  }

  public String toString() {
    String result = "";
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board.length; j++) {
        result += board[i][j].getName();

        if (j == board.length-1) result += "\n";
        else {
          result+= ", ";
        }
      }
    }
    return result;
  }

  public void moveDown() {
    for (int i = board.length-1; i >= 0; i--) {
      for (int j = board[0].length -1; j >=0; j--) {
        if (board[i][j].getName().equals("blank")) {
          for (int p = i-1; p>=0; p-- ) {
            if (!board[p][j].getName().equals("blank")) {
              board[i][j] = board[p][j];
              board[p][j] = new Candy("blank", "powerless");
              p = -1;
            }
          }
        }
      }
    }
  }

  public boolean eliminate () {
    boolean result = false;
    if (eliminate5()) return true;
    if (eliminate4()) return true;
    ;
    for (int i = 0; i < board.length - 2; i++) {
      for (int j = 0; j < board[0].length; j++) {
        if (board[i][j].getName().equals(board[i + 1][j].getName()) &&
          board[i][j].getName().equals(board[i + 2][j].getName())) { //3 in a col
          if (board[i][j].getName().equals(one.getType())) {
            one.addScore(3);
          }
          board[i][j] = new Candy ("blank", "powerless");
          board[i + 1][j] = new Candy ("blank", "powerless");
          board[i + 2][j] = new Candy ("blank", "powerless");
          result = true;
          break;
        }
      }
    }
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length - 2; j++) {
        if (board[i][j].getName().equals(board[i][j + 1].getName()) &&
          board[i][j].getName().equals(board[i][j + 2].getName())) { //3 in a row
          if (board[i][j].getName().equals(one.getType())) {
            one.addScore(3);
          }
          board[i][j] = new Candy ("blank", "powerless");
          board[i][j + 1] = new Candy ("blank", "powerless");
          board[i][j + 2] = new Candy ("blank", "powerless");
          result = true;
          break;
        }
        //println(toString());
      }
    }
    return result;
  }



  public void dropNew() {
    for (int i = 0; i < board.length; i ++) {
      for (int j = 0; j < board[0].length; j++) {
        if (board[i][j].getName().equals("blank")) {
          ArrayList <String> names = new ArrayList <String> ();
          names.add("red");
          names.add("orange");
          names.add("yellow");
          names.add("blue");
          names.add("purple");
          names.add("green");
          board[i][j] = new Candy(names.get((int)(Math.random() * 6)), "powerless");
        }
      }
    }
  }

  private boolean eliminate4 () {
    boolean result = true;
    for (int i = 0; i < board.length - 3; i++){
      for (int j = 0; j < board[0].length; j++){
        if (board[i][j].getName().equals(board[i + 1][j].getName()) && 
            board[i][j].getName().equals(board[i + 2][j].getName()) &&
            board[i][j].getName().equals(board[i + 3][j].getName())){ //4 in a col
            
           if (board[i][j].getName().equals(one.getType())){
              one.addScore(4);
            }
           board[i][j] = new Candy (board[i][j].getName(), "verticalStripe");
           board[i + 1][j] = new Candy ("blank", "powerless");
           board[i + 2][j] = new Candy ("blank", "powerless");
           board[i + 3][j] = new Candy ("blank", "powerless");
           break;
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
            board[i][j] = new Candy (board[i][j].getName(), "horizontalStripe");
            board[i][j + 1] = new Candy ("blank", "powerless");
            board[i][j + 2] = new Candy ("blank", "powerless");
            board[i][j + 3] = new Candy ("blank", "powerless");
            result = true;
            break;
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
           board[i][j] = new Candy ("special", "colourBomb");
           board[i + 1][j] = new Candy ("blank", "powerless");
           board[i + 2][j] = new Candy ("blank", "powerless");
           board[i + 3][j] = new Candy ("blank", "powerless");
           board[i + 4][j] = new Candy ("blank", "powerless");
           break;
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
           board[i][j] = new Candy ("special", "colourBomb");
           board[i][j + 1] = new Candy ("blank", "powerless");
           board[i][j + 2] = new Candy ("blank", "powerless");
           board[i][j + 3] = new Candy ("blank", "powerless");
           board[i][j + 4] = new Candy ("blank", "powerless");
           result = true;
           break;
         }
      }
    }
    return result;
  }

  private void eliminateRow(Candy a, int row) {
    for (int i = 0; i < board[0].length; i++) {
      if (board[row][i].getName().equals(one.getType())){
              one.addScore(1);
            }
      board[row][i] = new Candy("blank", "powerless");
    }
  }

  private void eliminateCol(Candy a, int col) {
    for (int i = 0; i < board.length; i++) {
      if (board[i][col].getName().equals(one.getType())){
              one.addScore(1);
            }
      board[i][col] = new Candy("blank", "powerless");
    }
  }

  public boolean power(int row, int col) {
    return (!board[row][col].getPower().equals("powerless"));
  }

  private int bomb (Candy a) {
    int count = 0;
      for (int i = 0; i < board.length; i++) {
        for (int j = 0; j < board[0].length; j++) {
          if (board[i][j].getName().equals(a.getName())) {
            if (board[i][j].getName().equals(one.getType())){
              one.addScore(1);
            }
            board[i][j] = new Candy("blank", "powerless");
            count++;
          }
        }
      }
    return count;
  }
  
  public void makeBomb (int row, int col){
    board[row][col] = new Candy("red", "colourBomb");
  }
}
