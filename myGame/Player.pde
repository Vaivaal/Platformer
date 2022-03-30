public class Player extends Animation{
  int lives;
  boolean onPlatform, inPlace;
  PImage[] standLeft;
  PImage[] standRight;
  PImage[] jumpLeft;
  PImage[] jumpRight;
  public Player(PImage image, float scale){
    super(image, scale);
    lives = 3;
    direction = RIGHT_FACING;
    onPlatform = true;
    inPlace = true;
    
    standLeft = new PImage[1];
    standLeft[0] = loadImage("platformChar_walk2L.png");
    
    standRight = new PImage[1];
    standRight[0] = loadImage("platformChar_walk2R.png");
    
    jumpLeft = new PImage[1];
    jumpLeft[0] = loadImage("platformChar_jumpL.png");
    
    jumpRight = new PImage[1];
    jumpRight[0] = loadImage("platformChar_jumpR.png");
    
    moveLeft = new PImage[2];
    moveLeft[0] = loadImage("platformChar_walk1L.png");
    moveLeft[1] = loadImage("platformChar_walk2L.png");
    
    moveRight = new PImage[2];
    moveRight[0] = loadImage("platformChar_walk1R.png");
    moveRight[1] = loadImage("platformChar_walk2R.png");
    
    currentImages = standRight;
  }
  
  public void updateAnimation(){
    onPlatform = isOnPlatform(this, platforms);
    inPlace = changeX == 0 && changeY == 0;
    super.updateAnimation();
  }
  
  public void setDirection(){
    if(changeX > 0){
      direction = RIGHT_FACING;
    }
    else if(changeX < 0){
      direction = LEFT_FACING;
    }
  }
  
  public void selectCurrentImages(){
    if(direction == RIGHT_FACING){
      if(inPlace){
        currentImages = standRight;
      }
      else if(!onPlatform){
        currentImages = jumpRight;
      }
      else{
        currentImages = moveRight;
      }
    }
    
    else if(direction == LEFT_FACING){
      if(inPlace){
        currentImages = standLeft;
      }
      else if(!onPlatform){
        currentImages = jumpLeft;
      }
      else{
        currentImages = moveLeft;
      }
    }
  }
  
}
