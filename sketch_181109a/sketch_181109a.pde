import controlP5.*; //import ControlP5 library
import processing.serial.*;
Serial port;

ControlP5 cp5; //create ControlP5 object
PFont font;
String time_char = "";
String time = "";
String data = "";
int index = 0;
PImage img;
PImage img2;

void setup(){ //same as arduino program

  size(1400, 800);    //window size, (width, height)
  
  printArray(Serial.list());   //prints all available serial ports
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("wat.jpg");  // Load the image into the program  
  img2= loadImage("gh_2.png");
  port = new Serial(this, "COM3", 9600);  //i have connected arduino to com3, it would be different in linux and mac os
    port.bufferUntil('.');
  //lets add buton to empty window
  
  cp5 = new ControlP5(this);
  font = createFont("calibri light bold", 20);    // custom fonts for buttons and title
  
  cp5.addButton("hello")     //"red" is the name of button
    .setPosition(600, 250)  //x and y coordinates of upper left corner of button
    .setSize(120, 70)      //(width, height)
    .setFont(font)
  ;   

  cp5.addButton("hi")     //"yellow" is the name of button
    .setPosition(600, 350)  //x and y coordinates of upper left corner of button
    .setSize(120, 70)      //(width, height)
    .setFont(font)
  ;

  cp5.addButton("clk")     //"yellow" is the name of button
    .setPosition(600, 450)  //x and y coordinates of upper left corner of button
    .setSize(120, 70)      //(width, height)
    .setFont(font)
  ;
  
}

void draw(){  //same as loop in arduino
  background(255, 255 , 255); // background color of window (r, g, b) or (0 to 255)
  // Displays the image at its actual size at point (0,0)
  image(img, 20, 20);
  image(img2, 20,760);
  //lets give title to our window

  textFont(font);
  //text("Text Control", 650, 200);  // ("text", x coordinate, y coordinat)
  text("Projekt zaliczający", 900, 100);
  text("Na zajęcia z Systemów Wbudowanych", 900, 130);
  text("Wykonał:", 1150, 750);
  text("Paweł Wangryn | E6C1S1", 1150, 780);
  text("Dokumentacja oraz Source Code:", 20, 750);
  text("|  https://github.com/Vangreen/Project_SW", 68, 780);
  text(time_char, 630, 550);  // ("text", x coordinate, y coordinat);
  text(time, 630, 580);  // ("text", x coordinate, y coordinat);
  fill(0,0,0);
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
  // fetch the Time char
  time_char = data.substring(0, index);
  // fetch the time from rtc
  time = data.substring(index+1, data.length());
}
