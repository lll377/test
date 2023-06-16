<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BankAccountInfoSet.aspx.cs" Inherits="M_Main.ChargesNew.BankAccountInfoSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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

    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
</head>
<body>
    <form id="FrmForm" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 200px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">企业名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="CommpanyName" name="CommpanyName" style="width: 150px" />
                    </td>
                    <td class="TdTitle">银行名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="BankName" name="BankName" style="width: 150px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>

    <script>
        $(function () {
            $("#TableContainer").css("height", $(window).height() + "px");
            LoadList();
        })

        var column = [[
            {
                field: 'CommpanyName', title: '企业名称', width: 150, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    return "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改信息','Edit','BID=" + row.BID + "');\">" + row.CommpanyName + "</a>";
                }
            },
            { field: 'BankName', title: '银行名称', width: 200, align: 'left', sortable: true },
            { field: 'BankBranches', title: '银行网点', width: 300, align: 'left', sortable: true },
            { field: 'BankAccount', title: '银行账号', width: 180, align: 'left', sortable: true },
            { field: 'UnitCode', title: '单位代码', width: 100, align: 'left', sortable: true },
            { field: 'PayType', title: '收款方式', width: 350, align: 'left', sortable: true },
            {
                field: 'IsDefault', title: '是否默认', width: 80, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = "";
                    if (row.IsDefault == 1) {
                        str = "<font  style='color:Red;'>是</font>";
                    }
                    else {
                        str = "<font  style='color:Green;'>否</font>";
                    }
                    return str;
                }
            }
        ]];

        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    ViewDetail("新增银行资料", 'Insert', null);
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var datarow = $("#TableContainer").datagrid("getSelected");
                    if (datarow == null) {
                        HDialog.Info('请选择删除项！');
                        return;
                    }
                    Deletes(datarow);
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');
                }
            }];

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                //frozenColumns: frozenColumns,
                remoteSort: false,
                fitColumns: false,
                rownumbers: true,
                freezeRow: 1,
                singleSelect: true,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                border: false,
                sortOrder: "asc",
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("BankAccountInfoSet", "GetList", "TableContainer", param);
                }
            });
            $("#SearchDlg").dialog("close");
        }

        //详细
        function ViewDetail(title, OpType, param, isAudit) {
            HDialog.Open(800, 250, '../ChargesNew/BankAccountInfoSetManage.aspx?' + param + '&OpType=' + OpType, title, true, function callback(_Data) {
                LoadList();
            });
        }

        //删除
        function Deletes(datarow) {
            $.messager.confirm('确定', '是否删除该项', function (r) {
                if (r) {
                    $.tool.DataGet('BankAccountInfoSet', 'deletes', 'BID=' + datarow.BID,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                HDialog.Info('删除成功');
                            }
                            else { HDialog.Info('删除失败'); }
                            LoadList();
                        }, null, null);
                }
            });
        }
    </script>
</body>
</html>
