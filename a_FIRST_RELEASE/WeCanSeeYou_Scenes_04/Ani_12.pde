class Ani_12 extends Animation {

  /*/////////////////// VARIABLES GLOBALES ///////////////////*/

  PImage saved;


  float Xpix2; // deux variables a changer facilement pour effets différents
  float Ypix2;

  float Xpix = 5; // deux variables a changer facilement pour effets différents
  float Ypix = 150;

  float rotation = 0.5;
  float vitesse = 0.05;

  float frequencyX = 0.1;
  float frequencyY = 0.05;

  /*/////////////////// SETUP /////////////////// */
  void setup() {

    // background(0);
    rectMode (CENTER);
    smooth();
    noStroke();
    Xpix2 = 1;
    Ypix2 = 5;

    this.saved = new PImage(); // REMPLACE LOADIMAGE 

    // INFORMATION ON CLASS : QUI & QUOI
    author = "sarah";
    name = "brouillage";
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    saved.resize(width/2, height/2);
  }

  /*/////////////////// DRAW ///////////////////*/
  void draw() {


    smooth();

    pushMatrix();
    translate(saved.width/2, saved.height/2);

    for (int x=0; x<saved.width; x+=Xpix2) {
      for (int y=0; y<saved.height; y+=Ypix2+10 ) {

        color c = saved.get(x, y);//variable type color stocker info couleur qui se trouve à tous x et y 
        float tailleY2 = sin(frameCount * frequencyX) * Ypix2;
        fill(c);
        // translate(x, y);
        rect(x, y, Xpix2, tailleY2);
      }
    }

    popMatrix(); 

    pushMatrix();
    translate(saved.width/2, saved.height/2);
    // GRILLE  
    for (int x=0; x<saved.width; x+=Xpix+5) {
      for (int y=0; y<saved.height; y+=Ypix ) {

        color c = saved.get(x, y);//variable type color stocker info couleur qui se trouve à tous x et y 
        // boucle = lire tous les pixels de l'img > reconstituer l'img
        float tailleX = sin(frameCount * frequencyX) * Xpix;
        float tailleY = sin(frameCount * frequencyY) * Ypix;

        fill(c, 200);


        pushMatrix(); 
        translate(x, y);
        rotate(radians(rotation));

        // rect(0, 0, tailleX, Ypix);
        rect(0, 0, tailleX, tailleY); // pixel de coté

        rotation = rotation + vitesse;
        popMatrix();
      }
    }
    popMatrix();
  }
}

