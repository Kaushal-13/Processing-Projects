class Vector{
  float x,y;
  int radius = 20;
  Vector(float a,float b){
   this.x = a;
   this.y = b;
  }
  void add(Vector B){
   this.x += B.x;
   this.y += B.y;
  }
  void show(){
   fill(255);
   circle(x,y,radius); 
  }
 boolean end(){
   if(this.y > height){
     this.y = height;
     vel.invert_y();
     return true;
   }
   else if(this.x > width){
    this.x = width;
    vel.invert_x();
    return true;
   }
   else if(this.x < 0){
    this.x = 0;
    vel.invert_x();
    return true;
   }
   return false;
 }
 void invert_y(){
  this.y = -1*this.y; 
 }
 
 void invert_x(){
   this.x = -1*this.x;
 }
}
