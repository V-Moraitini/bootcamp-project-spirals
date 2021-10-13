class Slider {
  float x, y, extent; //x,y are positions, extent is the overall height
  float xSize, ySize; //xSize, ySize are dimensions
  float min,max; //min,max are the values that represent the actual values wanted for the spirals
  float ogValue;
  color on,off,bg;
  boolean active;

  //constructor
  Slider(float xPos, float yPos, float sizeX, float sizeY, float minVal,float maxVal) {
    
    x = xPos;
    y = yPos;
    extent = sizeY*8; //extent extends the max y which can be achieved
    
    xSize = sizeX;
    ySize = sizeY;
    
    min = minVal;
    max = maxVal;
    
    ogValue = y;
    
    on = color(250,255,65);
    off = color(128);
    bg = color(191);
    
    active = false;
  }
  
  void draw() {
    noStroke();
    //border
    fill(bg);
    rect(x,y,xSize,extent-y+ySize, 20);
    //slider
    if (active == false) {
      fill(off);
    } else {fill(on);}
    rect(x, ogValue, xSize, ySize, 20);
    
    //shows value rectangle
    fill(bg);
    rect(x, y-ySize, xSize, ySize/2, 20);
    fill(0);
    textSize(ySize*0.35);
    textAlign(CENTER);
    text(map(ogValue,y,extent,min,max),x+xSize/2,y-ySize+ySize/3);
  }
  
  //when you drag this it does stuff!!
  void mouseDragged() {
    ogValue = constrain(mouseY-(ySize/2),y,extent); //the extent of the values reached itself dw about it
  }
 
  float mouseReleased() {
    return map(ogValue,y,extent,min,max);
  } 

}
