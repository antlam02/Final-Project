public class Piece {
  int [][] LinePiece1 = {
    {0, 1, 0, 0}, 
    {0, 1, 0, 0}, 
    {0, 1, 0, 0}, 
    {0, 1, 0, 0}
  };
  int [][] LinePiece2 = {
    {0, 0, 0, 0}, 
    {0, 0, 0, 0}, 
    {1, 1, 1, 1}, 
    {0, 0, 0, 0}
  };
  int [][] LPiece1 = {
    {0, 0, 1, 0}, 
    {0, 0, 1, 0}, 
    {0, 1, 1, 0}, 
    {0, 0, 0, 0}
  };
  int [][] LPiece2 = {
    {0, 1, 0, 0}, 
    {0, 1, 1, 1}, 
    {0, 0, 0, 0}, 
    {0, 0, 0, 0}
  }; 
  int [][] LPiece3 = {
    {0, 0, 1, 1}, 
    {0, 0, 1, 0}, 
    {0, 0, 1, 0}, 
    {0, 0, 0, 0}
  };
  int [][] LPiece4 = {
    {0, 0, 0, 0}, 
    {0, 1, 1, 1}, 
    {0, 0, 0, 1}, 
    {0, 0, 0, 0}
  };
  int [][] BLPiece1 = {
    {0, 1, 1, 0}, 
    {0, 0, 1, 0}, 
    {0, 0, 1, 0}, 
    {0, 0, 0, 0}
  };
  int [][] BLPiece2 = {
    {0, 0, 0, 1}, 
    {0, 1, 1, 1}, 
    {0, 0, 0, 0}, 
    {0, 0, 0, 0}
  }; 
  int [][] BLPiece3 = {
    {0, 0, 1, 0}, 
    {0, 0, 1, 0}, 
    {0, 0, 1, 1}, 
    {0, 0, 0, 0}
  };
  int [][] BLPiece4 = {
    {0, 0, 0, 0}, 
    {0, 1, 1, 1}, 
    {0, 1, 0, 0}, 
    {0, 0, 0, 0}
  };
  int [][] SquarePiece1 = {
    {0, 1, 1, 0}, 
    {0, 1, 1, 0}, 
    {0, 0, 0, 0}, 
    {0, 0, 0, 0}
  };
  int [][] ZPiece1 = {
    {0, 0, 1, 0}, 
    {0, 0, 1, 1}, 
    {0, 0, 0, 1}, 
    {0, 0, 0, 0}
  };
  int [][] ZPiece2 = {
    {0, 0, 0, 0}, 
    {0, 0, 1, 1}, 
    {0, 1, 1, 0}, 
    {0, 0, 0, 0}
  };       
  int [][] BZPiece1 = {
    {0, 0, 1, 0}, 
    {0, 1, 1, 0}, 
    {0, 1, 0, 0}, 
    {0, 0, 0, 0}
  };
  int [][] BZPiece2 = {
    {0, 0, 0, 0}, 
    {0, 1, 1, 0}, 
    {0, 0, 1, 1}, 
    {0, 0, 0, 0}
  }; 
  int [][] TPiece1 = {
    {0, 0, 1, 0}, 
    {0, 1, 1, 0}, 
    {0, 0, 1, 0}, 
    {0, 0, 0, 0}
  };
  int [][] TPiece2 = {
    {0, 0, 1, 0}, 
    {0, 1, 1, 1}, 
    {0, 0, 0, 0}, 
    {0, 0, 0, 0}
  };
  int [][] TPiece3 = {
    {0, 0, 1, 0}, 
    {0, 0, 1, 1}, 
    {0, 0, 1, 0}, 
    {0, 0, 0, 0}
  };
  int [][] TPiece4 = {
    {0, 0, 0, 0}, 
    {0, 1, 1, 1}, 
    {0, 0, 1, 0}, 
    {0, 0, 0, 0}
  };
  int [][][] LinePiece = {LinePiece1, LinePiece2, LinePiece1, LinePiece2};
  int [][][] LPiece = {LPiece1, LPiece2, LPiece3, LPiece4};
  int [][][] BLPiece = {BLPiece1, BLPiece2, BLPiece3, BLPiece4};
  int [][][] SquarePiece = {SquarePiece1, SquarePiece1, SquarePiece1, SquarePiece1};
  int [][][] ZPiece = {ZPiece1, ZPiece2, ZPiece1, ZPiece2};
  int [][][] BZPiece = {BZPiece1, BZPiece2, BZPiece1, BZPiece2};
  int [][][] TPiece = {TPiece1, TPiece2, TPiece3, TPiece4};
  int[][][][] Pieces = {LinePiece, LPiece, BLPiece, SquarePiece, ZPiece, BZPiece, TPiece};
  int [][] current;
  int rotation;
  int type;
  int[] corner = {0, 0};
  color[] colors = {color(255, 0, 0), color(0, 0, 255), color(255, 165, 0), color(255, 255, 0), color(0, 255, 0), color(255, 0, 255), color(0, 255, 255)};
  Block[] blocks;

  public Piece() {
    rotation = (int)(Math.random()*4);
    type = (int)(Math.random()*7);
    current = Pieces[type][rotation];
    blocks = new Block[4];
    int i = 0;
    corner[1]=fits();
 //   System.out.println(corner[1]);
    if (corner[1]!=-1) {
      for (int r = 0; r < 4; r++) {
        for (int c = 0; c < 4; c++) {
          if (current[r][c] == 1) {
            blocks[i] = new Block(r, c+corner[1], colors[type]);
            i++;
          }
        }
      }
    } else {
      state = "Over";
      falling.remove(this);
    }
  }
  public int fits() {
    for (int i =0; i<7; i++) {
      boolean fit = true;
      for (int r = 0; r < 4; r++) {
        for (int c = 0; c < 4; c++) {
          if (current[r][c] == 1 && (c+i>9||grid[r][c+i].c!=color(255))) {
            fit = false;
          }
        }
      }
      if (fit) {
        return i;
      }
    }
    return -1;
  }

  public void rotate(boolean left) {
    if (canRotate(left)) {
      // falling.remove(this);
      int x = corner[0];
      int y = corner[1];
      for (int r = 0; r < 4; r++) {
        for (int c = 0; c < 4; c++) {
          if (current[r][c] == 1) {
            grid[r+x][c+y].c = color(255);
          }
        }
      }
      if (left) {
        rotation = (rotation + 3) % 4;
        current = Pieces[type][rotation];
      } else {
        rotation = (rotation + 1) % 4;
        current = Pieces[type][rotation];
      }
      int i = 0;
      for (int r = 0; r < 4; r++) {
        for (int c = 0; c < 4; c++) {
          if (current[r][c] == 1) {
            blocks[i] = new Block(r + x, c + y, colors[type]);
            i += 1;
            grid[r + x][c + y].c = colors[type];
          } else {
          }
        }
      }
    }
  }



  public boolean canRotate(boolean left) {
    int newR;
    if (left) {
      newR = (rotation + 3) % 4;
    } else {
      newR = (rotation + 1) % 4;
    }
    int[][] temp = Pieces[type][newR];
    for (int r = 0; r < 4; r++) {
      for (int c = 0; c < 4; c++) {
        if (temp[r][c]==1) {
          if (r+corner[0]<0||r+corner[0]>23||c+corner[1]<0||c+corner[1]>9||(grid[r + corner[0]][c + corner[1]].c != color(255)&&current[r][c]!=1)) {
            return false;
          }
        }
      }
    }
    //    System.out.println(true);
    return true;
  }
  public boolean checkCollisions() {
    int[] cols ={-1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
    for (int i=0; i<4; i++) {
      if (blocks[0]==null){
        return true;
      }
      int x =blocks[i].x;
      //   println(x);
      int y =blocks[i].y;
      if (x>cols[y]) {
        cols[y]=x;
      }
    }
    for (int i=0; i<10; i++) {
      if (cols[i]!=-1 && (cols[i]==23 || grid[cols[i]+1][i].c != color(255))) {
        return true;
      }
    }
    return false;
  }

  public void moveDown() {
    for (Block block : blocks) {
      grid[block.x][block.y].c=color(255);
    }
    for (Block block : blocks) {
      block.x+=1;
      grid[block.x][block.y].c=block.c;
    }
    corner[0] += 1;
  }

  public void moveLeft() {
    if (canMoveLeft()) {
      for (Block block : blocks) {
        grid[block.x][block.y].c=color(255);
      }
      for (Block block : blocks) {
        block.y-=1;
        grid[block.x][block.y].c=block.c;
      }
      corner[1] -= 1;
    }
  }
  public boolean canMoveLeft() {
    for (Block block : blocks) {
      if (block.y<=0) {
        return false;
      }
    }
    int[] rows =new int[24];
    for (int i =0; i<24; i++) {
      rows[i]=100;
    }
    for (int i=0; i<4; i++) {
      int x =blocks[i].x;
      int y =blocks[i].y;
      if (y<rows[x]) {
        rows[x]=y;
      }
    }
    for (int i=0; i<24; i++) {
      if (rows[i]!=100 && (grid[i][rows[i]-1].c != color(255))) {
        return false;
      }
    }
    return true;
  }

  public boolean canMoveRight() {
    for (Block block : blocks) {
      if (block.y>8) {
        return false;
      }
    }
    int[] rows =new int[24];
    for (int i =0; i<24; i++) {
      rows[i]=-1;
    }
    for (int i=0; i<4; i++) {
      int x =blocks[i].x;
      int y =blocks[i].y;
      if (y>rows[x]) {
        rows[x]=y;
      }
    }
    for (int i=0; i<24; i++) {
      if (rows[i]!=-1 && (grid[i][rows[i]+1].c != color(255))) {
        return false;
      }
    }
    return true;
  }
  public void moveRight() {
    if (canMoveRight()) {
      for (Block block : blocks) {
        grid[block.x][block.y].c=color(255);
      }
      for (Block block : blocks) {
        if (block.y<9) {
          block.y+=1;
          grid[block.x][block.y].c=block.c;
        }
      }
      corner[1] += 1;
    }
  }
}
