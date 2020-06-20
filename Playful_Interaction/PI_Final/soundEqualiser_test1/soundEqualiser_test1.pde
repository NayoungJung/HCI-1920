import processing.sound.*;
Amplitude amp;
AudioIn in;
void setup() {
  size(1920, 1080);
    
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}      

void draw() {
  background(0);
  noFill();
  stroke(random(255),random(255),random(255));
  strokeWeight(10);
  float a= amp.analyze()*random(-100,100);
  triangle(width/2-20-a, height/4-a, width/3-a, height/2+150-a, width-width/3-a, height/2+150-a);
  
  strokeWeight(30);
  line(width/2-20, height/2, width/2-20, height/2-(amp.analyze()*random(100,1000)));
 
  pushMatrix();
  stroke(random(255),random(255),random(255));
  translate(width/2-20, height/2);
  rotate(cos(59.5));
  line(0, 0, 0,(amp.analyze()*random(100,1000)));
  popMatrix();

  pushMatrix();
  stroke(random(255),random(255),random(255));
  translate(width/2-20, height/2);
  rotate(sin(45.5));
  line(0, 0, 0, (amp.analyze()*random(100,1000)));
  popMatrix();
}
