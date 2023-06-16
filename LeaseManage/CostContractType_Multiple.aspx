<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostContractType_Multiple.aspx.cs" Inherits="M_Main.LeaseManage.CostContractType_Multiple" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择合同类别，多选</title>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../jscript/jquery.tool.new.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            background-color: #ffffff;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server" style="margin: 0px; padding: 0px; overflow: hidden;">
        <table id="Table1" cellspacing="1" style="width:100%;">
            <tr>
                <td class="formTable_ItemInput">
                    <div class="ContainerLeft" id="divTree" style="overflow: auto;">
                        <ul id="treeDemo" class="easyui-tree">
                        </ul>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="3"></td>
            </tr>
            <tr>
                <td align="center" style="padding-left: 70px;">
                    <input id="btnSelect" type="button" onclick="btnOK_onclick();" value="选择" name="btnFilter" class="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                   
                    <input id="btnReturn" type="button" onclick="btnCancle_Click();" value="放弃选择" name="btnReturn" class="button">
                </td>
            </tr>
        </table>

        <script type="text/javascript">
            InitTableHeight();
            function InitTableHeight() {
                var h = $(window).height();
                $("#divTree").css({ "height": h - 50 + "px" });
            }

            function InitTree() {
                $.tool.DataGet('CsCost', 'GetContractTypeEasyUiTree', "",
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != '') {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            GetTree(varObjects);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            InitTree();

            function GetTree(obj) {
                $('#treeDemo').html("");
                $('#treeDemo').tree({
                    data: obj,
                    checkbox: true
                });
            }

            function btnOK_onclick() {
                var nodes = $('#treeDemo').tree('getChecked');
                if (nodes.length == 0) {
                    HDialog.Info("请至少选择一个合同类别");
                    return;
                }
                var NameStr = "";
                var CodeStr = "";
                for (var i = 0; i < nodes.length; i++) {
                    if (nodes[i].attributes.ParentId != "") {
                        NameStr += nodes[i].text + ",";
                        CodeStr += nodes[i].id + ",";
                    }
                }
                if (NameStr.length > 0) {
                    NameStr = NameStr.substring(0, NameStr.length - 1);
                    CodeStr = CodeStr.substring(0, CodeStr.length - 1);
                }
                HDialog.Close(CodeStr + "&" + NameStr);
            }

            function btnCancle_Click() {
                HDialog.Close("");
            }

        </script>
    </form>
</body>
</html>

