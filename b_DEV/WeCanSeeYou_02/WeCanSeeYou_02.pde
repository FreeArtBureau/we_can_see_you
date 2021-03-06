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
Text MENUS; // Some text for first interaction

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(720, 480, OPENGL);
  background(0);
  smooth();
  initCamera(); 
  
  // Init timer with a maximum time (First & second actions)
  CLOCK = new Timer(9000); // 9 seconds or 9000 milliseconds

  // Init text
  MENUS = new Text();
  resetAll();
}

/////////////////////////// SETUP ////////////////////////////
void draw() {
  if(!DRAW_ANIME) {
  background(0);
  }
  // Start face detection 
  faceDetection();

  ///////////////////////////////////////////////////////////// FIRST [INTER]ACTION

  // If face detected...
  if (FACE_DETECTED) {

    // ... DO SOMETHING (text menus)
    if (CLOCK.sequence(0, 2000)) {
      // Display first text in center with font size 73
      MENUS.displayGreeting(width/2, height/2, 103);
    }

    if (CLOCK.sequence(2000, 3000)) {
      // Display next text
      MENUS.displayText(width/2, height/2, 33, "PLEASE WAIT....");
    }

    // Get camera ready to take picture ;–)
    if (CLOCK.sequence(5000, 50)) {
      CAMREADY = true;
    }
    // Take snap (picture) 
    if (CAMREADY) {
      saveFace(); // function call for taking a snap & saving the image to HD
      loadSnapShot();
      CAMREADY = false;
    }
  }

  ///////////////////////////////////////////////////////////// SECOND [INTER]ACTION
  // Once face saved we begin something else...

  // First set a time to begin second action...
  if (CLOCK.reached(6000)) {
    DRAW_ANIME = true;
  }

  // HERE's WHERE WE DO SOMETHING ELSE ;–)
  if (DRAW_ANIME) {

    //... THEN DO SOMETHING ELSE       
    image(SNAPS, random(width), height/2);
  }


  /////////////////////////////////////////////////////// AFTER TIMER HAS FINISHED  
  if (CLOCK.finished()) {
    resetAll();
  }
  
  updateFaceDetectImage();
}

////////////////////////////////////////////////////////// FIN
