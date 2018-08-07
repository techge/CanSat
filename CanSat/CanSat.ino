#include <Wire.h>
#include <SPI.h>
#include "getSensorData.h"

//const byte PWR_MGT_1 = 0x6B;
//const byte ACCEL_CONFIG = 0x1C;

Adafruit_BMP280 bmp(BMP_CS, BMP_MOSI, BMP_MISO,  BMP_SCK);

void setup() {
  
  // ensure BMP is connected
  /*if (!bmp.begin()) {  
    Serial.println(F("Could not find a valid BMP280 sensor, check wiring!"));
    //while (1);u
  }*/

  // initialize MPU
  Wire.begin();
  Wire.beginTransmission(MPU_6050_addr);
  Wire.write(0x6B);
  Wire.write(0);
  Wire.endTransmission();
  Wire.beginTransmission(MPU_6050_addr);
  Wire.write(0x1C);
  Wire.write(0x10);
  Wire.endTransmission();

  Serial.begin(9600);
  
}

void loop() {
  // put your main code here, to run repeatedly:

  Serial.print(millis()); Serial.print(";");
  Serial.print("The temperature (BMP280) is "); Serial.println(getTempBMP(bmp));
  Serial.print("The pressure (BMP280) is "); Serial.println(getPressure(bmp));
  Serial.print("The altitude (BMP280) is "); Serial.println(getAltitude(bmp));
  Serial.print("The temperature (MPU6050) is "); Serial.println(getTempMPU());
  struct threeaxis acc;
  acc = getAccel();
  Serial.print("X: ");Serial.print(acc.x);Serial.print("; Y: ");Serial.print(acc.y);Serial.print("; Z: ");Serial.println(acc.z);
  Serial.println("------");
  
  delay(1000);

}
