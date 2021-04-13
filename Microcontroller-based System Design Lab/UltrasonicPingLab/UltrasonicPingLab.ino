/* Ping))) Sensor

   The circuit:
	* +V connection of the PING))) attached to +5V
	* GND connection of the PING))) attached to ground
	* SIG connection of the PING))) attached to digital pin 7

 */


const int pingPin = 8;

void setup() {
  
  Serial.begin(9600);
}

void loop() {
  
  long duration, distance;

  //send trigger
  pinMode(pingPin, OUTPUT);
  digitalWrite(pingPin, LOW);
  delayMicroseconds(2);
  digitalWrite(pingPin, HIGH);
  delayMicroseconds(5);
  digitalWrite(pingPin, LOW);

  //receive echo
  pinMode(pingPin, INPUT);
  duration = pulseIn(pingPin, HIGH);

  // convert the time into a distance
  distance= (duration*0.034)/2;
  
  Serial.print("cm");
  Serial.print(distance);
  
  Serial.println();
  delay(1000);
}

