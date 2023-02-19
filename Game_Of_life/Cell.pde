class Cell{
 int val;
 int i,j;
 ArrayList<Cell> neighbours = new ArrayList<Cell>();
 Cell(int x,int y,int val){
   this.val = val;
   this.i = x;
   this.j = y;
 }
 void addN(){
   int r[] = new int[]{-1,0,1,1,1,0,-1,-1};
   int c[] = new int[]{-1,-1,-1,0,1,1,1,0};
   for(int k = 0;k<8;k++){
    int x = this.i + r[k];
    int y = this.j + c[k];
    if(x >= 0 && x < n && y >= 0 && y<n){
     neighbours.add(maze[x][y]); 
    }
   }
 }
 
 void show(){
   int x = this.i * rows;
   int y = this.j * cols;
   int w = rows;
   if(this.val == 1){
    fill(255);
    rect(x,y,rows,rows);
    noFill();
   }
   stroke(255);
   line(x,y,x+w,y);
   line(x+w,y,x+w,y+w);
   line(x+w,y+w,x,y+w);
   line(x,y+w,x,y);
 }
 
 int score(){
  int a = 0;
  for(Cell c : neighbours){
    if(c.val == 1 || c.val == 3){
     a++; 
    }
  }
  return a;
 }
 
 void update(){
   if(this.score() < 2){
    if(this.val == 1){
     this.val = 3; 
    }
   }
   else if(this.val == 1 && (this.score() == 2 || this.score() == 3)){
    this.val = 1; 
   }else if(this.val == 0 && this.score() == 3){
    this.val = 2; 
   }else if(this.val == 1 && this.score() > 3){
    this.val = 3; 
   }
 }
 
 void finalUpdate(){
  if(this.val == 2){
    this.val = 1;
  }else if(this.val == 3){
   this.val = 0; 
  }
 }
  
}
