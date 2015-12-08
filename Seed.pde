class Seed {

  float seedSize = 0.0;
  float XPos = 0.0;
  float YPos = 0.0;

  color col1;
  color col2;

  Seed(float size, color c1, color c2) {
    seedSize = size;
    col1 = color (c1);
    col2 = color (c2);
  }

  void draw(float x, float y) {
    pushMatrix();
    XPos = x;
    YPos = y;
    //gradient vvvv
    noFill();
    strokeWeight(1);
    for (int r = 0; r < seedSize; r++) {
      pushStyle();
      float n = map(r, 0, seedSize, 0, 1);
      color newc = lerpColor(col1, col2, n);
      stroke(newc);
      smooth();
      ellipseMode(CENTER);
      ellipse(XPos, YPos, r, r);
      popStyle();
    }  
    popMatrix();
  }

  void changeCol(color c1, color c2) {
    col1 = color (c1);
    col2 = color (c2);
    draw(XPos, YPos);
  }
}

