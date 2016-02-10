/*
 * Author : Maud Laville
 *
 */
class Ani_06 extends Animation {

  //TOUT CE QUI SE TROUVE ICI C'EST NOTRE CLASSE 

  /////////////////////////// GLOBALS ////////////////////////////

  PImage saved;
  int Ypix = 1;
  int Xpix = 1;
  float tileCount = 1;
  int circleAlpha = 180;
  int actRandomSeed = 1;
  float x, y;

  ///////////////////////////  SETUP  ////////////////////////////
  void setup() {

    frameRate(30);

    this.saved = new PImage();

    // INFORMATION ON CLASS : QUI & QUOI
    author = "Maud Laville";
    name = "Organique";
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    saved.resize(height/3, height/3);
  }

  ///////////////////////////  DRAW   ////////////////////////////

  void draw() {

    pushMatrix();
    translate(width/2-100, height/2-200);
    background(0);
    randomSeed(actRandomSeed);

    noFill();

    for (int x=0; x<saved.width; x+=5) {
      for (int y=0; y<saved.height; y+=5) {

        color c = saved.get(x, y); // créer une variable color dans laquelle je stoke une information qui est la couleur du pixel qui se trouve à x et y
        // va lire tous les pixels de l'image   
        stroke(c, circleAlpha);
        float dia = sin(frameCount*0.5)*50;
        strokeWeight(random(1, 8));
        forme(x, y, dia*0.05, dia*0.05);
      }
    }
    popMatrix();
  }
  /////////////////////////// FUNCTIONS ////////////////////////////

  void forme(float _x, float _y, float _pozX, float _pozY) {

    for (int gridY=0; gridY<tileCount; gridY++) {
      for (int gridX=0; gridX<tileCount; gridX++) {

        float posX = width/tileCount * gridX;
        float posY = height/tileCount * gridY;

        float shiftX = cos(frameCount*0.03)*50;
        float shiftY = sin(frameCount*0.05)*50;

        ellipse(_x+posX+shiftX, _y+posY+shiftY, _pozX, _pozY);
      }
    }
  }
}

