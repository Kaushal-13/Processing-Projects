
ArrayList<Rabbit> R = new ArrayList<Rabbit>();
ArrayList<Grass> G = new ArrayList<Grass>();
ArrayList<Grass> K = G;
int grass = 60;
int r_Size = 50;
int day = 0;
int i = 0;

void setup(){
 size(1000,800);
 for(int i = 0;i<r_Size;i++){
   R.add(new Rabbit());
 }
  for(int i = 0;i<grass;i++){
   G.add(new Grass());
 }
}

void draw(){
  background(120);
  i++;
    for(Rabbit r : R){
    r.show();
    r.move();
  }
  for(Grass r : G){
    r.show();
    r.find();
  }

  
  fill(255);
  text(day,10,100);
  if(i >= 10){
    day++;
    i = 0;
   ArrayList<Grass> d = new ArrayList<Grass>();
   for(Grass g : G){
    if(g.isEaten){
      d.add(g);
    }
   }
   for(Grass g : d){
    G.remove(g); 
   }
   for(Rabbit r : R)
     r.dUpdate();
     
   ArrayList<Rabbit> dead = new ArrayList<Rabbit>();
   for (Rabbit r : R){
    if(r.isDead == true) 
      dead.add(r);
   }
   for(Rabbit r : dead){
    R.remove(r); 
   }
  }
  
  if(day >= 30){
   System.out.println(R.size());
   for(Grass r : G){
    r.update();
   }
   for(int i = 0;i<10;i++){
    G.add(new Grass()); 
   }

   ArrayList<Rabbit> dead = new ArrayList<Rabbit>();
   for (Rabbit r : R){
    r.mupdate();
    if(r.isDead == true) 
      dead.add(r);
   }
   for(Rabbit r : dead){
    R.remove(r); 
   }
   day = 0;
  }
}
