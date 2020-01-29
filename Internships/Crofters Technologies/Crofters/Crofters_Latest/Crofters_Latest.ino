#include <ESP8266WiFi.h>          //https://github.com/esp8266/Arduino
//needed for library
#include <DNSServer.h>
#include <ESP8266WebServer.h>
#include <WiFiManager.h>          //https://github.com/tzapu/WiFiManager
#include <ArduinoJson.h>
#include <DHT.h>

#define DHTPIN D6  

#define PUMPPIN D2  
#define SEEDLING D3 
#define GROWBED D4 

#define TRIGGER D5 
#define ECHO D0  

#define BLUEPIN D1  
#define REDPIN D7   

#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);

ESP8266WebServer server(80);
const char* host = "dev.crofters.in";
const char* hoststring = "Host: http://dev.crofters.in";

String user="siva";
String ssid;
String password;
String name;
boolean newSSID = false;

String deviceid = "test";
float humidity,temp_f,distance;  // Values read from sensor
float humiditythreshold=50,tempthreshold=30,distancethreshold=32.5;


int pumpsetting,currentpumpsetting=0,pumpstate=0;

int bluebrightness = 0;        // how bright the LED is (0 = full, 512 = dim, 1023 = off)
int redbrightness = 0;        // how bright the LED is (0 = full, 512 = dim, 1023 = off)

String webString="";     // String to display
// Generally, you should use "unsigned long" for variables that hold time
unsigned long dhtpreviousMillis = 0;        // will store last temp was read
unsigned long switchpreviousMillis = 0;
unsigned long dhtlatencypreviousMillis = 0;
unsigned long pumponpreviousMillis = 0;

unsigned long pumpoffpreviousMillis=0;

const long dhtinterval = 22000;   // interval at which to send DHT sensor values
const long dhtlatencyinterval = 2000;
const long switchinterval = 5000;   // interval at which to ping for switch data
long pumpinterval = 60000*7;   // default 7 mins
long pumpruntime = 60000*2;   // default 2 mins

//Initial configuration for nodemcu
void icroftsetup(void)
{
  
  Serial.println("0:Executing iCroftSetup......................................................................................................................................");
  
  char myIpString[24];
  WiFiClient client;
  IPAddress myIp = WiFi.localIP();
  sprintf(myIpString, "%d.%d.%d.%d", myIp[0], myIp[1], myIp[2], myIp[3]);

  String postdata = String("{\"deviceid\":\""+deviceid+"\",\"deviceip\":\"")+myIpString+"\"}";
  client.connect(host,80);
  delay(250);
  if(client.connected()){
    
      
   
        String url = "http://dev.crofters.in/api/updateIP?username=";
        url += user; 
        url += "&ip=";
        url += myIpString;

  // This will send the request to the server
  client.print(String("GET ") + url + " HTTP/1.1\r\n" +
               "Host: " + host + "\r\n" + 
               "Connection: close\r\n\r\n");

      String line = client.readStringUntil('\r');

   while(client.available()){
      char in = client.read();
//Serial.print(in);
    }
    
    
    while (client.connected() || client.available()) {
    client.stop();
    }

    
  }else{
    Serial.println("Not connected");
  }
 
    
  
  // prepare all switches 
  pinMode(REDPIN, OUTPUT);
  pinMode(BLUEPIN, OUTPUT);
  pinMode(SEEDLING, OUTPUT);
  pinMode(PUMPPIN, OUTPUT);
  pinMode(GROWBED, OUTPUT);
 

}

// to save wifi to device http://192.168.4.1/configure?

void setup() {
  
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.println("Executing Setup......................................................................................................................................");
  //WiFiManager
  //Local intialization. Once its business is done, there is no need to keep it around
  WiFiManager wifiManager;
  wifiManager.setConfigPortalTimeout(180);
  //reset settings - for testing
  //wifiManager.resetSettings();

 
  //fetches ssid and pass and tries to connect
  //if it does not connect it starts an access point with the specified name
  //here  "AutoConnectAP"
  //and goes into a blocking loop awaiting configuration
  if(!wifiManager.autoConnect("icroft")) {
    Serial.println("failed to connect and hit timeout");
    //reset and try again, or maybe put it to deep sleep
    ESP.reset();
    delay(1000);
  } 

  //if you get here you have connected to the WiFi
  Serial.println("connected...yeey :)");
  icroftsetup();
  Serial.println("setup done :)");
  
}
//SETUP ENDS HERE


