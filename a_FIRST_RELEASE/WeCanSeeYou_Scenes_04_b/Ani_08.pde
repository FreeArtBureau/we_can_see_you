/*
 * This is where we will put our animation/drawings/whatever...
 *
 *
 */

class Ani_08 extends Animation {

  ////////////////////////////////////// GLOBALS

  // IMPORTANT NOTE : init all global values in setup()
  PImage saved; // this will keep track of the saved image from camera ;–)
  int  taille;

  ////////////////////////////////////// CONSTRUCTOR (SETUP)

  void setup() {

    this.saved = new PImage();
    taille = 25;

    // INFORMATION ON CLASS : QUI & QUOI
    author = "mark webster";
    name = "repeat";
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    saved.resize(width/2, height/2);
  }

  ////////////////////////////////////// METHODS

  void draw() {

    background(0);
    pushMatrix();
    translate(100,100);
    for (int y=0; y<saved.height; y+=50) {
      for (int x=0; x<saved.width; x+=50) {
        pushMatrix();
        translate(x, y);
        rotate(sin(frameCount*0.05)*100);
        PImage grab = saved.get(x, y, taille, taille);

        image(grab,0,0);
        popMatrix();
      }
    }
        popMatrix();
  }

}

