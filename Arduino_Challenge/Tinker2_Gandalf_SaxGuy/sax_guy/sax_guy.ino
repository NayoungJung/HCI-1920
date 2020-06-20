#include <Servo.h>

int speakerPin = 8;
int pos = 0;
Servo sm;
long time = millis() ;


void setup() {
 pinMode(speakerPin, OUTPUT);
 sm.attach(9); 
}

void loop() {
tone(speakerPin, 466, 200);
sm.write(0);
delay(250);
sm.write(30);
delay(250);
sm.write(0);
delay(250);
sm.write(30);
delay(250);

tone(speakerPin, 466, 200); 
sm.write(0);
delay(250);

tone(speakerPin, 466, 200);
sm.write(30);
delay(125);
  
tone(speakerPin, 466, 200);
delay(125);

tone(speakerPin, 415, 200);
sm.write(0); 
delay(125);
  
tone(speakerPin, 466, 200);
delay(200);
sm.write(30);
delay(200);   

tone(speakerPin, 466, 200);
sm.write(0);
delay(250);
sm.write(30);
delay(250);
sm.write(0);
delay(250);
sm.write(30);
delay(250);

tone(speakerPin, 466, 200);
sm.write(0);
delay(250);
tone(speakerPin, 466, 200);
sm.write(30);
delay(125);
tone(speakerPin, 466, 200);
delay(125);

tone(speakerPin, 415, 200);
sm.write(0);
delay(125);
  
tone(speakerPin, 466, 200);
delay(200);
sm.write(30);
delay(200);  

tone(speakerPin, 466, 200);
delay(100);
sm.write(0);
delay(300);
sm.write(30);
delay(300);



tone(speakerPin, 554, 200);
sm.write(0);
delay(250);
sm.write(30);
delay(250);

tone(speakerPin, 466, 200);
sm.write(0);
delay(250);
sm.write(30);
delay(250);
  
tone(speakerPin, 415, 200);
sm.write(0);
delay(250);
sm.write(30);
delay(250);

tone(speakerPin, 370, 200);
sm.write(0);
delay(250);
sm.write(30);
delay(250);
  
tone(speakerPin, 311, 200);
sm.write(0);
delay(250); 

tone(speakerPin, 311, 200);
sm.write(30);
delay(250); 

tone(speakerPin, 350, 200);
sm.write(0);
delay(250); 


tone(speakerPin, 370, 200);
sm.write(30);
delay(250); 

tone(speakerPin, 311, 200);
delay(250); 

}
