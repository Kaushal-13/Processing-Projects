import java.util.*;
int population_size = 20;
int generation = 0;
int retention = 9;
float mp = 0.4;
int j = 0;
int begin = 0;
int end = 450;
int dist = 20;
int path_length = 60;
boolean goal_found = false;
GA g = new GA();
float gx = 800;
float gy = 450;
Node best;
ArrayList<Obstacle> O = new ArrayList<Obstacle>();
int acceptable = 80;
ArrayList<Node> CurrentPopulation = new ArrayList<Node>();
void setup(){
  size(900,900);
  int start = 0;
  int end = 450;
  for(int i = 0;i<population_size;i++){
   CurrentPopulation.add(new Node(start,end,g.generateRandom())); 
  }
  for(int i = 0;i<10;i++){
   float a = random(800);
   float b = random(800);
   float c = random(100);
   O.add(new Obstacle(a,b,c));
  }
  best = CurrentPopulation.get(0);
}

void draw(){
  background(0,120,0);
  //frameRate(10);
  if(j >= path_length - 2){
    //noLoop();
    Collections.sort(CurrentPopulation,new Sorter());
     fill(0);
     print(CurrentPopulation.get(0).fitness());
     best = CurrentPopulation.get(0);
     float val = CurrentPopulation.get(0).fitness();
     if(val < acceptable){
       print("Path found");
      noLoop(); 
     }
     print("\n");
     System.out.println(generation);
    generation++;
    j = 0;
    //path_length++;
    ArrayList<Node> np = new ArrayList<Node>();
    for(int i = 0;i<retention;i++){
      Node best = CurrentPopulation.get(i);
      String s = best.path;
      //s = g.upd(s);
      Node c = new Node(begin,end,s);
      np.add(c);
    }
    while(np.size() < population_size){
      int a = int(random(population_size));
      int b = int(random(population_size));
      if(a != b){        
        Node p1 = CurrentPopulation.get(a);
        Node p2 = CurrentPopulation.get(b);
        String s = g.crossOver(p1.path,p2.path);
        //s = g.upd(s);
        s = g.mutate(s);
        np.add(new Node(begin,end,s));
      }
    }
    CurrentPopulation = np;
    // We have found all the values in the answer.  
  }
  else{
    for(Node n : CurrentPopulation){
      n.update(n.path.charAt(j));
    }
    //best.update(best.path.charAt(j));
    for(Node n : CurrentPopulation){
     n.draw(); 
    }
    j++;
    noFill();
    circle(gx,gy,acceptable);
    //best.draw();
  }
  for(Obstacle o : O){
   o.draw(); 
  }
}
