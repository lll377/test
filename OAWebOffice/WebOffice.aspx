<%@ Page language="c#" Codebehind="WebOffice.aspx.cs" AutoEventWireup="false" Inherits="M_Main.OAWebOffice.WebOffice" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>WEBOFFICE</title>
</head>
<body style="margin:0px;padding:0px;font-size:12px;overflow-y:hidden;">
 <form id="frmForm" runat="server">
<input id="FileName" name="FileName" type="hidden" runat="server" />
<input id="OprType" name="OprType" value="1" type="hidden" runat="server" />
<input id="HttpUrl" name="HttpUrl"  type="hidden" runat="server" />
<input id="DocUserName" name="DocUserName" type="hidden" runat="server" />
<input id="pcTypeValue" name="pcTypeValue" type="hidden" runat="server" />
<input id="CallBackName" name="CallBackName" type="hidden" runat="server" />
<input id="BuildFileName" name="BuildFileName" type="hidden" runat="server" />
<input id="TemplateFileName" name="TemplateFileName" type="hidden" runat="server" />
<input id="WorkContent" name="WorkContent" type="hidden" runat="server" />
<input id="UserCode" name="UserCode" type="hidden" runat="server" />
     
<script src="/HM/M_Main/jscript/WebSocket.js"></script>

<script type="text/javascript">

	function GetExtName(ExtNameValue)
	{
		var FilePath=ExtNameValue;
	
		if(FilePath=='')return 'doc';
		
		var ExtName=FilePath.substr(FilePath.indexOf('.')+1).toLowerCase();
		
		return ExtName;
	}

	function InitFunction()
	{
	    var FileName = document.getElementById("TemplateFileName").value;
	    var DocName = document.getElementById("FileName").value;
	    if (DocName != "") FileName = DocName;
	    var ExtName = GetExtName(FileName);
	    OpenDoc(FileName, ExtName);
	    if (FileName == '') {
	        CreateNewDoc(document.getElementById("pcTypeValue").value);
	    }
	}

	InitFunction();

	function OpenDoc(FileNameValue,pcType)
	{
	    if (FileNameValue == '') {

	        CreateNewDoc(pcType);
	    }
	    else {
	        var UrlAddress = "http://" + window.location.host + document.all.HttpUrl.value + 'OAUpLoadFile/' + FileNameValue;
	        var Url = UrlAddress.replace(/\\/g, "/");

	        OpenWordDoc(Url, pcType);
	    }
	}

	function CreateNewDoc(pcType)
	{
	    var FN = document.all.BuildFileName.value;
	    var FileName = document.all.FileName.value;
	    var Host = "http://" + window.location.host +  document.all.HttpUrl.value + 'OAWebOffice/UploadTemplate.aspx';

	    var oprType = document.all.OprType.value;
	    var WorkRecord = document.all.WorkContent.value;
	    var DocUserName = document.all.DocUserName.value;
	    var U = document.all.UserCode.value;

	    var Message = '<Attributes><Type>1002</Type><Cmd>Create</Cmd><FN>' + FN + '</FN><Host>' + Host + '</Host><FileName>' + FileName + '</FileName><OprType>' + oprType + '</OprType><WorkRecord>' + WorkRecord + '</WorkRecord><DocUserName>'+DocUserName+'</DocUserName><UserCode>'+U+'</UserCode></Attributes>';
	    WebSocket_SendMessage(Message);
	}

	function OpenWordDoc(Url,pcType)
	{
	    var FN = document.all.BuildFileName.value;
	    var FileName = document.all.FileName.value;
	    var Host = "http://" + window.location.host + document.all.HttpUrl.value + 'OAWebOffice/UploadFile.aspx';
	    var oprType = document.all.OprType.value;
	    var WorkRecord = document.all.WorkContent.value;
	    var DocUserName = document.all.DocUserName.value;
	    var U = document.all.UserCode.value;

	    var Message = '<Attributes><Type>1002</Type><Cmd>OpenDoc</Cmd><Url>' + Url + '</Url><pcType>' + pcType + '</pcType><FN>' + FN + '</FN><Host>' + Host + '</Host><FileName>' + FileName + '</FileName><OprType>' + oprType + '</OprType><WorkRecord>' + WorkRecord + '</WorkRecord><DocUserName>' + DocUserName + '</DocUserName><UserCode>' + U + '</UserCode></Attributes>';
	    WebSocket_SendMessage(Message);
	}
	
</script>
    </form>
</body>
</html>
