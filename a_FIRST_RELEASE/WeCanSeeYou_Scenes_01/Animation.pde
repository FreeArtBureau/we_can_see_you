/*
 * Main aniamtion class manager
 *
 *
 */


class Animation {

  PImage currentImage;
  String author = "Anonymous";
  String name = "Unknown";

  void setup() {
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
    pushStyle(); 
    textFont(infoFont, 14);
    float tx = 60;
    float ty = height - 150;
    String info = "étudiant : "+author + "\n";
    info += "titre : "+name + "\n";

    textSize(14);
    textAlign(LEFT);
    rectMode(CORNER);

    pushMatrix();
    translate(tx, ty);
    noStroke();
    fill(0);
    rect(-5, -15, 210, 20);
    rect(-5, 10, 273, 20);
    fill(255); 
    text(info, 0, 0);
    popMatrix();
    popStyle();
  }

  /*
   * Display sketch settings
   *
   */
  void showSettings() {
    pushStyle(); 
    textFont(infoFont, 12);
    textSize(12);
    textAlign(LEFT);
    rectMode(CORNER);

    float tx = 60;
    float ty = 20;
    String out = "";
    out += "--------------------------\n";
    out += "fps: " + nf(frameRate, 0, 1) + "\n";
    out += "current animation: " + author + "\n";
    
    pushMatrix();
    translate(tx, ty);
    fill(0);
    rect(-5, 12, 73, 18);
    rect(-5, 34, 210, 18);
    fill(255);
    text(out, 0, 0);
    popMatrix();
    popStyle();
  }
}

