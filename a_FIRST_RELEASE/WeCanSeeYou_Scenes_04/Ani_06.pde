/*
 * Author : valentine chevalley
 * Version : 0.1
 *
 */

class Ani_06 extends Animation {
  /////////////////////////// GLOBALS ////////////////////////////

  PImage saved; 
  PImage pix1, pix2, pix3, pix4;
  int pixelSize;
  int pixelSize1= pixelSize + 80;
  float x, y;
  int imageScale = 2;
  /////////////////////////// SETUP ////////////////////////////

  void setup() {

    this.saved = new PImage();  
    noStroke();
    pixelSize = 80;
    x = width/2;
    y = height/2;

    author = "valentine chevalley";
    name = "Unknown";
  }

  void setImage(PImage img) {
    this.saved = img;
    saved.resize(width/3, height/2);
  }

  /////////////////////////// DRAW ////////////////////////////

  void draw() { 
    pix1 = saved.get(110, 140, pixelSize, pixelSize);
    pix2 = saved.get(285, 130, pixelSize, pixelSize); 
    pix3 = saved.get(200, 215, pixelSize, pixelSize); 
    pix4 = saved.get(160, 295, pixelSize1, pixelSize); 

    image(pix1, random(1200), random(800));
    image(pix2, random(1200), random(800));
    image(pix3, random(1200), random(800));
    image(pix4, random(1200), random(800));

    // saved.resize(saved.width*imageScale, saved.height*imageScale);
    // image(saved,x, y);
  }
}

