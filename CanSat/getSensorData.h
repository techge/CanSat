#include <Wire.h>
#include <SPI.h>

// these need to get installed seperately (via Sketch -> Include Library)
#include <Adafruit_BMP280.h> // "Adafruit BMP280 Library"
#include <Adafruit_Sensor.h> // "Adafruit Unified Sensor"

// register declarations
const int MPU_6050_addr=0x68;
const byte PWR_MGMT_1 = 0x6B;
const byte WHO_AM_I = 0x75;
const byte TEMP_OUT = 0x41;
const byte ACCEL_OUT = 0x3B;
const byte GYRO_OUT=0X43;
const byte ACCEL_CONFIG = 0x1C;
const byte GYRO_CONFIG = 0x1B;

// global variables
//unsigned long timer;
const float LM35step = 0.4887686; // LM35 sensor ADC step in 0.1 mV
const int LM35Pin = A0; // Analog pin used for LM35 sensor
const float seaLevelhPa = 1010; // must be adapted to local forcast to be accurate!!!

// defining the digital pins used for the BMP
#define BMP_SCK 13
#define BMP_MISO 12
#define BMP_MOSI 11 
#define BMP_CS 10

struct threeaxis{
  float x;
  float y;
  float z;
};

// returns the temperature measured by the LM35 sensor
float getTempLM35();

// returns the temperature measured by the BMP280
float getTempBMP(Adafruit_BMP280 bmp);

// returns the temperature measured by the MPU6050
float getTempMPU();

// returns the pressure measured by BMP280
float getPressure(Adafruit_BMP280 bmp);

// returns the calculated altitude (BMP280)
float getAltitude(Adafruit_BMP280 bmp);

// returns the acceleration measured by MPU6050
struct threeaxis getAccel();

// returns the acceleration measured by MPU6050
struct threeaxis getGyro();

// calculates the velocity (optional)
float getVelo();

// send data to groundstation by XBee
void sendData();

// receive a command from groundstation by XBee
void recvCmd();

//float getBatatas();
