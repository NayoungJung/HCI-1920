#include <Servo.h>

int LED = 12;
int LED2 = 13;
int sensorPin = A0;
double alpha = 0.75;
int period = 50;
double change = 0.0;
double minval = 0.0;
Servo sm;


void setup ()
{
  sm.attach(9); 
  Serial.begin(9600);
  pinMode(LED, OUTPUT);
  pinMode(LED2, OUTPUT);
}
void loop ()
{
    static double oldValue = 0;
    static double oldChange = 0;
 
    int rawValue = analogRead(sensorPin);
    double value = alpha * oldValue + (1 - alpha) * rawValue;
 
    Serial.print(rawValue);
    Serial.print(",");
    Serial.println(value);
    oldValue = value;


    if(rawValue >1){
      sm.write(0);
      digitalWrite(LED, HIGH);
      digitalWrite(LED2, LOW);
    }
    else{
      sm.write(90);
      digitalWrite(LED, LOW);
      digitalWrite(LED2, HIGH);
    }
    delay(1000);

    
}
