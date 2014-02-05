<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Temperature.Default"
    ViewStateMode="Disabled" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Konvertera temperaturer</title>
    <link href="~/Content/temperature.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <h1>
            Konvertera temperaturer</h1>
    </header>
    <form id="form1" runat="server">
    <div id="main">
        <%-- Felmeddelanden --%>
        <asp:ValidationSummary ID="Validationsummary1" runat="server" HeaderText="Fel inträffade. Korrigera och försök igen."
            CssClass="field-validator"></asp:ValidationSummary>
        <%-- Mintemperatur --%>
        <div id="start-temperature">
            <asp:Label ID="Label1" AssociatedControlID="Starttemp" runat="server" Text="Starttemperatur:"></asp:Label>
            <asp:TextBox ID="Starttemp" runat="server" TextMode="Number"></asp:TextBox>
            <%-- Validering --%>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Fyll i en starttemperatur."
                ControlToValidate="Starttemp" Display="Dynamic" SetFocusOnError="True" Text="*"
                CssClass="field-validator"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Mata in ett heltal."
                ControlToValidate="Starttemp" Type="Integer" Operator="DataTypeCheck" Display="Dynamic"
                SetFocusOnError="True" Text="*" CssClass="field-validator"></asp:CompareValidator>
        </div>
        <%-- Maxtemperatur --%>
        <div id="end-temperature">
            <asp:Label ID="Label2" AssociatedControlID="Endtemp" runat="server" Text="Sluttemperatur:"></asp:Label>
            <asp:TextBox ID="Endtemp" runat="server" TextMode="Number"></asp:TextBox>
            <%-- Validering --%>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Fyll i en sluttemperatur."
                ControlToValidate="Endtemp" Display="Dynamic" SetFocusOnError="True" Text="*"
                CssClass="field-validator"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Sluttemperaturen måste vara högre än starttemperaturen."
                ControlToCompare="Starttemp" ControlToValidate="Endtemp" Display="Dynamic" Operator="GreaterThan"
                SetFocusOnError="True" Type="Integer" Text="*" CssClass="field-validator"></asp:CompareValidator>
        </div>
        <%-- Temperatursteg --%>
        <div id="temp-increment">
            <asp:Label ID="Label3" AssociatedControlID="Increment" runat="server" Text="Temperatursteg:"></asp:Label>
            <asp:TextBox ID="Increment" runat="server" TextMode="Number"></asp:TextBox>
            <%-- Validering --%>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Fyll i ett temperatursteg."
                ControlToValidate="Increment" Display="Dynamic" SetFocusOnError="True" Text="*"
                CssClass="field-validator"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Fyll i temperatursteget så att det är ett heltal mellan 1 och 100."
                ControlToValidate="Increment" Display="Dynamic" MaximumValue="100" MinimumValue="1"
                Type="Integer" SetFocusOnError="True" Text="*" CssClass="field-validator"></asp:RangeValidator>
        </div>
        <%-- Radioknappar konverteringsalternativ --%>
        <div id="radio-buttons">
            <p>
                <asp:RadioButton ID="toFahrenheit" runat="server" GroupName="temp-choice" Text="Celsius till Fahrenheit"
                    Checked="True"></asp:RadioButton>
            </p>
            <p>
                <asp:RadioButton ID="toCelsius" runat="server" GroupName="temp-choice" Text="Fahrenheit till Celsius">
                </asp:RadioButton>
            </p>
        </div>
        <%-- Kommandoknapp --%>
        <div id="convert-button">
            <asp:Button ID="Convert" runat="server" Text="Konvertera" OnClick="Convert_Click" />
        </div>
        <div id="table">
            <asp:Table ID="Temptable" runat="server" Visible="false">
            </asp:Table>
        </div>
    </div>
    </form>
</body>
</html>
