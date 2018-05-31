// Michael Lam
// March 13, 2018
// Set A, Exercise 5: Colourful circles drawn diagonally.

// Last updated May 26, 2018
// - Canvas size decreased to accomodate Assignment 2
// - Colours now match those of example image found in exercise instructions
//    - Circles now begin as red
//    - Changed saturation to be constant (255)

class Exercise_A5 {
  float a = 0; // Moves circles horizontally
  float c = 0; // Changes colour of circles
  float x = 0; // Draws circles horizontally
  float y = 0; // Draws circles vertically

  void draw() {
    background(0);
    stroke(0);
    strokeWeight(1);
    colorMode(HSB);
    c += 4;
    x += 1;
    y += 15;
    fill(c % 255, 255, 255);
    ellipse(a + x, 0 + y, 75, 75);
    if (y == 825) {
      c = 0; // Resets colours
      y = 0; // Resets y position of circles back to top
      a += 2; // Increases the x position of circles to the right
    }
    if (x == 625) {
      x = 0;
      y = 0;
    }
  }
}