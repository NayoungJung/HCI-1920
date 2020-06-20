import processing.serial.*;
Serial myPort;
String sensorReading="";

float a=160.0;

float x, y;
float angle1 = 0.0;
float angle2 = 0.0;

float atime= 0.0;
float btime= 100.0;
float increment= 0.003;
float segLength = 50;

void setup() {
  size(1024, 764);
  smooth();
  strokeWeight(0.6);
  
  myPort = new Serial(this, Serial.list()[1], 9600); 
  myPort.bufferUntil('\n');
}

void draw() {
  background(0);
  stroke(#B8DBD9,a);
  println(int(sensorReading));
   
  if (int(sensorReading)>30){ 
  a-=5; 
  }else { 
  a+=5;
  }
  
  float a =noise(atime)*width;
  float b =noise(btime)*height;
  
  atime+=increment;
  btime+=increment;

  angle1 = (a/float(width)) * PI;
  angle2 = (b/float(height)) * PI;
  
  for(int i=0; i<100; i++){
   pushMatrix();
   segment(a, b, angle1+i); 
   segment(segLength, 10, angle2);
   popMatrix();
  }
}

void segment(float x, float y, float a) {
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
}

void serialEvent (Serial myPort) {
 sensorReading = myPort.readStringUntil('\n');
}
