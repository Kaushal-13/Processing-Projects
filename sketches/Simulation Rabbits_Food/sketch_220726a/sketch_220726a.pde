
int male = 0;
int female = 0;
int total = 30;
int food = 1000;

ArrayList<Rabbit> A = new ArrayList<Rabbit>();

int count = 0;

void setup(){
 size(800,800);
 for(int i = 0;i<total;i++){
   Rabbit r = new Rabbit();
   if(r.type == 0){
    male++; 
   }
   else{
    female++; 
   }
   A.add(r);
 }
}

void draw(){
  if(count == 0){
    food += 40;
    background(0);
    ArrayList<Rabbit> D = new ArrayList<Rabbit>();
    for(Rabbit r : A){
      r.update();
      if(r.dead == 1){
        D.add(r);
      }
      r.draw();
    }
    
    for(Rabbit r : D){
     if(r.type == 0){
       male--;
     }
     else{
      female--; 
     }
     A.remove(r); 
    }
    food = max(0,food - A.size());
    if(food>0)
      produce();
  }
  count = (count + 1)%10;
}

void produce(){
  int val = min(male,female);
  for(int i = 0;i<val;i++){
   Rabbit r = new Rabbit();
   if(r.type == 1)
     female++;
   else
     male++;
   A.add(r);
  }
  
}
