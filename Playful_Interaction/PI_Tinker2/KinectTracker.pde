class KinectTracker {
  int threshold = 745;   // Depth threshold
  PVector loc;  // Raw location
  PVector lerpedLoc;  // Interpolated location

  int[] depth; // Depth data
  PImage display;  // What we'll show the user
   
  KinectTracker() {
    // This is an awkard use of a global variable here
    // But doing it this way for simplicity
    kinect.initDepth();
    kinect.enableMirror(true);
    display = createImage(kinect.width, kinect.height, RGB);  // Make a blank image
    loc = new PVector(0, 0);   // Set up the vectors
    lerpedLoc = new PVector(0, 0);
  }

  void track() {
    depth = kinect.getRawDepth();   // Get the raw depth as array of integers
    
    if (depth == null) return; // Being overly cautious here

    float sumX = 0;
    float sumY = 0;
    float count = 0;

    for (int x = 0; x < kinect.width; x++) {
      for (int y = 0; y < kinect.height; y++) {
        
        int offset =  x + y*kinect.width; // Grabbing the raw depth
        int rawDepth = depth[offset];

        if (rawDepth < threshold) {    // Testing against threshold
          sumX += x;
          sumY += y;
          count++;
        }
      }
    }
    if (count != 0) {    // As long as we found something 
      loc = new PVector(sumX/count, sumY/count);
    }

    // Interpolating the location, doing it arbitrarily for now
    lerpedLoc.x = PApplet.lerp(lerpedLoc.x, loc.x, 0.3f);
    lerpedLoc.y = PApplet.lerp(lerpedLoc.y, loc.y, 0.3f);
  }

  PVector getLerpedPos() {
    return lerpedLoc;
  }

  PVector getPos() {
    return loc;
  }

  void display() {
    PImage img = kinect.getDepthImage();

    if (depth == null || img == null) return;      // Being overly cautious here

    // Going to rewrite the depth image to show which pixels are in threshold
    // A lot of this is redundant, but this is just for demonstration purposes
    display.loadPixels();
    
    for (int x = 0; x < kinect.width; x++) {
      for (int y = 0; y < kinect.height; y++) {

        int offset = x + y * kinect.width;  
        int rawDepth = depth[offset];       // Raw depth
        int pix = x + y * display.width;
        if (rawDepth < threshold) {  // A red color instead
          display.pixels[pix] = color(150, 50, 50);
        } else {
          display.pixels[pix] = img.pixels[offset];
        }
      }
    }
    display.updatePixels();
    scale(2);
  }

  int getThreshold() {
    return threshold;
  }

  void setThreshold(int t) {
    threshold =  t;
  }
  
}
