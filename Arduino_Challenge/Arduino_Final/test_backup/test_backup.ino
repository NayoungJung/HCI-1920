const int buttonPin = 8; 
int greenpin =9; // select the pin for the green LED
int val;


void setup() {
  Serial.begin(9600); //Begin Serial Communication with a baud rate of 9600
  pinMode(buttonPin, INPUT);
  pinMode(greenpin, OUTPUT);
}

void loop() {//New variables are declared to store the readings of the respective pins
  int Value1 = analogRead(A0);
  int Value2 = digitalRead(buttonPin);
  

  Serial.print(Value1, DEC); // DEC means "send the number in base-10"
  Serial.print(",");
  Serial.print(Value2, DEC);
  Serial.println(); // the "ln" will tack on a special character at the end of the transmission
   
  if (Value2 == HIGH) { 
    digitalWrite(greenpin, HIGH); 
  }
   else if (Value2== LOW) {
   
   digitalWrite(greenpin, LOW);

  }
  delay(20); // Don't use a delay smaller than 20 ms or so.

  
  
}
