/*
 * SEQUENCED INTERACTION
 * Sequential operations based on a timer
 *
 * MW_01_2016
 * links / refs ...
 *
 * end
 
 */

/////////////////////////// GLOBALS ////////////////////////////
Timer CLOCK; // Create a timer
Text MENU;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 460);
  background(0);
  smooth();
  noStroke();

  // Init timer with a maximum
  CLOCK = new Timer(5000); // 5 seconds or 5000 milliseconds

  // Init text
  MENU = new Text();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);

  if (CLOCK.sequence(3000, 2000)) {
    // Display first text in center with font size 73
    MENU.displayGreeting(width/2, height/2.3, 133);
  }

  if (CLOCK.sequence(5000, 3000)) {
    MENU.displayText(width/2, height/2, 33, "PLEASE WAIT....");
  }


  println("Timer in millis = "+CLOCK.elapsedMillis());
  println("Timer in seconds = "+CLOCK.elapsedSeconds());
}

/////////////////////////// FUNCTIONS ////////////////////////////

