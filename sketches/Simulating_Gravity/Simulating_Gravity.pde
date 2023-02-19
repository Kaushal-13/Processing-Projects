
Vector pos = new Vector(100,200);
Vector vel = new Vector(0,0);
Vector acc = new Vector(0,0.1);
void setup(){
  size(800,800);
}

void draw(){
  
  background(0);
  acc = new Vector(0,0.1);
  if(mousePressed){
    acc = new Vector(0,0.1);
    acc.add(new Vector(0.1,0));
  }
  vel.add(acc);
  pos.add(vel);
  pos.show();
  pos.end();
  
}
