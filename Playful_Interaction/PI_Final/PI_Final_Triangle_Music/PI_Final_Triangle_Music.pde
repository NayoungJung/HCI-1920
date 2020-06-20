import org.openkinect.freenect.*;
import org.openkinect.processing.*;
KinectTracker tracker;
Kinect kinect;

import ddf.minim.*;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
Minim minim;

PFont f;

void setup() {
  size(640, 360);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  
  f=loadFont("SubwayBerlinSC-48.vlw");
  
  minim = new Minim(this);
  player1 = minim.loadFile("ahhh.mp3", 2048);
  player2 = minim.loadFile("never.mp3", 2048);
  player3 = minim.loadFile("astronomia.mp3", 2048);

}

void draw() {
  background(0);
  layout();
  tracker.track();
  tracker.display();
 
  PVector v1 = tracker.getPos();
  fill(random(255),random(255),random(255));
  noStroke();
  triangle(v1.x, v1.y-30,v1.x+60, v1.y+60,v1.x-60, v1.y+60 );
  
  if (v1.x <= width/2 && v1.y<=height/2){
      player1.play();
      player2.pause();
      player3.pause();
  } 
  if (v1.x >= width/2 && v1.y<=height/2){
    player2.play();
    player1.pause();
    player3.pause();
  }
  if (v1.x < width/2 && v1.y>height/2){
    player1.pause();
    player2.pause();
    player3.pause();
  }
   if (v1.x >= width/2 && v1.y>=height/2){
    player3.play();
    player1.pause();
    player2.pause();
  }
}

void stop() {
     player1.close();
     player2.close();
     player3.close();
     player4.close();
     minim.stop();
     super.stop();
}

void layout(){
  fill(255);
  textFont(f);
  textSize(40);
  text("MEME", width/8,height/3); 
  text("RETRO", width/2+100,height/3);
  text("SHHHHH", width/8,height-height/3); 
  text("EDM", width/2+100,height-height/3); 
  
  stroke(255);
  strokeWeight(0.5);
  line (width/2, 0, width/2, height);
  line (0, height/2, width, height/2);
}
