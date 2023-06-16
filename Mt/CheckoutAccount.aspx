<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckoutAccount.aspx.cs" Inherits="M_Main.Mt.CheckoutAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>票据扎帐</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: 200px;
        }

        .SearchTable {
            width: 700px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }
    </style>
</head>
<body>
    <form id="AccountForm">
        <div id="AddDlg" class="easyui-dialog" title="新增扎帐" style="overflow: hidden;" data-options="iconCls:'icon-save',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td colspan="4">
                        <label style="color: red">注:不选择仓库则对所有仓库进行扎帐</label></td>
                </tr>
                <tr>
                    <td class="TdTitle">开始时间
                    </td>
                    <td class="TdContentSearch">
                        <input id="ReceiptStartDate" name="ReceiptStartDate" class="easyui-datebox" data-options="required:true" runat="server" />
                    </td>
                    <td class="TdTitle">结束时间
                    </td>
                    <td class="TdContentSearch">
                        <input id="ReceiptEndDate" name="ReceiptEndDate" class="easyui-datebox" data-options="required:true" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">仓库名称
                    </td>
                    <td class="TdContent" colspan="3">
                        <input type="hidden" id="AccountWareHouseIds" name="AccountWareHouseIds" />
                        <textarea id="AccountWareHouseName" name="AccountWareHouseName" style="width: 84%; height: 100px" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="Account();">确定扎帐</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <form id="frmForm" runat="server">
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">仓库名称
                    </td>
                    <td class="TdContent">
                        <input id="WareHouseName" name="WareHouseName" runat="server" />
                        <input type="hidden" id="WareHouseId" name="WareHouseId" />
                    </td>
                </tr>

                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">


            //监听键盘回车事件
            document.onkeydown = function (event) {
                var e = event || window.event || arguments.callee.caller.arguments[0];
                if (e && e.keyCode == 13) { // enter 键
                    LoadList();
                }
            };

            $("#WareHouseName").click(function (e) {
                HDialog.Open('500', '500', '../DialogNew/SelWareHouse.aspx', '选择仓库', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#WareHouseId").val(arrRet[0]);
                        $("#WareHouseName").val(arrRet[1]);
                    }
                });
            });
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();
            var column;
            column = [[
                { field: 'ck', checkbox: true },
                { field: 'AccountStart', title: '扎帐开始时间', align: 'left', width: 50, sortable: true },
                { field: 'AccountEnd', title: '扎帐结束时间', align: 'left', width: 50, sortable: true },
                { field: 'UserName', title: '制单人', align: 'left', width: 50, sortable: true },
                { field: 'AccountWareHouseName', title: '扎帐仓库', width: 50, align: 'left', sortable: true },
            ]];
            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '新增扎帐',
                    iconCls: 'icon-add',
                    handler: function () {
                        $('#AddDlg').parent().appendTo($("form:first"));
                        $('#AddDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '取消扎帐',
                    iconCls: 'icon-clear',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getChecked");
                        if (row.length > 0) {
                            var arr = [];
                            for (var item in row) {
                                arr.push(row[item].AccountId);
                            }
                            $.tool.DataPost('CheckOut', 'CheckOutAccountDel', 'datastr=' + arr.join(","),
                                function Init() {
                                },
                                function callback(_Data) {
                                    LoadList();
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }
                        else {
                            HDialog.Info('请选择已扎帐数据');
                        }

                    }
                }
            ];


            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CheckOut&Command=CheckOutAccountList&WareHouseId=' + $('#WareHouseId').val(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    //singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {

                        $("#SearchDlg").dialog("close");

                    }
                });
            }

            $('#SearchDlg').parent().appendTo($("form:first"));
            LoadList();


            //选择仓库
            $("#AccountWareHouseName").click(function (e) {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                HDialog.Open(600, h, '../DialogNew/SelWareHouses.aspx', '仓库选择', true, function callback(_Data) {
                    var Obj = JSON.parse(_Data);
                    var _n = '';
                    var _Id = '';
                    for (var i = 0; i < Obj.length; i++) {
                        _n = _n + Obj[i].text + ",";
                        _Id = _Id + Obj[i].attributes.Id + ",";
                    }
                    if (_n != '') _n = _n.substr(0, _n.length - 1);
                    if (_Id != '') _Id = _Id.substr(0, _Id.length - 1);
                    $("#AccountWareHouseName").val(_n);
                    $("#AccountWareHouseIds").val(_Id);
                });
            });

            function Account() {
                if (!$('#AccountForm').form('validate')) {
                    return;
                }

                $.tool.DataPost('CheckOut', 'CheckOutAccount', $('#AccountForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info(_Data);
                        if (_Data = "扎帐成功") {
                            $('#AddDlg').dialog("close");
                            LoadList();
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

            }
        </script>
    </form>
</body>
</html>