// custom function for accessing DHT11
void gettemperature() {
  
  Serial.println("3.1:Executing getTemperature......................................................................................................................................");
  // Wait at least 2 seconds seconds between measurements.
  // if the difference between the current time and last time you read
  // the sensor is bigger than the interval you set, read the sensor
  // Works better than delay for things happening elsewhere also
  unsigned long currentMillis = millis();
 
  if(currentMillis - dhtlatencypreviousMillis >= dhtlatencyinterval) {
    // save the last time you read the sensor 
    dhtlatencypreviousMillis = currentMillis;   
     //prepare the DHT11 to sense.
     dht.begin();
     delay(500);
    // Reading temperature for humidity takes about 250 milliseconds!
    // Sensor readings may also be up to 2 seconds 'old' (it's a very slow sensor)
   
//    humidity = (humidity+dht.readHumidity())/2; // Read humidity (percent)
    humidity = dht.readHumidity() ;// Read humidity (percent)
    temp_f = (temp_f+dht.readTemperature(true))/2;     // Read temperature as Fahrenheit
    Serial.println(humidity);
    Serial.println(temp_f);
    // Check if any reads failed and exit early (to try again).
    if (isnan(humidity) || isnan(temp_f)) {
      Serial.println("Failed to read from DHT sensor!");
      //test test
      temp_f = 404;
      humidity = 404;
      return;
    }
  } 
}

//update the switches (should map /)
void updateswitches() {
  
  Serial.println("2:Executing UpdateSwitches......................................................................................................................................");
  
  unsigned long currentMillis = millis();
  String response;
  bool begin = false;
  WiFiClient client;

// Ping the node server once in 10 seconds to get the value of the switches

  if(currentMillis - switchpreviousMillis >= switchinterval) {
    // save the last time you read the sensor 
    switchpreviousMillis = currentMillis;   
    
  if(client.connect(host,80))
  {
    
      Serial.println("updating switches data");
        String url = "http://dev.crofters.in/api/updateValues?username=";
        url += user; 
    
  // This will send the request to the server
  client.print(String("GET ") + url + " HTTP/1.1\r\n" +
               "Host: " + host + "\r\n" + 
               "Connection: close\r\n\r\n");

      String line = client.readStringUntil('\r');
         Serial.println(line);

      }
      
    while(1){
      char in = client.read();
      if (in == '{') {
        begin = true;
       }
      if (begin) response += (in);
      if (in == '}') {
        break;
      }    
    }
    
    while (client.connected() || client.available()) {
    client.stop();
    }
    Serial.println(response);
       //Start parsing the JSON response obtained
    int len = response.length()+1;
    char json[380]; 
    Serial.println(len);
    response.toCharArray(json,380);
    StaticJsonBuffer<512> jsonBuffer;
    //Serial.println(json);
    JsonObject& root = jsonBuffer.parseObject(json);
    
  // Test if parsing succeeds.
  if (!root.success()) {
    Serial.println("parseObject() update switches failed");
    return;
  }else{
int  redlight = root["redlight"];
int  bluelight = root["bluelight"];
int  growbedlight = root["growbedlight"];
int  seedlinglight = root["seedlinglight"];
int  filter = root["filterswitch"];  
int  pumpintervalsetting = root["pump"];
     pumpsetting = root["pumpswitch"];  
int  test = root["relaytest"];  

 // seedling light 
   if (seedlinglight == 1) {
  //write to the pins
  digitalWrite(SEEDLING, HIGH);
  Serial.println("seedlinglight on");
   }
   else {
  digitalWrite(SEEDLING, LOW);
  Serial.println("seedlinglight off");
  }  
  
   if (growbedlight == 1) {
  //write to the pins
  digitalWrite(GROWBED, HIGH);
  analogWrite(BLUEPIN,bluelight);
  analogWrite(REDPIN,redlight);
  Serial.println("growbedlight on");
   }
   else {
  //write to the pins
digitalWrite(GROWBED, LOW);
  Serial.println("growbedlight off");
  }

  if(pumpsetting==0)
  {
    digitalWrite(PUMPPIN,0);
    pumpstate=0;
    currentpumpsetting=0;
    Serial.println("pumpsetting off");
  }
  else
  {
    if(pumpsetting!=currentpumpsetting)
    {
    digitalWrite(PUMPPIN,1);
    pumpstate=1;      
    }
    currentpumpsetting=1;
    Serial.println("pumpsetting on");
  
  }

 pumpinterval = 60000*pumpintervalsetting;

  
  Serial.println("Switches updated");

  
  }
 }
}



