const int echoPin = 6; 
const int trigPin = 7;

void setup() {
  pinMode(echoPin, INPUT);
  pinMode(trigPin, OUTPUT);
  Serial.begin(9600); 
  }
void loop() {
    float filtervalue = 0;
    digitalWrite(trigPin, LOW);
    delayMicroseconds(2);
    digitalWrite(trigPin, HIGH);
    delayMicroseconds(5);
    digitalWrite(trigPin, LOW);  
  long duration = pulseIn(echoPin, HIGH);
  
  for(int i = 0;i<100; i++){ 
    filtervalue += duration; 
    delayMicroseconds(100);
  }
  filtervalue /= 100;
  float cm = filtervalue*17/1000;
  Serial.print(cm); 
  Serial.println("cm");
  }
