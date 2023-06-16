<%@ Page language="c#" Codebehind="ReadWebOffice.aspx.cs" AutoEventWireup="false" Inherits="M_Main.OAWebOffice.ReadWebOffice" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>文档阅读</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<style type="text/css"> body { margin-left: 0px; margin-top: 0px; margin-bottom: 0px; margin-right: 0px; background-color: #ffffff; }
		</style>
	</HEAD>
	<body MS_POSITIONING="GridLayout" onload="InitFunction();" scroll="no">
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
<script src="/HM/M_Main/jscript/WebSocket.js"></script>

<script type="text/javascript">

	function GetExtName(ExtNameValue)//取得文件扩展名
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
	    OpenDoc(FileName, ExtName);//打开文档
	    if (FileName == '') {
	        CreateNewDoc(document.getElementById("pcTypeValue").value);//默认创建一个word文档
	    }
	}

	InitFunction();

	function OpenDoc(FileNameValue,pcType)
	{
	    if (FileNameValue == '') {
            //创建文件
	        CreateNewDoc(pcType);
	    }
	    else {
	        var UrlAddress = "http://" + window.location.host + document.all.HttpUrl.value + FileNameValue;
	        var Url = UrlAddress.replace(/\\/g, "/");
            //打开文件
	        OpenWordDoc(Url, pcType);
	    }
	}

	function CreateNewDoc(pcType)
	{
	    var FN = document.all.BuildFileName.value;
	    var FileName = document.all.FileName.value;
	    var Host = "http://" + window.location.host +  document.all.HttpUrl.value + 'OAWebOffice/UploadFile.aspx';

	    var oprType = document.all.OprType.value;
	    var WorkRecord = document.all.WorkContent.value;
	    var DocUserName = document.all.DocUserName.value;
        //创建一个文件
	    var Message = '<Attributes><Type>1002</Type><Cmd>Create</Cmd><FN>' + FN + '</FN><Host>' + Host + '</Host><FileName>' + FileName + '</FileName><OprType>' + oprType + '</OprType><WorkRecord>' + WorkRecord + '</WorkRecord><DocUserName>' + DocUserName + '</DocUserName><UserCode></UserCode></Attributes>';
	    WebSocket_SendMessage(Message);
	}

	function OpenWordDoc(Url,pcType)
	{
	    var FN = document.all.BuildFileName.value;
	    var FileName = document.all.FileName.value;
	    var Host = "http://" + window.location.host + ":" + window.location.port + document.all.HttpUrl.value + 'OAWebOffice/UploadFile.aspx';
	    var oprType = document.all.OprType.value;
	    var WorkRecord = document.all.WorkContent.value;
	    var DocUserName = document.all.DocUserName.value;
        //打开一个文件
	    var Message = '<Attributes><Type>1002</Type><Cmd>OpenDoc</Cmd><Url>' + Url + '</Url><pcType>' + pcType + '</pcType><FN>' + FN + '</FN><Host>' + Host + '</Host><FileName>' + FileName + '</FileName><OprType>' + oprType + '</OprType><WorkRecord>' + WorkRecord + '</WorkRecord><DocUserName>' + DocUserName + '</DocUserName><UserCode></UserCode></Attributes>';
	    WebSocket_SendMessage(Message);
	}
	
</script>
    </form>
	</body>
</HTML>