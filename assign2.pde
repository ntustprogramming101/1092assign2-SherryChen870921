PImage bg,soil,life,groundhogIdle,soldier,cabbage,title,startNormal,startHovered;
float groundhogX ;
float groundhogY ;
float groundhogSpeed = 80 ;
float soldierX;
float soldierY;

void setup() {
	size(640, 480, P2D);
	bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");
  groundhogIdle = loadImage("img/groundhogIdle.png");
  soldier = loadImage("img/soldier.png");
  cabbage = loadImage("img/cabbage.png");
  
  //groundhog
  groundhogX = 320 ;
  groundhogY = 80 ;
  
  //soldier
  soldierX = 0;
  soldierY = floor(random(2,6))*80;
  
}

void draw() {
  if(groundhogX > width-80){
  groundhogX = width-80;
  }
  if(groundhogX <0){
  groundhogX=0;
  }
  if(groundhogY >height-80){
  groundhogY=height-80;
  }
  if(groundhogY <80){
  groundhogY = 80;
  }
  
  //hit
  //x
  
  //backgroung
  image(bg,0,0);

  //greengrass
  colorMode(RGB);
  fill(124,204,25);
  noStroke();
  rect (0,145,640,480);
  
  //sun 
  strokeWeight(5);
  stroke(255,255,0);
  fill(253,184,19);
  ellipse(590,50,120,120);
  
  image(soil,0,160);//ground
  image(life,10,10);//heart
  image(life,80,10);//heart
  image(groundhogIdle,groundhogX,groundhogY);//groundhogIdle
  image(cabbage,560,160);//cabbage
  
  //soldier
  image(soldier,soldierX-80,soldierY);
  soldierX += 3;
  soldierX %= 640+80;
  
  }


void keyPressed(){
  
  //groundhog move
  if (key == CODED){
   switch(keyCode){
     case UP:
      groundhogY -= groundhogSpeed;
      break;
     case DOWN:
      groundhogY += groundhogSpeed;
      break;
     case LEFT:
      groundhogX -= groundhogSpeed;
      break;
     case RIGHT:
      groundhogX += groundhogSpeed;
      break;
   }
  }
  }
  
  
