/*
 * Author : Fei Gao
 * Version : 0.1
 *
 */

class Ani_09 extends Animation {

  ///////////////////////////GLOBALS//////////////////////////
  PImage saved;

  ///////////////////////////SETUP////////////////////////////
  void setup() {
    noStroke();
    smooth();
    this.saved = new PImage();

    // INFORMATION ON CLASS : QUI & QUOI
    author = "fei gao";
    name = "rond";
  }


  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    saved.resize(400, 400);
  }


  /////////////////////////DRAW//////////////////////////
  void draw() {

    pushMatrix();
    translate(width/2-saved.width/2, height/2-saved.height/2);

    int x = (int) random (0, saved.width);
    int y = (int) random (0, saved.height);
    color c = saved.get(x, y);
    float d = random(1, 20);

    fill(c);
    noStroke();
    ellipse (x, y, d, d);

    popMatrix();
  }
}

