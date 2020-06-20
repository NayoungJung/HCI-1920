import org.openkinect.freenect.*;
import org.openkinect.processing.*;

KinectTracker tracker;
Kinect kinect;

void setup() {
  size(1920, 1080);
  background(0);
  frameRate(12);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
}

void draw() {
  //background(255);
  tracker.track(); // Run the tracking analysis
  tracker.display();   // Show the image
  
  PVector v2 = tracker.getLerpedPos();  // Let's draw the "lerped" location
  //image(stonks, v2.x, v2.y, 100, 120);
  noStroke();
  fill(random(255),random(255),random(255),160);
  float a = random(2,10);
  ellipse (v2.x, v2.y, a, a);
}
 
void keyPressed() {   // Adjust the threshold with key presses
  int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t+=5;
      tracker.setThreshold(t);
    } else if (keyCode == DOWN) {
      t-=5;
      tracker.setThreshold(t);
    }
  }
}
