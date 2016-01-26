/*
 * Author : Julie Laalaj
 * Version : 0.1
 *
 */

class Ani_03 extends Animation {

  PImage saved;       
  int taillecell = 10; 
  int colonne, ligne;   


  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
  }

  void setup() {
    //size(700, 500, P3D); 
    //img = loadImage("lena.jpg"); 
    //image(img, 0, 0, img.width/10, img.height/10);
    //img.resize(0, 400);
    this.saved = new PImage();
    //colonne = saved.width / taillecell;  
    //ligne = saved.height / taillecell;  
    int w = saved.width;
    int h = saved.height;
    //println(w);
    //println(h);
    //imageMode(CENTER);

    // INFORMATION ON CLASS : QUI & QUOI
    author = "julie laalaj";
    name = "vj pixels";
  }

  void draw() {
    background(0);
    //saved.resize(0,400);
    saved.resize(width/2, height/2);
    colonne = saved.width / taillecell;  
    ligne = saved.height / taillecell;

    pushMatrix();
    translate(saved.width/2, saved.height/2.5);
    // Begin loop for columns
    for ( int i = 0; i < colonne; i++) {
      // Begin loop for rows
      for ( int j = 0; j < ligne; j++) {

        float var = sin(frameCount*0.05);
        int v2 = (int)map(var, -1, 1, 1, 500);
        int v3 = (int)map(var, -1, 1, 1, width);

        int x = i*taillecell;  // x position
        int y = j*taillecell;  // y position
        int loc = x + y*saved.width;  
        color c = v2*saved.pixels[loc];  // garder la couleur des pixels
        // Calculer la position de z en fonction de mouseX et de la luminosité
        float z = (v3 / float(width)) * brightness(saved.pixels[loc]) - 300.0;
        // Translate to the location, set fill and stroke, and draw the rect
        pushMatrix();
        translate(x+50, y+50, z+100);
        fill(c/2, 204);
        noStroke();
        rectMode(CENTER);
        rect(0, 0, taillecell, taillecell);
        popMatrix();
      }
    }
    popMatrix();
  }

  void keypressed() {
    if (key=='+') {
      taillecell+=10;
    }
  }
}