//Update the sensor values
void updatesensors() {
  
  Serial.println("3:Executing UpdateSensors......................................................................................................................................");
  bool begin = false;
  unsigned long currentMillis = millis();
  WiFiClient client;
 
  // Post to server once in 30 mins to update sensor value

  if(currentMillis - dhtpreviousMillis >= dhtinterval) {
    // save the last time you read the sensor 
    dhtpreviousMillis = currentMillis;   

  Serial.println("updating sensor data");
    
  gettemperature();                      //update the DHT11

  Serial.println("before ultrasonic read");
  long duration;               // update ultrasonic sensor

  pinMode(TRIGGER, OUTPUT);
  digitalWrite(TRIGGER, LOW);  
  delayMicroseconds(5); 
  
  digitalWrite(TRIGGER, HIGH);
   delayMicroseconds(10); 
  
  digitalWrite(TRIGGER, LOW);
  pinMode(ECHO, INPUT);

  duration = pulseIn(ECHO, HIGH);
  distance = (duration/2) / 29.1;

  
  
  String postdata = String("{\"temp\":")+temp_f+",\"humidity\":"+humidity+",\"distance\":"+distance+"}";
  Serial.println(postdata);
  
  if(client.connect(host,80)){
    
   Serial.println("updating sensor data");
        String url = "http://dev.crofters.in/api/updateValues?username=";
        url += user; 
        url += "&volume=";
        url += distance;
        url += "&temperature=";
        url += temp_f; 
        url += "&humidity=";
        url += humidity; 
  // This will send the request to the server
  client.print(String("GET ") + url + " HTTP/1.1\r\n" +
               "Host: " + host + "\r\n" + 
               "Connection: close\r\n\r\n");

      String line = client.readStringUntil('\r');

   while(client.available()){
      char in = client.read();
//Serial.print(in);
    }
    
    
    while (client.connected() || client.available()) {
    client.stop();
    }
  }
    
  }
}

//method to run pump

void runpump(){
  Serial.println("1:Executing RunPump......................................................................................................................................");
  

  if(pumpstate==1)
  { 
    unsigned long currentMillis = millis();
    if(currentMillis - pumpoffpreviousMillis >= pumpruntime) {

    pumpoffpreviousMillis = currentMillis;
    digitalWrite(PUMPPIN,0);
    Serial.println("Pump Stopped");
    pumpstate=0;
    pumponpreviousMillis=millis();
    }
  }
  else {
  unsigned long currentMillis = millis();
  if(currentMillis - pumponpreviousMillis >= pumpinterval) {
    // save the last time you read the sensor 
    pumponpreviousMillis = currentMillis;
    digitalWrite(PUMPPIN,1);
    Serial.println("Pump Started");
    pumpstate = 1;
    pumpoffpreviousMillis=millis();
  }
  }
}


void loop() 
{
  Serial.println("Executing Loop......................................................................................................................................");
  Serial.println(ssid);
    delay(500);
    if(WiFi.status() == WL_DISCONNECTED || WiFi.status() == WL_CONNECTION_LOST){
      Serial.println("Resetting loop");
      ESP.reset();  
    }
    else
    {
      updateswitches();  
        delay(250);
        if(currentpumpsetting==1)
        {
        runpump();
        delay(250);
        }
        updatesensors();
        delay(250);
    } 
}

