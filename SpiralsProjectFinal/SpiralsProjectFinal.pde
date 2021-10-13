int radius;
PVector[] positions;
boolean activateLines;
Dot dotMaker;
Slider arr, r, thick;
Button init;

void setup()
{
  size(1200, 800);
  background(128);

  dotMaker = new Dot(0, 0, 0);
  arr = new Slider(40, 160, 80, 70, -1, 5);
  r = new Slider(40+120, 160, 80, 70, 1.001, 1.010);
  thick = new Slider(40+120*2, 160, 80, 70, 0.002, 0.700);
  init = new Button("Initialisation", 40, 680, 320, 60);
  activateLines = false;
}

void draw() {
  //spiral element
  if (init.defunct == true) {
    dotMaker.arrangement = arr.mouseReleased();
    dotMaker.radiusMove = r.mouseReleased();
    dotMaker.thicknessMove = thick.mouseReleased();
    dotMaker.draw();
  } else {
    //do nothing
  }
  
  if (dotMaker.pos.x < 0) {
    init.defunct = false;
    dotMaker.arrangement = 0;
    dotMaker.radiusMove = 0;
    dotMaker.thicknessMove = 0;
    
    init.x = init.xOG;
    init.y = init.yOG;
  }

  //all "static" elements
  stroke(255);
  strokeWeight(20);
  point(width*0.66, height/2);

  stroke(0);
  strokeWeight(1);
  if (activateLines == true) {
    line(width*0.66, height/2, dotMaker.pos.x, dotMaker.pos.y);
  }

  //control panel aaaa
  fill(64);
  rect(0, 0, 400, 800);

  //title
  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("Customising the rate of change", 200, 50);

  arr.draw();
  label("Arrangement", 80, 650);

  r.draw();
  label("Distance from centre", 210, 650);

  thick.draw();
  label("Radius", 320, 650);

  init.draw();
  label("Press l or L to see how many dots are making the spirals...", 200, 770);
}

void mousePressed() {
  //button
  if (mouseY >= init.y && mouseY <= init.y+init.ySize
    && mouseX >= init.x && mouseX <= init.x+init.xSize) {
    init.mousePressed();
  }
}

void mouseDragged() {
  //arrangement slider
  if (mouseX >= arr.x && mouseX <= arr.x+arr.xSize) {
    arr.active = true;
    arr.mouseDragged();
  }
  //radius move/ distance from centre move
  if (mouseX >= r.x && mouseX <= r.x+r.xSize) {
    r.active = true;
    r.mouseDragged();
  }
  //thickness move
  if (mouseX >= thick.x && mouseX <= thick.x+thick.xSize) {
    thick.active = true;
    thick.mouseDragged();
  }
}

void mouseReleased() {
  //initialisation button
  if (mouseY >= init.y && mouseY <= init.y+init.ySize
    && mouseX >= init.x && mouseX <= init.x+init.xSize) {
    init.mouseReleased();
    background(128);
    dotMaker.pos.x = width*0.66;
    dotMaker.pos.y = height/2;
    dotMaker.radius = 10;
    dotMaker.thickness = 5;
  }
  //arrangement slider
  else if (mouseX >= arr.x && mouseX <= arr.x+arr.xSize
    && mouseY >= arr.y && mouseY <= arr.y+arr.extent+arr.ySize) {
    arr.active = false;
  }
  //radius AKA distance from centre slider
  else if (mouseX >= r.x && mouseX <= r.x+r.xSize
    && mouseY >= r.y && mouseY <= r.y+r.extent+r.ySize) {
    r.active = false;
  }
  //radius AKA thickness slider
  else if (mouseX >= thick.x && mouseX <= thick.x+thick.xSize
    && mouseY >= thick.y && mouseY <= thick.y+thick.extent+thick.ySize) {
    thick.active = false;
    //end case
  } else {
    //do nothing
  }
}

//for the optional lines
void keyPressed() {
  if (key == 'l') {
    activateLines = true;
  }
  if (key == 'L') {
    activateLines = false;
  }
}

//for labels of the sliders
void label(String text, float x, float y) {
  fill(191);
  textAlign(CENTER);
  textSize(16);
  text(text, x, y);
}
