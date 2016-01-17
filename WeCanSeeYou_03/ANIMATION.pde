/*
 * This is where we will put our animation/drawings/whatever...
 *
 *
 */

class Animation {
  PImage saved; // this will keep track of the saved image from camera ;–)
  float x, y;
  color c;


  Animation() {
    x = random(width);
    y = height/2;
    this.saved = new PImage();
  }

  void setImage(PImage img) {
    this.saved = img;
  }

  void anime01() {

    image(saved, random(width), y);
  }

  void anime02() {  
    pushMatrix();
    translate(x, y);
    rotate(sin(frameCount*0.01)*TWO_PI); 

    float imgSizeX = sin(frameCount*0.01)*(saved.width*2);
    float imgSizeY = sin(frameCount*0.01)*(saved.height*2);

    image(saved, 0, 0, imgSizeX, imgSizeY);
    popMatrix();
  }
}

