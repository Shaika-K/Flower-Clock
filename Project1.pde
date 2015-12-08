//-----------------------
// DO NOT TOUCH THIS
//-----------------------

import java.util.Date;
import java.text.SimpleDateFormat;
import ddf.minim.*;

int initialH, initialM, initialS;
boolean displayDoc = false;
boolean alarmMode = false;

Minim minim;
AudioPlayer alarmSOUND;


void initialize() {
  //current hour
  initialH = hour();
  //current minute
  initialM = minute();
  //current second
  initialS = second();
}

void setup() {
  size(700, 800);
  minim = new Minim(this);
  alarmSOUND = minim.loadFile("rain.mp3");
  //input = minim.getLineIn();
  smooth();
  initialize();
  drawClock();
}

void draw() {
  pushStyle();
  pushMatrix();
  runClock();
  popMatrix();
  popStyle();

  if (displayDoc) {  
    pushMatrix();  
    pushStyle();
    showDoc();
    popMatrix();
    popStyle();
  }
}


void keyPressed() {
  if (key == 'h'||key == 'H') {
    displayDoc = !displayDoc;
  }

  if (!displayDoc) { //Dont go into alarm mode if the documentation is being displayed
    if (key == 'a'||key == 'A') {
      alarmMode = !alarmMode;
      runKeyPressed();
    } else {
    }
  }
  if (alarmMode = false) {
    println("alarm false");
    alarmSet = false;
    alarmReadyToSET = false;
    alarmIsRINGING = false;
  }
  runKeyPressed();
}

