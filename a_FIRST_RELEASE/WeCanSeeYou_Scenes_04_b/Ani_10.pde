
class Ani_10 extends Animation {

  PImage saved;
  int cell;
  int randDiff = 100;

  void setup() {
    this.saved = new PImage();
    smooth();

    // INFORMATION ON CLASS : QUI & QUOI
    author = "nadia bellalij";
    name = "pink";
  }
  void setImage(PImage img) {
    this.saved = img;
    saved.resize(width, height); //taille de l'écran
    pushStyle();
    //image(saved, 0, 0);
    tint(200, 0, 150, 110);
    popStyle();
  }

  void draw() {

    for (int i=0; i<8; i++) {
      cell = (int)random(5, 60);
      int x = (int)random(1, saved.width-cell);
      int y = (int) random(1, saved.height-cell);

      PImage newImg = saved.get(x, y, cell, cell);

      int xDiff = (int)random(50, 50);
      int yDiff = (int)random(50, 50);

      image(newImg, x+xDiff, y+yDiff);
    }
  }
}

