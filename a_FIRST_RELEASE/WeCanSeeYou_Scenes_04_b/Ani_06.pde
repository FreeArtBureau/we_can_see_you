/*
 * Author : Fanny Muller
 * Version : 0.1
 *
 */

class Ani_06 extends Animation {

  ///////////////////////////GLOBALS//////////////////////////
  PImage saved;
  int x, y, pixelSize;

  ///////////////////////////SETUP////////////////////////////
  void setup() {
    noStroke();
    smooth();
    this.saved = new PImage();
    this.x = 0;
    this.y = 0;
    this.pixelSize=(int)random(1,8);

    // INFORMATION ON CLASS : QUI & QUOI
    author = "fanny muller";
    name = "britney";
  }


  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    this.saved.resize(600, 600);
  }


  /////////////////////////DRAW//////////////////////////
  void draw() {
    
    float angle = sin(frameCount*0.01)*360;
    
    pushMatrix();
    translate(width/2-saved.width/2, height/2-saved.height/2);
    //translate(10, 100);

    for (int y = 0; y < saved.height; y++) {
      // Select a random location
      x = (int)random(saved.width);
      
      pixelSize=(int)random(1,8);
      // use pixel color at x,y position
      color c = saved.get(x, y);
      fill (c);

      pushMatrix();
      translate(x, y);
      rotate(angle); // ADDED
      rect(0, 0, pixelSize, pixelSize);
      popMatrix();
    }
    popMatrix();
  }
}

