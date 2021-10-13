class Button {
  float x, y; //x,y are positions
  float xOG, yOG; //xOG and yOG keep the original positions specified
  float xSize, ySize; //xSize, ySize are dimensions
  String word; //word to be displayed
  color on,off,fontColour;
  boolean active,defunct; // active is for hovering, defunct activates makeDefunct()
  
  //Constructor
  Button(String name, float xPos, float yPos, float sizeX, float sizeY) {
    word = name;
    
    x = xPos;
    xOG = xPos;
    y = yPos;
    yOG = yPos;
    
    xSize = sizeX;
    ySize = sizeY;
    
    on = color(250,255,65);
    off = color(128);
    fontColour = color(0);
    
    active = false;
    defunct = false;
  }
  
  void draw() {
    if (defunct == true) {
      
    } else {
      
      on = color(250,255,65);
      off = color(128);
      fontColour = color(0);
      
      noStroke();
      //changes active colours
      if (active == true) {
        fill(on);
      } else {fill(off);}
      rect(x,y,xSize,ySize, 20);
      
      //text
      fill(fontColour);
      textSize(34);
      textAlign(CENTER,CENTER);
      text(word,xSize/2+x,ySize/2+y);
    }
  }
  
  //clik
  void mousePressed() {
    if (defunct == true) {
      active = false;
    } else {
      active = true;
      on = color(250,255,65);
      off = color(128);
      fontColour = color(0);
    }
   }
  
  //when releasing it makes it defunct
  void mouseReleased() {
    active = false;
    this.makeDefunct();
  }
  
  //the actual defunct method
  void makeDefunct() {
    defunct = true;
    off = color(64);
    on = color(64);
    //to make the button not work during the defunct state, its position becomes inaccessible
    x = width;
    y = height;
    fontColour = color(64);
  }
}
