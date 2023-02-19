class Rabbit extends Animal{
  Rabbit paired;
  
  
  Rabbit(){
   pos = new PVector(random(0,width),random(0,height));
   vel = new PVector(2,1);
   int k = (int)(random(0,2));
   this.isDead = false;
   this.gender = k;
   this.max_age = 10;
   this.max_speed = 3;
  }
 
  
  void show(){
    noStroke();
   if(this.gender == 0){
    fill(120,0,0 );
   }
   else{
    fill(0,0,120); 
   }
   circle(this.pos.x,this.pos.y,20);
  }
  
   PVector seperate(){
   float desiredRadius = 100;
   int count = 0;
   PVector c = new PVector(0,0);
   for(Rabbit r : R){
     if(r != this){
      float a = pos.dist(r.pos);
      if(a >= 0 && a < desiredRadius){
        PVector diff = PVector.sub(pos, r.pos);
        stroke(255);
        line(pos.x,pos.y,r.pos.x,r.pos.y);
//diff.normalize();
        diff.div(a);        // Weight by distance
        c.add(diff);
        count++;  
      }
     }
   }
    if (count > 0){
      //c.div((float)count);
      return c;
    }
    return c;
  }
    
  PVector target(){
   PVector mi = new PVector(0,0);
   if(G.isEmpty())
     return mi;
    mi = G.get(0).pos;
   //int distance =  1000;
   for(Grass g : G){
    float a = dist(pos.x,pos.y,g.pos.x,g.pos.y);
     if(a < pos.dist(mi)){
      mi = g.pos;
     }
    }
    stroke(255);
    line(pos.x,pos.y,mi.x,mi.y);
    PVector n =  new PVector(mi.x,mi.y);
    return n.sub(pos);
  }
  
  PVector partner(){
   PVector mi = new PVector(0,0);
   if(R.isEmpty())
     return mi;
   for(Rabbit r : R){
    float a = dist(pos.x,pos.y,r.pos.x,r.pos.y);
    if(a<pos.dist(mi) && this.gender != r.gender ){
     mi = r.pos; 
    }
   }
   stroke(255,192,203);
  line(pos.x,pos.y,mi.x,mi.y);
  PVector n =  new PVector(mi.x,mi.y);
  return n.sub(pos);
   
  }
  void move(){
   pos.add(this.vel);
   checkBound();
   vel.add(seperate());
   if(isHungry)
     vel.add(target());
   else{
    vel.add(partner()); 
   }
   vel.normalize();
   vel.mult(max_speed);
  }
}
