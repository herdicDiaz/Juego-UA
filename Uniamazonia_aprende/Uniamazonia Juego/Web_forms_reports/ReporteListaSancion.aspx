<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteListaSancion.aspx.cs" Inherits="Uniamazonia_Juego.Web_forms_reports.ReporteListaSancion" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Lista sancion</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <CR:CrystalReportViewer ID="CrystalReportViewerSancion" runat="server" AutoDataBind="true" />
        </div>
    </form>
</body>
</html>
