/**
 * PLEASE READ INFO TAB
 * WE CAN SEE YOU AKA SELFIE MIRROR
 *
 * NOTES : FIRST RELEASE
 * Implementing idle menu where all faces shall be shown - need some kind of transitional timer ;–)
 * Think about a GIF animated version too ;–)
 * Add RandomSelection algo 
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
  CLOCK = new Timer(45000); // 45 seconds or 45000 milliseconds
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

    //////////////////////////////////////////// IDLE MENUS

  if (IDLE_MENUS) {

    // THIS IS WHERE WE COULD ADD A GENERAL VISUAL MENU WHEN NO ONE IS AROUND (no faces) 
    // - SOMETHING TO ATTRACT THE PEOPLE ;-] 
    fill(0, 0, 255, 200);
    float dia = sin(frameCount*0.03) * 400;
    ellipse((frameCount*3)%width, height/2, dia, dia);
    if (frameCount%10==0) {
      fill(255, 0, 0, 173);
      ellipse((frameCount*3)%width, height/2, dia/2, dia/2);
    }
  }


  ////////////////////////////////////// FIRST [INTER]ACTION

  // If face detected...
  if (FACE_DETECTED) {
    TEXT_INTRO = true;
  }

  // Start text introduction
  if ((TEXT_INTRO)&&(!IDLE_MENUS)) {
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


    // DISPLAY INFO FOR CURRENT ANIMATION
    if (DRAW_INFO) {
      CURRENT_ANIME.showInfo();
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

