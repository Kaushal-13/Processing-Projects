int n = 25;
Cell maze[][];
int rows,cols;
void setup(){
  size(900,900);
  rows = width/n;
  cols = height/n;
  maze = new Cell[n][n];
  for(int i = 0;i<n;i++){
   for(int j = 0;j<n;j++){
    double a = Math.random();
    int v = (int)(a*2);
    //print(v);
    maze[i][j] = new Cell(i,j,v); 
   }
  }
  for(int i = 0;i<n;i++){
   for(int j = 0;j<n;j++){
    maze[i][j].addN(); 
   }
  }
  maze[2][0].val = 1;
  maze[2][1].val  =1;
  maze[2][2].val = 1;
  
}

void draw(){
  background(0);
  //frameRate(10);
   for(int i = 0;i<n;i++){
   for(int j = 0;j<n;j++){
    maze[i][j].update(); 
   }
  }
  
    for(int i = 0;i<n;i++){
   for(int j = 0;j<n;j++){
    maze[i][j].finalUpdate(); 
   }
  }
  
  for(int i = 0;i<n;i++){
   for(int j = 0;j<n;j++){
    maze[i][j].show(); 
   }
  }
  
  
}
