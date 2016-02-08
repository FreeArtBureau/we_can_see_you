/*
 * This is where we will put our animation/drawings/whatever...
 *
 *
 */

class Ani_11 extends Animation {

  ////////////////////////////////////// GLOBALS

  PImage saved; // this will keep track of the saved image from camera ;–)
 // PImage[] mesImg = new PImage[3]; 
   PImage deal;
  int x, y;
  int xm, ym;
  int xi;
  int yi;

  ////////////////////////////////////// CONSTRUCTOR (SETUP)

  void setup() {
    yi=5;
    this.saved = new PImage();

    author = "Arthur";
    name = "Thug Life Glasses";

    deal = loadImage("01.png");
    deal.resize(680, 136);

  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
  }

  ////////////////////////////////////// METHODS

  void draw() {
    
   anime02();
  }


  void anime02() {

    saved.resize(810, 720);// 540*1.5;480*1.5
    tint(255, 255, 255, 255);
    imageMode(CENTER);
    image(saved, width/2, height/2-25);
    xi=width/2-20;

    if (yi <= 290) {
      yi+=5;
    } else {
      yi=295;
    }

  image(deal, xi,yi);
 
  }

}

