String inputString = "";         // a String to hold incoming data

bool stringComplete = false;  // whether the string is complete

 

void setup() {

  // initialize serial:

  Serial.begin(115200);

  // reserve 200 bytes for the inputString:

  inputString.reserve(200);

  pinMode(22,INPUT);
 pinMode(26,INPUT);
 pinMode(30,INPUT);
 pinMode(34,INPUT);
 pinMode(38,INPUT);
 pinMode(42,INPUT);

}

 

void loop() {

  // print the string when a newline arrives:

  if (stringComplete) {

    Serial.println(inputString);

    // clear the string:

    inputString = "";

    stringComplete = false;

  }
 //Serial.println("nekistring");
 
  Serial.print(digitalRead(22));
 Serial.print(digitalRead(30));
 Serial.print(digitalRead(26));
 Serial.print(digitalRead(34));
 Serial.print(digitalRead(38));
 Serial.println(digitalRead(42));
 delay(100);
}

 

/*

  SerialEvent occurs whenever a new data comes in the hardware serial RX. This

  routine is run between each time loop() runs, so using delay inside loop can

  delay response. Multiple bytes of data may be available.

*/

void serialEvent() {

  while (Serial.available()) {

    // get the new byte:

    char inChar = (char)Serial.read();

    // add it to the inputString:

    inputString += inChar;

    // if the incoming character is a newline, set a flag so the main loop can

    // do something about it:

    if (inChar == '\n') {

      stringComplete = true;

    }

  }

}
