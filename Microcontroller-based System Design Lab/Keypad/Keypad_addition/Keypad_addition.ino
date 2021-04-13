#include <Keypad.h>

const byte ROWS = 4; // Four rows
const byte COLS = 4; // Three columns
// Define the Keymap
char keys[ROWS][COLS] = {
  {'1', '2', '3', '/'},
  {'4', '5', '6', '*'},
  {'7', '8', '9', '-'},
  {'C', '0', '=', '+'}
};
// Connect keypad ROW0, ROW1, ROW2 and ROW3 to these Arduino pins.
byte rowPins[ROWS] = { 4, 5, 6, 7 };
// Connect keypad COL0, COL1 and COL2 to these Arduino pins.
byte colPins[COLS] = { 8, 9, 10, 11};

// Create the Keypad
Keypad kpd = Keypad( makeKeymap(keys), rowPins, colPins, ROWS, COLS );

boolean presentValue = false;
boolean final = false;
String num1;
String num2;
int answer;
char op;

void setup()
{
  Serial.begin(9600);
}

void loop() {
  char key = kpd.getKey();

  if (key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9' || key == '0')
  {
    if (presentValue == false)
    {
      num1 = num1 + key;
      Serial.print(key);
    }
    else
    {
      num2 = num2 + key;
      Serial.print(key);
      final = true;
    }
  }

  else if (presentValue == false  && (key =='+'))
  {

      presentValue = true;
      op = key;
      Serial.print(op);
  
  }

  else if (final == true && key == '=') {
    
    answer = num1.toInt() + num2.toInt();
    
    Serial.println();
    Serial.println(answer);
    presentValue = false;
    final = false;
    num1 = "";
    num2 = "";
    answer = 0;
    op = ' ';
  }
  else if (key == 'C') {
    //Serial.clear();
    presentValue = false;
    final = false;
    num1 = "";
    num2 = "";
    answer = 0;
    op = ' ';
  }
}

