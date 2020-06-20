/*-----automatic leg/ Legs----*/
float a;
float aspeed=8.0;
int adirection=1;
float x, y;
float angle1 = 0.0, angle2 = 0.0;
float segLength = 100;

PImage f,b;
int posB;

int num = 500; // water
Particle[] myPart = new Particle[num];

void setup() {
  noCursor();
  size(1000, 700);
  f= loadImage("fish.png");
  b= loadImage("bj.png");
  a= 300; // leg angle starts from this X
  
  x = width * 0.5;
  y = height * 0.5;
  
  for(int i = 0; i < num; i++){ // water
   myPart[i] = new Particle(random(width), random(height),  random(0.5, 3)); 
  }
}

void draw() {
  background(0);
/*-----leg movement-----*/
  angle1 = (a/float(width)-0.5) * PI;
  a=a+(aspeed*adirection);
  if (a>750 || a <250){
   adirection*=-1; 
  }
 if (mousePressed==true){ // stop the legs
     aspeed=0;
  }else { // walk again
     aspeed=8.0;
     strokeWeight(1);
     stroke(255);
/*-----floating Ben&Jerry-----*/     
     posB=posB+adirection;
     if (posB> 100 || posB+120 < 100) { adirection *= -1; }
     line(width-150, 0, width-150,posB+120);
     image(b,width-150,posB+120, 100,100);
  }
  
  strokeWeight(30);
  stroke(255, 100);  
/*-----front leg-----*/
  pushMatrix();
  segment(x, y, angle1); 
  segment(0,segLength,QUARTER_PI);
  popMatrix();
/*-----body -----*/
  imageMode(CENTER);
  image(f,width/2,height/2+20, 400,300);
/*-----behind leg-----*/
  pushMatrix();
  segment(x, y, -angle1); 
  segment(0,segLength,QUARTER_PI);
  popMatrix();  
/*-----ground-----*/
  strokeWeight(3);
  line(0,height-150,width,height-150);
/*-----water effect-----*/
  noStroke();
  for(int i = 0; i < num; i++){
    myPart[i].display();
    myPart[i].drive();
  }
}

void segment(float x, float y, float a) { // for the leg movement
  translate(x, y); 
  rotate(a);
  line(0, 0, 0, segLength);
} 

class Particle{ // water
  float xpos, ypos;
  float speed;
  float w_size;
  Particle(float temp_xpos, float temp_ypos, float temp_speed) {
    xpos = temp_xpos;
    ypos = temp_ypos;
    speed =  temp_speed;
    w_size = random(1, 4);
  }
   
  void display(){
    noFill();
    stroke(255);
    strokeWeight(0.8);
    ellipse(xpos, ypos, w_size, w_size);
  }
  void drive() {
    xpos = xpos - speed;
    if(xpos < -10) {
      xpos = width+10;
      ypos = random(height);
      speed = random(0.9, 3);
    }
  }
}
