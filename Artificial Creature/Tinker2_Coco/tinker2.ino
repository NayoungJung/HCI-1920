const int temperaturePin = 0;
 void setup() {
  Serial.begin(9600);  //시리얼 통신속도 설정
}
 
void loop() {
  int reading = analogRead(temperaturePin);  //센서값 읽어옴
  float temp = (5.0*reading*100.0)/1024.0;
  Serial.println(temp);  //센서값 섭씨온도로 변환(LM35 계산 공식에 의함)
  delay(400);                         
}
