Panel crushP;
static final int SQUARE_SIZE = 100;//this is a constant.
int draggedCol;
int draggedRow;
int countdown;
void setup(){
  size(515, 515);
  crushP = new Panel((height -15)/ SQUARE_SIZE, (width -15)/SQUARE_SIZE);
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
        countdown += 60;
  }
   }
    draggedCol = col;
    draggedRow = row;
    

}


void draw(){
  grid(crushP);
  if(countdown > 0){
    countdown--;
    //System.out.println(countdown);
  }
  crushP.eliminate();
  crushP.moveDown();
  
}
