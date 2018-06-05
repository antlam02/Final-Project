import java.util.*;
Block[][] grid = new Block[24][10];
ArrayList<Piece> falling = new ArrayList<Piece>();
ArrayList<Block> onBoard = new ArrayList<Block>();
void setup() {
  size(300, 720);
  for (int r =0; r<24; r++) {
    for (int c = 0; c<10; c++) {
      grid[r][c]= new Block(r, c, color(255));
    }
  }
}
void draw() {
  if (frameCount%10==0) {
    add();
    checkCollision();
    for (int r =0; r<24; r++) {
      for (int c = 0; c<10; c++) {
        fill(grid[r][c].c);
        rect(c*30, r*30, c*30+30, r*30+30);
      }
    }
  }
  checkFullRow();
}
void add() {
  if (falling.size()==0) {
    falling.add(new Piece());
  }
}

void checkCollision() {
  if (falling.get(0).checkCollisions()) {
    for (Block b : falling.get(0).blocks) {
      onBoard.add(b);
    }
    falling.remove(0);
  } else {
    falling.get(0).moveDown();
  }
}


void checkFullRow() {
  for (int r = grid.length - 1; r > -1; r--) {
    boolean full = true;
    for (int c = 0; c < grid[0].length; c++) {
      if (grid[r][c].c == color(255)){
        full = false;
        c = grid[0].length; //**im not sure if break is allowed
      }
    }
    if (full){
      for (Block b : grid[r]){
       b.c = color(255); 
      }
      
      for (Block b : onBoard){
        if (b.x < r){
         println(b.x);
         grid[b.y][b.x+1].c = b.c;
         b.c = color(255);
        }
      }
    }
    
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    moveRight();
  }
  if (keyCode == LEFT) {
    moveLeft();
  }
  if (keyCode == UP ) {
    rotate(true); //left
  }
  if (key == 'e' ) {
    rotate(false); //right
  }
}
void moveRight() {
  for (Piece current : falling) {
    current.moveRight();
  }
}
void moveLeft() {
  for (Piece current : falling) {
    current.moveLeft();
  }
}

void rotate(boolean left) {
  for (Piece current : falling) {
    current.rotate(left);
  }
}
