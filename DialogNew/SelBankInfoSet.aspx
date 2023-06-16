<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelBankInfoSet.aspx.cs" Inherits="M_Main.DialogNew.SelBankInfoSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
        }

        .Container {
            width: 100%;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .ContainerLeft {
            float: left;
            overflow-y: auto;
            border-right: 1px solid #cccccc;
            width: 30%;
        }

        .ContainerRight {
            float: left;
            overflow-y: auto;
            overflow-x: hidden;
        }
    </style>
</head>
<body>
    <form id="FrmForm" runat="server">
        <input type="hidden" id="hiSearchOrganCode" name="hiSearchOrganCode" runat="server" />
        <input type="hidden" id="BankName" name="BankName" />

        <div class="Container">
            <div id="ContainerLeft" class="ContainerLeft">
                <table id="RoomFrameTree" name="RoomFrameTree">
                    <tr>
                        <td>
                            <div id="LeftTop1" style="height: 100%">
                                <div>
                                    <ul id="treeDemo" style="width: 100%;" class="easyui-tree">
                                    </ul>
                                </div>
                            </div>
                        </td>
                    </tr>

                </table>
            </div>
            <div id="ContainerRight" class="ContainerRight">
                <div>
                    <div class="datagrid-toolbar" id="divtt">
                        <table cellspacing="0" cellpadding="0">
                            <tr>
                            </tr>
                        </table>
                    </div>
                    <div style="width: 100%;" id="TableContainer"></div>
                </div>
            </div>
        </div>
    </form>

    <script>


        $(document).ready(function () {
            var w = $("#ContainerLeft").width();
            var AllWidth = $(window).width();
            var rightW = AllWidth - w;
            $("#ContainerRight").css("width", rightW - 5);
            InitFunction();
            InitLeftTree();
            LoadList();
        });
        var toolbar = [
            {
                text: '银行名称：<input type="text" id="SelBankName" name="SelBankName"  />',
            },
            {
                iconCls: 'icon-search',
                handler: function () {
                    $("#BankName").val($("#SelBankName").val());
                    LoadList();
                }
            }
        ];

        function NodeItemClick(node) {
            $("#hiSearchOrganCode").val(node);
            LoadList();
        }

        var column = [[
            { field: 'BID', title: 'ID', width: 200, align: 'left', sortable: true, hidden: true },
            { field: 'CommName', title: '物业项目', width: 80, align: 'left', sortable: true },
            { field: 'BankName', title: '银行名称', width: 230, align: 'left', },
            { field: 'BankAccount', title: '银行账号', width: 230, align: 'left', }
        ]];

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=BankAccountInfoSet&Command=getselect&' + $('#FrmForm').serialize(),
                method: "get",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                columns: column,
                fitColumns: true,
                singleSelect: true,
                remoteSort: false,
                pagination: false,
                border: false,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "asc",
                onDblClickRow: function (rowIndex, rowData) {
                    HDialog.ReturnIsJson = true;
                    HDialog.Close(rowData);
                }
            });
            $('#SearchDlg').dialog('close');
        }

        function InitFunction() {
            var h = $(window).height();
            var w = $(window).width() * 0.25 - 1;
            $("#RoomFrameTree").css("width", w + "px");
            $("#RoomFrameTree").css("height", h + "px");
            $("#TableContainer").css("height", h + "px");
            $("#ContainerRight").css("height", h + "px");

            var h1 = h;
            $("#LeftTop1").css("height", h1 + "px");
        }

        function InitLeftTree() {
            $.tool.DataPost('Organ', 'GetOrganTreeByOragan', "OrganCode=" + $('#hiOrganCode').val(),
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
                data: obj,
                onClick: function (node) {
                    NodeItemClick(node.attributes.OrganCode);
                }
            });
        }
        LoadList();
    </script>
</body>
</html>
