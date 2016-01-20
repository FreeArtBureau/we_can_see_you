/*
 * BASIC SEQUENTIAL TIMER
 * Implements a timer class for sequential operations
 *
 * MW_01_2016
 * links / refs ...
 *
 * end
 
 */

/////////////////////////// GLOBALS ////////////////////////////
Timer CLOCK; // Create a timer

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(400, 400);
  background(0);
  smooth();
  noStroke();
  // Init timer with a maximum
  CLOCK = new Timer(5000); // 5 seconds or 5000 milliseconds
}

/////////////////////////// DRAW ////////////////////////////
void draw() {

  if (CLOCK.finished()) {
    background(255);
  } else {
    background(0);
  }

  // 3000 = start time
  // 5000 = duration of sequence
  // time in milliseconds !
  if (CLOCK.sequence(3000, 5000)) {
    fill(0, 0, 255);
    noStroke();
    ellipse(width/2, height/2, 100, 100);
  }


  println("Timer in millis = "+CLOCK.elapsedMillis());
  println("Timer in seconds = "+CLOCK.elapsedSeconds());
}

/////////////////////////// FUNCTIONS ////////////////////////////

void mousePressed() {
  //myTimer.reset();
  CLOCK.reset( int(random(1000, 4000)) );  
  println("New timer: " + CLOCK.timeout + " ms");
}

