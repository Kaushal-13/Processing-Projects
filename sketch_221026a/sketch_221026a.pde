import java.util.*;
boolean goal;
Searches sear = new Searches();
//For generating the maze;
Stack<Cell> s = new Stack<Cell>();
//For part 1 or the bfs.
Queue<Cell> q = new LinkedList<Cell>();
//For the A* part;
PriorityQueue<Cell> pq = new PriorityQueue(10,new Sorter());
int n = 10;
int rows,cols;
Cell maze[][];
boolean start = false;
Cell current = new Cell(0,0);
// let n be the size of the maze
void setup(){
 size(900,900); 
 rows = floor(width/n);
 cols = floor(height/n);
 fill(0,0,0);
 maze = new Cell[n][n];
 for(int i = 0;i<n;i++){
   for(int j = 0;j<n;j++){
    maze[i][j] = new Cell(i,j); 
   }
 }
  for(int i = 0;i<n;i++){
   for(int j = 0;j<n;j++){
    maze[i][j].addN(); 
   }
 }
 current = maze[0][0];
 s.push(current);
}

void draw(){
  //fill(0);
  background(0);
   for(int i = 0;i<n;i++){
   for(int j = 0;j<n;j++){
     maze[i][j].show();
   }
  }
  //frameRate(10);
  if(current.hasUnvisited()){
   Cell ne = current.pick();
   s.add(ne);
   int x1 = current.i;
   int x2 = ne.i;
   int y1 = current.j;
   int y2 = ne.j;
   if(x1 == x2 + 1){
    maze[x1][y1].walls[3] = false;
    maze[x2][y2].walls[1] = false;
   }else if(x1 == x2 - 1){
    maze[x1][y1].walls[1] = false;
    maze[x2][y2].walls[3] = false;
   }else if(y1 == y2 - 1){
    maze[x1][y1].walls[2] = false;
    maze[x2][y2].walls[0] = false;
   }else{
    maze[x1][y1].walls[0] = false;
    maze[x2][y2].walls[2] = false;
   }
   current = ne;
  }else if(s.size() > 0){
    current = s.pop();
  }else{
   if(start == false){
     print("Work Done");
     current = maze[0][0];
     //q.add(current);
     pq.add(current);
     start = true;
   }
   if(pq.size() > 0 && goal == false){
     //current = q.remove();
     current = pq.poll();
     if(current.i == n - 1 && current.j == n - 1){
      goal = true; 
     }
     // look at the bfs function for more detail.
     sear.A_star();
   }else{
    noLoop(); 
   }
  }
}
