
#include <LiquidCrystal_I2C.h>
#include <DS1302.h>
#include <Wire.h> 

// Set the LCD address to 0x27 for a 16 chars and 2 line display
LiquidCrystal_I2C lcd(0x27, 16, 2);
//Setup rtc to pin number 2,3 and 4 
DS1302 rtc(2, 3, 4);
void setup()
{
  lcd.begin();                //Activate LCD

  rtc.halt(false);           // Activate RTC module
  rtc.writeProtect(false);

  Serial.begin(9600);       //start serial communication @9600 bps
  }

void loop(){
  Serial.print("Time"); // wysyła napis time
  Serial.print(",");            //znak stopu 
  Serial.print(rtc.getTimeStr());   //wysyła godzine 
  Serial.print("."); // znak stopu 
  
 char val = Serial.read();
    if(val == 'r'){       //if r receive
        lcd.clear();
        lcd.backlight();
        lcd.print("Hello, world!");
      }
    if(val == 'b'){       //if b received
      lcd.clear();
      lcd.backlight();
      lcd.print("Hi!");
      }
      if(val == 'c'){       //if c received
      lcd.clear();
      lcd.backlight();
      lcd.print(rtc.getTimeStr());
      }
}
