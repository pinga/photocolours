//my first try to have communication between arduino and processing
//
//photosensor values control colour and position of a rectangle
// 
//processing sketch

// importing the processing serial class
import processing.serial.*;

// variables for serial connection, portname and baudrate have to be set 
Serial port;
String portname = "/dev/ttyUSB0";  
int baudrate = 9600;


int value = 0;
int oldvalue = 0;


//setup of canvas 

void setup() {
  size(200, 200);
  noStroke();
  frameRate(25);

  // establish serial port connection      
  port = new Serial(this, portname, baudrate);
  println(port);
}

void serialEvent(int serial) { 
  if (value != oldvalue) {
    color cl = color(value, value, 100);
    rect(13, value, 30, 100);   
    fill(cl);
    int value = oldvalue;
  }
  else {
    color clo = color(102, oldvalue, 100);
    rect(13, oldvalue, 30, 100);   
    fill(clo);
  }
}

void draw() {
  background(244);
  // listen to serial port and draw rectangle 

  while (port.available () > 0) {
    value = port.read();
    serialEvent(value);
  }
}

