using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Steg1_3.Model
{
    public class TemperatureConverter
    {
        //Omvandlar temperatur från Celsius till Fahrenheit
        public static int CelsiusToFahrenheit(int degreesC)
        {
            double fTemp = degreesC * 1.8 + 32;
            return (int) Math.Round(fTemp);
        }
        //Omvandlar temperatur från Fahrenheit till Celsius
        public static int FahrenheitToCelsius(int degreesF)
        {
            double cTemp = (double) (degreesF - 32) * 5 / 9;
            return (int) Math.Round(cTemp);
        }
    }
}