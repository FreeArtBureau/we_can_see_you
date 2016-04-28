/**
 * PLEASE READ INFO TAB
 * WE CAN SEE YOU AKA SELFIE 
 *
 * NOTES : FIRST RELEASE
 * DONE ! - Implementing idle menu where all faces shall be shown - need some kind of transitional timer ;–)
 * Think about a GIF animated version too ;–) 
 * DONE ! - Add RandomSelection algo that implements a sequence to play all animations but never twice. 
 */

/////////////////////////// GLOBALS ////////////////////////////
PApplet applet;
ArrayList <Animation> ANIMATIONS = new ArrayList<Animation>();
Animation CURRENT_ANIME = null;

Timer CLOCK; // Create a timer
Text MENUS; // Some text for first interaction
Text IDLE_MENU_TEXT;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(displayWidth, displayHeight, OPENGL);
  background(0);
  smooth();
  applet = this;
  initCamera();
  // Init timer with a maximum time (First & second actions)
  CLOCK = new Timer(25000); // 35 seconds or 35000 milliseconds
  // Init text
  MENUS = new Text();
  IDLE_MENU_TEXT = new Text();

  // initialise animation sequences...
  initNewAnimationSequence();
  generateRandomSequence();
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
    /*fill(0, 0, 255, 200);
     float dia = sin(frameCount*0.03) * 400;
     ellipse((frameCount*3)%width, height/2, dia, dia);
     if (frameCount%10==0) {
     fill(255, 0, 0, 173);
     ellipse((frameCount*3)%width, height/2, dia/2, dia/2);
     }
     */
    fill(0, 0, 255);
    MENUS.displayText(width/2, height/2.3, 73, "FACES DETECTED TODAY \n"+ INDEX);

    // DISPLAY lAST FACE ?

    if (FACE_MENU_INDEX>0) {
      image(FACE_MENU[FACE_MENU_INDEX], width/2, height/1.5);
      fill(0, 0, 255, 73);
      rect(width/2, height/1.5, 100, 100);
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
      fill(255, 0, 255);
      MENUS.displayGreeting(width/2, height/2.3, 133);
    }

    if (CLOCK.sequence(2000, 3000)) {
      // Display next text
      fill(255, 0, 255);
      MENUS.displayText(width/2, height/2.3, 73, "NE BOUGEZ PAS....\n ET SOURIEZ ;–)");
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
    initNewAnimationSequence();
    resetAll();
  }
  updateFaceDetectImage();
}
////////////////////////////////////////////////////////// FIN

