/////////////////////////// FUNCTIONS ////////////////////////////

// !!!!!! RIEN À FAIRE ICI ;–) !!!!!!!!
/*
 * Global variables for sketch   
 *
 */

// CAMERA & DETECTION
import gab.opencv.*;
import java.awt.*;
import processing.video.*;

Capture CAM;
OpenCV FACE_DETECT;
Rectangle[] FACES; 

boolean SHOW_DETECT = false;
boolean TEXT_INTRO = false;
boolean FACE_DETECTED = false;
boolean DRAW_ANIME = false;

PImage[] SAM_SNAPS;
PImage[] FACE_MENU;
int FACE_MENU_INDEX;
int NUM_MAX_IMGS = 700;
PImage SNAPS;
String LAST_TAKEN;

int INDEX; // index for saved images
boolean SNAP, CAMREADY;
boolean DRAW_INFO = true;
PFont infoFont;
int ANI_INDEX;
int SEQUENCE;
int[] RAND_SEQ;
int CURRENT_SEQ_INDEX;

boolean IDLE_MENUS = true;
////////////////////////////////// GLOBALS FINISHED

/*
 * Initialises image array, camera & face detection   
 *
 */
void initCamera() {
  imageMode(CENTER);
  rectMode(CENTER);
  infoFont = createFont("FiraSans-LightItalic", 12); // NOTE : NOT THE BEST PLACE FOR THIS.

  SAM_SNAPS = new PImage[NUM_MAX_IMGS]; // saving a max of 500 images
  FACE_MENU = new PImage[NUM_MAX_IMGS];
  FACE_MENU_INDEX = 0;

  CAM = new Capture(this, 640/2, 480/2);

  // ADD FaceDetect
  FACE_DETECT = new OpenCV(this, 640/2, 480/2);
  FACE_DETECT.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  CAM.start();
}
///////////////////////////////////////////////////////// END INIT

/*
 * Makes a copy of the screen image   
 * and saves it in a relative folder
 */
void saveFace() {
  // Set path to save image to HD
  // Note the folder path must correspond to a folder on YOUR computer !
  String image_path = ("/Users/markwebster/Dropbox/Apps/SAM_SNAPS");
  LAST_TAKEN = (image_path + INDEX + ".jpg"); 


  // Make a copy of face from camera image and save in our PImage SAM_SNAPS( Grab just image around face ;—) )
  SAM_SNAPS[INDEX] = new PImage( FACES[0].width, FACES[0].height);
  SAM_SNAPS[INDEX].copy(CAM, FACES[0].x, FACES[0].y, FACES[0].width, FACES[0].height, 0, 0, FACES[0].width, FACES[0].height);

  // Add this to our SNAPS PImage (This is the current image
  SNAPS = new PImage(FACES[0].width, FACES[0].height);
  SNAPS = SAM_SNAPS[INDEX];
  //SNAPS.resize(width, height);
  SNAPS.save(LAST_TAKEN); // save SNAPS image to folder

  INDEX++;
  SNAP = true;
  if (SNAP) println("PHOTO TAKEN ;–)");
  println("SAM_SNAPS["+INDEX+"]");

  // ADDED 19.02.2016 /////////////////////////////////////////
  // This saves faces for presenting to screen
  FACE_MENU[FACE_MENU_INDEX] = SNAPS;
  for (int i=0; i<FACE_MENU.length; i++) {
    FACE_MENU[i] = loadImage(image_path + (INDEX-1)+".jpg");
  }
  if (FACE_MENU_INDEX<FACE_MENU.length) {
    FACE_MENU_INDEX++;
    println("FACE MENU IMAGE = "+FACE_MENU_INDEX);
  }
  ///////////////////////////////////////// MAY NOT IMPLEMENT THIS - NEEDS TESTING
  
}

/*
 * Loads last saved image from HD   
 *
 */
void loadSnapShot() {
  String image_path = ("/Users/markwebster/Dropbox/Apps/SAM_SNAPS"); // DropBox
  if (SAM_SNAPS.length>0) {
    SNAPS = loadImage(image_path + (INDEX-1)+".jpg");
  }

  //SNAPS.resize(width, height);
  //SNAPS.resize(width/2, height-100);
  CURRENT_ANIME.setImage(SNAPS); ///////////////// IMPORTANT !!
}


////////////////////////////////////////// FACE DETECTION STUFF
/*
 * Starts Face Detection as well as looking out for faces  
 *
 */
void faceDetection() {
  if (CAM.available() == true) {
    CAM.read();
    FACE_DETECT.loadImage(CAM);
  }
  // BEGIN FACE DETECTION AS LONG AS WE ARE NOT DRAWING ANYTHING ;–)
  if (!DRAW_ANIME) {
    FACES = FACE_DETECT.detect();
    // IF WE DETECT A FACE THEN ACTIVATE TEXT INTRO
    if (FACES.length >=1) {
      FACE_DETECTED = true;
      IDLE_MENUS = false;
    } else {
      FACE_DETECTED = false;
      IDLE_MENUS = true;
      reset();
    }
  }
}

void reset() {
  background(0); // clear screen
  DRAW_ANIME = false;
  CLOCK.reset();
}

