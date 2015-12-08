class Sun {

  float sunSize = 70.0;
  float XPos = 0.0;
  float YPos = 0.0;

  color col1;
  color col2;

  Sun(float x, float y, color c) {
    XPos = x;
    YPos = y;
    col2 = color (c);
    col1 = color (255, 255, 255);
  }

  void draw() {
    pushMatrix();
    pushStyle();
    noFill();
    smooth();
    strokeWeight(2);
    for (int r = 0; r < sunSize; r++) {
      float n = map(r, 0, sunSize, 0, 1);
      color newc = lerpColor(col1, col2, n);
      stroke(newc);
      smooth();
      ellipse(XPos, YPos, r, r);
    }  
    popStyle();
    popMatrix();
  }

  void changeCol (color c2) {
    col2 = color (c2);
    this.draw();
  }
}

