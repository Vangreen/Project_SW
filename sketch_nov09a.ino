
#include <LiquidCrystal_I2C.h>
#include <DS1302.h>
#include <Wire.h> 

// Set the LCD address to 0x27 for a 16 chars and 2 line display
LiquidCrystal_I2C lcd(0x27, 16, 2);
DS1302 rtc(2, 3, 4);
void setup()
{

  // Activate RTC module
rtc.halt(false);
  rtc.writeProtect(false);

  Serial.begin(9600);    //start serial communication @9600 bps
  }
  // initialize the LCD

  // Turn on the blacklight and print a message.
  
  
  
byte  a = 11;

void loop(){
          Serial.print("Time"); // wysyła napis time
  Serial.print(",");            //znak stopu 
    Serial.print(rtc.getTimeStr());   //wysyła godzine 
  Serial.print("."); // znak stopu 
  // int bytesSent = Serial.write(rtc.getTimeStr());
 char val = Serial.read();

    if(val == 'r'){       //if r receive
        lcd.begin();
      lcd.backlight();
  lcd.print("Hello, world!");
      }
    if(val == 'b'){       //if b received
        lcd.begin();
      lcd.backlight();
  lcd.print("Hi!");
      }
      if(val == 'c'){       //if c received
                lcd.begin();
      lcd.backlight();
    lcd.print(rtc.getTimeStr());

    
      }

}
