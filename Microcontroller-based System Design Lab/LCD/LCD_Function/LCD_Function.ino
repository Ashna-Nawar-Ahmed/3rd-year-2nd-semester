#include <LiquidCrystal.h>
LiquidCrystal lcd(13,12,11,10,9, 8);
void setup() { 
 lcd.begin(16,2); // set up the LCD's number of columns and rows: } 
}
void loop() { 
 lcd.print("AUST"); // Prints "Arduino" on the LCD 
 delay(1000); // 3 seconds delay 
 lcd.setCursor(2,1); // Sets the location at which subsequent text written to the LCD will be displayed 
 lcd.print("CSE"); 
 delay(1000); 
 lcd.clear(); // Clears the display 
 lcd.blink(); //Displays the blinking LCD cursor 
 delay(1000); 
 lcd.setCursor(7,1); 
 delay(1000); 
 lcd.noBlink(); // Turns off the blinking LCD cursor 
 lcd.cursor(); // Displays an underscore (line) at the position to which the next character will be written 
 delay(1000); 
 lcd.noCursor(); // Hides the LCD cursor 
 lcd.clear(); // Clears the LCD screen 
}
