/*
 * Author : Chloe Girard
 * Version : 0.1
 *
 */

class Ani_07 extends Animation {

  ///////////////////////////GLOBALS//////////////////////////
  PImage saved;
  PImage[] lines;
  float theta;
  int newImageSize;

  ///////////////////////////SETUP////////////////////////////
  void setup() {
    noStroke();
    smooth();
    this.saved = new PImage();
    theta = 00.1;
    newImageSize = 600;
    
    // INFORMATION ON CLASS : QUI & QUOI
    author = "chloe girard";
    name = "lines";
  }


  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    initLines();
  }

  ////////// ADDED FUNCTION : loads array for lines
  void initLines() {
    saved.resize(newImageSize, newImageSize);
    // no need for this function below
    //image(saved, 0, 0, saved.width, saved.height);
    lines = new PImage[saved.height];

    for (int i = 0; i < lines.length; i++) {
      // NOTE : MUST GET FROM SAVED IMAGE ;–) ---------- !
      lines[i] = saved.get(0, i, saved.width, 1);
    }
  }


  /////////////////////////DRAW//////////////////////////
  void draw() {
    pushMatrix();
    translate(width/2-saved.width/2, 100);
    float amp = sin(frameCount*0.01)*20; 
    for (int i = 0; i < lines.length; i++) {
      image(lines[i], 
      ((width-saved.width)/2)+amp*sin(i*theta), i, saved.width, 2);
    }
    theta += 0.005;

    popMatrix();
  }
}

