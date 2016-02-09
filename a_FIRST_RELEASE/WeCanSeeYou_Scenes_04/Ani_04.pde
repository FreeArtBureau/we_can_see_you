/*
 * Author : valentine chevalley
 * Version : 0.1
 *
 */

class Ani_04 extends Animation {

  /////////////////////////// GLOBALS ////////////////////////////

  PImage saved; 
  int pas;

  /////////////////////////// SETUP ////////////////////////////

  void setup() {
    this.saved = new PImage();  
    saved.filter(GRAY);
    noStroke();
    pas =  10;

    author = "valentine chevalley";
    name = "grid";
  }

  void setImage(PImage img) {
    this.saved = img;
    saved.resize(width-600, height-180);
  }

  /////////////////////////// DRAW ////////////////////////////
  void draw() {

    background(0);  
    pushMatrix();
    translate(width/2-saved.width/2, height/2-saved.height/1.8);
    for ( int x = 0; x < saved.width; x+=pas) {
      for ( int y = 0; y < saved.height; y+=pas) {
        color c = saved.get(x, y);
        float Minimum = sin(frameCount*0.007)*1;
        float Maximum = sin(frameCount*0.02)*30;

        //  float Minimum = sin(frameCount*0.015)*2;
        //  float Maximum = sin(frameCount*0.035)*12;
        float taille = map(brightness(c), 0, saved.width, Minimum, Maximum);
        // float taille = map(brightness(c), 0, saved.width, 1/2, 20);
        fill(255);
        pushMatrix();
        translate(x, y);
        ellipse(0, 0, taille, taille);
        popMatrix();
      }
    }
    popMatrix();
  }
}

