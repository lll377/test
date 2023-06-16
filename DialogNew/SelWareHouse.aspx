<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelWareHouse.aspx.cs" Inherits="M_Main.DialogNew.SelWareHouse" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framedialog_twocol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body style="padding: 5px; overflow-y: auto;">
    <form id="frmForm" runat="server">
        <div id="searchDiv">
            <input type="text" id="SearchName" name="SearchName" style="border: 1px solid #cccccc; width: 200px; margin-left: 10px;" class="easyui-validatebox" />
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="FilterTree();">筛选</a>
        </div>
        <ul id="treeDemo" style="width: 100%;" class="easyui-tree">
        </ul>
        <script type="text/javascript">
            $(document).ready(function () {
                function InitLeftTree() {
                    $.tool.DataGet('Choose', 'SelWareHouse', "",
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

                var column;
                column = [[
                    {
                        field: 'text', title: '仓库名称', align: 'left', sortable: true, formatter: function (value, row, index) {
                            if (row.attributes.IsRight == "1") {
                                var str = "<a class=\"HrefStyle\" href=\"#\">" + row.text + "</a>";
                                return str;
                            }
                            else {
                                var str = row.text;
                                return str;
                            }
                        }
                    },
                    {
                        field: 'CommID', title: '小区ID', align: 'left', formatter: function (value, row, index) {
                            var str = row.attributes.CommID;
                            if (str == 0) str = '';
                            return str;
                        }
                    }
                ]];

                function GetTree(obj) {
                    $('#treeDemo').html("");
                    $('#treeDemo').tree({
                        data: obj,
                        columns: column,
                        onSelect: function (node) {
                            if (node.attributes.IsRight == "1") {
                                var ReturnValue = node.attributes.Id + ',' + node.text;
                                HDialog.Close(ReturnValue);
                            }
                        },
                        onLoadSuccess: function () {
                            $("#treeDemo").tree("collapseAll");
                        }

                    });
                }
                InitLeftTree();
            });
            function FilterTree() {
                $('#treeDemo').tree("doFilter", $('#SearchName').val());
            }
        </script>
    </form>
</body>
</html>
