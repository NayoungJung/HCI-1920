import processing.serial.*;  
Serial myPort; 
String resultString;  // Arduino

import processing.sound.*;
AudioIn input;
Amplitude analyzer; // Sound
 
float x, y;
float v=1.0;
float angle1 = 0.0; // Layout of the particles 

float atime= 0.0;
float btime= 100.0;
float increment= 0.001; // Perlin

int count=0, z=50, c=8; 

Table table;
Bubble[] bubbles; // Data from the .csv

void setup() {
  size(1240, 768);
  smooth();
  strokeWeight(0.6);
  cursor(CROSS);
/*------Arduino-------*/  
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n'); 
/*---------Audio----------*/   
  input = new AudioIn(this, 0);
  input.start();
  analyzer = new Amplitude(this);
  analyzer.input(input);
  
/*--------Data Visualisation---------*/    
   table = loadTable("ENV_Marine_Pollution_Obs_data_v4_0.csv", "header");
   bubbles = new Bubble[table.getRowCount()];
   
   for (int i = 0; i<table.getRowCount(); i++) {  // Iterate over all the rows in a table.
    TableRow row = table.getRow(i);
    String a = row.getString("country");
    float x = row.getFloat("Plastics");
    float y = row.getFloat("General garbage");
    
    println(a+ " "+x + " "+ y);
    bubbles[i] = new Bubble(x,a);
   }
}

void draw() {
  background(0);
  noStroke();
  fill(#B8DBD9,z);

/*--------Sound--------*/
  float vol = analyzer.analyze();
  if(vol*1000>2){
   z+=10; 
  } else {
   z-=10;
   if (z<50){ z=50; }
   }
/*-------Angle--------*/  
  float a =noise(atime)*width;
  float b =noise(btime)*height;
  atime+=increment;
  btime+=increment;
  angle1 = (a/float(width)) * PI;
  
  if (resultString!=null){ // START: receive sensor values
  for(int i=0; i<bubbles.length; i++){ // Shape
   pushMatrix(); // Because of the angles 
   segment(a, b, angle1+i, bubbles[i].x/c); 
   popMatrix();
}
  bubbles[count].display(); // To change/ display the text information in the middle
  }
}
void mousePressed(){  // To change the screen text
   count++; 
   if(count>=bubbles.length){
   count=0;
   }
}

void serialEvent(Serial myPort){
  String inputString = myPort.readStringUntil('\n');
  inputString = trim(inputString);
  resultString = "";
  int sensors[] = int(split(inputString, ','));
  for (int sensorNum = 0; sensorNum<sensors.length; sensorNum++) {
    resultString += "Sensor " + sensorNum + ": ";
    resultString += sensors[sensorNum] + "\t";
    
/*----- To change the scale of the creature ----*/
    if (sensors[sensorNum]>20){ 
      c--;
      if (c<=8){  c=8;  } 
  } else if (sensors[sensorNum]<21) { c=16;
}
  }
}

void segment(float x, float y, float a, float d) { // Display the creature
  translate(x, y);
  rotate(a);
  ellipse(a+40, a+40, d,d);
}

/*---------CLASS---------*/  
class Bubble {
  String a;
  float x;
  boolean over = false;
  
  Bubble(float tempX,String s) {
    x = tempX;
    a = s;
  }
   void display() { // text information
     fill(255,160);
      textSize(30);
      textAlign(CENTER);
      text(a,width/2, height/2);
      textSize(15);
       text( int(x)+ ": the incidence of marine debris" , width/2, height/2+30);
  } 
}
