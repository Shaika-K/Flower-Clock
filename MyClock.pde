color gridC = color(0, 0, 0);

boolean NIGHT = false;

boolean alarmReadyToSET = false;

PImage back;
PImage back2;
PImage doc;

//T.I.M.E   ---   CONSTANTS
int seconds; 
int min;
int hour;

//Sun/moon colours
color sunCol = color(255.0, 246.0, 180.0);
color moonCol = color(234.0, 236.0, 255.0);

//Petals Colours
color DayPetalCol = color(255.0, 223.0, 59.0); 
color DayPetalOUTLINE = color(191.0, 150.0, 2.0); 
color NightPetalCol = color(234.0, 255.0, 247.0); 

//Seed colours
color DaySeedCol  = color(67.0, 29.0, 7.0); 
color DaySeedCol2  = color(173.0, 85.0, 12.0);
color NightSeedCol = color(161.0, 109.0, 203.0); 
color NightSeedCol2 = color(135.0, 242.0, 241.0);

//seconds
SecondSeed sec;

//Seed BASE colours
float r = 67.0; 
float g = 34.0;
float b = 0.0;

//SUN
Sun sun;

Seed[] minute1 = new Seed[60];
Seed[] minute2 = new Seed[60];
Seed[] minute3 = new Seed[60];
Seed[] minute4 = new Seed[60];
Seed[] minute5 = new Seed[60];

Petal[] minutes60 = new Petal[12];

