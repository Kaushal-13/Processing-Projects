
class Star{
 float x;
 float y;
 float z;
 float pz;
 ArrayList<Float> colors;
 Star(){
  x = random(-width,width);
  y = random(-height,height);
  z = random(width);
  pz = z;
  colors = new ArrayList();
  float r = random(100,255);
  float b = random(100,255);
  float g = random(100,255);
  colors.add(r);
  colors.add(g);
  colors.add(b);
 }
 
 void update(){
  z = z - 10;
  if(z < 1){
    x = random(-width/2,width/2);
    y = random(-height/2,height/2);
    z = random(width);
    pz = z;
  }
   
 }
 
 void show(){
      noStroke();
   fill(colors.get(0),colors.get(1),colors.get(2));

   float sx = map(x/z,0,1,0,width);
   float sy = map(y/z,0,1,0,height);
   
   float r = map(z,0,width,4,0);
   
   //ellipse(sx,sy,r,r);
   strokeWeight(r);

   float px = map(x/pz,0,1,0,width);
   float py = map(y/pz,0,1,0,height);
   stroke(colors.get(0),colors.get(1),colors.get(2));

   pz = z;
   line(px,py,sx,sy);


   
 }
  
  
}
