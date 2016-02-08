/*
 * Author : Chloe Girard
 * Version : 0.1
 *
 */

class Ani_03 extends Animation {

  /////////////////////////// GLOBALS ////////////////////////////

  PImage saved;
  int cell;
  int randDiff;

  /////////////////////////// SETUP /////////////////////////////

  void setup() {
    this.saved = new PImage();
    randDiff = 25;
    
    // INFORMATION ON CLASS : QUI & QUOI
    author = "chloe girard";
    name = "random selection";
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
     // RESIZE IMAGE HERE ;–)
    saved.resize(width, height);
  }

  /////////////////////////// DRAW ////////////////////////////

  void draw() {

    // REPOSITION ALSO ;–)
    //pushMatrix();
    //translate(saved.width/2, saved.height/2.5);
    
    cell = (int)random(30, 130);
    int x = (int)random(1, saved.width-cell);
    int y = (int)random(1, saved.height-cell);

    PImage newImg = saved.get(x, y, cell, cell);

    int xDiff = (int)random(-randDiff, randDiff);
    int yDiff = (int)random(-randDiff, randDiff);

    image(newImg, x+xDiff, y+yDiff);
    //popMatrix();
  }
}

