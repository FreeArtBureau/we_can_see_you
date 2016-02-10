/* 
 * Author : Chloé Girard
 * Version 0.1
 */

class Ani_01 extends Animation {

  //////////////////////// GLOBALS ////////////////////////

  PImage saved;
  PImage [] lines;
  int newImageSize;
  float theta;
  float thresh;

  //////////////////////// SETUP ////////////////////////

  void setup() {

    noStroke();
    smooth();
    this.saved = new PImage();
    newImageSize = 600;
    theta = 00.1;

    // INFORMATION ON CLASS
    author = "chloé girard";
    name = "wave";
  }

  //////////////////////// IMPORTANT TO ADD TO ALL CLASSES 

  void setImage(PImage img) {
    this.saved = img;
    initLines();
  }

  //////////////////////// loads array for lines 

    void initLines() {
    saved.resize(newImageSize, newImageSize);
    lines = new PImage[saved.height];

    for (int i = 0; i < lines.length; i++) {
      lines[i] = saved.get(0, i, saved.width, 1);
    }
  }

  //////////////////////// DRAW ////////////////////////

  void draw() {

    pushMatrix();
    translate(width/2-saved.width/2, 100);
    float amp = sin(frameCount*0.01)*20;
    for (int i = 0; i < lines.length; i++) {
      image(lines[i], 
      ((width-saved.width)/2)+amp*sin(i*theta), i, saved.width, 10);
    }
    theta += 0.005;
    filter(THRESHOLD, 0.7);
    popMatrix();

    rectMode(CENTER); 
    fill(0, 100, 255, 100);
    rect(width/2+40, height/2, 650, 620);
  }
}

