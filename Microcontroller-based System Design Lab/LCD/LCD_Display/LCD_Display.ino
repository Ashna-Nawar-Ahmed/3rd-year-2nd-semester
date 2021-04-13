#include <LiquidCrystal.h>
LiquidCrystal LCD(13,12,11,10,9, 8);

void setup() {
  // set up the LCD's number of columns and rows:
  LCD.begin(16, 2);
  // Print a message to the LCD.
  LCD.print("hello, world!");
}

void loop() {
  // Turn off the display:
  LCD.noDisplay();
  delay(500);
  // Turn on the display:
  LCD.display();
  delay(500);
}
