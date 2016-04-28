class Ani_14  extends Animation {

  PImage saved;
  float x, y;
  float pas;

  void setup () {

    this.saved = new PImage();
    background (255);
    smooth();
    pas = 4;

    // INFORMATION ON CLASS : QUI & QUOI
    author = "My-Lan Thuong";
    name = "matrix";
  }
  //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    saved.resize(width, height);
    saved.filter (THRESHOLD, 0.47);
  }

  void draw() {
    pushMatrix();
    translate(width/2-saved.width/2, height/2-saved.height/2);
    background (255);
    for (int x=0; x<saved.width; x+=pas) {
      for (int y=0; y<saved.height; y+=pas) {
        color c = saved.get (x, y);
        fill (c);
        noStroke();
        textSize(5+pas);
        text ((char)random(48, 50), x+pas, y+pas);
      }
    } 
    //filter (THRESHOLD, 0.85);
    pas +=0.04;
    popMatrix();
  }

}

