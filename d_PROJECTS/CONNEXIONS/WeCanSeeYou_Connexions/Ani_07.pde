
class Ani_07 extends Animation {


/*
----------------------------------------
PLEASE READ INFO TAB FOR ALL INFORMATION
----------------------------------------
*/

/////////////////////////// GLOBALS ////////////////////////////
PImage saved;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  imageMode(CENTER);
  
//  background(0);
  this.saved = new PImage(); //remplace ligne de code 'loadimage'
  smooth();
  noStroke();
  
 // INFORMATION ON CLASS : QUI & QUOI
  author = "Alix Bonte";
  name = "LIGHT";
}


////////////////////////////////////////////// IMPORTANT TO ADD TO ALL CLASSES
void setImage(PImage img) {
    this.saved = img;
    saved.resize(height/2,height/2);
  }
/////////////////////////// DRAW ////////////////////////////
void draw() {
  
  image(saved,width/2,height/2);
  filter(POSTERIZE,9);
  filter(DILATE);

   
}


}  
