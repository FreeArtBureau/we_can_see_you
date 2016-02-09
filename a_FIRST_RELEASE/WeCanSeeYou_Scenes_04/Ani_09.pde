/*
 * Author : Simon Heller
 * Version : 0.1
 *
 */

class Ani_09 extends Animation {


  /////////////////////////// GLOBALS ////////////////////////////

  PImage saved; 
  float angle;
  int PixelSize; 
  int pas;

  PImage img;
  PImage pix;

  int randomPosition;

  int x;
  float y;
  float yPosOff;

  /////////////////////////// SETUP ////////////////////////////

  void setup() {


    noStroke();

    PixelSize = 80;
    y=0;
    yPosOff = 0;

    author = "simon heller";
    name = "superposition"; 
    randomPosition = (int)random(1, 80);
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    saved.resize(width, height);
  }


  /////////////////////////// DRAW ////////////////////////////

  void draw() {

    int xPos = (int)random(0, width);
    int yPos = (int)random(0, height);
    pix = saved.get(xPos, yPos, PixelSize, PixelSize);

    yPosOff = 10;


    image(pix, xPos+random(-randomPosition, randomPosition), yPos+random(-randomPosition, randomPosition));
  }
}

