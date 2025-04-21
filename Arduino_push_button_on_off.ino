/*
  Created 21 Apr 2025
  by Yase Dusu

  This program reads the state of a push button connected to pin 7 on the Arduino.
  When the button is pressed, the internal LED on pin 13 is turned on.
  When the button is not pressed, the LED is turned off.

  Additionally, the program sends a value over the serial port:
    - "1" when the button is pressed
    - "0" when the button is not pressed

  The serial data is sent at 9600 baud and can be used by a Processing sketch
  to trigger visual output, such as drawing random ellipses on the screen.
  Each message is followed by a newline character to ensure complete transmission.
*/

const int redLedPin = 13;
const int redButtonPin = 7;

void setup() {
  pinMode(redLedPin, OUTPUT);
  pinMode(redButtonPin, INPUT_PULLUP);
  Serial.begin(9600);                                   // start serial communication
}

void loop() {
  int redVal = digitalRead(redButtonPin);

  digitalWrite(redLedPin, redVal == LOW ? HIGH : LOW); // light led. digitalWrite(parameter, condition ? value_if_true : value_if_false);

  if (redVal == LOW) {                                 // Send 1 if button is pressed (LOW), 0 if not (HIGH)
    Serial.println(1);
  } else {
    Serial.println(0);
  }

  delay(50);                                          // Small delay to avoid flooding serial buffer


  /*
  if (redVal == HIGH) {
    digitalWrite(redLedPin, LOW);
  } else {
    digitalWrite(redLedPin, HIGH);
  }
  */
}
