/* 
 * Author : Manon Verdier
 * Version 0.1
 */

import ddf.minim.*;


class Ani_09 extends Animation {

  /////////////////////////// GLOBALS ////////////////////////////
  PImage saved; // Déclaration d’une variable du type PImage
  int xPas;
  int yPas;
  Minim minim;
  AudioInput in;

  /////////////////////////// SETUP ////////////////////////////
  void setup() {
    minim = new Minim(this);
    minim.debugOn();
    in = minim.getLineIn(Minim.STEREO, 512);

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
    frameRate(15);
    float sonMix = in.mix.get(0)*33;

    pushMatrix();
    translate(width/1.8-saved.width/2, height/2-saved.height/2);
    for (int x=0; x<width; x+=xPas) {
      for (int y=0; y<height; y+=yPas) {

        color c = saved.get(x, y);
        noStroke();
        fill(c);
        rect(x, y, 100, 3+sonMix);
      }
    }
    popMatrix();
  }
}

