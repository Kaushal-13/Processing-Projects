final int N = 64;
final int iter = 4;
Fluid fluid;
final int SCALE = 10;
final int scale = 10;
void settings(){
 size(N*10,N*10); 
}

void setup(){
  fluid = new Fluid(0.1,0,0);
  
}

void mouseDragged(){
 fluid.addDensity(mouseX/scale,mouseY/scale,100); 
 float amtx = mouseX - pmouseX;
 float amty = mouseY - pmouseY;
 fluid.addVelocity(mouseX/scale,mouseY/scale,amtx,amty); 

}

void draw(){
  background(0);
  fluid.step();
  fluid.renderD();
  
}
