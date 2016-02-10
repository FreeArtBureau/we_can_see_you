class Ani_14 extends Animation {

  /////////////////////// GLOBALS ////////////////////////

  PImage saved; 
  float x;
  float y;
  int taillePixel;
  int pas;
  int SEED;

  //////////////////////// SETUP ////////////////////////

  void setup() {

    background(0);
    smooth();
    this.saved = new PImage();
    taillePixel = 10;
    pas = 15;
    SEED = (int)random(100);



    // INFORMATION ON CLASS : QUI & QUOI
    author = "Alain Papazian";
    name = "dumb";
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    saved.resize(width, height);
  }


  //////////////////////// DRAW ////////////////////////

  void draw() {
    background(0);
    randomSeed(SEED);
    noStroke();
    for (int x=0; x<width; x+=pas) {
      for (int y=0; y<height; y+=pas) {
        color rouge = saved.get(x, y); 
        fill(rouge);
        taillePixel = (int)random(20, 80);
 
        ellipse(x, y, taillePixel+1, taillePixel+1);
      }
    }
  }
}

