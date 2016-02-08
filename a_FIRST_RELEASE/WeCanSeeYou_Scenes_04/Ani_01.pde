/*
 * Author : MW
 * Version : 0.1
 * Implementation of Mitchell's Best Candidate Algorithm
 * which creates a random distribution sample that attempts
 * to be uniform. Not the best algo compared with Poissondisc
 * sampling.
 */



class Ani_01 extends Animation{
  
  /////////////////////////// GLOBALS ////////////////////////////
  PImage saved; 
  RandomSample mySample;

  ///////////////////// 

  void setup() {
      noStroke();
     this.saved = new PImage();
    /** Creates a new Sample
     * @param maximum number of samples
     * @param disc size
     */
    mySample = new RandomSample(7500);
     
    // INFORMATION ON CLASS : QUI & QUOI
    author = "MW_2016";
    name = "Best Candidate";
  }
  
    //////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
  void setImage(PImage img) {
    this.saved = img;
  }

  ///////////////////// 

  void draw() {
    background(255);
    saved.resize(width, height);
    mySample.emitSample();
    mySample.render(saved);
  }

  ////////////////////////////////////////// CLASS (within a class ;–) )
  /**
   * Mitchell's Best Candidate Algorithm
   * Adaptation of a sketch originally written by
   * Nicholas Felton (He calls it a Poissondisc but it isn't)
   * He based his example on Mike Bostock's great explanation
   * http://bost.ocks.org/mike/algorithms/
   *
   */


  class RandomSample {

    int maxPoints; // number of total points to draw
    int numCandidates = 400; // number of candidate points to try
    ArrayList <PVector> points;
    PVector origin = new PVector();
    float discSize;


    RandomSample(int _maxPoints) { 
      this.maxPoints = _maxPoints;
      //this.discSize = _discSize;
      points = new ArrayList();
      origin = new PVector(width/2, height/2);
      points.add(origin);
    }

    void render(PImage _img) {
      //fill(0, 0, 255);
      noStroke();
      for (PVector p : points) {

        color pix = _img.get(int(p.x), int(p.y));
        discSize = 2+brightness(pix)/10;
        //discSize = 40;
        fill(pix);
        ellipse(p.x, p.y, discSize, discSize);
      }
    }

    void emitSample() {
      if (points.size() <= maxPoints) {
        addPoints();
      }
      if (points.size() == maxPoints) {
        println("Sample finished");
      }
    }

    void addPoints() {
      float bestDistance = 0;
      PVector bestCandidate = new PVector(0, 0);
      for (int i=0; i<numCandidates; i++) {
        float closestDistance = width*height;
        float randomX = random(0, width);
        float randomY = random(0, height);
        PVector candidate = new PVector(randomX, randomY);
        // Draw candidates ?
        //fill(100);
        //noStroke();
        //ellipse(candidate.x, candidate.y, discSize/2, discSize/2);
        for (PVector p : points) {
          if (PVector.dist(candidate, p) < closestDistance) {
            closestDistance = PVector.dist(candidate, p);
          }
        }

        if (closestDistance > bestDistance) {
          bestDistance = closestDistance;
          bestCandidate.set(candidate.x, candidate.y);
        }
      }
      points.add(bestCandidate);
    }
  }
}

