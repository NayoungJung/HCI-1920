float theta;   
void setup() {
  size(1024, 786);
}

void draw() {
  background(255);
  frameRate(30);
  stroke(0); 
  float a = (mouseY / (float)height) * 120f;
  theta = radians(a);  
  
  translate(width/2,height/2);  
  branch(250);  
}

void branch(float h) {   //  2/3rd size 
  h *= 0.66;
 // Exit
  if (h > 5) { //length:5 pixel
    pushMatrix();  
    rotate(theta);  
    line(0, h, 0, -h); 
    translate(0, -h); 
    branch(h);    
    popMatrix();    
    
    //otherSide
    pushMatrix();
    rotate(-theta);
    line(h, 0, -h, 0);
    translate(0, h);
    branch(h);
    popMatrix();
  }
}
