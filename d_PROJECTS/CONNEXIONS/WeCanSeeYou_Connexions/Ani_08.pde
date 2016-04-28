/*
 * Author : Marie Kopa
 * Version : 0.1
 *
 */


class Ani_08 extends Animation {
  
//TOUT CE QUI SE TROUVE ICI C'EST NOTRE CLASSE 

/////////////////////////// GLOBALS ////////////////////////////

PImage saved; // this will keep track of the saved image from camera ;–)
PImage truc;
float x, y;
int imageScale = 2;

///////////////////////////  SETUP  ////////////////////////////
void setup() {
    x = width;
    y = height;
    
    this.saved = new PImage();
    
// INFORMATION ON CLASS : QUI & QUOI
    author = "marie kopa";
    name = "nom";
}

//////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
      saved.resize(width,height);
  }

///////////////////////////  DRAW   ////////////////////////////

void draw() {
  int x1 = (int) random(0, width);
  int y1 = 10;

  int x2 = round(x1 + random(-0, 0));
  int y2 = round(random(-20, 20));

  int w = (int) random(4, 4);
  int h = height;

  copy(saved, x1,y1, w,h, x2,y2, w,h);
}
     
  
}
