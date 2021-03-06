// Michael Lam, Vinay Meldrum
// May 1, 2018
// Set B, Exercise 9: Randomly creates 50 points and draws it to the nearest wall.

// Last updated May 28, 2018
// - Fixed a bug in which the lines appeared briefly before disappearing
//    - Created a new boolean (programEnd) which randomizes each point once
// - Exercise 9 now redraws when exiting and re-entering

class Exercise_B9 {
  // Declaring variables
  boolean programEnd = false;
  float[] xLines, yLines;
  int top_bottom;

  // Creates random point and draws a line to nearest wall
  void draw() {
    stroke(0);
    if (programEnd == false) {
      xLines = new float[49];
      yLines = new float[49];
      // Randomly creates a point
      for (int i = 0; i < xLines.length; i++) {
        xLines[i] += random(600);
        yLines[i] += random(600);
      }
      programEnd = true;
    } else {
      background(255);
      // Decides where closest wall is to point and draws a line accordingly
      for (int i = 0; i < xLines.length; i++) {
        top_bottom = (int)random(1, 2);
        if (yLines[i] < 300) {
          line(xLines[i], 0, xLines[i], yLines[i]);
        } else if (yLines[i] > 300) {
          line(xLines[i], 600, xLines[i], yLines[i]);
        } else if (yLines[i] == 300) {
          if (top_bottom == 1) {
            line(xLines[i], 0, xLines[i], yLines[i]);
          } else if (top_bottom == 2) {
            line(xLines[i], 600, xLines[i], yLines[i]);
          }
        }
      }
    }
  }
  void resetLines() {
    xLines = new float[0];
    yLines = new float[0];
    programEnd = false;
  }
}