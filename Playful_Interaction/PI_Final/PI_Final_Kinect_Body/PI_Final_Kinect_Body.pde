import org.openkinect.freenect.*;
import org.openkinect.processing.*;

Kinect kinect;
float[] depthLookUp = new float[2048];

void setup() {
  size(1440, 1080);
  kinect = new Kinect(this);
  kinect.initDepth();

  for (int i = 0; i < depthLookUp.length; i++) {  
    depthLookUp[i] = rawDepthToMeters(i);
  }
} // Lookup table for all possible depth values (0 - 2047)

void draw() {
  background(0);

  int[] depth = kinect.getRawDepth();
  int skip = 8;

  for (int x = 0; x < kinect.width; x += skip) {
    for (int y = 0; y < kinect.height; y += skip) {
      int offset = x + y*kinect.width;

      int rawDepth = depth[offset];
      PVector v = depthToWorld(x, y, rawDepth);

 if (rawDepth >= 0 && rawDepth <= 860) { // Print out only 0-860 depth range
      fill(random(255),random(255),random(255));
      noStroke();
      
      pushMatrix();     
      scale(3); // enlarge what I got
      float factor = 400; // scale up!
      translate(v.x*factor+200, v.y*factor+100); // removed Z (depth)value
      rect(0,0, skip/2,skip/2);
      popMatrix();
     }
    }
  }
}

// These functions come from: http://graphics.stanford.edu/~mdfisher/Kinect.html
float rawDepthToMeters(int depthValue) {
  if (depthValue < 2047) {
    return (float)(1.0 / ((double)(depthValue) * -0.0030711016 + 3.3309495161));
  }
  return 0.0f;
}

PVector depthToWorld(int x, int y, int depthValue) {

  final double fx_d = 1.0 / 5.9421434211923247e+02;
  final double fy_d = 1.0 / 5.9104053696870778e+02;
  final double cx_d = 3.3930780975300314e+02;
  final double cy_d = 2.4273913761751615e+02;

  PVector result = new PVector();
  double depth =  depthLookUp[depthValue]; //rawDepthToMeters(depthValue);
  result.x = (float)((x - cx_d) * depth * fx_d);
  result.y = (float)((y - cy_d) * depth * fy_d);
  result.z = (float)(depth);
  return result;
}
