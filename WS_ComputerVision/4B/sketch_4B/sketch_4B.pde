import processing.serial.*;
Serial myPort;
String sensorReading="";

ParticleSystem ps;
PImage stonks;
PImage ew;
PFont f;

void setup() {
 size(1024, 768);
 myPort = new Serial(this, Serial.list()[0], 9600); 
 myPort.bufferUntil('\n');
 
 ps = new ParticleSystem(new PVector(width/2, 50));
 stonks=loadImage("stonks.png");
 ew=loadImage("ew.png");
 f=createFont("impact",20);
}

void draw() {
 noStroke();
 background(255);
 textFont(f, 100);
 
 if(int(sensorReading)<20){
    fill(255,0,0);
    text("EWWWW", width/2-200,180);
    image(ew,width/2-200,height/2-100,400,400); 
    ps.addParticle();
    ps.run();
 }
 else if (int(sensorReading)>=20){
  fill(0,200,200);
  text("Kalm", width/2-100,180);
  image(stonks,width/2-200,height/2-100,400,400); 
 }
}
void serialEvent (Serial myPort) {
 sensorReading = myPort.readStringUntil('\n');
}

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  void display() {
    fill(0,random(100,250),random(50,100), lifespan);
    ellipse(position.x+80, position.y+460, 8, 8);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
