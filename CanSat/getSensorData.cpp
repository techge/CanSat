#include "getSensorData.h"

// returns the temperature measured by the LM35 sensor
float getTempLM35(){
  return LM35step * analogRead(LM35Pin);
}

// returns the temperature measured by the BMP280
float getTempBMP(Adafruit_BMP280 bmp){
	return bmp.readTemperature();	
}

// returns the pressure measured by BMP280
float getPressure(Adafruit_BMP280 bmp){
	return bmp.readPressure();
}

// returns the altitude calculated by BMP280 pressure
float getAltitude(Adafruit_BMP280 bmp){
  return bmp.readAltitude(seaLevelhPa);
}

// returns the temperature measured by the MPU6050
float getTempMPU(){
	int TEMP_OUT;
	Wire.beginTransmission(MPU_6050_addr);
	Wire.write(TEMP_OUT);
	Wire.endTransmission();
	Wire.requestFrom(MPU_6050_addr,2);
	TEMP_OUT = Wire.read() << 8 | Wire.read();
	return (float)TEMP_OUT/340 + 36.53;
}

// returns the acceleration measured by MPU6050
struct threeaxis getAccel(){
  float x, y, z;
  Wire.beginTransmission(MPU_6050_addr);
  Wire.write(ACCEL_OUT);
  Wire.endTransmission(); 
  Wire.requestFrom((int)MPU_6050_addr, 6);
  x = Wire.read() << 8 | Wire.read();
  y = Wire.read() << 8 | Wire.read();
  z = Wire.read() << 8 | Wire.read();
  struct threeaxis result;
  result.x = x/4096;
  result.y = y/4096;
  result.z = z/4096;
  return result;
}

struct threeaxis getGyro(){
  struct threeaxis result;
  result.x = -1.0;
  result.y = -1.0;
  result.z = -1.0;
  return result;
}

// calculates the velocity (optional)
float getVelo(){
	return -1.0;
}

// send data to groundstation by XBee
void sendData(){
	return -1.0;
}

// receive a command from groundstation by XBee
void recvCmd(){
	return -1.0;
}

