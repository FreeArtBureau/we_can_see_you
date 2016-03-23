/*
 * This is where we will put our animation/drawings/whatever...
 *
 *
 */

class Ani_07 extends Animation {
  PImage saved;
  ////////////////////////////////////// CONSTRUCTOR (SETUP)

  void setup() {
    this.saved = new PImage();

    // INFORMATION ON CLASS : QUI & QUOI
    author = "hadrien";
    name = "nawak";
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    saved.resize(width-600, height-250);
  }

  ////////////////////////////////////// METHODS

  void draw() {

    background(0);

    pushMatrix();
    translate(width/1.8-saved.width/2, height/2-saved.height/2);
    for (int x=0; x<width; x+=8) {
      for (int y=0; y<height; y+=12) {

        float sonMix = cos(frameCount*0.007)*0.1;
        float sonMix2 = sin(frameCount*0.001)*0.1;
        float N = noise(x*sonMix, y*sonMix2)*27; 
        color c = saved.get(x, y);
        noStroke();
        fill(c);
        ellipse(x, y, 5+sonMix*N, 1+sonMix2+N);
      }
    }
    popMatrix();
  }
}

