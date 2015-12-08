
int alarmHOUR;
int alarmMIN;

int alarmH1;
int alarmH2;
int alarmM1;
int alarmM2;
String ALARMH;
String ALARMM;
boolean alarmSet = false;
//boolean alarmReadyToSET = false;
boolean alarmIsRINGING = false;


void alarmGoingOFF() {
  if (alarmIsRINGING = true) {
    back = loadImage("data/rain.jpg");
    background(back);
    alarmSOUND.play();
  }
}

void checkAlarm() { 
  background(back);
  alarmIsRINGING = false;
  if ((alarmSet = true)) {
    if ((alarmHOUR == hour) && (alarmMIN == min)) {
      alarmIsRINGING = true;
    } else {
      alarmIsRINGING = false;
    }
    if (alarmIsRINGING = true) {
      alarmGoingOFF();
    }
  }
}

void getTIME() {
  String ALARMH1 = ("" + alarmH1);
  String ALARMH2 = ("" + alarmH2);
  ALARMH = (ALARMH1 + ALARMH2);
  String ALARMM1 = ("" + alarmM1);
  String ALARMM2 = ("" + alarmM2);
  ALARMM = (ALARMM1 + ALARMM2);
  alarmHOUR = Integer.parseInt(ALARMH);
  alarmMIN = Integer.parseInt(ALARMM);
    //if ((alarmHOUR != -1) && (alarmMIN != -1)) {
  // alarmSet = true;
//}
}

