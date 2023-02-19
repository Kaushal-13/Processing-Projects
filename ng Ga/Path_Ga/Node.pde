class Node{
 float x;
 float y;
 float radius;
 String path;
 Boolean isDead;
 Node(int x,int y,String val){
  this.x = x;
  this.y = y;
  this.radius = 15;
  this.path = val;
  isDead = false;
 }
 
 void update(char c){
     if(x < 0 || x > width || y < 0 || y > height){
      isDead = true; 
     }
     for(Obstacle o : O){
       if(dist(x,y,o.x,o.y) < o.radius){
        isDead = true; 
       }
     }
     if(isDead){
      return ; 
     }
     if(c == '1'){
      x += dist; 
     }else if(c == '2'){
      x -= dist; 
     }else if(c == '3'){
      y += dist; 
     }else{
      y -= dist; 
     }
 }
 void draw(){
  fill(255);
  circle(x,y,radius);
 }
 
 float fitness(){
   float a = 0;
   float b = 450;
   if(isDead){
    return 100000.0;
   }
   for(int i = 0;i<path.length();i++){
     char c = path.charAt(i);
     if(c == '1'){
      a += dist;
     }else if(c == '2'){
      a -= dist; 
     }else if(c == '3'){
      b += dist; 
     }else{
      b -= dist; 
     }
   }
   return dist(a,b,gx,gy);
 }
}
