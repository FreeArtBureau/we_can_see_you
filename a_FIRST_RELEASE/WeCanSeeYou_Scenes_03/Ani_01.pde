/*
 * This is where we will put our animation/drawings/whatever...
 *
 *
 */

class Ani_01 extends Animation {

  ////////////////////////////////////// GLOBALS
  
  // IMPORTANT NOTE : init all global values in setup()
  PImage saved; // this will keep track of the saved image from camera ;–)
  float x, y;
  int imageScale;


  ////////////////////////////////////// CONSTRUCTOR (SETUP)

  void setup() {
    x = 0;
    y = 0;
    this.saved = new PImage();
    imageScale = (int)random(6, 22);

    // INFORMATION ON CLASS : QUI & QUOI
    author = "mark webster";
    name = "repeat";
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
  }

  ////////////////////////////////////// METHODS

  void draw() {
    anime01();
  }

  /*
   * Displays photo as a repeated pattern
   */
  void anime01() {
    saved.resize(width/imageScale, height/imageScale);
    image(saved, x, y);
    x+=saved.width;
    if (x>=width+(saved.width/imageScale)/2) {
      x = 0;
      y+=saved.height;
    }
  }
}

