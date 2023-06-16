<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ElectronicInvoiceSettingAdd.aspx.cs" Inherits="M_Main.ChargesNew.ElectronicInvoiceSettingAdd" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framedialog_twocol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
</head>
<body style="padding: 0; margin: 0;">
    <form id="frmForm" runat="server">
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
        <input id="CommID" type="hidden" name="CommID" runat="server" />
        <input id="ImageUrl" type="hidden" name="ImageUrl" runat="server" />
        <input id="sealImageUrl" type="hidden" name="sealImageUrl" runat="server" />
        <input id="IID" type="hidden" name="IID" runat="server" />
        <table class="DialogTable">
            <tr>
                <td class="TdTitle">收据抬头</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" data-options="required:true" id="HeadTitle" type="text" name="HeadTitle" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle" id="imageTitle">公司Logo<a id="UpImage" style="color: #688aed; cursor: pointer;" onclick="UploadImage(1)">(上传)</a> ：
                </td>
                <td id="ImageContent" class="TdContent" colspan="3"></td>
            </tr>
            <tr>
                <td class="TdTitle" id="sealimageTitle">公章图片<a id="sealUpImage" style="color: #688aed; cursor: pointer;" onclick="UploadImage(2)">(上传)</a> ：
                </td>
                <td id="sealImageContent" class="TdContent" colspan="3"></td>
            </tr>
        </table>

        <table class="DialogTable">
            <tr>
                <td colspan="4" class="DialogTdSubmit" style="text-align: center">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>


        <script type="text/javascript">
            $(document).ready(function () {
                if ($("#hiOPType").val() == "edit") {
                    InitDate();
                }
            });

            function InitDate() {
                $.tool.DataGet('ElectronicInvoiceSetting', 'GetElectronicInvoiceSetting', 'IID=' + $("#IID").val(),
                    function Init() {
                    },
                    function callback(Data) {
                        var varObjects = eval("(" + Data.replace(/\\/g, "/") + ")");
                        var rows = varObjects.rows[0];
                        console.log(rows);
                        $("#HeadTitle").val(rows.HeadTitle);
                        $("#CommID").val(rows.CommID);
                        //$("#Name").val(rows.Name);
                        //$("#Memo").val(rows.Memo);
                        $("#ImageUrl").val(rows.LogoImg);
                        $('#ImageContent').append(CreateSmImg(rows.LogoImg, rows.HeadTitle));
                        $('#imageTitle').css('height', '100px');

                        $("#sealImageUrl").val(rows.SealImg);
                        $('#sealImageContent').append(CreateSmImg(rows.SealImg, rows.HeadTitle));
                        $('#sealimageTitle').css('height', '100px');
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function UploadImage(type) {
                var strType = '';
                if (type == '1') {
                    strType = 'logo';
                } else {
                    strType = 'seal';
                }
                HDialog.Open('500', '222', '../ChargesNew/ElectronicInvoiceSettingUploadFileDialog.aspx?Type=' + strType, '上传图片', false, function callback(_Data) {
                    if (_Data) {
                        if (type == '1') {
                            $('#ImageContent').html("");
                            var ImageUrl = _Data.split("|")[0];
                            var fileName = _Data.split("|")[1];
                            $('#ImageUrl').val(ImageUrl);
                            $('#ImageContent').append(CreateSmImg(ImageUrl, fileName));
                            $('#imageTitle').css('height', '120px');
                        }
                        else {
                            $('#sealImageContent').html("");
                            var ImageUrl = _Data.split("|")[0];
                            var fileName = _Data.split("|")[1];
                            $('#sealImageUrl').val(ImageUrl);
                            $('#sealImageContent').append(CreateSmImg(ImageUrl, fileName));
                            $('#sealimageTitle').css('height', '120px');
                        }
                    }
                });
            }
            function CreateSmImg(ImageUrl, fileName) {
                var sb = "";
                sb += "<div class=\"addpicdiv\" style=\"width: 100px; height: 100px; float: left; margin-right: 15px; position: relative;text-align:center;\" ondblclick=\"ImageBlclick('" + fileName + "')\">";
                sb += "<img src=\"" + ImageUrl + "\" style=\"width: 100px; height: 100px;\" />";
                sb += " </div>";
                return sb;
            }

            $("#BtnSave").click(function () {
                if ($('#ImageUrl').val() == "") {
                    HDialog.Info('请上传文件');
                    return;
                }

                $.tool.DataPostChk('frmForm', 'ElectronicInvoiceSetting', 'AddElectronicInvoiceSetting', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            HDialog.Info('保存成功');
                            //HDialog.Close(1);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });
            });
            $("#BtnReturn").click(function () {
                close();
            });

            function close() {
                HDialog.Close();
            }

        </script>

    </form>
</body>
</html>
