<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BIllCheckAccount.aspx.cs" Inherits="M_Main.Mt.BIllCheckAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>票据扎帐</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding:10px;
            width: 700px; 
            height: 200px; 
        } 
        .SearchTable
        {
            width: 700px; 
            height:auto;
        }
        .SearchTable .TdTitle {
            width:15%;
        }
        .SearchTable .TdContent {
            width:35%;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
    <input id="WorkFlowTypeId" type="hidden" name="WorkFlowTypeId" runat="server" />
    <div id="TableContainer"></div>
    <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow:hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
        <table class="SearchTable">
            <tr>
                <td class="TdTitle">
                    开始时间
                </td>
                <td class="TdContentSearch">
                    <input id="ReceiptStartDate" name="ReceiptStartDate" class="easyui-datebox" runat="server"  />
                </td>
                <td class="TdTitle">
                    结束时间
                </td>
                <td class="TdContentSearch">
                    <input id="ReceiptEndDate" name="ReceiptEndDate" class="easyui-datebox"  runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    单号
                </td>
                <td class="TdContent">
                    <input id="ReceiptSign" name="ReceiptSign" runat="server" />
                </td>
                <td class="TdTitle">
                    仓库名称
                </td>
                <td class="TdContent">
                    <input id="WareHouseName" name="WareHouseName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    是否扎帐
                </td>
                <td class="TdContent">
                    <select id="IsCheckAccount" name="IsCheckAccount">
                      <option></option>
                      <option value="0">否</option>
                      <option value="1">是</option>
                    </select>
                    <%--<input id="UserName" name="UserName" runat="server" />--%>
                </td>
                <td class="TdTitle">
                    单据类型
                </td>
                <td class="TdContent">
                     <select id="BillType" name="BillType">
                      <option></option>
                      <option value="0">入库</option>
                      <option value="1">出库</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center;padding-top:5px;">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </td>
            </tr>
        </table>
    </div>
    <script  src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">


        //监听键盘回车事件
        document.onkeydown = function (event) {
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if (e && e.keyCode == 13) { // enter 键
                LoadList();
            }
        };
        //获取盘点仓库
        $("#WareHouseName").click(function (e) {
            HDialog.Open('500', '500', '../DialogNew/SelWareHouse.aspx', '选择盘点仓库', true, function callback(_Data) {
                if (_Data != '') {
                    var arrRet = _Data.split(',');
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
                {
                    field: 'ReceiptSign', title: '单号', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.Id + "','"+row.InOutMethod+"');\">" + row.ReceiptSign + "</a>";
                        return str;
                    }
                },
                { field: 'ReceiptDate', title: '时间', align: 'left', width: 50, sortable: true },
                { field: 'UserName', title: '制单人', align: 'left', width: 50, sortable: true },
                { field: 'WareHouseName', title: '仓库名称', width: 50, align: 'left', sortable: true },
                { field: 'InOutMethod', title: '类型', width: 50, align: 'left', sortable: true },
                {
                    field: 'IsCheckAccount', title: '是否扎帐', width: 50, align: 'left', sortable: true,formatter: function (value, row, index) {
                        if (value=="0") {
                            return "否";
                        }
                        else {
                            return "是";
                        }
                    } }
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
                text: '单据扎帐',
                iconCls: 'icon-ok',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getChecked");
                    if (row.length>0) {
                        var arr = [];
                        for (var item in row) {
                            arr.push(row[item].Id + "|" + row[item].InOutMethod + "|" + row[item].IsCheckAccount);
                        }
                        $.tool.DataPost('ReceiptRevoke', 'CheckAccount', 'datastr=' + arr.join(","),
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data.substring(0, 5) == "false") {
                                    HDialog.Info(_Data.substring(6));
                                }
                                else {
                                    $('#SearchDlg').parent().appendTo($("form:first"));
                                    LoadList();
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                 
                    //Revoke(row)
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
                            arr.push(row[item].Id + "|" + row[item].InOutMethod + "|" + row[item].IsCheckAccount);
                        }
                        $.tool.DataPost('ReceiptRevoke', 'CancelCheckAccount', 'datastr=' + arr.join(","),
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data.substring(0, 5) == "false") {
                                    HDialog.Info(_Data.substring(6));
                                }
                                else {
                                    $('#SearchDlg').parent().appendTo($("form:first"));
                                    LoadList();
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }

                }
            }
        ];


        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=ReceiptRevoke&Command=CheckAccountList&' + $('#frmForm').serialize(),
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
                    //$.tool.MergeEasyUiGrid("TableContainer", "DepName");
                    $("#SearchDlg").dialog("close");

                }
            });
        }

        $('#SearchDlg').parent().appendTo($("form:first"));
        LoadList();

        function Detail(Id, OpType) {
            if (OpType == '入库')
            {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                HDialog.Open(w, h, '../Mt/StorageDetail.aspx?Id=' + Id + '&OpType=edit', '入库单', true, function callback(_Data) {
                    if (_Data != '') {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        LoadList();
                    }
                });
            }
            else
            {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                HDialog.Open(w, h, '../Mt/CheckOutDetail.aspx?Id=' + Id + '&OpType=edit', '出库单', true, function callback(_Data) {
                    if (_Data != '') {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        LoadList();
                    }
                });
            }

        }
    </script>
    </form>
</body>
</html>