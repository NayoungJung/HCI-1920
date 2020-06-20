import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;  
Capture video;
OpenCV opencv;
PImage src;

int maxColors = 5;
int[] hues;
int[] colors;
int rangeWidth = 10;
PImage[] outputs;

int colorToChange = 1;
float posX, posY;
  
void setup() {
    video = new Capture(this, 640, 480);
    opencv = new OpenCV(this, video.width, video.height);
    
    size(700, 480, P2D);
    smooth();
    
    colors = new int[maxColors];
    hues = new int[maxColors];
    outputs = new PImage[maxColors];
    video.start();
    
    posX = random(0,width);
    posY = random(0,height);
    }
  
void draw() {
    background(255);
    if (video.available()) {
      video.read();
    }
    opencv.loadImage(video);  
    opencv.useColor(); 
    src = opencv.getSnapshot();
    opencv.useColor(HSB);
    detectColors();  
    image(src, 0, 0);
  
  for (int i=0; i<outputs.length; i++) {
    if (outputs[i] != null) {
      noStroke();
      fill(colors[i]);
      rect(src.width, 60*i, 60, 60);
      drawFly();
    }
  }
 }
void detectColors() {  
      for (int i=0; i<hues.length; i++) {
        if (hues[i] <= 0) continue;
        opencv.loadImage(src);
        opencv.useColor(HSB);
        opencv.setGray(opencv.getH().clone());
        
        int hueToDetect = hues[i];
        opencv.inRange(hueToDetect-rangeWidth/2, hueToDetect+rangeWidth/2);
        opencv.erode();
        outputs[i] = opencv.getSnapshot();
      }
     }
void drawFly(){
     posX+=random(-30,30); 
     posY+=random(-30,30); 
        if (posX > width) posX = 0;
        if (posX < 0) posX = width;
        if (posY < 0) posY = height;
        if (posY > height) posY = 0; 
      ellipse(posX, posY, 40, 40);
}
void mousePressed() {
      color c = get(mouseX, mouseY);
      int hue = int(map(hue(c), 0, 255, 0, 180));  
      colors[colorToChange-1] = c;
      hues[colorToChange-1] = hue;
     colorToChange++;
     if(colorToChange>5){
     colorToChange=1;
     }
}
