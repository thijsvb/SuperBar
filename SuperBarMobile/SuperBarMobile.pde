int h;
int[] x = {0,0,0};
int s;
float[] ph = {0,0,0};
float[] ch = {0,0,0};
color bc = color(0,150,0);
color bg = color(255);
int score = 0;
int r;
String title = "Super Bar";

void setup(){
  size(1750,1080);
  
  h = height/10;
  x[0] = width;
  x[1] = width+width/2;
  x[2] = width*2;
  s = width/200; 
  ph[0] = random((height/5)*2);
  ph[1] = random((height/5)*2);
  ph[2] = random((height/5)*2); 
}

void draw(){
  if(millis() < 4000){
   background(0,150,0);
   fill(0,255,0);
   noStroke();
   textAlign(CENTER);
   textSize(100);
   text(title,width/2,height/2);
   rect(width*0.725,height/5,width/20,(height/5)*3,10);
   rect(width*0.225,(height/5)*2,width/20,height/5,10);
  }
  else{
  
  background(bg);
  noStroke();
  
  hit();
  bar();
  pilar();
  coin();
  }
}

void bar(){
  fill(bc);
  rectMode(CENTER);
  rect(width/2,height/2,width/20,h,10);
}

void pilar(){
  fill(150,0,0);
  rectMode(CORNER);
  for(int i = 0; i != 3; ++i){
    rect(x[i],0,width/20,ph[i]);
    rect(x[i],height-ph[i],width/20,ph[i]);
    x[i] = x[i]-s;
  }
  
  if(x[2] <= width*0.55 + s/2 && x[2] >= width*0.55 - s/2){
    x[0] = width;
    ph[0] = random((height/5)*2);
  }
  else if(x[0] <= width*0.55 + s/2 && x[0] >= width*0.55 - s/2){
    x[1] = width;
    ph[1] = random((height/5)*2);
  }
  else if(x[1] <= width*0.55 + s/2 && x[1] >= width*0.55 - s/2){
    x[2] = width;
    ph[2] = random((height/5)*2);
  }
}

void coin(){
  fill(250,250,0);
  stroke(255,150,0);
  
  for(int u = 0; u !=3; ++u){
   ch[u] = ph[u]+width/40+(ph[u]%width/20); 
    
   ellipse(x[u]+width/40,ch[u],width/20,width/20);
   ellipse(x[u]+width/40,height-ch[u],width/20,width/20); 
  }
}

void hit(){
  if(r > 0){
    r = r-s;
  }
  else{
    bc = color(0,150,0);
  }
  for(int e = 0; e != 3; ++e){
    if(x[e] <= width/2 + s/2 && x[e] >= width/2 - s/2){
      if(h < height-ph[e]*2 && h > height-(ch[e]+width/40)*2){
        ++score;
        bc = color(0,255,0);
      }
      else if(h > height-ph[e]*2){
        score = 0;
        bc = color(0);
      }
      r = 100;
    }
  }

  if(score >= 50){
    s = (width/200)*2;
    bg = color(random(255),random(255),random(255));
  }
  else if(score >= 40){
    bg = color(255,128,0);
  }
  else if(score >= 30){
    bg = color(128,0,128);
  }
  else if(score >= 20){
    bg = color(255,0,0); 
  }
  else if(score >= 10){
    bg = color(128,128,255);
  }
  else{
    s = width/200;
    bg = color(255);
  }
 
  fill(0,0,255);
  textSize(50);
  textAlign(CENTER);
  text(score,width/2 -10,50);
} 

void mousePressed(){
  if(h < height-height/10){
   if(mouseX > width/2){
     h = h+height/10; 
    }
  }
  if(h > height/10){
    if(mouseX < width/2){
     h = h-height/10; 
    }
  }
}
