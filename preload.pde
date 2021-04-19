PImage title, bg, gameover, soil, life, cabbage, soldier, groundhogIdle;
PImage startNormal, startHovered, restartNormal, restartHovered;

final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;
int gameState = GAME_START;

final int BUTTON_TOP = 360;
final int BUTTON_BOTTOM = 420;
final int BUTTON_LEFT = 248;
final int BUTTON_RIGHT = 392;

float groundhogX = 320;
float groundhogY = 80;
float groundhog_W = 80;
float groundhog_H = 80;
float groundhogSpeed = 80;

boolean downPressed= false;
boolean rightPressed= false;
boolean leftPressed= false;


//soldier
int y = 160;
int soldierX = 80;
int soldierY = y + floor(random(4))*80;
float soldierWidth = 80;
float soldierHeight = 80;
float soldierSpeed;

//cabbage
int cabbageX = floor(random(8))*80;
int cabbageY = y + floor(random(4))*80;

//life
int groundhoglife = 2;

void setup() {
  size(640, 480, P2D);
  // Enter Your Setup Code Here
  title = loadImage("img/title.jpg");
  bg = loadImage("img/bg.jpg");
  gameover = loadImage("img/gameover.jpg");
  startNormal = loadImage("img/startNormal.png");
  startHovered = loadImage("img/startHovered.png");
  restartNormal = loadImage("img/restartNormal.png");
  restartHovered = loadImage("img/restartHovered.png");
  cabbage = loadImage("img/cabbage.png");
  soldier = loadImage("img/soldier.png");
  groundhogIdle = loadImage("img/groundhogIdle.png");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");


  soldierSpeed = 5;
}

void draw() {
  image(title, 0, 0);


  switch(gameState) {

  case GAME_START:

    if (mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT
      && mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM) {        
      image(startHovered, 248, 360);
      if (mousePressed) {
        gameState = GAME_RUN;
      }
    } else {
      image(startNormal, 248, 360);
    }
    break;

  case GAME_RUN:

    //background
    image(bg, 0, 0);

    //soil
    image(soil, 0, 160);

    //grass
    noStroke();
    fill(124, 204, 25);
    rect(0, 145, 640, 15);

    //sun
    noStroke();
    fill(255, 255, 0);
    ellipse(590, 50, 130, 130);
    fill(253, 184, 19);
    ellipse(590, 50, 120, 120);

    //touch soldier
    if (groundhogX < soldierX && groundhogX+80 > soldierX -80
      && groundhogY < soldierY+80 && groundhogY+80 > soldierY) {
      if (groundhoglife == 1) {
        groundhoglife -= 1;
        gameState = GAME_OVER;
      }
      if (groundhoglife == 2) {
        groundhoglife -= 1;
        groundhogX = 320;
        groundhogY = 80;
        image(groundhogIdle, 320, 80);
      }
      if (groundhoglife == 3) {
        groundhoglife -= 1;
        groundhogX = 320;
        groundhogY = 80;
        image(groundhogIdle, 320, 80);
      }
    }

    image(soldier, soldierX - 80, soldierY);
    soldierX += soldierSpeed;
    soldierX %= 640+80;

    //groundhog life
    if (groundhoglife == 1) {
      image(life, 10, 10);
    }

    if (groundhoglife == 2) {
      image(life, 10, 10);
      image(life, 80, 10);
    }

    if (groundhoglife == 3) {
      image(life, 10, 10);
      image(life, 80, 10);
      image(life, 150, 10);
    }

    //cabbage
    image(cabbage, cabbageX, cabbageY);
    //touch cabbage 
    if (cabbageX == groundhogX && cabbageY == groundhogY) {
      cabbageX = -80;
      cabbageY = -80;
      groundhoglife += 1;
    }

    //groundhog move
    if(downPressed){
        if(groundhogY >= 400){
          groundhogY = 400;
        }else{
          groundhogY += 80;
          downPressed = false;
        }
      }
      
      if(leftPressed){
        if(groundhogX <= 0){
          groundhogX = 0;
        }else{
          groundhogX -= 80;
          leftPressed = false;
        }
      }
      
      if(rightPressed){
        if(groundhogX >= 560){
          groundhogX = 560;
        }else{
          groundhogX += 80;
          rightPressed = false;
        }
      }

    //groundhogIdle 
    image(groundhogIdle,groundhogX,groundhogY,groundhog_W,groundhog_H);


    break;

    // Game Lose
  case GAME_OVER:
    image(gameover, 0, 0);
    
    if (mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT
      && mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM) {        
      image(restartHovered, 248, 360);
      if (mousePressed) {
        gameState = GAME_RUN;
        groundhoglife = 2;
        image(groundhogIdle, groundhogX, groundhogY);
        cabbageX = floor(random(7))*80;
        cabbageY = y + floor(random(4))*80;
        soldierY = y + floor(random(4))*80;
      }
    } else {
      image(restartNormal, 248, 360);
    }
    break;
  }
}

void keyPressed() {
 if (key == CODED)
  {
    switch(keyCode)
    {
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed= true;
        break;
        }
        }
     }
     

void keyReleased() {
   if (key == CODED)
  {
    switch(keyCode)
    {
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed= false;
        break;
    }
  }

}
