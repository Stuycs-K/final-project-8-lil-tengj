import processing.sound.*;
Panel crushP;
static final int SQUARE_SIZE = 100;//this is a constant.

int MODE = 0;
int draggedCol;
int draggedRow;
int countdown;
SoundFile eliminate;
SoundFile cantSwap;
SoundFile BGM;
int[] num;
String[] type;
PImage backg;
PImage winP;
void setup(){
  eliminate = new SoundFile(this, "moneyInSound.wav");
  cantSwap = new SoundFile(this, "errorSound.wav");
  BGM = new SoundFile(this, "happyBGM.wav");
  winP = loadImage("CandyCrushWPic.jpg");
  winP.resize(width,height);
  BGM.loop();
  size(625, 625);
  num = new int[] {10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20};
  type = new String[] {"blue", "green", "yellow", "orange", "red", "purple"};

  crushP = new Panel((height -25)/ SQUARE_SIZE, (width -25)/SQUARE_SIZE, num[(int)(Math.random()*11)], new Candy(type[(int)(Math.random()*6)], "powerless"));
  //crushP = new Panel(5,5);
  System.out.println(crushP);
  backg = loadImage("CandyCrushBackG.jpg");
  backg.resize(width,height);
  background(backg);
  fill(0);
  textSize(40);
  textAlign(CENTER, CENTER);
  text("press any key to start the game!", width/2, height/2);
}


void grid(Panel crushP) {
  PImage colourBomb = loadImage("colorfulCandy.png");
  colourBomb.resize(SQUARE_SIZE,SQUARE_SIZE);
  PImage blueC = loadImage("BluecandyHTML5.png");
  blueC.resize(SQUARE_SIZE,SQUARE_SIZE);
  PImage redC = loadImage("RedcandyHTML5.png");
  redC.resize(SQUARE_SIZE,SQUARE_SIZE);
  PImage orangeC = loadImage("OrangecandyHTML5.png");
  orangeC.resize(SQUARE_SIZE,SQUARE_SIZE);
  PImage yellowC = loadImage("YellowcandyHTML5.png");
  yellowC.resize(SQUARE_SIZE,SQUARE_SIZE);
  PImage greenC = loadImage("GreencandyHTML5.png");
  greenC.resize(SQUARE_SIZE,SQUARE_SIZE);
  PImage purpleC = loadImage("PurplecandyHTML5.png");
  purpleC.resize(SQUARE_SIZE,SQUARE_SIZE);
  //fill(0);
  stroke(255);
  //strokeWeight(15);
  int x =0;
  int y=0;
  for(int i = 0; i < width -25; i+= SQUARE_SIZE){
    for(int j = 0; j < height - 25; j += SQUARE_SIZE){
      if(x>= crushP.getRow()){
        x=0;
      }
      if(y>= crushP.getCol()){
        y=0;
      }
        Candy c = crushP.getCandy(x,y);
        if (!c.getPower().equals("colourBomb")){
          if(c.getName().equals("blue")){
            if (c.getPower().equals("verticalStripe")){
              
            } else if (c.getPower().equals("horizontalStripe")){
              
            } else image(blueC, i, j);
          }
          if(c.getName().equals("red")){
            if (c.getPower().equals("verticalStripe")){
              
            } else if (c.getPower().equals("horizontalStripe")){
              
            } else image(redC, i, j);
          }
          if(c.getName().equals("yellow")){
            if (c.getPower().equals("verticalStripe")){
              
            } else if (c.getPower().equals("horizontalStripe")){
              
            } else image(yellowC, i, j);
          }
          if(c.getName().equals("green")){
            if (c.getPower().equals("verticalStripe")){
              
            } else if (c.getPower().equals("horizontalStripe")){
              
            } else image(greenC, i, j);
          }
          if(c.getName().equals("purple")){
            if (c.getPower().equals("verticalStripe")){
              
            } else if (c.getPower().equals("horizontalStripe")){
              
            } else image(purpleC, i, j);
          }
          if(c.getName().equals("orange")){
            if (c.getPower().equals("verticalStripe")){
              
            } else if (c.getPower().equals("horizontalStripe")){
              
            } else image(orangeC, i, j);
          } 
        }
        else{
           image(colourBomb,i,j);
        }
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
  if(MODE == 0){
    MODE =1;
  }
  if(MODE ==1){
  
  if (key == 'r'){
    crushP.fillPanel();
  }
  if (key == 'n'){
    crushP = new Panel((height -15)/ SQUARE_SIZE, (width -15)/SQUARE_SIZE, num[(int)(Math.random()*11)], new Candy(type[(int)(Math.random()*6)], "powerless"));
    //System.out.println(crushP);
    grid(crushP);
  }}
}


void draw(){
  if(MODE ==1 ){
  background(backg);
  grid(crushP);
  //if(countdown > 0){
  //  countdown--;
  //  //System.out.println(countdown);
  //}
  fill(0);
  textSize(22);
  textAlign(BOTTOM, BOTTOM);
  text("GOAL: " + crushP.one.getObjective() + "  " + crushP.one.getType(), 10, 620);
  text("SCORE: " + crushP.one.getScore(), 250, 620);
  text("press 'r' if you're stuck", 410, 620);

  if(crushP.eliminate()) eliminate.play();
   crushP.moveDown();

  //println(crushP.one.passLevel());  
  crushP.dropNew();
  if (crushP.one.passLevel()){
    background(winP);
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(50);
    text("congrats!", 290, 250);
    text("press 'n' to play again!", 290, 320);
  }
  }
}
