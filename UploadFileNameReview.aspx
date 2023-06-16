<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadFileNameReview.aspx.cs" Inherits="M_Main.UploadFileNameReview" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>文件上传</title>
<style type="text/css">

 #upload_img
 {
     height:24px;
     width:160px;
 }
</style>
</head>
<body style="font-size:12px;font-family:微软雅黑;margin:0px;">
<form id="UploadForm" runat="server">
<input id="upload_img" type="file" runat="server" name="upload_img" style="font-size:12px;width:auto;"/>&nbsp;<asp:Button ID="BtnSave" runat="server" Text="确定上传"   style="font-size:12px;" onclick="BtnSave_Click"/>
</form>
</body>
</html>