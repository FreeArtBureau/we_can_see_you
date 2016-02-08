/*
 * Author : Marine Leleu
 * Version : 0.1
 *
 */


class Ani_04 extends Animation {

  /////////////////////////// GLOBALS ////////////////////////////
  PImage saved; 
  int pixelSize;
  int x;
  float y;

  /////////////////////////// SETUP /////////////////////////////

  void setup() {
    noStroke();
    this.saved = new PImage();
    y=0;
    //pixelSize = 350;

    // INFORMATION ON CLASS : QUI & QUOI
    author = "marine leleu";
    name = "décomposition";
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
  }

  /////////////////////////// DRAW ////////////////////////////
  void draw() {
    pixelSize = saved.width;
    int xPos = (int)random(saved.width);
    int yPos = (int)random(saved.height);

    PImage pix = saved.get(xPos, yPos, saved.width, pixelSize/10);

    for ( x=30; x<width+pixelSize; x+=80) {
      image(pix, x, y);
    }
    y+=random(10.10);
  }
}

