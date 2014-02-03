<%@ Page Title="Konvertera temperaturer" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Steg1_3._Default" ViewStateMode="Disabled" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <section class="float-left">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <%-- Starting temperature --%>
        <asp:Label ID="LabelStartTemp" runat="server" Text="Starttemperatur"></asp:Label>
        <div>
            <asp:TextBox ID="TextBoxStartTemp" runat="server" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Fyll i en starttemperatur" ControlToValidate="TextBoxStartTemp" Display="None"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Starttemperatur måste vara ett heltal" ControlToValidate="TextBoxStartTemp" Display="None" Type="Integer" ControlToCompare="TextBoxEndTemp" Operator="LessThan"></asp:CompareValidator>
        </div>
        <%-- Ending temperature --%>
        <asp:Label ID="LabelEndTemp" runat="server" Text="Sluttemperatur"></asp:Label>
        <div>
            <asp:TextBox ID="TextBoxEndTemp" runat="server" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Fyll i en sluttemperatur" ControlToValidate="TextBoxEndTemp" Display="None"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Sluttemperatur måste vara högre än starttemperatur" ControlToValidate="TextBoxEndTemp" Type="Integer" Display="None" ControlToCompare="TextBoxStartTemp" Operator="GreaterThan"></asp:CompareValidator>
        </div>
        <%-- Temperature stepping --%>
        <asp:Label ID="LabelStepTemp" runat="server" Text="Temperatursteg"></asp:Label>
        <div>
            <asp:TextBox ID="TextBoxStepTemp" runat="server" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Fyll i ett temperatursteg" ControlToValidate="TextBoxStepTemp" Display="None"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Temperatursteget måste vara mellan 1 och 100" ControlToValidate="TextBoxStepTemp" Display="None" Type="Integer" MinimumValue="1" MaximumValue="100"></asp:RangeValidator>
        </div>
        <%-- Conversion type --%>
        <asp:Label ID="LabelConversionType" runat="server" Text="Typ av konvertering"></asp:Label><br />
        <asp:RadioButtonList ID="RadioButtonListConversionType" runat="server">
            <asp:ListItem Value="CtoF">Celsius till Fahrenheit</asp:ListItem>
            <asp:ListItem Value="FtoC">Fahrenheit till Celsius</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Du måste välja en konverteringstyp" ControlToValidate="RadioButtonListConversionType"></asp:RequiredFieldValidator>
        <asp:Button ID="ButtonConvert" runat="server" Text="Button" OnClick="ButtonConvert_Click" />
    </section>
    <section class="float-left">
        <asp:Table ID="Table1" runat="server" CssClass="ts1"></asp:Table>
    </section>
</asp:Content>
