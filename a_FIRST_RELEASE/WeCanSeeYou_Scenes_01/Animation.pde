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
  PGraphics pg;
  //boolean backgroundUsed;

  void setup() {
    pg = createGraphics(width, height,OPENGL);
   // pg.beginDraw();
    infoFont = loadFont("FiraSans-LightItalic-12.vlw");
    textFont(infoFont, 12);
   // pg.endDraw();
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
    pg.beginDraw();
    pg.background(0);
    float tx = 20;
    float ty = height - 90;
    String info = author + "\n";
    info += name + "\n";   
    pg.textSize(12);
    pg.pushMatrix();
    pg.translate(tx, ty);
    pg.fill(0);
    pg.rect(70,0,173,12);
    pg.rect(70,14,173,12);
    pg.fill(255); 
    pg.text(info, 0, 0);
    pg.popMatrix();
    pg.endDraw(); 
  }

  /*
   * Display sketch settings
   *
   */
  void showSettings() {
    String out = "";
    textSize(12);
    textAlign(LEFT);
    out += "--------------------------\n";
    out += "fps: " + nf(frameRate, 0, 1) + "\n";
    out += "current animation: " + author + "\n";
    pushMatrix();
    translate(20, 20);
    fill(0);
    rect(70,18,173,14);
   // rect(70,34,173,14);
    rect(70,46,233,14);
    fill(255);
    text(out, 0, 0);
    popMatrix();
  }
  
  void displ(){
       image(pg,0,0); 
  }
}

