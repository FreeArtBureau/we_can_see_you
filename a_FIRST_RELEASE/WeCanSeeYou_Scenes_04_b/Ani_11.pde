/*
 * Author: siloé nouyrit
 * version: 0.00000001
 */

class Ani_11 extends Animation {

  ////////////////////////////////////// GLOBALS

  PImage saved; // this will keep track of the saved image from camera ;–)
  float x, y;
  float a = 0.0;
  float b = 0.0;
  float c = 0.0;

  ////////////////////////////////////// CONSTRUCTOR (SETUP)

  void setup() {
    x = 0;
    y = 0;
    this.saved = new PImage();

    // INFORMATION ON CLASS : QUI & QUOI
    author = "siloé nouyrit";
    name = "this sketch has been corrupted";

    rectMode(CENTER);
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
  }

  ////////////////////////////////////// METHODS

  void draw() {
    anime01();

    a = a + 0.05;
    b = cos(a)*1.5;

    scale(b); 

    textFont(infoFont, 100);
    textSize(18);
    fill(255);

    String the = "YOU MAY BE THE REASON WHY";
    text(the, random(0, width), random(0, height));

    String too = "too much popMatrix() and not enought pushMatrix()";
    text(too, random(0, width), random(0, height));
  }

  void anime01() {
    a = a + 0.05;
    b = cos(a)*1.5;
    float posX = sin(frameCount*0.02)*100; //x//vitesse d'animation*amplitude
    float posY = sin(frameCount*0.02)*100; //y//vitesse d'animation*amplitude

    scale(b); 

    saved.resize(width, height);
    fill(0, 20);
    rect(0, 0, width*2, height*2);
    image(saved, width/2+posX, height/2+posY, width/2, height/2);
  }
}

