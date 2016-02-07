/*
 * Author : Fanny Muller
 * Version : 0.1
 *
 */

class Ani_08 extends Animation {

  ///////////////////////////GLOBALS//////////////////////////
  PImage saved;
  int x, y;

  ///////////////////////////SETUP////////////////////////////
  void setup() {
    noStroke();
    smooth();
    this.saved = new PImage();
    this.x = 0;
    this.y = 0;

    // INFORMATION ON CLASS : QUI & QUOI
    author = "fanny muller";
    name = "britney";
  }


  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    //this.saved.resize(150,150);
  }


  /////////////////////////DRAW//////////////////////////
  void draw() {

    //saved.loadPixels();
    //saved.resize(150,150);
    pushMatrix();
    translate(width/2-saved.width/2, 100);
    //translate(10, 100);

    for (int y = 0; y < saved.height; y++) {
      // Select a random location
      x = (int)random(saved.width);

      // use pixel color at x,y position
      int index = y * saved.width + x;
      color c = saved.pixels[index];
      fill (c);

      pushMatrix();
      translate(x, y);
      rect(0, 0, 20, 20);
      popMatrix();
    }

    popMatrix();
    //saved.updatePixels();
  }
}

