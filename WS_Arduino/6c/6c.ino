int greenLedPin = 10;
int yellowLedPin = 9;


void setup()

{
Serial.begin(9600);

pinMode(greenLedPin, OUTPUT);
pinMode(yellowLedPin, OUTPUT);


}



void loop()

{
float sensorValue = analogRead(A0);

sensorValue = (sensorValue/1023)*255;
Serial.println(sensorValue); 
analogWrite(greenLedPin, sensorValue);
analogWrite(yellowLedPin, -sensorValue+255);
} 
