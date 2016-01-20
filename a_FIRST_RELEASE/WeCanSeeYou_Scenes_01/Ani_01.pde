/*
 * This is where we will put our animation/drawings/whatever...
 *
 *
 */

class Ani_01 extends Animation {

  ////////////////////////////////////// GLOBALS

  PImage saved; // this will keep track of the saved image from camera ;–)
  float x, y;
  int pas;
  float imageScale = 0.93;
  float angle;
  float fact;
  int rand;

  ////////////////////////////////////// CONSTRUCTOR (SETUP)

  void setup() {
    x = random(width);
    y = height/2;
    this.saved = new PImage();
    pas = 2;
    fact = 9.6;
    angle = 0;
    rand = (int)random(4);

    // INFORMATION ON CLASS : QUI & QUOI
    author = "mark webster";
    name = "spirals";
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
  }

  ////////////////////////////////////// METHODS

  void draw() {
    /*
    if ((rand == 1) || (rand == 0)) {
     anime01();
     }
     
     if (rand == 2) {
     anime02();
     }
     
     if (rand == 3) {
     anime03();
     }
     */
    anime01();
  }

  /*
   * Displays photo randomly on x axis
   */
  void anime01() {
    saved.resize(width/4, height/4);
    image(saved, random(width), y);
  }

  /*
   * Displays photo randomly & rotates
   */
  void anime02() { 
    randomSeed(1);
    for (int i=0; i<10; i++) { 
      pushMatrix();
      float xPos = random(width);
      translate(xPos, y);
      rotate(sin(frameCount*0.01)*TWO_PI); 

      float imgSizeX = sin(frameCount*0.01)*(saved.width*2);
      float imgSizeY = sin(frameCount*0.01)*(saved.height*2);

      image(saved, 0, 0, imgSizeX, imgSizeY);
      popMatrix();
    }
  }

  /*
   * Displays image as a set of graphic pixels
   */

  void anime03() {
    background(0);
    pushMatrix();
    //translate(width/4.3, 100);
     //translate(width/4, 20);
    loadPixels();
    noStroke();
    int res = 4;
    float imgScale = 4;
    for (int x=0; x<saved.width-1; x+=res) {
      for (int y=0; y<saved.height-1; y+=res) {
        int pos = x+y*saved.width;
        color c = saved.pixels[pos]; // 1D PixelArray

        float lum = (brightness(c)/255)*fact;
        if (lum >= 6) {  
          fill(c);
          //ellipse(x*imgScale, y*imgScale, 1*lum, 1*lum);
           ellipse(x, y, 1*lum, 1*lum);

          //other possibility
          //image(saved, x, y, 0.9*lum, 0.9*lum);
        }
      }
    }

    //fact+=0.007;
    fact=abs(sin(angle*0.050)*63.1);
    angle+=0.5;
    popMatrix();
  }
}

