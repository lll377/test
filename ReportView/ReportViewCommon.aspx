<%@ Page Language="c#" AutoEventWireup="false" CodeBehind="ReportViewCommon.aspx.cs" Inherits="M_Main.ReportViewCommon" validateRequest="false"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>±®±Ìœ‘ æ</title>
	<script type="text/javascript" src="CreateControl.js" language="javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/WebSocket.js" language="javascript"></script>
    <style type="text/css">
        html,body {
            margin:0;
            height:100%;
        }
    </style>
</head>
<body style="margin:0">
<input type="hidden" id="ServerIp" runat="server" />
<form runat="server">

  <script type="text/javascript">
      document.all.ServerIp.value = window.location.host;
      var Attributes = '<%=Attributes%>';
      Attributes = Attributes.replace(/\[IP\]/g, document.all.ServerIp.value);
      WebSocket_SendMessage(Attributes);
</script>
</form>
</body>
</html>