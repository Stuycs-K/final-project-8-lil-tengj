import processing.sound.*;
Panel crushP;
static final int SQUARE_SIZE = 60;//this is a constant.

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
PImage blueC; PImage redC; PImage orangeC; PImage colourBomb; PImage yellowC; PImage greenC; PImage purpleC;
PImage StripedBlueH; PImage StripedBlueV; PImage StripedGreenH; PImage StripedGreenV;
PImage StripedOrangeH; PImage StripedOrangeV; PImage StripedPurpleH; PImage StripedPurpleV;
PImage StripedRedH; PImage StripedRedV; PImage StripedYellowH; PImage StripedYellowV;

void setup(){
  frameRate(30);
  blueC = loadImage("BluecandyHTML5.png"); blueC.resize(SQUARE_SIZE,SQUARE_SIZE);
  redC = loadImage("RedcandyHTML5.png"); redC.resize(SQUARE_SIZE,SQUARE_SIZE);
  orangeC = loadImage("OrangecandyHTML5.png"); orangeC.resize(SQUARE_SIZE,SQUARE_SIZE);
  yellowC = loadImage("YellowcandyHTML5.png"); yellowC.resize(SQUARE_SIZE,SQUARE_SIZE);
  colourBomb = loadImage("colorfulCandy.png"); colourBomb.resize(SQUARE_SIZE,SQUARE_SIZE);
  greenC = loadImage("GreencandyHTML5.png"); greenC.resize(SQUARE_SIZE,SQUARE_SIZE);
  purpleC = loadImage("PurplecandyHTML5.png"); purpleC.resize(SQUARE_SIZE,SQUARE_SIZE);
  StripedBlueH = loadImage("Striped_blue_h.png"); StripedBlueH.resize(SQUARE_SIZE,SQUARE_SIZE);
  StripedBlueV = loadImage("Striped_blue_v.png"); StripedBlueV.resize(SQUARE_SIZE,SQUARE_SIZE);
  StripedGreenH = loadImage("Striped_green_h.png"); StripedGreenH.resize(SQUARE_SIZE,SQUARE_SIZE);
  StripedGreenV = loadImage("Striped_green_v.png"); StripedGreenV.resize(SQUARE_SIZE,SQUARE_SIZE);
  StripedOrangeH = loadImage("Striped_orange_h.png"); StripedOrangeH.resize(SQUARE_SIZE,SQUARE_SIZE);
  StripedOrangeV = loadImage("Striped_orange_v.png"); StripedOrangeV.resize(SQUARE_SIZE,SQUARE_SIZE);
  StripedPurpleH = loadImage("Striped_purple_h.png"); StripedPurpleH.resize(SQUARE_SIZE,SQUARE_SIZE);
  StripedPurpleV = loadImage("Striped_purple_v.png"); StripedPurpleV.resize(SQUARE_SIZE,SQUARE_SIZE);
  StripedRedH = loadImage("Striped_red_h.png"); StripedRedH.resize(SQUARE_SIZE,SQUARE_SIZE);
  StripedRedV = loadImage("Striped_red_v.png"); StripedRedV.resize(SQUARE_SIZE,SQUARE_SIZE);
  StripedYellowH = loadImage("Striped_yellow_h.png"); StripedYellowH.resize(SQUARE_SIZE,SQUARE_SIZE);
  StripedYellowV = loadImage("Striped_yellow_v.png"); StripedYellowV.resize(SQUARE_SIZE,SQUARE_SIZE);
  

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
              image(StripedBlueV, i,j);
            } else if (c.getPower().equals("horizontalStripe")){
              image(StripedBlueH, i,j);
            } else image(blueC, i, j);
          }
          if(c.getName().equals("red")){
            if (c.getPower().equals("verticalStripe")){
              image(StripedRedV, i, j);
            } else if (c.getPower().equals("horizontalStripe")){
              image(StripedRedH, i, j);
            } else image(redC, i, j);
          }
          if(c.getName().equals("yellow")){
            if (c.getPower().equals("verticalStripe")){
              image(StripedYellowV, i, j);
            } else if (c.getPower().equals("horizontalStripe")){
              image(StripedYellowH, i, j);
            } else image(yellowC, i, j);
          }
          if(c.getName().equals("green")){
            if (c.getPower().equals("verticalStripe")){
              image(StripedGreenV,i,j);
            } else if (c.getPower().equals("horizontalStripe")){
              image(StripedGreenH,i,j);
            } else image(greenC, i, j);
          }
          if(c.getName().equals("purple")){
            if (c.getPower().equals("verticalStripe")){
              image(StripedPurpleV,i,j);
            } else if (c.getPower().equals("horizontalStripe")){
              image(StripedPurpleH,i,j);
            } else image(purpleC, i, j);
          }
          if(c.getName().equals("orange")){
            if (c.getPower().equals("verticalStripe")){
              image(StripedPurpleV,i,j);
            } else if (c.getPower().equals("horizontalStripe")){
              image(StripedPurpleH,i,j);
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
    //System.out.println(swap);
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
  if(MODE !=0){
  
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
