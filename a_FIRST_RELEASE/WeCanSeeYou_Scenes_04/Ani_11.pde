/*
 * This is where we will put our animation/drawings/whatever...
 *
 *
 */

class Ani_11 extends Animation {

  ////////////////////////////////////// GLOBALS

  PImage saved; // this will keep track of the saved image from camera ;–)
  // Changer cette valeur et observer si qui se passe
  int pixelSize;
  int randomPosition;
  int x;
  float y;
  float yPosOff; // offset


  ////////////////////////////////////// CONSTRUCTOR (SETUP)

  void setup() {
    x = 0;
    y = 0;
    this.saved = new PImage();
    y=0;
    yPosOff = 0;

    // INFORMATION ON CLASS : QUI & QUOI
    author = "tanguy";
    name = "random";
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    saved.resize(width/2, height/2); // Divise la taille de l'image
  }

  ////////////////////////////////////// METHODS

  void draw() {
    anime01();
  }

  /*
   * Displays photo as a repeated pattern
   */
  void anime01() {
    pixelSize = (int)random(1, 80); // taille des carrés de 1 à 50 et plus

    pushMatrix();
    translate(width/2-saved.width/2, height/2-saved.height/2); // Le /2 est utilisé quatre fois afin de centrer l'image

    int xPos = (int)random(0, saved.width);
    int yPos = (int)random(0, saved.height);

    // Attribuer ces coordonnées à pix (qui est une variable du type PImage)
    PImage pix = saved.get(xPos, yPos, pixelSize, pixelSize);

    yPosOff = 10;

    image(pix, xPos+random(-randomPosition, randomPosition), yPos+random(-randomPosition, randomPosition));

    popMatrix();
  }
}

