using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Temperature
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Convert_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                //Initierar variabler
                var minDegrees = int.Parse(Starttemp.Text);
                var maxDegrees = int.Parse(Endtemp.Text);
                var increment = int.Parse(Increment.Text);

                //Skapar den översta tabellraden och dess celler
                var tRow1 = new TableRow();
                Temptable.Rows.Add(tRow1);
                var tCell1 = new TableCell();
                var tCell2 = new TableCell();

                if (toFahrenheit.Checked)
                {
                    tCell1.Text = "Celsius";
                    tCell2.Text = "Fahrenheit";
                }

                if (toCelsius.Checked)
                {
                    tCell1.Text = "Fahrenheit";
                    tCell2.Text = "Celsius";
                }

                tRow1.Cells.Add(tCell1);
                tRow1.Cells.Add(tCell2);

                //Skapar de tabellrader och celler som innehåller temperaturerna
                for (int i = minDegrees; i <= maxDegrees; i += increment)
                {
                    var tRow2 = new TableRow();
                    Temptable.Rows.Add(tRow2);
                    var tCell3 = new TableCell();
                    tCell3.Text = i.ToString();
                    tRow2.Cells.Add(tCell3);
                    var tCell4 = new TableCell();
                    if (toFahrenheit.Checked)
                    {
                        tCell4.Text = Temperature.Model.TemperatureConverter.CelsiusToFahrenheit(i).ToString();
                    }
                    if (toCelsius.Checked)
                    {
                        tCell4.Text = Temperature.Model.TemperatureConverter.FahrenheitToCelsius(i).ToString();
                    }
                    tRow2.Cells.Add(tCell4);
                }

                //Gör tabellen synlig
                Temptable.Visible = true;
            }
        }
    }
}
