/**
 * 
 * PLEASE READ INFO TAB
 * WE CAN SEE YOU !
 *
 * NOTES : 
 *         
 *  
 * 
 */

/////////////////////////// GLOBALS ////////////////////////////
Timer CLOCK; // Create a timer
Text MENUS;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640, 480, OPENGL);
  background(0);
  smooth();
  initCamera(); // Function to set up camera & detection
  
  // Init timer with a maximum
  CLOCK = new Timer(5000); // 5 seconds or 5000 milliseconds

  // Init text
  MENUS = new Text();
}

/////////////////////////// SETUP ////////////////////////////
void draw() {
  background(0);
  // Start face detection 
  faceDetection();

  // If face detected...
  if (FACE_DETECTED) {
    // ... DO SOMETHING (text menus)
    if (CLOCK.sequence(0, 2000)) {
      // Display first text in center with font size 73
      MENUS.displayGreeting(width/2, height/2, 73);
    }

    if (CLOCK.sequence(2000, 3000)) {
      // Display next text
      MENUS.displayText(width/2, height/2, 33, "PLEASE WAIT....");
    }
  }


  // Once face saved we begin something else...
  if (DRAW_ANIME) {

    //... THEN DO SOMETHING ELSE
  }


  updateFaceDetectImage();
}

