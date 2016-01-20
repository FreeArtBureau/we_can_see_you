/*
 * Main aniamtion class manager
 *
 *
 */


class Animation {

  PImage currentImage;
  String author = "Anonymous";
  String name = "Unknown";
  PFont infoFont;
  //boolean backgroundUsed;

  void setup() {
    infoFont = loadFont("FiraSans-LightItalic-12.vlw");
    textFont(infoFont, 12);
  }

  void setImage(PImage img) {
    this.currentImage = img;
  }

  void draw() {
  }
  void mousePressed() {
  }
  void keyPressed() {
  }


  /*
   * Display info for current animation
   *
   */
  void showInfo() {
    float tx = 20;
    float ty = height - 90;
    String info = author + "\n";
    info += name + "\n";   
    textSize(12);
    pushMatrix();
    translate(tx, ty);
    fill(0);
    rect(0, 0, 50, 18);
    fill(255); 
    text(info, 0, 0);
    popMatrix();
  }

  /*
   * Display sketch settings
   *
   */
  void showSettings() {
    String out = "";
    textSize(12);
    textAlign(LEFT);
    fill(255, 100);
    out += "--------------------------\n";
    out += "fps: " + nf(frameRate, 0, 1) + "\n";
    out += "current animation: " + author + "\n";
    pushMatrix();
    translate(20, 20);
    text(out, 0, 0);
    popMatrix();
  }
}

