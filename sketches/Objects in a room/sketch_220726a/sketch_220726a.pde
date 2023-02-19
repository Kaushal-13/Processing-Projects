
ArrayList<Boid> flock = new ArrayList<Boid>();
int n = 300;
void setup(){
  size(800,600);
  for(int i = 0;i<n;i++){
   Boid b = new Boid(random(0,width),random(0,height));
   flock.add(b);
  }
  
}

void draw(){
  background(0);
  for(Boid b : flock){
   b.run(flock);
  }
}
