import org.openkinect.freenect.*;
import org.openkinect.processing.*;

Kinect kinect;
PImage depthImg;  // Depth image
PImage coffin;

int minDepth =  400; // Which pixels do we care about?
int maxDepth = 650;

float angle;  // What is the kinect's angle

void setup() {
  size(1280, 1080);
  coffin=loadImage("coffin.png"); 
  
  kinect = new Kinect(this);
  kinect.initDepth();
  angle = kinect.getTilt();

  depthImg = new PImage(kinect.width, kinect.height);   // Blank image
 
}

void draw() {
  background(0);
  
  int[] rawDepth = kinect.getRawDepth(); // Threshold the depth image
  for (int i=0; i < rawDepth.length; i++) {
    if (rawDepth[i] >= minDepth && rawDepth[i] <= maxDepth) {
      coffin();
    }
  }
}

void coffin(){
 image(coffin, width/2, height/2, 600, 400);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      angle++;
    } else if (keyCode == DOWN) {
      angle--;
    }
    angle = constrain(angle, 0, 30);
    kinect.setTilt(angle);
  } else if (key == 'a') {
    minDepth = constrain(minDepth+10, 0, maxDepth);
  } else if (key == 's') {
    minDepth = constrain(minDepth-10, 0, maxDepth);
  } else if (key == 'z') {
    maxDepth = constrain(maxDepth+10, minDepth, 2047);
  } else if (key =='x') {
    maxDepth = constrain(maxDepth-10, minDepth, 2047);
  }
}
