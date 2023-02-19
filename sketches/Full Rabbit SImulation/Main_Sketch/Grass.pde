class Grass{
 PVector pos;
 int age = 0;
 int side = 20;
 boolean isEaten = false;
 int perTurn = 10;
 Grass(){
  pos = new PVector(random(0,width-side),random(0,height-side)); 
 }
 
 void update(){
  age++;
 }
 
void find(){
  
  if(isEaten)
    return;
  for(Rabbit r : R){
   if(this.pos.dist(r.pos) < side && r.isHungry){
    isEaten = true;
    r.hasBeenHungry = 0;
    return;
   }
  }
  return;
 }
 
 
 void show(){
   //System.out.println(pos.x);
  fill(0,120,0);
  noStroke();
  square(this.pos.x,pos.y,side);
 }
}
