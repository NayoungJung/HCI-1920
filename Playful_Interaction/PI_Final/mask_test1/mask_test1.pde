import processing.video.*;
Capture video;

void setup() {
  size(1920, 1080);  
  background(0);
  noStroke();
  
  video = new Capture(this, 320, 240);
  video.start(); 
}

void draw() { 
  int x= width/2;
  int y = height/2;
   //fill(random(255), random(255), random(255));
  if (video.available()) {
    video.read();
    video.loadPixels();
   triangle(x,height/6, x,y, width/3-60,y+180);
   blend(video,0,0, 800,400, 600,150,800,600, DARKEST);
   updatePixels();
    }
 
 if (video.available()) {
    video.read();
    video.loadPixels();
   triangle(x,height/6, x,y, width-width/3+90,y+150); 
    triangle(x,y, width/3-60,y+180, width-width/3+90,y+150);
   blend(video,0,0, 800,400, 600,150,800,600,SUBTRACT);
   updatePixels();
    }
    
  }
    
    

  
