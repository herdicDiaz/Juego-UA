<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteListaPruebas.aspx.cs" Inherits="Uniamazonia_Juego.Web_forms_reports.ReporteListaPruebas" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Listado de pruebas</title>
</head>
<body>
    <form id="form1" runat="server">
        <CR:CrystalReportViewer ID="CrystalReportViewerListaPruebas" runat="server" AutoDataBind="true" />
        <div>
        </div>
    </form>
</body>
</html>
