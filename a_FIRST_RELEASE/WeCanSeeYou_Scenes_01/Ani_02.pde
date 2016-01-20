
import punktiert.math.Vec;
import punktiert.physics.*;
// install : http://www.lab-eds.org/punktiert


class Ani_02 extends Animation {

  VPhysics physics;
  PImage saved; // this will keep track of the saved image from camera ;–)



  void setup() {

    this.saved = new PImage();
    physics = new VPhysics(width, height);
    int amount = 1000;

    for (int i = 0; i < amount; i++) {
      Vec pos = new Vec(random(10, width), random(10, height));
      float rad = random(0.3, 3);
      VBoid p = new VBoid(pos);
      p.swarm.setSeperationScale(rad*3.7);
      p.setRadius(rad);
      physics.addParticle(p);
    }
    noStroke();

    // INFORMATION ON CLASS : QUI & QUOI
    author = "punktiert";
    name = "boids";
  }

  //////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
  }

  /////////////////////////// DRAW ////////////////////////////
  public void draw() {
    
    // RESIZE IMAGE BEFORE DRAWING OVER IT
    //saved.resize(width/2, height-100);
    translate(width/4, 20);
    
    physics.update();
    for (VParticle p : physics.particles) {
      color pix = saved.get(int(p.x), int(p.y));
      //color pix = color(0, 0, 255, 173);
      float discSize = (brightness(pix)/255)*(sin(frameCount*0.0035)*7.3);
      //float discSize = sin(frameCount*0.0035)*7.3;
      fill(pix);

      ellipse(p.x, p.y, p.getRadius()+discSize, p.getRadius()+discSize);
    }
  }
}

