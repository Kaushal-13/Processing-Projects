class Rabbit{
  int time;
  int type;
  int dead = 0;
  float deathTime = map(food,0,7,0,2000);
  float x,y;
  Rabbit(){
    time = 0;
    int k = int(random(2));
    //System.out.println(k);
    if(k == 1){
      type = 1;
    }
    else{
     type = 0;
    }
    x = random(0,width);
    y = random(0,height);
  }
  void update(){
    time++;
    if(time >= deathTime){
     this.dead = 1; 
    }
    int k = int(random(5));
    if(k == 1)
      this.dead = 1;
  }
  
  void draw(){
    if(this.type == 0){
       fill(255,0,0); 
    }
    else{
     fill(0,0,255); 
    }
    circle(x,y,20);
    
  }
  
  
}
