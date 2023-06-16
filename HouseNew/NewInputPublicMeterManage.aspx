<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewInputPublicMeterManage.aspx.cs" Inherits="M_Main.HouseNew.NewInputPublicMeterManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>工区表抄表导入</title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript">
		<!--

    function btnFileUp_Onclick() {

        if (InputMeterManage.btnFile.value == "" && InputMeterManage.PostedFileName.value == "") {
            HDialog.Info("请选择要读取的本地文件!");
            InputMeterManage.btnFile.focus();
            return false;
        }
        if (InputMeterManage.TableName.value == "") {
            HDialog.Info("请输入Excel表的工作表名!");
            InputMeterManage.TableName.focus();
            return false;
        }

        return true;
    }
    function btnFile_OnClick() {
        InputMeterManage.FilePhysics.value = "";
    }
    function btnOK_Onclick() {
        if (btnFileUp_Onclick() == false) {
            return false;
        }        
        return true;
    }
    </script>
    <style type="text/css">
        td, th {
            font-family: 微软雅黑;
        }
    </style>
</head>
<body style="overflow-y: auto">

    <form id="InputMeterManage" method="post" runat="server">
        <table class="DialogTable" id="Table" style="width: 100%">
            <tr>
                <td align="center" style="height: 22px; background-color: #e6e6e6"><span style="font-size: 16px">第一步：生成格式</span></td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <input class="button" id="btnCreExcel" style="width: 100px" type="button" value="生成格式文件" name="btnCreExcel" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center" style="height: 22px; background-color: #e6e6e6"><span style="font-size: 16px">第二步：上传文件</span></td>
            </tr>
            <tr>
                <td valign="top">
                    <input id="btnFile" style="width: 264px; height: 22px" onclick="javascript: btnFile_OnClick();"
                        tabindex="1" type="file" size="24" name="btnFile" runat="server">
                    <input id="FilePhysics" style="width: 35px; height: 22px" type="hidden" size="1" name="FilePhysics"
                        runat="server" /><input id="PostedFileName" style="width: 35px; height: 22px" type="hidden" size="1" name="PostedFileName"
                            runat="server" />Excel工作表名<input class="Control_ItemInput" id="TableName" style="width: 112px; height: 19px" type="text"
                                maxlength="50" size="13" value="Sheet1$" name="TableName" runat="server" />
                    <input class="button" id="btnFileUp" onclick="javascript: if (btnFileUp_Onclick() == false) return false;"
                        type="button" value="读取" name="btnFileUp" runat="server" />
                </td>
            </tr>
           
            <tr>
                <td align="center" style="height: 22px; background-color: #e6e6e6"><span style="font-size: 16px">第三步：确定导入</span></td>
            </tr>
            <tr>
                <td valign="top">
                    <table class="SchTable" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td align="center">
                                <input class="button" id="btnOK" onclick="javascript: if (btnOK_Onclick() == false) return false;"
                                    type="button" value="确定导入" name="btnOK" runat="server"><br>
                                <textarea id="TextResults" style="width: 100%; font-size: 12px;" name="TextResults" rows="6" cols="20" runat="server"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>注：抄表日期应大于最近抄表日期，否则抄表登记无效！
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" style="height: 22px; background-color: #e6e6e6"><span style="font-size: 16px">前10行数据</span></td>
            </tr>
            <tr>
                <td style="background-image: url(../images/main_sp_h.jpg); background-repeat: repeat-x"
                    height="3"></td>
            </tr>
            <tr>
                <td valign="top">
                    <asp:DataGrid ID="DGrid" Style="font-size: 12px" runat="server" CssClass="DataGrid" Width="100%">
                        <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                        <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                        <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                    </asp:DataGrid></td>
            </tr>
        </table>
        <script type="text/javascript">

            $('#btnCreExcel').click(function () {
                HDialog.Open(500, 300, '../HouseNew/NewExcelPublicMeterManage.aspx', '生成Excel抄表文件', false, function callback(_Data) {
                });
            });

            $('#btnOK').click(function () {
                $.tool.DataPost('Meter', 'PublicMeterExcelAdd', $('#InputMeterManage').serialize(),
                       function Init() {
                       },
                       function callback(_Data) {
                           var Data = _Data.split('|');
                           HDialog.Info(Data[1]);
                           if (Data[0] == "true") {
                               window.location = window.location;
                           }
                       },
                       function completeCallback() {
                       },
                       function errorCallback() {

                       });
            });
        </script>
    </form>
</body>
</html>

