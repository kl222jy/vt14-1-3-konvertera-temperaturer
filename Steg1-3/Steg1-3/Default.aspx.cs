using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Steg1_3
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBoxStartTemp.Focus();
        }

        //Utför temperaturkonvertering och presenterar resultat i form av en tabell
        protected void ButtonConvert_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var start = int.Parse(TextBoxStartTemp.Text);
                var end = int.Parse(TextBoxEndTemp.Text);
                var step = int.Parse(TextBoxStepTemp.Text);
                var steps = (end - start) / step;

                //Tabell för Celsius till Fahrenheit
                if (RadioButtonListConversionType.SelectedValue == "CtoF")
                {
                    //Header
                    TableHeaderRow thRow = new TableHeaderRow();
                    Table1.Rows.Add(thRow);
                    TableHeaderCell thCell1 = new TableHeaderCell();
                    thCell1.Text = "&deg; C";
                    thRow.Cells.Add(thCell1);
                    TableHeaderCell thCell2 = new TableHeaderCell();
                    thCell2.Text = "&deg; F";
                    thRow.Cells.Add(thCell2);
                    //Body
                    for (int i = start; i <= end; i += step)
                    {
                        TableRow tRow = new TableRow();
                        Table1.Rows.Add(tRow);
                        TableCell tCell1 = new TableCell();
                        tCell1.Text = i.ToString();
                        tRow.Cells.Add(tCell1);
                        TableCell tCell2 = new TableCell();
                        tCell2.Text = Model.TemperatureConverter.CelsiusToFahrenheit(i).ToString();
                        tRow.Cells.Add(tCell2);
                    }
                }

                //Tabell för Fahrenheit till Celsius
                if (RadioButtonListConversionType.SelectedValue == "FtoC")
                {
                    //Header
                    TableHeaderRow thRow = new TableHeaderRow();
                    Table1.Rows.Add(thRow);
                    TableHeaderCell thCell1 = new TableHeaderCell();
                    thCell1.Text = "&deg; F";
                    thRow.Cells.Add(thCell1);
                    TableHeaderCell thCell2 = new TableHeaderCell();
                    thCell2.Text = "&deg; C";
                    thRow.Cells.Add(thCell2);
                    //Body
                    for (int i = start; i <= end; i += step)
                    {
                        TableRow tRow = new TableRow();
                        Table1.Rows.Add(tRow);
                        TableCell tCell1 = new TableCell();
                        tCell1.Text = i.ToString();
                        tRow.Cells.Add(tCell1);
                        TableCell tCell2 = new TableCell();
                        tCell2.Text = Model.TemperatureConverter.FahrenheitToCelsius(i).ToString();
                        tRow.Cells.Add(tCell2);
                    }
                } 
            }
        }
    }
}