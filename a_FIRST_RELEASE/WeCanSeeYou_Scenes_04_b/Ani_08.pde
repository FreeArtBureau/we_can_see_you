/*
 * This is where we will put our animation/drawings/whatever...
 *
 *
 */

class Ani_08 extends Animation {

  PImage saved;
  PImage grab; 
  int  taille;
  float theta;

  ////////////////////////////////////// CONSTRUCTOR (SETUP)

  void setup() {
    this.saved = new PImage();
    this.grab = new PImage();
    taille = 5;
    theta = radians(0);

    // INFORMATION ON CLASS : QUI & QUOI
    author = "hadrien";
    name = "nawak";
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
    translate(width/1.8-saved.width/2, height/2-saved.height/2);

    //theta = sin(frameCount*0.05)*100;

    for (int y=0; y<saved.height; y+=50) {
      for (int x=0; x<saved.width; x+=50) {
        pushMatrix();
        translate(x, y);
        int BIGGER = (int)cos(frameCount*0.1)*40;
        //rotate(radians(theta));
        grab = saved.get(0, 0, taille, taille);

        image(grab, 0, 0, taille+BIGGER, taille+BIGGER);
        popMatrix();
      }
    }
    popMatrix();
  }
}

