/*
 * Author : Julie Laalaj
 * Version : 0.1
 *
 */

class Ani_03 extends Animation {
 PImage saved;       
  int taillecell; 
  int colonne, ligne;   

  void setup() {
    this.saved = new PImage();
    taillecell = 10;
    
    // INFORMATION ON CLASS : QUI & QUOI
    author = "julie laalaj";
    name = "vj pixels";
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    // RESIZE IMAGE ;–)
    saved.resize(width/2, height/2);
  }

  void draw() {
    background(0);
  
    colonne = saved.width / taillecell;  
    ligne = saved.height / taillecell;
    
    // REPOSITION ALSO ;–)
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
        fill(c/2);
        noStroke();
        rectMode(CENTER);
        rect(0, 0, taillecell, taillecell);
        popMatrix();
      }
    }
    popMatrix();
  }
}