void updateFaceDetectImage() {
  if (SHOW_DETECT) {
    image(CAM, CAM.width/2, CAM.height/2, CAM.width, CAM.height);

    noFill();
    stroke(0, 255, 0);
    strokeWeight(3);
    for (int i = 0; i < FACES.length; i++) {
      // println(FACES[i].x + "," + faces[i].y);
      // NOTE : imageMode(CENTER) - I've compensated for this in code.
      rect(FACES[i].x+FACES[i].width/2, FACES[i].y+FACES[i].height/2, FACES[i].width, FACES[i].height);
    }
  }
}

void keyPressed() {
  // SHOW FACE DETECT IMAGE
  if (key == 'f') {
    SHOW_DETECT = !SHOW_DETECT;
  }

  // SHOW INFO
  if (key == 'i') {
    DRAW_INFO = !DRAW_INFO;
  }

  if (keyCode == RIGHT) {
    if (ANI_INDEX <ANIMATIONS.size()) {
      ANI_INDEX++;
      println(ANI_INDEX);
      println(ANIMATIONS.indexOf(CURRENT_ANIME));
      CURRENT_ANIME = ANIMATIONS.get( (ANIMATIONS.indexOf(CURRENT_ANIME)+1) );
    }
  }

  if (keyCode == LEFT) {
    if (ANI_INDEX > 0) {
      ANI_INDEX--;
      println(ANI_INDEX);
      CURRENT_ANIME = ANIMATIONS.get( (ANIMATIONS.indexOf(CURRENT_ANIME)-1) );
    }
  }

  if (key == 's') {
    saveFrame(CURRENT_ANIME.author+"savedImage_###.png");
  }
}

//////////////////////////////////////////////////// IMPORTANT

void initNewAnimationSequence() {
  ANIMATIONS.clear();
  /////////////////////////////////////////////////  OUR ANIMATION SETUP > ADD new class animations here :–]
  ANIMATIONS.add( new Ani_01() );
  ANIMATIONS.add( new Ani_02() );
  ANIMATIONS.add( new Ani_03() );
  ANIMATIONS.add( new Ani_04() );
  ANIMATIONS.add( new Ani_05() );
  ANIMATIONS.add( new Ani_06() );
  ANIMATIONS.add( new Ani_07() );
  ANIMATIONS.add( new Ani_08() );
  ANIMATIONS.add( new Ani_09() );
  ANIMATIONS.add( new Ani_10() );
  ANIMATIONS.add( new Ani_11() );
  ANIMATIONS.add( new Ani_12() );
  ANIMATIONS.add( new Ani_13() );
  ANIMATIONS.add( new Ani_14() );
}

// GENERATES A NEW RANDOM SEQUENCE FOR ANIMATION PLAY. 
// EACH SEQUENCE IS UNIQUE & NEVER REPEATS AN ANIMATION ;–)
// SEE checkRandom() FUNCTION BELOW FOR IMPLEMENTING THIS.
void generateRandomSequence() {
  CURRENT_SEQ_INDEX = 0;
  int animationsMax = ANIMATIONS.size();
  SEQUENCE = animationsMax;
  //println("Total Animations = "+SEQUENCE); // DEBUG
  RAND_SEQ = new int[ SEQUENCE-1 ];

  int index = 0;      
  while (index<RAND_SEQ.length) {
    int num = (int)random(SEQUENCE);
    if (checkRandom(num)) {
      RAND_SEQ[index] = num;
      index++;
    }
  }
  println(" \n/////////////////////////////////////////////////////////////////");
  for (int i = 0; i < RAND_SEQ.length; ++i) {
    println("Random Animation Sequence ="+RAND_SEQ[i]);
  }
   println(" \n/////////////////////////////////////////////////////////////////");
}
////////////////////////////////////////////////////////////////////
void resetAll() {
  background(0); // clear screen
  //ANIMATIONS.clear();
  DRAW_ANIME = false;
  CLOCK.reset();
  MENUS = new Text();  


  // Choose an animation /////////////////////// NOTE TO SELF : May need to implement memory management here !
  //ANI_INDEX = (int)random(14);
  //ANI_INDEX = 13; // DEBUGGING

  ANI_INDEX = RAND_SEQ[ CURRENT_SEQ_INDEX ];


  CURRENT_ANIME = ANIMATIONS.get(ANI_INDEX);
  println("Current animation chosen : "+ANI_INDEX);

  //////////////////////////////////////END > NOTHING TO CHANGE HERE...
  for (Animation a : ANIMATIONS) {
    a.setup();
  }
  //println("The Animation Array Size is ="+ANIMATIONS.size()); // DEBUG

  // CHECK TO SEE IF CURRENT RANDOM SEQUENCE HAS FINISHED. IF YES, GENERATE ANOTHER NEW SEQUENCE
  if (CURRENT_SEQ_INDEX<RAND_SEQ.length-1) {
    CURRENT_SEQ_INDEX++;
  } else {
    generateRandomSequence();
  }
}

/**
 * Method for checking same int numbers
 * @param   num   the int number to check
 * @return        returns true or false
 */
boolean checkRandom(int num) {
  for (int i=0; i<RAND_SEQ.length; i++) {
    if (num == RAND_SEQ[i]) return false;
    if (num == 0) return false; // never choose zero (could be handy !)
  }
  return true;
}

