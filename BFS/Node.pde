class Node{
 float x,y;
 float radius;
 int isVisited = 0;
 Node(){
   x = random(10,width);
   y = random(20,height);
   radius = 60;
 }
 void show(){
   //noStroke();
   if(isVisited == 0)
     fill(255);
   else if(isVisited == 1)
     fill(0,120,0);
   else
     fill(120,0,0);
   circle(x,y,radius);
 }
 
 
  
}
