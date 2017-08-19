PImage img;  // Declare variable "a" of type PImage

float moonCenterX, moonCenterY;
float waterHeight;
float[] tmpHeight;
float[] rawHeight;
float xoff = 0.0;
float increment = 0.1;
void setup() {
  size(900, 600);
  background(color(0,0,50));
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  moonCenterX = width/2-50;
  moonCenterY = height/2-50;
  waterHeight = 200;
  
  tmpHeight = new float[width+1];
  rawHeight = new float[width];
}

void draw() {
  
  clear();
  noStroke();
  
  for(int i = 0; i<30; i++)
  {
    fill(255, 255, 255, 100-3*i);
    ellipse( moonCenterX, moonCenterY, 100+i, 100+i );
  }
  beginShape();
  float yoff = 0.0;
  for(int i = 0; i<=width; i+=30)
  { xoff += increment;
   yoff += increment;
    tmpHeight[i]=noise(xoff,yoff)*250;
    stroke(255);
    vertex(i,height-tmpHeight[i]);
}

vertex(width,height);
vertex(0,height);
endShape(CLOSE);

}