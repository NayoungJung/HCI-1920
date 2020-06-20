int [] xpos = new int [20];
int [] ypos = new int [20];

void setup(){
 size(1024,768);
 rectMode(CENTER);
 noCursor();
 noStroke();
}

void draw (){
  background(0);
  stroke(0,random(200), random(200));
  strokeWeight(2);
  line(150,mouseY,150,height);
  noStroke();
  for (int i =0; i<xpos.length-1;i++){
  xpos[i]=xpos[i+1]; ypos[i]=ypos[i+1]; 
}

  xpos[xpos.length -1] = mouseX;  ypos[ypos.length -1] = mouseY;
  
 for (int i =0; i<xpos.length;i++){
  fill(255,150,255-i*5,150);  rect(xpos[i]+100, ypos[i]-100,i*3,i*3);
  fill(255-i*5,0,200,150);  ellipse(xpos[i]+20, ypos[i]+20,i*3,i*3);
  fill(100,0,255-i*2,150); triangle(ypos[i], xpos[i],ypos[i]+40, xpos[i]+10,ypos[i], xpos[i]+20);
  fill(20,220,255-i*2,100);
  quad(ypos[i]+10,xpos[i]+100,  ypos[i]+120,xpos[i]+100, 
  ypos[i]+130,xpos[i]+130, ypos[i]-10,xpos[i]+130);
} 
}
