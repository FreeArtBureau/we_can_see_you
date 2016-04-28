/*
 * Author : nicodeme
 * Version : 0.1
 *
 */

//NICODEME KAMIENSKI / YOUR FACE IN 3D FOR FREE

class Ani_02 extends Animation {


  /////////////////////////// GLOBALS ////////////////////////////

  PImage saved; 
  float pixelSize; 
  int taillecell; 
  int colonne, ligne;
  float ang;
  float ZN;


  /////////////////////////// SETUP ////////////////////////////

  void setup() {
    this.saved = new PImage();
    noStroke();
    taillecell = 10;
    ang = radians(0);

    author = "NICODÈME";
    name = "Your face in 3D FOR FREE";
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    saved.resize(width-500, height-240);
    //saved.filter(GRAY);
  }


  /////////////////////////// DRAW ////////////////////////////

  void draw() {
     background(255);
    colonne = saved.width / taillecell;  
    ligne = saved.height / taillecell; 
 
    pushMatrix();
    translate(saved.width/2.6, saved.height/6.6);
    
    for ( int i = 0; i < colonne; i++) {
      for ( int j = 0; j < ligne; j++) {
        // Calculate x & y positions
        int x = i*taillecell;
        int y = j*taillecell;
        //Calculate location in image
        int loc = x+y*saved.width;
        
        // Grab color at that location
        //color c = saved.pixels[loc];
        color c = saved.get(x,y);

        float fact = map(sin(frameCount*0.025), -1, 1, 50, 360);
        //pixelSize = sin(frameCount*0.015) *  brightness(c);
        pixelSize = (brightness(c)/255) * fact;
        pixelSize = map(pixelSize, 0, 255, 0.5, 24);

        // NOISE SHIT
        // Noise Shit : Look further into what is happening here. It's a smooth nois algo ;–)
        float noiseTurbo = map(cos(frameCount*0.015), -1, 1, 0.0001, 0.015);
        float noiseAmm = map(sin(frameCount*0.009), -1, 1, 1, 250);

        ang = frameCount * 0.005; //if this number gets bigger the movement will be more nervous... play around!
        float rad = width/2;

        float nx = (x + cos(ang) * rad) * noiseTurbo;
        float ny = (y + sin(ang) * rad) * noiseTurbo;
        ZN = noise(nx, ny) * noiseAmm;

        pushMatrix();
        translate(x, y, ZN); // Notez bien l'axe z (profondeur)
        fill(c);
        noStroke();
        ellipse(0, 0, pixelSize, pixelSize);
        popMatrix();
      }
    }
   
    popMatrix();
  }
}

