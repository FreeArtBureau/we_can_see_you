/*
 * Author : nicodeme
 * Version : 0.1
 *
 */

class Ani_02 extends Animation {

  /////////////////////////// GLOBALS ////////////////////////////

  PImage saved; 
  float angle;
  int PixelSize; 
  int pas;

  /////////////////////////// SETUP ////////////////////////////

  void setup() {
    this.saved = new PImage();
    noStroke();
    //rectMode(CENTER);
    PixelSize = 2;
    angle = radians(0);  
    pas =  8;

    // INFORMATION ON CLASS : QUI & QUOI
    author = "nicodème";
    name = "funDamental Z";
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
  }

  /////////////////////////// DRAW ////////////////////////////

  void draw() {
    background(255);  
    // On parcourt l'image grâce à une boucle
    saved.resize(width/2, height/2);
    pushMatrix();
    translate(saved.width/2, saved.height/2);
    for ( int x = 0; x < saved.width; x+=pas) {
      for ( int y = 0; y < saved.height; y+=pas) {


        float z = sin(angle*0.05) *  brightness(saved.get(x, y)) - 100.0;
        //float z = sin(angle*0.1) *  saturation(saved.get(x, y)) - 90.0;
        //float z = sin(angle*0.15) *  hue(saved.get(x, y)) - 100.0;
        //float z = sin(angle*0.15) *  blue(saved.get(x, y)) - 90.0;

        // on récupère  la couleur du pixel en fonction des variables x & y
        int pixelColor = saved.get(x, y);

        fill(pixelColor);

        //Added this 26/01/16 : (MW)
        PixelSize = (int)map(brightness(pixelColor), 0, 255, 1, 10);

        // On se sert de translate pour positionner nos rectangles/pixels
        pushMatrix();
        translate(x, y, z); // Notez bien l'axe z (profondeur)

        ellipse(0, 0, PixelSize, PixelSize);
        //box(pas,pas,z); // Forme 3D
        popMatrix();
      }
    }

    // mouvement auto
    angle+=0.5; 
    popMatrix();
  }
}

