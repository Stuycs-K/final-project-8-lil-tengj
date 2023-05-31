Panel crushP;
static final int SQUARE_SIZE = 100;//this is a constant.
int swappedCol;
int swappedRow;
int draggedCol;
int draggedRow;
int countdown;

void setup(){
  

  size(615, 615);
  crushP = new Panel((height -15)/ SQUARE_SIZE, (width -15)/SQUARE_SIZE, 10, new Candy("blue"));
  //crushP = new Panel(5,5);
  System.out.println(crushP);
}


void grid(Panel crushP) {
  PImage blueC = loadImage("blueC.png");
  blueC.resize(SQUARE_SIZE,SQUARE_SIZE);
  PImage redC = loadImage("redC.png");
  redC.resize(SQUARE_SIZE,SQUARE_SIZE);
  PImage orangeC = loadImage("orangeC.png");
  orangeC.resize(SQUARE_SIZE,SQUARE_SIZE);
  PImage yellowC = loadImage("yellowC.png");
  yellowC.resize(SQUARE_SIZE,SQUARE_SIZE);
  PImage greenC = loadImage("greenC.png");
  greenC.resize(SQUARE_SIZE,SQUARE_SIZE);
  PImage purpleC = loadImage("purpleC.png");
  purpleC.resize(SQUARE_SIZE,SQUARE_SIZE);
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
        if(c.getName().equals("blue")){
          image(blueC, i, j);
        }
         if(c.getName().equals("red")){
          image(redC, i, j);
        }
         if(c.getName().equals("yellow")){
          image(yellowC, i, j);
        }
         if(c.getName().equals("green")){
          image(greenC, i, j);
        }
         if(c.getName().equals("purple")){
          image(purpleC, i, j);
        }
         if(c.getName().equals("orange")){
          image(orangeC, i, j);
        }
        //c.buildCandy();
        //rect(i, j, SQUARE_SIZE, SQUARE_SIZE);
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
  boolean swap = false;
  int col = (mouseX-15) / SQUARE_SIZE;
  int row = (mouseY-15) / SQUARE_SIZE;
  if (col >= 0 && col < crushP.getCol() && row >= 0 && row < crushP.getRow()) {
    if(row == draggedRow+1 || row ==draggedRow -1 ||
    col == draggedCol+1 || col ==draggedCol -1)
      //if(countdown ==0){

    crushP.swapCandy(draggedRow, draggedCol, row, col);
    swap = crushP.eliminate();
    System.out.println(swap);
     if(!swap){ crushP.swapCandy(row,col , draggedRow, draggedCol);
 }
    swap = false;

}
    draggedRow = row; draggedCol = col;

}


void draw(){
  
  grid(crushP);
  //if(countdown > 0){
  //  countdown--;
  //  //System.out.println(countdown);
  //}

  crushP.eliminate();
   crushP.moveDown();

  //println(crushP.one.passLevel());  
  crushP.dropNew();
  if (crushP.one.passLevel()){
    background(255);
    text("congrats!", 250, 250);
  }

}
