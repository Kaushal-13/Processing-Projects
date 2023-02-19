class Animal{
  PVector pos;
  PVector vel;
  boolean isDead;
  int age;
  int gender;
  int max_age;
  float max_speed;
  int hasBeenHungry = 0;
  boolean isHungry = false;
  
  //gender 0 means female and 1 means male;
  
   void dUpdate(){
    hasBeenHungry++;
    if(hasBeenHungry >= 12){
      isDead = true;
    }
    else if(hasBeenHungry > 5){
     isHungry = true; 
    }
    else{
     isHungry = false; 
    }
   }
  
  // update means age in months;
  void mupdate(){
   this.age++;
   
   if(this.age >= max_age){
    isDead = true; 
   }
   float k = (int)random(10);
   if(k == 0){
    isDead = true; 
   }
  }
  
  void move(){
   pos.add(this.vel);
   checkBound();
   this.vel.mult(0);
  }
  
  void checkBound(){
    if(pos.x > width || pos.x < 0){
      vel.x = -1*vel.x;
    }
    if(pos.y > height || pos.y < 0){
     vel.y = -1*vel.y; 
    }
    

  }
  
  
  
  
  
}
