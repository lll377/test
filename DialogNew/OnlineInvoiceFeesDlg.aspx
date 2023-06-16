<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineInvoiceFeesDlg.aspx.cs" Inherits="M_Main.DialogNew.OnlineInvoiceFeesDlg" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="CustID" runat="server" name="CustID" type="hidden" />

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 240px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">业务类型
                    </td>
                    <td class="TdContent">
                        <select id="OnlineInvoiceType" name="OnlineInvoiceType" runat="server">
                            <option value="0" selected>全部
                            </option>
                            <option value="1">实收
                            </option>
                            <option value="2">预收
                            </option>
                            <option value="3">单项预存
                            </option>
                            <option value="4">预存冲抵
                            </option>
                            <option value="5">人工托收
                            </option>
                        </select></td>
                    <td class="TdTitle">房屋编号
                    </td>
                    <td class="TdContent">
                        <select id="SelRoomID" name="SelRoomID" runat="server"></select>
                    </td>


                </tr>
                <tr>
                    <td class="TdTitle">费用时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EditBeginDate" runat="server" name="EditBeginDate" /></td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" runat="server" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EditEndDate" name="EditEndDate" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">收款时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="SetBeginDate" runat="server" name="SetBeginDate" /></td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" runat="server" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="SetEndDate" name="SetEndDate" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">票据号
                    </td>
                    <td class="TdContent">
                        <input id="BillsSign" type="text" name="BillsSign" runat="server" /></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <a href="#" id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>


        <div class="SearchContainer" id="TableContainer">
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();


            var frozenColumns = [[
                { field: 'ck', checkbox: true },
                { field: 'FeesID', title: 'FeesID', hidden: true },
                { field: 'RecdID', title: 'RecdID', hidden: true },
                 {
                     field: 'OnlineInvoiceType', title: '业务类型', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                         var TypeName = '';
                         switch (row.OnlineInvoiceType) {
                             case "1":
                                 TypeName = '实收';
                                 break;
                             case "2":
                                 TypeName = '预收';
                                 break;
                             case "3":
                                 TypeName = '单项预存';
                                 break;
                             case "4":
                                 TypeName = '预存冲抵';
                                 break;
                             case "5":
                                 TypeName = '人工托收';
                                 break;
                         }
                         return TypeName;
                     }
                 },
                { field: 'CostName', title: '费用项目', width: 100, align: 'left', sortable: true },
                {
                    field: 'BillsDate', title: '收款日期', width: 150, align: 'left', sortable: true
                },
                 { field: 'ChargeAmount', title: '收款/冲抵金额', width: 100, align: 'left', sortable: true },
                { field: 'LateAmount', title: '合同违约金', width: 100, align: 'left', sortable: true },

            ]];

            var column = [[

                {
                    field: 'spmc', title: '商品名称', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'spsm', title: '商品税目', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'ggxh', title: '规格型号', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'dw', title: '单位', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'spsl', title: '商品数量', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'dj', title: '单价', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'je', title: '金额', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'sl', title: '税率', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'se', title: '税额', width: 100, align: 'left', sortable: true
                },

                { field: 'BillsSign', title: '票据号码', width: 100, align: 'left', sortable: true },

                {
                    field: 'FeesDueDate', title: '应收时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesStateDate', title: '开始时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '结束时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                        return str;
                    }
                }

            ]];
            var toolbar = [
                {
                    text: '确定选择',
                    iconCls: 'icon-save',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid('getChecked');
                        if (rows == "") {
                            HDialog.Info('请勾选费项!');
                            return;
                        } else {
                            var str = JSON.stringify(rows);
                            var res = "{\"total\":" + rows.length + ", \"rows\":" + str + "}";
                            HDialog.Close(res);
                        }
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                { text: '<font color=red>提示：请选择相同税率商品</font>' }
            ];


            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("ValueAddedTax", "OnlineInvoiceFeesList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    }
                });
                $("#SearchDlg").dialog("close");

            }
            LoadList();
        </script>
    </form>
</body>
</html>

