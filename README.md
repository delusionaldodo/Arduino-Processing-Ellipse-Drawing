## 🎨 Arduino-Processing Ellipse Drawing
This project combines an Arduino and Processing to create red colord ellipse. A physical push button connected to the Arduino triggers randomly placed red ellipses to appear on the screen using Processing.

### Features
- Uses a physical push button to control visual output
- Lights up the Arduino's onboard LED when the button is pressed for feedback
- Sends "1" or "0" over serial to Processing
- Processing sketch listens to the serial data in real time
- On receiving "1", it draws random red circles on the canvas
- On receiving "0", it stops drawing

### How it works
The Arduino monitors a push button (wired with INPUT_PULLUP) and sends a signal to Processing.
Processing reads the serial data using the Serial library and reacts by drawing or stopping based on the signal.

### What You Need
- Arduino board (e.g., Uno)
- Processing
- Push button
- LED (optional)
- 220kΩ resistor
- Jumper wires + breadboard
- USB cable

![button_red_led](https://github.com/user-attachments/assets/0fa59dc8-91b2-430c-9abe-a9aad0b72250)


Note: Make sure the serial port number in Serial.list()[X] matches your Arduino's port



