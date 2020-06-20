/*----Serial------*/
import processing.serial.*;  //import the Serial library
int end = 10;    // The number 10 is the ASCII code for linefeed (end of serial.println), later we will look for this to break up individual messages.
String receivedString;   // Declare a new string called 'receivedString'. A string is an array of characters (data type "char")
Serial myPort;  // The serial port, this is a new instance of the Serial class (an Object) and we're naming it "myPort"

/*----Meme------*/
PImage coffin;
PImage gf;
PImage h1;
PImage h2;
PImage h3;
PFont font;

/*----Video------*/
import processing.video.*;
Capture video;
PImage prevFrame;

/*----Screenshot------*/
import processing.pdf.*;


void setup() {
  size(640, 480);
  myPort= new Serial(this, Serial.list()[0], 9600); // initializing the object by assigning a port and baud rate (must match that of Arduino)
  myPort.clear();  // function from serial library that throws out the first reading, in case we started reading in the middle of a string from Arduino
  receivedString = myPort.readStringUntil(end); // function that reads the string from serial port until a println occurs,
                                                 // and then assigns string to our string variable called 'receivedString'.
  receivedString = null; // initially, we want the string to be set to null (which means empty)

/*----Meme------*/
  coffin = loadImage("c.png");
  gf = loadImage("gf.png");
  h1 = loadImage("h1.png");
  h2 = loadImage("h2.png");
  h3 = loadImage("h3.png");
  fill(255);
  font = createFont( "Impact", 30);

/*----Video------*/
  video = new Capture(this, width, height);
  video.start();
  prevFrame = createImage(video.width, video.height, RGB);
  
}


void draw() {
  background(0);
  image(video, 0, 0);
  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();
  while (myPort.available () > 0) { //as long as there is data coming from serial port, read it and store it 
    receivedString = myPort.readStringUntil(end);
  }
  if (receivedString != null) {  //if the string is not empty, print the following

    /*  Note: the split function used below is not necessary if sending only a single variable. However, it is useful for parsing (separating) messages when
     reading from multiple inputs in Arduino.
     */

    String[] a = split(receivedString, ',');  // a new array (called 'a') that stores values into separate cells (separated by commas specified in your Arduino program)
    println(a[0]); //print the first string value of the array
    println(a[1]); //print to the console the second string value
    int val1 = Integer.parseInt(a[0].trim()); // This is probably the scariest line of code here. For now, you...
    int val2 = Integer.parseInt(a[1].trim()); // ...just need to know that it converts the string into an integer.

  if(val1>=0 && val1<341){
    image(h2, 0,150, 250,450);
    image(h3, 450, -50, 250,450);
    image(h1, 420,150, 250,450);
     textFont(font, 50);
     text("When no one tells you the dress code",0, 50);
   
    /*----Screenshot------*/
    beginRecord(PDF, "output.pdf");

    if (val2==1) endRecord();
  }
  else if (val1>=341&& val1<682) {
    image(coffin, 0,0, width,height);
    if (val2==1) endRecord();
  }
  else{
    image(gf, 0,0, width,height);
    if (val2==1) endRecord();
  }
}
}

void captureEvent(Capture video) {
  prevFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
  prevFrame.updatePixels();  
  video.read();
}
