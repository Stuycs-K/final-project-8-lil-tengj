Panel crushP;
static final int SQUARE_SIZE = 100;//this is a constant.
int swappedCol;
int swappedRow;
int draggedCol;
int draggedRow;
int countdown;
void setup(){
  size(515, 515);
  crushP = new Panel((height -15)/ SQUARE_SIZE, (width -15)/SQUARE_SIZE, 10, new Candy("blue"));
  //crushP = new Panel(5,5);
  System.out.println(crushP);
}


void grid(Panel crushP) {
  background(255);
  //fill(0);
  stroke(255);
  //strokeWeight(15);
  int x =0;
  int y=0;
  for(int i = 0; i < width -15; i+= SQUARE_SIZE){
    for(int j = 0; j < height - 15; j += SQUARE_SIZE){
      if(x>= crushP.getRow()){
        x=0;
      }
      if(y>= crushP.getCol()){
        y=0;
      }
        Candy c = crushP.getCandy(x,y);
        c.buildCandy();
        rect(i, j, SQUARE_SIZE, SQUARE_SIZE);
        x++;
    }
    y++;
  }
}

void mousePressed(){
  int col = (mouseX -15) / SQUARE_SIZE;
  int row = (mouseY -15)/ SQUARE_SIZE;
  if (col >= 0 && col < crushP.getCol()&& row >= 0 && row < crushP.getRow()) {
    draggedCol = col;
    draggedRow = row;
  }
}

void mouseDragged() {
  int col = (mouseX-15) / SQUARE_SIZE;
  int row = (mouseY-15) / SQUARE_SIZE;
  if (col >= 0 && col < crushP.getCol() && row >= 0 && row < crushP.getRow()) {
    if(row == draggedRow+1 || row ==draggedRow -1 ||
    col == draggedCol+1 || col ==draggedCol -1)
      if(countdown ==0){

    crushP.swapCandy(draggedRow, draggedCol, row, col);
    System.out.println(crushP.eliminate());
    
        countdown += 60;
  }
   }
    swappedCol = draggedCol;
    swappedRow = draggedRow;
    draggedCol = col;
    draggedRow = row;
    

}


void draw(){
  
  grid(crushP);
  if(countdown > 0){
    countdown--;
    //System.out.println(countdown);
  }
<<<<<<< HEAD
if(!crushP.eliminate()){ crushP.swapCandy(swappedRow,swappedCol , draggedRow, draggedCol);
 }
 crushP.moveDown();
  //crushP.dropNew();
=======
  crushP.eliminate();
  crushP.moveDown();
  crushP.dropNew();
<<<<<<< HEAD
  if (crushP.one.passLevel()){
    background(255);
    text("congrats!", 250, 250);
  }
=======
  println(crushP.one.passLevel());
>>>>>>> 077c0a7ca8b4558533a7199acc87d8e4201efcb1
>>>>>>> b7a3767e5603a8209f03b95f4de62333acfaec2d
  
}
