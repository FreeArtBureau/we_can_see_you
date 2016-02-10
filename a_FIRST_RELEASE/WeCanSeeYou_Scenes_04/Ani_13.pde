class Ani_13 extends Animation {


  /////////////////////////// GLOBALS ////////////////////////////

  PImage saved;
  int interX;
  int interY;

  /////////////////////////// SETUP ////////////////////////////

  void setup() {
    smooth();
    this.saved = new PImage();
    interX = 8;
    interY = 8;

    /////////////
    author = "sarah dauneau";
    name = "aniLines";
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES

  void setImage(PImage img) {
    this.saved = img;
    saved.resize(width, height);
  }

  /////////////////////////// DRAW ////////////////////////////

  void draw() {
    background(0);

    pushMatrix();
    translate(73, -90);

    // float mouseXVar = map(sin(frameCount*0.05), -1, 1, 0.05, 3);

    // float mouseXVar = map(sin(frameCount*0.05), -1, 1, 0.05, 3);

    for (int x=5; x<saved.width; x+=interX) {
      for (int y=5; y<saved.height-10; y+=interY) {
        float gridX = width / (float)saved.width;
        float gridY = height / (float)saved.height;
        float posX = gridX * x;
        float posY = gridY * y;


        // NOISE SHIT ADDED BY MW
        // Noise Shit : Smooth noise algo ;–)
        float noiseTurbo = map(cos(frameCount*0.015), -1, 1, 0.0001, 0.010);
        float noiseAmm = map(sin(frameCount*0.009), -1, 1, 100, 300);

        float ang = frameCount * 0.005; //if this number gets bigger the movement will be more nervous... play around!
        float rad = width/2;

        float nx = (x + cos(ang) * rad) * noiseTurbo;
        float ny = (y + sin(ang) * rad) * noiseTurbo;
        float mouseXVar = noise(nx, ny) * noiseAmm;

        ////////////////////////////////////////////////// END OF NOISE

        //Récupérer la couleur
        //color c = saved.pixels[y*saved.width + x];
        color c = saved.get(x, y);

        //Convertir à une valeur de niveau de gris
        int greyScale = round(red(c)*0.222 + green(c)*0.617 + blue(c)*0.071);

        // greyScale to line relief
        float w5 = map(greyScale, 0, 255, 9, 0.1);

        // get neighbour pixel, limit it to image width
        color c2 = saved.get(min(x+1, saved.width-1), y);
        //stroke(0,0,255);
        stroke(c);
        int greyScale2 = int(red(c2)*0.722 + green(c2)*0.707 + blue(c2)*0.071);

        //JOUER AVEC LA VALEUR 53
        float h5 = mouseXVar;

        float d1 = map(greyScale, 0, 255, h5, 0);
        float d2 = map(greyScale2, 0, 255, h5, 0);

        //JOUER AVEC + & - . RAJOUTER D'AUTRES VALEURS.

        //line(posX-d1, posY+d1, posX+gridX-d2, posY+d2);
        line(posX-d1, posY+d1, posX+gridX-d2, posY+d2);
      }
    }
    popMatrix();
  }
}

