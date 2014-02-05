using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Temperature.Model
{
    public static class TemperatureConverter
    {
        //Metod som konverterar Celsius till Fahrenheit
        public static int CelsiusToFahrenheit(int degreesC)
        {
            double fahrenheit = degreesC * 1.8 + 32;

            int intFahrenheit = (int)fahrenheit;

            return intFahrenheit;
        }

        //Metod som konverterar Fahrenheit till Celsius
        public static int FahrenheitToCelsius(int degreesF)
        {
            int celsius = (degreesF - 32) * 5 / 9;

            return celsius;
        }
    }
}
