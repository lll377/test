<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ElectronicInvoiceSettingRight.aspx.cs" Inherits="M_Main.ChargesNew.ElectronicInvoiceSettingRight" %>

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
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

    <style type="text/css">
        #CostNames {
            width: 91.7%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }

        #CommNames {
            width: 91.7%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }
    </style>
</head>
<body>
    <form id="FinanceOverAccountsSetInfo" method="post" runat="server">
        <input id="CommIDs" name="CommIDs" value="" type="hidden" runat="server" />
        <input id="OrganCode" name="OrganCode" value="" type="hidden" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 187px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td>项目名称</td>
                    <td colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" ru="server" onclick="SelCommInfo();"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>收据抬头</td>
                    <td>
                        <input id="HeadTitle" name="HeadTitle" runat="server" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Search();">查询</a>
                    </td>
                </tr>
            </table>
        </div>

        <script type="text/javascript">

            $(function () {
                InitTableHeight();
                $.parser.parse("#SearchDlg");
                LoadList();
            });

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            function SelCommInfo() {
                HDialog.Open(700, 400, '../DialogNew/SelComm.aspx?IsCheck=0', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommIDs").val(arrRet.id);
                    $("#CommNames").val(arrRet.name);
                });
            }

            function Search() {
                LoadList();
            }

            var mainToolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($('#CommIDs').val() == '') {
                            HDialog.Info('请选择设置项目');
                            return false;
                        }
                        ViewDetail("新增收据信息", 'add', 0);
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            var mainColumn = [[
                { field: 'OrganName', title: '区域名称', width: 120, align: 'center', sortable: true },
                { field: 'CommName', title: '项目名称', width: 120, align: 'center', sortable: true },
                {
                    field: 'HeadTitle', title: '收据抬头', width: 120, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改收据信息','edit','" + row.IID + "');\">" + row.HeadTitle + "</a>";
                        return str;
                    }
                }
            ]];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: mainColumn,
                    rownumbers: true,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    border: false,
                    width: "100%",
                    toolbar: mainToolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("ElectronicInvoiceSetting", "SettingList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });
            }

            function ViewDetail(title, OpType, ID) {
                if (OpType == "edit") {
                    HDialog.Open(600, 350, '../ChargesNew/ElectronicInvoiceSettingAdd.aspx?IID=' + ID + '&OpType=' + OpType + '&CommID=' + $('#CommIDs').val(), title, false, function callback(_Data) {
                        //LoadList();
                    });
                }
                else {
                    HDialog.Open(600, 350, '../ChargesNew/ElectronicInvoiceSettingAdd.aspx?IID=' + ID + '&OpType=' + OpType + '&CommID=' + $('#CommIDs').val(), title, false, function callback(_Data) {
                        //LoadList();
                    });
                }
            }

        </script>
    </form>
</body>
</html>
