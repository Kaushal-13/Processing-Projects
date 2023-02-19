import java.util.*;
int nodeLength = 8;
Node arr[] = new Node[nodeLength];
ArrayDeque<Integer> A = new ArrayDeque<Integer>();

ArrayList<ArrayList<Integer>> adj = new ArrayList<ArrayList<Integer>>(nodeLength);

ArrayList<Integer> a;
int k;
int cur;
int n;
int counter = 0;
int visited = 0;




static void addEdge(ArrayList<ArrayList<Integer>> adj,
                        int u, int v){
    adj.get(u).add(v);
    adj.get(v).add(u);
}

void printGraph(ArrayList<ArrayList<Integer>> adj){
    for (int i = 0; i < adj.size(); i++) {
      for (int j = 0; j < adj.get(i).size(); j++) {
        Node A = arr[i];
        Node B = arr[adj.get(i).get(j)];
        stroke(255); 
        line(A.x,A.y,B.x,B.y);
      }
  }
}

boolean distance(Node A,Node B,int c){
 return abs(A.x - B.x) + abs(A.y - B.y) >= 2*c; 
}

 
void setup(){
  size(800,800);
  for (int i = 0; i < nodeLength; i++)
    adj.add(new ArrayList<Integer>());
  ArrayList<Node> s = new ArrayList<Node>();
  for(int i = 0;i<nodeLength;i++){
    boolean ans = true;
    Node A = new Node();
    while(ans){
      boolean d = true;
      for(Node j : s){
       if(distance(A,j,120) == false){
         d = false;
         break;
       }
      }
      if(d){
       ans = false;
       s.add(A);
      }
      else{
       A = new Node(); 
      }
    }
  }
  arr = s.toArray(arr);
  A.add(0);
  arr[0].isVisited = 1;
  addEdge(adj,1,2);
  addEdge(adj,1,4);
  addEdge(adj,2,5);
  addEdge(adj,0,5);
  addEdge(adj,3,4);
  addEdge(adj,3,1);
  addEdge(adj,1,7);
  addEdge(adj,2,6);
  addEdge(adj,0,6);
  cur = 0;
  a = adj.get(cur);
  k = 0;
  n = a.size();
}

void draw(){
  background(100);
  noStroke();
  for(int i = 0;i<arr.length;i++){
    arr[i].show();
  }
 
  printGraph(adj);
  if(A.size() >=0 && visited != nodeLength + 1){
    if(k>=n){
       arr[cur].isVisited = 2;
       visited++;
       if(A.size() > 0)
         cur = A.poll();
       counter = 0;
       a = adj.get(cur);
       k = 0;
       n = a.size();
    }
    else{
      counter = counter + 1;
      int d = a.get(k);
      stroke(0,0,0);
      line(arr[cur].x,arr[cur].y,arr[d].x,arr[d].y);
      if(counter == 50){
        counter = 0;
        if(arr[d].isVisited == 0){
          A.add(d);
          arr[d].isVisited = 1;
        }
        k++;
      }
    }
  }
}
