
Star[] stars = new Star[400];
void setup(){
  size(800,800);
  for(int i = 0;i<stars.length;i++){
    stars[i] = new Star();
  }
}

void draw(){
  translate(width/2,height/2);
  background(0);
   for(int i = 0;i<stars.length;i++){
    stars[i].update();
    stars[i].show();
  }
  
}
