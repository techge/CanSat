
#include <Wire.h>
#include <SPI.h>
#include "getSensorData.h"

//Adafruit_BMP280 bmp; // I2C
//Adafruit_BMP280 bmp(BMP_CS); // hardware SPI
Adafruit_BMP280 bmp(BMP_CS, BMP_MOSI, BMP_MISO,  BMP_SCK);

void setup() {

  Serial.begin(9600);

  // ensure BMP is connected
  if (!bmp.begin()) {  
    Serial.println(F("Could not find a valid BMP280 sensor, check wiring!"));
    //while (1);
  }
  
     /*Serial.print("tempLM35");
     Serial.print(";");
     Serial.print("tempBMP280");
     Serial.print("\t");
     Serial.print("altit");
     Serial.print("\t");
     Serial.print("tempBMP280");
     Serial.print("\t");
     Serial.print("press");
     Serial.print("\t");
     Serial.print("altit");
     Serial.print("\t");
     Serial.print("tempMPU6050");
     Serial.print("\t");
     Serial.print("\accel.X");
     accel.Y \t accel.Z \t gyr.X \t gyr.Y \t gyr.Z");*/

  
  // initialize MPU
  Wire.begin();
  Wire.beginTransmission(MPU_6050_addr);
  Wire.write(PWR_MGMT_1);
  Wire.write(0);
  Wire.endTransmission();
  Wire.beginTransmission(MPU_6050_addr);
  Wire.write(ACCEL_CONFIG);
  Wire.write(0x10);                           //full scale range of accelerometer +-8g
  Wire.write(GYRO_CONFIG);
  Wire.write(0x08);                          //full scale range of gyroscope ± 500 °/s
  Wire.endTransmission();
  Serial.begin(9600);
  
}

void loop() {
  
  // put your main code here, to run repeatedly:
  Serial.print(millis());Serial.print(";");
  Serial.print(getTempLM35());Serial.print(";");
  Serial.print(getTempBMP(bmp));Serial.print(";");
  Serial.print(getPressure(bmp));Serial.print(";");
  Serial.print(getAltitude(bmp));Serial.print(";");
  Serial.print(getTempMPU());Serial.print(";");
  struct threeaxis acc;
  acc = getAccel();
  Serial.print(acc.x);Serial.print(";");Serial.print(acc.y);Serial.print(";");Serial.print(acc.z);Serial.print(";");
  struct threeaxis gyr;
  gyr = getGyro();
  Serial.print(gyr.x);Serial.print(";");Serial.print(gyr.y);Serial.print(";");Serial.print(gyr.z);Serial.println(";");
  delay(1000);

}
