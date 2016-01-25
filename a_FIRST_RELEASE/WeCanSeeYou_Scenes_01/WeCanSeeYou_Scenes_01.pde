/**
 * PLEASE READ INFO TAB
 * WE CAN SEE YOU !
 *
 * NOTES : FIRST RELEASE
 * Need to correct image ratio / resize & pixelArray readings of saved image. 
 * Need to add PGraphics for textual info
 *         
 */

/////////////////////////// GLOBALS ////////////////////////////
PApplet applet;
ArrayList <Animation> ANIMATIONS = new ArrayList<Animation>();
Animation CURRENT_ANIME = null;

Timer CLOCK; // Create a timer
Text MENUS; // Some text for first interaction

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(displayWidth, displayHeight, OPENGL);
  background(0);
  smooth();
  applet = this;
  initCamera();
  // Init timer with a maximum time (First & second actions)
  CLOCK = new Timer(30000); // 30 seconds or 30000 milliseconds
  // Init text
  MENUS = new Text();
  resetAll();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  // Only use a background if not drawing to screen
  if (!DRAW_ANIME) {
    background(0);
  }
  faceDetection(); // Start face detection 

    ////////////////////////////////////// FIRST [INTER]ACTION

  // If face detected...
  if (FACE_DETECTED) {
    TEXT_INTRO = true;
  }

  // Start text introduction
  if (TEXT_INTRO) {
    // ... DO SOMETHING  = display text menus
    if (CLOCK.sequence(0, 2000)) {
      // Display first text in center with font size 73
      MENUS.displayGreeting(width/2, height/2.3, 103);
    }

    if (CLOCK.sequence(2000, 3000)) {
      // Display next text
      MENUS.displayText(width/2, height/2.3, 33, "PLEASE STAY THERE....");
      CAMREADY = true; // Get camera ready to take picture ;–)
    }
    
  // Take snap (picture) 
    if (CAMREADY) {
      // Wait till 5 seconds before taking picture
      if (CLOCK.sequence(5000, 100)) {
      saveFace(); // function call for taking a snap & saving the image to HD
      loadSnapShot(); // function call for calling last saved image 
      CAMREADY = false;
      TEXT_INTRO = false;
      }
    }
  }

  ///////////////////////////////////////////// SECOND [INTER]ACTION
  // Once face saved we begin something else...

  // First set a time to begin second action...
  if (CLOCK.reached(6000)) {
    DRAW_ANIME = true;
  }

  // HERE's WHERE WE DO SOMETHING ELSE ;–)
  if ((DRAW_ANIME)&&( CURRENT_ANIME !=null)) { 
    
    //... THEN DO SOMETHING ELSE ///////////////////////////////// THIS IS WHERE WE UPDATE OUR ANIMATIONS
    CURRENT_ANIME.draw();



    
    if (DRAW_INFO) {
        //CURRENT_ANIME.showInfo();
        //CURRENT_ANIME.displ();
        //image(pg,0,0);
        CURRENT_ANIME.showSettings();
    }
    
    
  }

  //////////////////////////////////////// AFTER TIMER HAS FINISHED  
  if (CLOCK.finished()) {
    resetAll();
  }
  updateFaceDetectImage();
}
////////////////////////////////////////////////////////// FIN
