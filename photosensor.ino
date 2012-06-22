/*
  arduino to processing photosensor thing
 
 draws colour that changes based on a changing analog input
 
 circuit:
 * photoresistor on analog 0 to 5V
 * 4.7K resistor on analog 0 to ground
 
*/


int photoPin = A0;


void setup() {
  // initialize serial communications (for debugging only):
  Serial.begin(9600);
   pinMode(13, OUTPUT); 
}

void loop() {
  digitalWrite(13, HIGH);   // set the LED on
  // read the sensor:
  int photoVal = analogRead(photoPin);
  
  // map the val of photosensor to the range of the colours.
  // change the minimum and maximum input numbers below
  // depending on the range your sensor's giving:
  int val = map(photoVal, 250, 670, 0, 255);
  
  //print the value to the serial output
  Serial.println(val);

}






