using System;
using System.IO.Ports;

namespace SmartParking_WebApp.ArduinoHelper
{
    public class SerialPortConnector
    {
        private readonly int _boundRate = 115200;
        private readonly string _portName = "COM3";
        public String Receive()
        {
            var serialPort = new SerialPort(_portName, _boundRate);
            serialPort.ReadTimeout = 100;
            serialPort.Open();
            var s = serialPort.ReadLine();
            serialPort.Close();
            return s;
        }
    }
}
