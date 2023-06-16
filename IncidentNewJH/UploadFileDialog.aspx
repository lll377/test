<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadFileDialog.aspx.cs" Inherits="M_Main.IncidentNewJH.UploadFileDialog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

</head>
<body>
    <input type="hidden" value="" id="hiIncidentID" runat="server" />
    <input type="hidden" value="" id="hiFileDescr" runat="server" />
    <input type="hidden" value="" id="hiImgGUID" runat="server" />
    
    <div style="padding: 40px 5px 35px 15px; color: #6c6a6a">
        文件上传：
         <input id="TexFileName" type="text" style="width: 280px; color: #6c6a6a" readonly />
        <input type="button" value="浏览.." onclick="BrowseFile()" />
        <input id="btnFile" type="file" runat="server" style="display: none;" onchange="btnChange()" />
    </div>
    <div style="width: 100%; text-align: center;">
        <input id="btnUpFile" type="button" class="button" value="上传" onclick="UpladImage()" style="margin-right: 15px;" />
        <input type="button" class="button" value="放弃返回" onclick="HDialog.Close()" />
    </div>


    <script>
        function BrowseFile() {
            $('#btnFile').click();
        }
        function btnChange() {
            var fileName = $('#btnFile').val();
            $('#TexFileName').val(fileName);
        }
        //上传
        function UpladImage() {
            $('#btnUpFile').attr('disabled', 'disabled');
            var text = $('#TexFileName').val();
            var FileDescr=hiFileDescr.value;
            if (!text) {
                HDialog.Info('上传文件不能为空');
                $('#btnUpFile').removeAttr('disabled');
                return;
            }
            if (FileDescr.indexOf("图片")>0) {
                var type = text.split(".")[1];
                if (type.toLowerCase() != "png" && type.toLowerCase() != "jpg" && type.toLowerCase() != "gif" && type.toLowerCase() != "jpeg") {
                    HDialog.Info('图片格式请转换为png、jpg、gif、jpeg其中一种类型');
                    $('#btnUpFile').removeAttr('disabled');
                    return false;
               }
            }
            var formData = new FormData();
            formData.append("file", btnFile.files[0]);
            $.ajax({
                type: "POST",
                url: "/HM/M_Main/IncidentNewJH/UploadFileDialog.aspx?Method=UpladFile&IncidentID=" + hiIncidentID.value + "&FileDescr=" + hiFileDescr.value + "&ImgGUID=" + $("#hiImgGUID").val(),
                data: formData,
                async: false,
                cache: false,
                dataType: 'text',
                contentType: false,
                processData: false,
                error: function (request) {
                    $('#btnUpFile').removeAttr('disabled');
                },
                success: function (data) {
                    var obj = data.split(",");
                    localStorage.hiIncidentID = obj[1];
                    localStorage.fAdjunctCode = obj[2];
                    HDialog.Close(obj[0]);
                }
            });
        };


    </script>


</body>
</html>
