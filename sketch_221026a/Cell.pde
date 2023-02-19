class Cell{
 int i,j;
 int x,y;
 boolean visited;
 boolean path;
 boolean seen;
 int v;
 boolean [] walls = {true,true,true,true};
 ArrayList<Cell> neighbours = new ArrayList<Cell>();
 Cell(int i,int j){
  this.i = i;
  this.j = j;
  this.x = i*rows;
  this.y = j*cols;
  visited = false;
  path = false;
  this.v = 0;
 }
 
 void show(){
  int w = rows;
  stroke(255);
  if(this.visited){
    noStroke();
    //fill(0,120,0);
    rect(x,y,w,w);
    stroke(255);
  }
  if(seen){
    noStroke();
    fill(120,0,120);
    rect(x,y,w,w);
    stroke(255);
    noFill();
  }
  if(walls[0]){
    line(x,y,x+w,y);
  }
  if(walls[1]){
    line(x+w,y,x+w,y+w);
  }
  if(walls[2]){
    line(x+w,y+w,x,y+w);
  }
  if (walls[3]){
    line(x,y+w,x,y);
  }
 }
 void addN(){
  if(this.i > 0){
   neighbours.add(maze[i-1][j]); 
  }if(this.j > 0){
   neighbours.add(maze[i][j-1]); 
  }  if(this.i < n-1){
   neighbours.add(maze[i+1][j]); 
  }  if(this.j < n - 1){
   neighbours.add(maze[i][j+1]); 
  }
 }
 boolean hasUnvisited(){
   for(Cell c : neighbours){
    if(c.visited == false){
     return true; 
    }
   }
   return false;
 }
 Cell pick(){
  Cell n = neighbours.get(floor(random(0,neighbours.size())));
  while(n.visited){
      neighbours.remove(n);
      n = neighbours.get(floor(random(0,neighbours.size())));
  }
  neighbours.remove(n);
  n.visited = true;
  return n;
 }
}
