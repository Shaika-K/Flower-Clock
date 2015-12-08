class SecondSeed {

  void draw() {

    float stroke = 2;
    float angle = map(seconds, 0, 59, 0, 349);    
    translate(350, 400);
    int count = 0;
    if ((min == 5)||(min == 10)||(min == 15)||(min == 20)||(min == 25)||(min == 30)||(min == 35)||(min == 40)||(min == 45)||(min == 50)||(min == 55)||(min == 0)) {
      count = 0;
      stroke = 2;
    } else if ((min == 6)||(min == 11)||(min == 16)||(min == 21)||(min == 26)||(min == 31)||(min == 36)||(min == 41)||(min == 46)||(min == 51)||(min == 56)||(min == 1)) {
      count = 1;
      stroke = 1.8;
    } else if ((min == 7)||(min == 12)||(min == 17)||(min == 22)||(min == 27)||(min == 32)||(min == 37)||(min == 42)||(min == 47)||(min == 52)||(min == 57)||(min == 2)) {
      count = 2;
      stroke = 1.6;
    } else if ((min == 8)||(min == 13)||(min == 18)||(min == 23)||(min == 28)||(min == 33)||(min == 38)||(min == 43)||(min == 48)||(min == 53)||(min == 58)||(min == 3)) {
      count = 3;
      stroke = 1.4;
    } else if ((min == 9)||(min == 14)||(min == 19)||(min == 24)||(min == 29)||(min == 34)||(min == 39)||(min == 44)||(min == 49)||(min == 54)||(min == 59)||(min == 4)) {
      count = 4;
      stroke = 1.2;
    }  

    pushMatrix();
    rotate(radians(-90));
    rotate(radians(angle));
    pushStyle();
    strokeWeight(stroke);
    stroke(255, 255, 255);
    noFill();
    ellipse(10 + (20*count), 0, 2+count, 2+count); 
    popStyle();
    popMatrix();
  }
}

