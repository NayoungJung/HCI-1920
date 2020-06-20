void setup(){
 size(1024,768);
 noCursor();
 frameRate(6);
}

void draw (){
  background(0);
  for (int i=0; i<50; i++){
    for (int j=0; j<50; j++){
    fill(0, random(120), random(200));
    stroke(random(255));
     ellipse(250+i*10, 150+j*10,random(20),random(20)); 
    }
}
}
