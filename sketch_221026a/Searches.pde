class Searches{
  void bfs(){
     maze[current.i][current.j].seen = true;
     if(current.j > 0 && current.walls[0] == false && maze[current.i][current.j - 1].path == false){
       q.add(maze[current.i][current.j-1]);
       maze[current.i][current.j-1].path = true;
     }
     if(current.i > 0 && current.walls[3] == false && maze[current.i - 1][current.j].path == false){
       q.add(maze[current.i-1][current.j]);
       maze[current.i - 1][current.j].path = true;
     }if(current.i < n - 1 && current.walls[1] == false && maze[current.i+1][current.j].path == false){
      q.add(maze[current.i+1][current.j]);
      maze[current.i+1][current.j].path = true;
     }if(current.j < n - 1 && current.walls[2] == false && maze[current.i][current.j+1].path == false){
       q.add(maze[current.i][current.j+1]);
       maze[current.i][current.j+1].path = true;
     }
}

void A_star(){
  maze[current.i][current.j].seen = true;
  if(current.j > 0 && current.walls[0] == false && maze[current.i][current.j - 1].path == false){
       pq.add(maze[current.i][current.j-1]);
       maze[current.i][current.j-1].path = true;
     }
     if(current.i > 0 && current.walls[3] == false && maze[current.i - 1][current.j].path == false){
       pq.add(maze[current.i-1][current.j]);
       maze[current.i - 1][current.j].path = true;
     }if(current.i < n - 1 && current.walls[1] == false && maze[current.i+1][current.j].path == false){
      pq.add(maze[current.i+1][current.j]);
      maze[current.i+1][current.j].path = true;
     }if(current.j < n - 1 && current.walls[2] == false && maze[current.i][current.j+1].path == false){
       pq.add(maze[current.i][current.j+1]);
       maze[current.i][current.j+1].path = true;
     }
}
  
}
