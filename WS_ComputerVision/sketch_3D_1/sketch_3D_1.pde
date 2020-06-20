  import gab.opencv.*;
  import processing.video.*;
  import java.awt.*;
  Capture video;
  OpenCV opencv;
  
  /*------------------font--*/
  PFont f, f2;
  
  /*---------------Image---*/ 
  int x=-100;
  int x2=width-80;
  PImage frog;
  
  /*-----Particles---Num---*/ 
  int y=20;
  int num=0;
  
  void setup() {
  size(1280, 960);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_NOSE);  
  video.start();
  }
  void draw() {
  scale(4);
  opencv.loadImage(video);
  image(video, 0, 0 );
  
  f= loadFont("ComicSansMS-48.vlw");
  f2= createFont("impact",16);
  frog = loadImage("frog.png");
  
  noFill();
  Rectangle[] faces = opencv.detect();
  println(faces.length);
  
  for (int i = 0; i < faces.length; i++) {
    textFont(f,20);  
    fill(random(0,150));
    text("BLAHBLAHBLAH", x, faces[i].y);
    x+=10;
    
    textFont(f2,20); 
    fill(0);
    text("STRESS SCORE: " + num, 100, 200);
    
    if(x>=faces[i].x-180){ 
    x=-80; 
    num++;
  }
   image(frog, faces[i].x-10,faces[i].y-100, 50,50 );
   
   for (int k=0; k<60;k++){  
   noStroke();
   float a=faces[i].x+30;   
   float b=random(faces[i].y-20, faces[i].y+20);
  
   fill(random(255),random(255),random(255));
   ellipse(a+y+k*5,b, 3,3);
   y+=0.5;
    }
  } 
   }
  void captureEvent(Capture c) { c.read(); }
