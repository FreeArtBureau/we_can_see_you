

class Ani_10 extends Animation {

  /////////////////////////// GLOBALS ////////////////////////////

  PImage saved; 
  int pas;

  /////////////////////////// SETUP ////////////////////////////

  void setup() {
    this.saved = new PImage();  
    saved.filter(GRAY);
    noStroke();
    pas =  5;
  }

  void setImage(PImage img) {
    this.saved = img;
  }

  /////////////////////////// DRAW ////////////////////////////
  void draw() {
      saved.resize(width-400, height-100);
    // background(0);  
   pushMatrix();
  translate(200, 50);
    for ( int x = 0; x < saved.width; x+=pas) {
      for ( int y = 0; y < saved.height; y+=pas) {
        color c = saved.get(x, y);
      float Minimum = sin(frameCount*0.01)*4;
        float Maximum = sin(frameCount*0.03)*20;
         
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

