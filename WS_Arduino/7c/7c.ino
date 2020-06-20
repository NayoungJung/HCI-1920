const int row[8] = { 17, 16, 11, 7, 12, 5, 4, 14 };

const int col[8] = { 2, 3, 6, 8, 9, 10, 13, 15 };



void setup(){

Serial.begin(9600);

  for(int i = 0; i <8; i ++){

    pinMode(col[i], OUTPUT);

    pinMode(row[i], OUTPUT);

  }

}



void loop(){
float sensorValue = analogRead(A5);

sensorValue = (sensorValue/1023)*255;
Serial.println(sensorValue);


if(sensorValue<=45){
digitalWrite(row[1], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[2], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[3], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[4], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[5], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[6], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[7], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[0], HIGH); // row[?] 0~7까지 숫자를 바꾸면됨  
}

else if(45 < sensorValue && sensorValue<=75){
digitalWrite(row[0], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[2], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[3], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[4], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[5], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[6], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[7], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[1], HIGH); // row[?] 0~7까지 숫자를 바꾸면됨  
}

else if(75 < sensorValue && sensorValue<=105){
digitalWrite(row[0], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[1], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[3], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[4], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[5], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[6], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[7], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[2], HIGH); // row[?] 0~7까지 숫자를 바꾸면됨  
}

else if(105 < sensorValue && sensorValue<=135){
digitalWrite(row[0], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[1], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[2], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[4], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[5], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[6], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[7], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[3], HIGH); // row[?] 0~7까지 숫자를 바꾸면됨  
}

else if(135 < sensorValue && sensorValue<=165){
digitalWrite(row[0], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[1], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[3], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[2], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[5], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[6], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[7], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[4], HIGH); // row[?] 0~7까지 숫자를 바꾸면됨  
}
else if(165 < sensorValue && sensorValue<=195){
digitalWrite(row[0], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[1], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[3], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[4], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[2], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[6], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[7], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[5], HIGH); // row[?] 0~7까지 숫자를 바꾸면됨  
}
else if(195 < sensorValue && sensorValue<=215){
digitalWrite(row[0], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[1], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[3], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[4], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[5], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[2], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[7], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[6], HIGH); // row[?] 0~7까지 숫자를 바꾸면됨  
}
else if(sensorValue>215){
digitalWrite(row[0], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[1], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[3], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[4], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[5], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[6], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[2], LOW); // row[?] 0~7까지 숫자를 바꾸면됨
digitalWrite(row[7], HIGH); // row[?] 0~7까지 숫자를 바꾸면됨  
}

}
