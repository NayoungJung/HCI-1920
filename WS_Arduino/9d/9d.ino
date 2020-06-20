int pb = 8;
int melody[] = {262, 294, 330, 349, 392, 440, 494, 523};

void setup() {
  pinMode(pb, OUTPUT); 
  }

void loop() {
  int light = analogRead(A0);
  int a = map(light, 0, 1023, melody[0], melody[7]);
  tone(pb, a, 1000);
 

}
