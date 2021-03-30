PImage bg,soil,life,groundhogIdle,soldier,cabbage,title,startNormal,startHovered;
float groundhogX = 320;
float groundhogY = 80;
float groundhog_W = 80;
float groundhog_H = 80;
float groundhogSpeed = 80;
float soldierX;
float soldierY = 320;
float soldier_W = 80;
float soldier_H = 80;
float cabbageX = 560;
float cabbageY = 160;
float cabbage_W = 80;
float cabbage_H = 80;

boolean upPressed, downPressed, rightPressed, leftPressed;

final int GAME_START = 1 ,GAME_RUN = 2 , GAME_WIN  = 3 ,GAME_LOSE = 4;
int gameState;

final int TOTAL_HEART = 2;
int heart;
int lifeX =80 ;

void setup() {
  
  gameState = GAME_START;
  
	size(640, 480);
	bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");
  groundhogIdle = loadImage("img/groundhogIdle.png");
  soldier = loadImage("img/soldier.png");
  cabbage = loadImage("img/cabbage.png");
  title = loadImage("img/title.jpg");
  startNormal = loadImage("img/startNormal.png");
  startHovered = loadImage("img/startHovered.png");
  
  heart = TOTAL_HEART;
}

void draw() {
  
  switch(gameState){
    
    case GAME_START:
    if(mouseX > 248 && mouseX < 248+144
    && mouseY > 360 && mouseY < 420){
    image(title,0,0);
    image(startNormal,248,360);
    image(startHovered,248,360);
    if(mousePressed){
      gameState = GAME_RUN;
    }
    }else{
      image(title,0,0);
      image(startNormal,248,360);
    }
    break;
    
   
    
    case GAME_RUN:
    
    //groundhog X,Y position
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
    
    image(cabbage,cabbageX,cabbageY,cabbage_W,cabbage_H);//cabbage
  
    //cabbage hit
    if(groundhogX + groundhog_W > cabbageX &&
       groundhogX < cabbageX + cabbage_W &&
       groundhogY + groundhog_H > cabbageY &&
       groundhogY < cabbageY + cabbage_H){
        println(heart);
        heart++;
        image(life,lifeX,10);
        
        image(soil,0,160);
       }
    
    image(groundhogIdle,groundhogX,groundhogY,groundhog_W,groundhog_H);//groundhogIdle 
      
    //soldier
    image(soldier,soldierX,soldierY,soldier_W,soldier_H);
    soldierX += 3;
    soldierX %= width;
     break;
    
    case GAME_WIN:
    //
    break;
    
    case GAME_LOSE:
    //
    break;

    }
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
