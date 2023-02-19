class Obstacle{
 float x;
 float y;
 float radius;
 Obstacle(float x,float y,float r){
  this.x = x;
  this.y = y;
  this.radius = r;
 }
 void draw(){
  fill(194,178,128);
  circle(x,y,radius);
 }
}
