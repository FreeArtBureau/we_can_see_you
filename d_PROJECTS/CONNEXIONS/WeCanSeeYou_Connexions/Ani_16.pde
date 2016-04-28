/*
 * Author : Louise Turner
 * version : 0.1
 */

class Ani_16 extends Animation {

  ////////////////////////////////////// GLOBALS

  float x, y;
  int imageScale;

  PImage saved;       // The source image
  int cellsize; // Dimensions of each cell in the grid
  int columns, rows;   // Number of columns and rows in our system
  float eyeX, eyeY, eyeZ;
  float ang;
  int d;  
  float angle;



  ////////////////////////////////////// CONSTRUCTOR (SETUP)

  void setup() {
    x = 0;
    y = 0;
    ang = 0;
    d = 2000; 
    cellsize = 4;
    this.saved = new PImage();

    // INFORMATION ON CLASS : QUI & QUOI
    author = "Louise Turner";
    name = "J'étends mon linge un samedi de tempête";
  }

  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    saved.resize(width/2, height/2);
  }

  ////////////////////////////////////// METHODS

  void draw() {

    background(0);

    columns = saved.width/cellsize;  
    rows = saved.height/cellsize;

    pushMatrix();
    translate(width/2-saved.width/2, height/2-saved.height/2);
    //translate(100, 100);
    rotateY(radians(angle));
    // Begin loop for columns
    for ( int i = 0; i < columns; i++) {
      // Begin loop for rows
      for ( int j = 0; j < rows; j++) {
        int x = i*cellsize + cellsize/2;  // x position
        int y = j*cellsize + cellsize/2;  // y position

        int loc = x + y*saved.width;  // Pixel array location
        //color c = saved.pixels[loc];  // Grab the color
        color c = saved.get(x,y);
        float z = (300 / float(width)) * brightness(saved.pixels[loc]) - 20.0;
        float zNoiseAngle = sin(frameCount*0.0070);
        float zNoise = noise(x*zNoiseAngle/100, y*zNoiseAngle/30, zNoiseAngle) * 500;

        pushMatrix();
        translate(x, y, z + zNoise);
        fill(c, 204);
        noStroke();
        rectMode(CENTER);
        rect(0, 0, cellsize, cellsize);
        popMatrix();
      }
    }
    angle+=0.5;
    popMatrix();
  }
}

