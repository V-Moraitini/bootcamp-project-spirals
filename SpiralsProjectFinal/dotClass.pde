class Dot {
  PVector pos; //position of dots
  float radius; //distance away from the centre
  float thickness; //thickness of dot (strokeWeight)
  float arrangement; //influences "t", framecount or rate of change
  float radiusMove; //incrementation constant of radius
  float thicknessMove; //incrementation constant of thickness
  color colour; //colour of dots
  
  Dot(float r,float t,float a) {
    pos = new PVector(width*0.66, height/2);
    radius = 10;
    thickness = 5;
    radiusMove = r;
    thicknessMove = t;
    //setting the arrangment to something negative makes the spokes go the other way
    //arrangement = 0.000001 does some REALLY WEIRD UNEXPECTED THINGS at the end
    arrangement = a; //arrangement = 1 makes the most random and compact sequence of circles. why??
    colour = color(0,0,0);
  }
  
  void draw() {
    stroke(colour);
    strokeWeight(thickness);
    
    //drawing each point in a slight spiral
    float t = frameCount/arrangement;
    point(pos.x, pos.y);
    pos = new PVector(width*0.66 + radius*cos(t), height/2 + radius*sin(t));
    
    //incrementations/random assignments
    colour = color(red(colour) + random(-15,15), green(colour) + random(-15,15), blue(colour) + random(-15,15));
    radius *= radiusMove; //nice amount is 1.005
    thickness += thicknessMove; //complimentary amount is 0.2, ratio of that is /5.025
    
    /*note: doing sizeMove/1.005 takes some time to work but it creates a pattern
    based on the ends of the circles, not the starts like sizeMove/5.025
    A good choice would be between 1.001 and 7, random(1.001,7.001)*/
    
    /*note 2: when the incrementation of the radius happens slower
    than the incrementation of the thickness, the shape will be more like a polygon.
    This happens because the dots get big enough that when they cross the centre of 
    the canvas, the curves look more like straight lines than if the dots were smaller*/
  }
}
