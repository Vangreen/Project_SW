# Project_SW

Jest to projekt napisany w Arduino IDE (backend) oraz GUI w Processing.
Program pozwala na wyświetlanie na wiświetlaczu i2c defaultowo 
zaprogramowanych napisów/czasu, oraz pozwala odczywać i wyświetlić w 
programie czas z RTC.  

## Biblioteki wykorzystane w projekcie
W projekcie wykorzystałem dwie zewnętrzne biblioteki:

*LiquidCrystal_I2C.h* - Byłą ona niezbędna do wyświetlania treści na wyświetlaczu LCD

*DS1302.h* - Była ona niezbędna do zczytywania czasu z RTC.

## Przesyłanie danych z arduino do PC 
Przesyłąnie danych z arduino do pc umożliwiła mi komenda:
```
Serial.print();
```
Wyorzystałem ją do przesłania czasu z RTC
```
  Serial.print("Time");               // wysyła napis time
  Serial.print(",");                 // znak stopu 
  Serial.print(rtc.getTimeStr());   // wysyła godzine 
  Serial.print(".");               // znak stopu 
  ```
 i wyświetlenie go w GUI:
   ```
   data = port.readStringUntil('.');
   data = data.substring(0, data.length() - 1);
 
  index = data.indexOf(",");
  // fetch the Time char
  time_char = data.substring(0, index);
  // fetch the time from rtc
  time = data.substring(index+1, data.length());
  ```
  
 ## Przesyłąnie danych z PC do arduino
 Zostało wykonane poprzez wbudowane komendy w biblioteki wymienione wyżej 
 ```
 lcd.print("Hello, world!");
 ```
 ## Wygląd aplikacji
![img](https://i.imgur.com/OkWLblH.png)
