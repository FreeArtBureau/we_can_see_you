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

    author = "fei gao";
    name = "rond";
  }


  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    changeSize();
  }

  void changeSize() {
    this.saved.resize(400, 400);
    image(this.saved, 0, 0);
    background(0);
  }


  /////////////////////////DRAW//////////////////////////
  void draw() {

    pushMatrix();
    translate(width/2-saved.width/2, 10);

    int x = (int) random (0, saved.width);
    int y = (int) random (0, saved.height);

    int index = y * saved.width + x;
    color c = saved.pixels[index];
    float d = random(1, 20);

    fill(c);
    noStroke();
    ellipse (x, y, d, d);

    popMatrix();
  }
}

