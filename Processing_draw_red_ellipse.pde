/*
 created 21 Apr 2025
 by Yase Dusu
 
 This program reads data sent from the arduino serial port at 9600 baud
 and draws random ellipses all over the screen.
 It expects values "1" or "0", followed by a newline, or newline and carriage return.
 */

import processing.serial.*;                               // library for serial communication
Serial myPort;                                            // object for the serial port

float x, y;                                               // starting position for ellipse
float size;                                               // ellipse size
boolean isPressed = false;                                // boolean for button state to control drawing


void setup() {
  size(800, 600);                                         // sketch frame size

  printArray(Serial.list());                              // list all available serial ports
  myPort = new Serial(this, Serial.list()[2], 9600);      // look for something like this --> [2] "/dev/cu.usbmodemF..."

  myPort.bufferUntil('\n');                               // don't generate serialEvent() unless newline character

  background(0);                                          // black background
  noStroke();                                             // no stroke for circle
}


void draw() {

  if (isPressed) {                                        // if isPressed = True
    size = random(10, 30);                                // generate a random number between 10 to 30 for ellipse's size

    x = random(width);                                    // start creation x, y random position anywhere within the frame
    y = random(height);

    fill(220, 50, 50, 100);                               // warm red color with semi transparency transparency. fill (red, green, blue, alpha)
    ellipse(x, y, size, size);                            // ellipse(x_position, y_position, width, height)
  }
}


void serialEvent (Serial myPort) {                        // This function is automatically triggered only when a complete line ending in \n is received from Arduino
  String inString = myPort.readStringUntil('\n');         // This reads an entire line from the serial input (e.g., "523\n")

  if (inString != null) {
    inString = trim(inString);                            // trim off any whitespace. It would trim from both front and back

    if (inString.equals("1")) {
      isPressed = true;                                   //Start drawing, button pressed
    } else if (inString.equals("0")) {
      isPressed = false;                                  //Stop drawing, button released}
    }
  }
}
