import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
PImage man;
PFont f;
void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  video.start();
  man= loadImage("stonks.png");
}
void draw() {
  scale(2);
  opencv.loadImage(video);
  image(video, 0, 0 );
  f=createFont("impact", 16);
  noFill();
  stroke(#FF6700);
  strokeWeight(1);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
   image(man,faces[i].x-40, faces[i].y-20, faces[i].width+80, faces[i].height+80);
   fill(0); textFont(f,40);
   if(faces[i].width-faces[i].x>30|| faces[i].x-faces[i].width>30 ){
   text("stonks",faces[i].x,faces[i].y-40); } 
 } 
 }
void captureEvent(Capture c) { c.read();}
