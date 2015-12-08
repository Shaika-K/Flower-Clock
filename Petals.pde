class Petal {

  float petalWidth = 60.0;
  float petalHeight = 180.0;
  float XPos = 0.0;
  float YPos = 0.0;

  color col1; 
  color col2; 

  Petal(color c, color c2) {
    col1 = color (c);
    col2 = color (c2);
  }

  void draw(float x, float y) {
    pushMatrix();
    XPos = x;
    YPos = y;
    pushStyle();
    strokeWeight(1);
    stroke(col2);
    smooth();
    ellipseMode(CENTER);
    fill(col1);
    ellipse(XPos, YPos, petalHeight, petalWidth);
    popStyle();
    popMatrix();
  }

  void changeCol(color c1) {
    col1 = color (c1);
    col2 = color (122.0, 86.0, 155.0);
    this.draw(XPos, YPos);
  }
}

