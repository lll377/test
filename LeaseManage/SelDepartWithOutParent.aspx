<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelDepartWithOutParent.aspx.cs" Inherits="M_Main.LeaseManage.SelDepartWithOutParent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择机构部门，不包含上级（多选最下级）</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framedialog_Fourcol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body style="overflow-y: auto;">
    <form id="FrmForm" runat="server">
        <ul id="treeDemo" style="width: 100%; overflow-y: auto;" class="easyui-tree">
        </ul>
        <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="BtnSave" />
            <input type="button" class="button" value="放弃返回" id="BtnReturn" />
        </div>
        <script type="text/javascript">
            $(document).ready(function () {
                var h = $(window).height();
                $('#treeDemo').css({ "height": h - 50 + "px" });

                function InitLeftTree() {
                    $.tool.DataGet('Choose', 'SelDepartment', "",
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

                function GetTree(obj) {
                    $('#treeDemo').html("");
                    $('#treeDemo').tree({
                        checkbox: true,
                        data: obj
                    });
                }

                InitLeftTree();
                $("#BtnSave").click(function () {
                    var SelDepCode = '';
                    var SelDepName = '';
                    var nodes = $('#treeDemo').tree('getChecked');

                    if (nodes.length == 0) {
                        HDialog.Info("请勾选机构部门");
                        return;
                    }
                    for (var i = 0; i < nodes.length; i++) {
                        if ($('#treeDemo').tree('isLeaf', nodes[i].target)) {
                            SelDepCode = SelDepCode + "," + nodes[i].attributes.DepCode;
                            SelDepName = SelDepName + "," + nodes[i].text;
                        }
                    }
                    SelDepCode = SelDepCode.substring(1);
                    SelDepName = SelDepName.substring(1);
                    window.returnValue = SelDepCode + ";" + SelDepName;
                    close(SelDepCode + ";" + SelDepName);
                });
                $("#BtnReturn").click(function () {
                    close('');
                });

                function close(_Data) {
                    HDialog.Close(_Data);
                }
            });
        </script>
    </form>
</body>
</html>