float centreX = 350;
float centreY = 400;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void drawClock() {

  back = loadImage("data/skygrass.jpg");

  //back2 = loadImage("data/nightsky.jpg");

  doc = loadImage("data/documentation.jpg");

  //new secons seed object
  sec = new SecondSeed();

  //new sun object
  sun = new Sun(310, 0, sunCol);//centreX, centreY-0, sunCol);

  //ADD OBJECTS TO ARRAYS
  //new minutes------MAKE A 5 LAYER SEEDED CIRCLE!
  //5th minute seeds
  for (int i=0; i < minute5.length; i++) {         
    minute5[i] = new Seed(8, DaySeedCol, DaySeedCol2);
  }

  //4th minute seeds  
  for (int i=0; i < minute4.length; i++) {         
    minute4[i] = new Seed(5, DaySeedCol, DaySeedCol2);
  }

  //3rd minute seeds
  for (int i=0; i < minute3.length; i++) {         
    minute3[i] = new Seed(4, DaySeedCol, DaySeedCol2);
  }

  //2nd minute seeds
  for (int i=0; i < minute2.length; i++) {         
    minute2[i] = new Seed(3, DaySeedCol, DaySeedCol2);
  }

  //1st minute seeds
  for (int i=0; i < minute1.length; i++) {         
    minute1[i] = new Seed(2, DaySeedCol, DaySeedCol2);
  }

  //new petal objects
  //12 hour petals
  for (int i=0; i < minutes60.length; i++) {         
    minutes60[i] = new Petal(DayPetalCol, DayPetalOUTLINE);
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void runClock() {

  seconds = second(); 
  min = minute();
  hour = hour();

  // boolean alarmIsRINGING = false;
  //checkAlarm();
  // 

  if (hour >= 18 || hour <= 6) {
    NIGHT = true;
  }
  if (NIGHT) {
    changeDayNightCOL();
  }

  //DRAW
  background(back);

  //Draw Stalk
  pushMatrix();
  stroke(37, 64, 8);
  strokeWeight(2);
  line(centreX, centreY, centreX, height);
  for (int i = 0; i<=7; i++) {
    stroke(37+(i*5), 64+(i*5), 8+(i*5));
    line(centreX-i, centreY, centreX+i, height);
    line(centreX+i, centreY, centreX-i, height);
  }
  popMatrix();

  //PETALS falling every 5 min
  int petal = 0;
  if ((min >= 0) && (min < 5)) {
    petal = 0;
  } else if ((min >= 5) && (min < 10)) {
    petal = 1;
  } else if ((min >= 10) && (min < 15)) {
    petal = 2;
  } else if ((min >= 15) && (min < 20)) {
    petal = 3;
  } else if ((min >= 20) && (min < 25)) {
    petal = 4;
  } else if ((min >= 25) && (min < 30)) {
    petal = 5;
  } else if ((min >= 30) && (min < 35)) {
    petal = 6;
  } else if ((min >= 35) && (min < 40)) {
    petal = 7;
  } else if ((min >= 40) && (min < 45)) {
    petal = 8;
  } else if ((min >= 45) && (min < 50)) {
    petal = 9;
  } else if ((min >= 50) && (min < 55)) {
    petal = 10;
  } else if (min >= 55) {
    petal = 11;
  }

  for (int i=petal+1; i < ( (minutes60.length)); i++ ) {       
    pushMatrix();                                                       
    translate (centreX, centreY); 
    rotate(radians((30*i)-90));  
    smooth();    
    minutes60[i].draw(150.0, 0.0);                       
    popMatrix();
  }
  drawKernel();

  //ROTATION FOR SUN
  float angleHR = map(hour, 0, 12, 0, 359);
  pushMatrix();
  translate(centreX, centreY);
  rotate(radians(-90));
  rotate(radians(angleHR));
  ellipseMode(CENTER);
  sun.draw();
  popMatrix(); 
  //println(hour);

  if (alarmMode) {
    askForTIME();
  }
  if (alarmSet) {
    drawAlarmTIME();
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void drawAlarmTIME() {
  if (alarmSet = true) {
    textSize(20);
    fill(255, 255, 255);
    text("ALARM IS ON!", 10, 30);
    textSize(40);
    fill(255, 255, 255);
    text(ALARMH + " : " + ALARMM, 10, 80);
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void askForTIME() {
  //println("at ask for TIME");
  if (alarmMode) {
    stroke(2.0, 240.0, 12.0);
    strokeWeight(5);
    line (10, 85, 200, 85);
    alarmReadyToSET = true;
    //println("alarmReadyToSET");
      }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void drawSEC() {
  //ROTATION FOR SECONDS
  //println("seconds: " + seconds);
  pushMatrix();
  sec.draw();
  popMatrix();
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void showDoc() {
  image(doc, 0, 0);
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void drawKernel() {
  // 5 MINUTES - SEEDS
  //MINUTE LAYERS -BASE 
  pushMatrix();
  translate (centreX, centreY); 
  for (int i = 1; i<=5; i++) {
    ellipseMode(CENTER);
    noStroke();
    fill(r + (20 * i), g + (20 * i), b + (20 * i));
    ellipse(0, 0, 240 - (40 * i), 240 - (40 * i));
  }
  popMatrix();

  //5th MINUTE LAYERS -SEEDS 

  for (int i=0; i < minute5.length; i++) { 
    pushMatrix(); 
    translate(centreX, centreY);    
    rotate(radians((6*i)-90));   
    minute5[i].draw(90.0, 0.0);
    popMatrix();
  }     

  //4th MINUTE LAYERS -SEEDS  
  for (int i=0; i < minute4.length; i++) {         
    pushMatrix();   
    translate(centreX, centreY);      
    rotate(radians((6*i)-90));   
    minute4[i].draw(70.0, 0.0);
    popMatrix();
  }

  //3 MINUTE LAYERS -SEEDS
  for (int i=0; i < minute3.length; i++) {
    pushMatrix();      
    translate(centreX, centreY);      
    rotate(radians((6*i)-90));      
    minute3[i].draw(50.0, 0.0);
    popMatrix();
  }

  //2 MINUTE LAYERS -SEEDS
  for (int i=0; i < minute2.length; i++) { 
    pushMatrix();      
    translate(centreX, centreY);      
    rotate(radians((6*i)-90));     
    minute2[i].draw(30.0, 0.0);
    popMatrix();
  }

  //1 MINUTE LAYERS -SEEDS
  for (int i=0; i < minute1.length; i++) {  
    pushMatrix(); 
    translate(centreX, centreY);      
    rotate(radians((6*i)-90));   
    minute1[i].draw(10.0, 0.0);
    popMatrix();
  }

  //AM OR PM
  pushMatrix();
  if (hour<12 && hour>=0) {
    fill(0, 0, 0);
    textSize(9);
    text("AM", centreX-7, centreY+3);
  } else {
    fill(0, 0, 0);
    textSize(9);
    text("PM", centreX-6, centreY+4);
  }
  popMatrix();
  drawSEC();
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void changeDayNightCOL() {
  //Change background
  back = loadImage("data/nightsky.jpg");
  background(back);

  //Change SUN colour
  sun.changeCol(moonCol);

  //Change seeds BASE colour
  r = 62.0; 
  g = 66.0;
  b = 142.0;

  //Change seeds colour
  //5th MINUTE LAYERS -SEEDS
  for (int i=0; i < minute5.length; i++) {         
    minute5[i].changeCol(NightSeedCol, NightSeedCol2);
  }

  //4 MINUTE LAYERS -SEEDS  
  for (int i=0; i < minute4.length; i++) {         
    minute4[i].changeCol(NightSeedCol, NightSeedCol2);
  }

  //3 MINUTE LAYERS -SEEDS
  for (int i=0; i < minute3.length; i++) {         
    minute3[i].changeCol(NightSeedCol, NightSeedCol2);
  }

  //2 MINUTE LAYERS -SEEDS
  for (int i=0; i < minute2.length; i++) {         
    minute2[i].changeCol(NightSeedCol, NightSeedCol2);
  }

  //1 MINUTE LAYERS -SEEDS
  for (int i=0; i < minute1.length; i++) {         
    minute1[i].changeCol(NightSeedCol, NightSeedCol2);
  }

  //Change PETAL colour
  for (int i=0; i < minutes60.length; i++) {     
    minutes60[i].changeCol(NightPetalCol);
  }
}

void runKeyPressed() {
  if (alarmMode) {
        if (alarmReadyToSET = true) {
      //println("inside first if");
            if (key >= 0 && key <= 2) {          
        alarmH1 = key;
        //println("alarmH1 : " + alarmH1);
      }
      if (alarmH1!=-1) {
        if ((alarmH1<2) && (key >= 0 && key <= 9)) {
          alarmH2 = key;
        }
        if ((alarmH1==2)&& (key >= 0 && key <= 4)) {
          alarmH2 = key;
        }
      }
      if ((alarmH1!=-1)&& (alarmH2 != -1)) {
        if (key >= 0 && key <= 5) {          
          alarmH1 = key;
        }
        if (alarmM1!=-1) {
          if ((key >= 0 && key <= 9)) {
            alarmH2 = key;
          }
        }
      }
    }
    getTIME();
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void drawGrid() {
  for (int i=0; i < 10; i++) {
    float x = map(i, 0, 9, 0, width);
    stroke(gridC);
    strokeWeight(2);
    line(x, 0, x, height);
  }

  for (int j=0; j < 10; j++) {
    float y = map(j, 0, 9, 0, height);
    stroke(gridC);
    strokeWeight(2);
    line(0, y, width, y);
  }
}

