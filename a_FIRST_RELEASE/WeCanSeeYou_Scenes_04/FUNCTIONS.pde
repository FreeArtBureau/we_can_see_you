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
int NUM_MAX_IMGS = 500;
PImage SNAPS;
String LAST_TAKEN;

int INDEX;
boolean SNAP, CAMREADY;
boolean DRAW_INFO = true;
PFont infoFont;
int ANI_INDEX = 0;
////////////////////////////////// GLOBALS FINISHED

/*
 * Initialises image array, camera & face detection   
 *
 */
void initCamera() {
  imageMode(CENTER);
  rectMode(CENTER);
  infoFont = createFont("FiraSans-LightItalic",12); // NOTE : NOT THE BEST PLACE FOR THIS.
  
  SAM_SNAPS = new PImage[NUM_MAX_IMGS]; // saving a max of 500 images
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
  CURRENT_ANIME.setImage(SNAPS); // IMPORTANT !!
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
    } else {
      FACE_DETECTED = false;
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
}

//////////////////////////////////////////////////// IMPORTANT
void resetAll() {
  background(0); // clear screen
  ANIMATIONS.clear();
  DRAW_ANIME = false;
  CLOCK.reset();
  MENUS = new Text();
  // Choose an animation /////////////////////// NOTE TO SELF : May need to implement memory management here !
  ANI_INDEX = (int)random(5);
  
  /////////////////////////////////////////////////  OUR ANIMATION SETUP > ADD new class animations here :–]
  ANIMATIONS.add( new Ani_01() );
  ANIMATIONS.add( new Ani_02() );
  ANIMATIONS.add( new Ani_03() );
  ANIMATIONS.add( new Ani_04() );
  ANIMATIONS.add( new Ani_05() );
  
  
  //////////////////////////////////////END > NOTHING TO CHANGE HERE...
  for (Animation a : ANIMATIONS) {
    a.setup();
  }

  //ANI_INDEX = 4;
  CURRENT_ANIME = ANIMATIONS.get(ANI_INDEX);
  println(ANI_INDEX);
}

