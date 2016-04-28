/* 
 * Author : Manon Verdier
 * Version 0.1
 */


class Ani_11 extends Animation {

  /////////////////////////// GLOBALS ////////////////////////////
  PImage saved; // Déclaration d’une variable du type PImage
  int xPas;
  int yPas;

  /////////////////////////// SETUP ////////////////////////////
  void setup() {
    background(0);
    noStroke();
    smooth();
    xPas = 8;
    yPas = 8;

    // SUPPRIMER LE CHARGEMENT D'IMAGE + AJOUTER :
    this.saved = new PImage();

    // INFORMATION ON CLASS : QUI & QUOI
    author = "manon verdier";
    name = "glitch";
  }

  //////////////////////////////////////////// À RAJOUTER
  void setImage(PImage img) {
    this.saved = img;
    saved.resize(width-600, height-250);
  }


  /////////////////////////// DRAW ////////////////////////////
  void draw() {
    background(0);

    pushMatrix();
    translate(width/1.8-saved.width/2, height/2-saved.height/2);
    for (int x=0; x<width; x+=xPas) {
      for (int y=0; y<height; y+=yPas) {
       
       float sonMix = cos(frameCount*0.009)*0.3;
       float sonMix2 = sin(frameCount*0.003)*0.3;
       float N = noise(x*sonMix, y*sonMix2)*33; 
        color c = saved.get(x, y);
        noStroke();
        fill(c);
        rect(x, y, 1+sonMix2+N, 3+N);
      }
    }
    popMatrix();
  }
}

