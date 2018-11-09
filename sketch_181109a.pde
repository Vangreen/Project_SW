import controlP5.*; //import ControlP5 library
import processing.serial.*;
Serial port;

ControlP5 cp5; //create ControlP5 object
PFont font;
String temp_c = "";
String temp_f = "";
String data = "";
int index = 0;

void setup(){ //same as arduino program

  size(300, 450);    //window size, (width, height)
  
  printArray(Serial.list());   //prints all available serial ports
  
  port = new Serial(this, "COM3", 9600);  //i have connected arduino to com3, it would be different in linux and mac os
    port.bufferUntil('.');
  //lets add buton to empty window
  
  cp5 = new ControlP5(this);
  font = createFont("calibri light bold", 20);    // custom fonts for buttons and title
  
  cp5.addButton("hello")     //"red" is the name of button
    .setPosition(100, 50)  //x and y coordinates of upper left corner of button
    .setSize(120, 70)      //(width, height)
    .setFont(font)
  ;   

  cp5.addButton("hi")     //"yellow" is the name of button
    .setPosition(100, 150)  //x and y coordinates of upper left corner of button
    .setSize(120, 70)      //(width, height)
    .setFont(font)
  ;

  cp5.addButton("clk")     //"yellow" is the name of button
    .setPosition(100, 250)  //x and y coordinates of upper left corner of button
    .setSize(120, 70)      //(width, height)
    .setFont(font)
  ;
  
}

void draw(){  //same as loop in arduino

  background(150, 150 , 150); // background color of window (r, g, b) or (0 to 255)
  
  //lets give title to our window

  textFont(font);
  text("Text Control", 110, 30);  // ("text", x coordinate, y coordinat)
    
  text(temp_c, 110, 350);  // ("text", x coordinate, y coordinat);
  text(temp_f, 110, 380);  // ("text", x coordinate, y coordinat);
}

//lets add some functions to our buttons
//so whe you press any button, it sends perticular char over serial port

void hello(){
  port.write('r');
}

void hi(){
  port.write('b');
}

void clk(){
  port.write('c');
}
void serialEvent (Serial port)
{
  data = port.readStringUntil('.');
  data = data.substring(0, data.length() - 1);
  
  // look for the comma between Celcius and Farenheit
  index = data.indexOf(",");
  // fetch the C Temp
  temp_c = data.substring(0, index);
  // fetch the F Temp
  temp_f = data.substring(index+1, data.length());
}
