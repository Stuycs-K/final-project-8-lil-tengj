Panel crushP;
static final int SQUARE_SIZE = 100;//this is a constant.
void setup(){
  size(515, 515);
  crushP = new Panel((height -15)/ SQUARE_SIZE, (width -15)/SQUARE_SIZE);
  //crushP = new Panel(5,5);
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


void draw(){
  grid(crushP);
}
