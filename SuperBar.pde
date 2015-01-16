int h = 50;
int[] x = {1000, 1500, 2000};
int s = 5;
float[] ph = {0,0,0};
float[] ch = {0,0,0};
color bc = color(0,150,0);
color bg = color(255);
int score = 0;
int r;
String title = "Super Bar";

void setup(){
  size(1000,500);
 
  ph[0] = random(200);
  ph[1] = random(200);
  ph[2] = random(200); 
}

void draw(){
  if(millis() < 4000){
   background(0,150,0);
   fill(0,255,0);
   noStroke();
   textAlign(CENTER);
   textSize(50);
   text(title,500,250);
   rect(725,150,50,200);
   triangle(750,100,700,150,800,150);
   rect(225,200,50,100);
   triangle(250,350,200,300,300,300);
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
  rect(500,250,50,h,15);
}

void pilar(){
  fill(150,0,0);
  rectMode(CORNER);
  for(int i = 0; i != 3; ++i){
    rect(x[i],0,50,ph[i]);
    rect(x[i],height-ph[i],50,ph[i]);
    x[i] = x[i]-s;
  }
  
  if(x[2] == 550){
    x[0] = 1000;
    ph[0] = random(200);
  }
  else if(x[0] == 550){
    x[1] = 1000;
    ph[1] = random(200);
  }
  else if(x[1] == 550){
    x[2] = 1000;
    ph[2] = random(200);
  }
}

void coin(){
  fill(250,250,0);
  stroke(255,150,0);
  
  for(int u = 0; u !=3; ++u){
   ch[u] = ph[u]+25+(ph[u]%50); 
    
   ellipse(x[u]+25,ch[u],50,50);
   ellipse(x[u]+25,height-ch[u],50,50); 
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
    if(x[e] == 500){
      if(h < height-ph[e]*2 && h > height-(ch[e]+25)*2){
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
    s = 10;
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
    s = 5;
    bg = color(255);
  }
 
  fill(0,0,255);
  textSize(25);
  textAlign(CENTER);
  text(score,495,25);
} 

void keyPressed(){
  if(h < height-50){
   if(keyCode == UP){
     h = h+50; 
    }
  }
  if(h > 50){
    if(keyCode == DOWN){
     h = h-50; 
    }
  }
  if(key == 't'){
   score = 50; 
  }
  else if(key == 'r'){
   score += 10; 
  }
}
