
import punktiert.math.Vec;
import punktiert.physics.*;
// install : http://www.lab-eds.org/punktiert


class Ani_10 extends Animation {

  VPhysics physics;
  PImage saved; // this will keep track of the saved image from camera ;–)



  void setup() {
    this.saved = new PImage();
    physics = new VPhysics(width, height);
    int amount = 1000;

    for (int i = 0; i < amount; i++) {
      
      Vec pos = new Vec(width/2, random(height));
      float rad = random(0.1, 1);
      VBoid p = new VBoid(pos);
      p.swarm.setSeperationScale(rad*9.7);
      p.setRadius(rad);
      physics.addParticle(p);
    }
    noStroke();

    // INFORMATION ON CLASS : QUI & QUOI
    author = "Florine_Caro";
    name = "Lines";
  }

  //////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
    saved.resize(width, height);
  }

  /////////////////////////// DRAW ////////////////////////////
  public void draw() {
    
    pushMatrix();
    //translate(200, 200);
    
    physics.update();
    for (VParticle p : physics.particles) {
      color pix = saved.get(int(p.x), int(p.y));
      //color pix = color(0, 0, 255, 173);
      float discSize = (brightness(pix)/255)*(sin(frameCount*0.0035)*7.3);
      //float discSize = sin(frameCount*0.0035)*7.3;
      fill(pix);

      ellipse(p.x, p.y, p.getRadius()+discSize, p.getRadius()+discSize);
    }
    popMatrix();
  }
}

