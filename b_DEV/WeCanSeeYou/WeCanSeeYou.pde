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


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640, 480, OPENGL);
  background(0);
  smooth();
  initCamera(); // Function to set up camera & detection
}

/////////////////////////// SETUP ////////////////////////////
void draw() {
  background(0);
  // Start face detection 
  faceDetection();

  // If face detected...
  if (FACE_DETECTED) {

    // ... DO SOMETHING (text menus)
  }


  // Once face saved we begin something else...
  if (DRAW_ANIME) {

    //... THEN DO SOMETHING ELSE
  }


  updateFaceDetectImage();
}

