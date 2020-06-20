import processing.sound.*;
AudioIn input;
Amplitude analyzer;

PImage h;
PFont f;
int xpos, ypos;
int yd=1;

int num = 500;
Particle[] myPart = new Particle[num];

void setup(){
  size(1024, 768);
  h=loadImage("h.png"); 
  f= loadFont("DilleniaUPC-48.vlw");
  
  xpos=width/2;
  ypos = height/2;
  
   for(int i = 0; i < num; i++){
    myPart[i] = new Particle(random(width), random(height),  random(0.5, 3)); 
  }
  
  input = new AudioIn(this, 0);
  input.start();
  analyzer = new Amplitude(this);
  analyzer.input(input);
}

void draw(){
  float vol = analyzer.analyze();
  
  for(int i=0; i< height; i++){
   stroke(0, 240-i/4, 240-i/4);
   line(0,i,width, i); 
  }
  
 noStroke();
 for(int i = 0; i < num; i++){
    myPart[i].display();
    myPart[i].drive();
  }
 
 ypos=ypos+yd;
 if (ypos > 500 || ypos < 300) { yd *= -1; }
 image(h,xpos-100, ypos-200, 300,400); 
 
 if (vol*1000>5){
   xpos+=10;
   if (xpos > 700){ 
   xpos=700;
  }
 }
 else if (vol*1000<5){
   xpos-=2;
   if (xpos < 350){
    xpos=350; 
   }
 }
 println(vol*100);
 fill(#343E3D);
 rect(width-width/3,0, width,height);
 
 fill(255);
 textFont(f,60);
 text("Say hi to Elvis!", width-270, height-30);
}


class Particle{
  float xpos, ypos;
  float speed;
  float w_size;
  Particle(float temp_xpos, float temp_ypos, float temp_speed) {
    xpos = temp_xpos;
    ypos = temp_ypos;
    speed =  temp_speed;
    w_size = random(2, 15);
  }
   
  void display(){
    fill(random(200,255),60);
    ellipse(xpos, ypos, w_size, w_size);
  }
   
  void drive() {
    ypos = ypos - speed;
    if(ypos < -10) {
      ypos = height + 10;
      xpos = random(width);
      w_size = random(2, 15);
      speed = random(0.9, 3);
    }
  }
}
