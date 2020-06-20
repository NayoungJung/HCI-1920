const int echoPin = 6; 
const int trigPin = 7;

int redLedPin = 11;
int greenLedPin = 10;
int blueLedPin = 9;

void setup() {
  pinMode(echoPin, INPUT);
  pinMode(trigPin, OUTPUT);
  pinMode(greenLedPin, OUTPUT);
  pinMode(redLedPin, OUTPUT);
  pinMode(blueLedPin, OUTPUT);
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
    filtervalue += duration; //이거 for문 필터임. 100번 구해서 100으로 나눈 평균값임. 노이즈가 오래 지속될리는 없으니까 평균내면 오차를 줄일수있음.
    delayMicroseconds(100);
  }
  filtervalue /= 100;
  
  float cm = filtervalue*17/1000;

  


  Serial.print(cm); 
  Serial.println("cm");
  

  if(cm<140){
    digitalWrite(9, LOW);
    digitalWrite(10, LOW);
    digitalWrite(11, HIGH);
  }

  else if(cm>=140 && cm<160){
    digitalWrite(9, LOW);
    digitalWrite(10, HIGH);
    digitalWrite(11, LOW);
  }

    else if(cm>160){
    digitalWrite(9, HIGH);
    digitalWrite(10, LOW);
    digitalWrite(11, LOW);
  }
  }
