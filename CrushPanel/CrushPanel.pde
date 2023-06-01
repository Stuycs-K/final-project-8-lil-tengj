import processing.sound.*;
Panel crushP;
static final int SQUARE_SIZE = 100;//this is a constant.

int draggedCol;
int draggedRow;
int countdown;
SoundFile eliminate;
SoundFile cantSwap;


void setup(){
  
  eliminate = new SoundFile(this, "moneyInSound.wav");
  cantSwap = new SoundFile(this, "errorSound.wav");
  size(615, 615);
  int[] num = {10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20};
  String[] type = {"blue", "green", "yellow", "orange", "red", "purple"};
  crushP = new Panel((height -15)/ SQUARE_SIZE, (width -15)/SQUARE_SIZE, num[(int)(Math.random()*11)], new Candy(type[(int)(Math.random()*6)]));
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
    //eliminate = new SoundFile(this, "moneyInSound.mp3");

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
     //cantSwap.play();
 }
   else eliminate.play();
    swap = false;

}
    draggedRow = row; draggedCol = col;

}

void keyPressed(){
  if (key == 'r'){
    crushP.fillPanel();
  }
}


void draw(){

  grid(crushP);
  //if(countdown > 0){
  //  countdown--;
  //  //System.out.println(countdown);
  //}
  fill(0);
    text("GOAL: " + crushP.one.getObjective() + " " + crushP.one.getType(), 0, 610);
  text("SCORE: " + crushP.one.getScore(), 300, 610);

  if(crushP.eliminate()) eliminate.play();
   crushP.moveDown();

  //println(crushP.one.passLevel());  
  crushP.dropNew();
  if (crushP.one.passLevel()){
    background(255);
    text("congrats!", 250, 250);
  }

}
