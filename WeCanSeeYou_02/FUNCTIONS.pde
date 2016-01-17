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
//boolean TEXT_INTRO = false;
boolean FACE_DETECTED = false;
boolean DRAW_ANIME = false;

PImage[] SAM_SNAPS;
int NUM_MAX_IMGS = 500;
PImage SNAPS;
String LAST_TAKEN;

int INDEX;
boolean SNAP, CAMREADY;

////////////////////////////////// GLOBALS FINISHED

/*
 * Initialises image array, camera & face detection   
 *
 */
void initCamera() {
  imageMode(CENTER);
  rectMode(CENTER);
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
      resetAll();
    }
  }
}

void resetAll() {
  background(0); // clear screen
  DRAW_ANIME = false;
  CLOCK.reset();
  MENUS = new Text();
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
}
