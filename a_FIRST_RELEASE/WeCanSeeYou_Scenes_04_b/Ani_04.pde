/*
 * Author : Marine Leleu
 * Version : 0.1
 *
 */


class Ani_04 extends Animation {


  /////////////////////////// GLOBALS ////////////////////////////
  PImage saved;
  PImage pix;
  int pixelSize;
  int  pixelSizeh;
  float x, y;

  void setup() {
    background(255);
    noStroke();
    y=0;
    x=0;
    pixelSize =0;
    this.saved = new PImage();

    // INFORMATION ON CLASS : QUI & QUOI
    author = "marine leleu";
    name = "destructuration";
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    // RESIZE IMAGE HERE ;–)
    saved.resize(width/4, height/4);
  }

  /////////////////////////// DRAW ////////////////////////////
  void draw() {
    pushMatrix();
    translate(width/2, 0); // cadrage


    pixelSize = (int)random(73, 563);
    pixelSizeh = (int)random(5, 30);
    
    int xPos = (int)random(10, saved.width-pixelSize);
    int yPos = (int)random(10, saved.height-pixelSizeh);
    
    pix = saved.get(xPos, yPos, pixelSize, pixelSizeh);

    image(pix, x, y);
    popMatrix();

    y+=random(5);
    
    if(y>height) {
     y = 0; 
    }
  }
}

