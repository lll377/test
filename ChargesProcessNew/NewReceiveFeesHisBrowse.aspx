<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewReceiveFeesHisBrowse.aspx.cs" Inherits="M_Main.ChargesProcessNew.NewReceiveFeesHisBrowse" %>


<!DOCTYPE html>
<html>
<head>
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

        <input type="hidden" id="RowData" name="RowData" runat="server" />
        <input type="button" id="print" name="print" runat="server" onserverclick="print_ServerClick" />
        <input type="button" id="printsel" name="printsel" runat="server" onserverclick="printsel_ServerClick" />
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 200px;">
            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" style="width: 82%;"
                            name="CustName" runat="server" disabled /><input id="CustID" style="width: 8px; height: 19px" type="hidden"
                                size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                    size="1" name="hiCustName" runat="server" /></td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">

                        <input id="RoomSign" style="width: 82%;"
                            name="RoomSign" runat="server" disabled />
                        <input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                            size="1" name="RoomID" runat="server" />
                        <input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                            size="1" name="hiRoomSign" runat="server" />
                    </td>
                </tr>
                <tr>

                    <td class="TdTitle">票据号</td>
                    <td class="TdContent">
                        <input id="BillsSign" style="width: 82%;" name="BillsSign" runat="server" />
                    </td>
                    <td class="TdTitle">收/退款人</td>
                    <td class="TdContent">
                        <input type="text" style="width: 82%;" id="UserName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">收/退款时间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="BillsDate1" style="width: 82%;" data-options="editable:false" class="easyui-datebox" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input type="text" id="BillsDate2" style="width: 82%;" data-options="editable:false" class="easyui-datebox" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否包含物业券</td>
                    <td class="TdContent" style="float:left;">
                        <input id="ChargeMode" type="checkbox" name="ChargeMode" style="width: 82%;" runat="server" />
                        <input type="hidden" id="hiChargeMode" name="hiChargeMode" value="" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">


                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">查询</a>&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>
                    </td>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");


                $('#RowData').hide();
                $('#print').hide();
                $('#printsel').hide();
            }
            InitFunction();


            function CancelParm() {
                $("#BillsDate1").datebox("setValue", '');
                $("#BillsDate2").datebox("setValue", '');
                $('#CustName').searchbox("setValue", '');
                $("#CustID").val("");

                $("#RoomID").val("");
                $("#RoomSign").searchbox("setValue", '');
                $("#BillsSign").val('');
                $("#UserName").val('');
            }


            var column = [[
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 120, align: 'left', sortable: true },
                { field: 'BillTypeName', title: '票据类别', width: 100, align: 'left', sortable: true },
                { field: 'BillsSign', title: '票据号码', width: 100, align: 'left', sortable: true },
                { field: 'ChequeBill', title: '支/汇票号', width: 100, align: 'left', sortable: true },
                { field: 'EinvoiceNos', title: '电子发票号码', width: 100, align: 'left', sortable: true },
                { field: 'BillsDate', title: '收费日期', width: 100, align: 'left', sortable: true },
                { field: 'ChargeMode', title: '收款/退款方式', width: 100, align: 'left', sortable: true },
                { field: 'UserName', title: '收款/退款人', width: 100, align: 'left', sortable: true },
                { field: 'PrintTimes', title: '打印次数', width: 70, align: 'left', sortable: true },
                { field: 'BillsAmount', title: '收费/退款金额', width: 100, align: 'left', sortable: true },
                { field: 'IsDeleteName', title: '是否作废', width: 70, align: 'left', sortable: true },
                { field: 'ReceMemo', title: '备注', width: 150, align: 'left', sortable: true },
                {
                    field: '预览', title: '预览', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {

                        var str = "";
                        if (row.ReceID != null) {
                            str = "<a href='javascript:void();' onclick=PrintSel('" + row.ReceID + "');>预览</a>";
                        }

                        return str;
                    }
                },
                {
                    field: '打印', title: '打印', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "";
                        if (row.ReceID != null) {
                            str = "<a href='javascript:void();' onclick=Print('" + row.ReceID + "');>打印</a>";
                        }
                        return str;
                    }
                },
                {
                    field: 'IsAudit', title: '是否冲销', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "否";

                        if (row.IsWriteOff == "1") {
                            str = "是";
                        }
                        return str;
                    }
                },
                {
                    field: 'AuditDate', title: '冲销时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.AuditDate, "yyyy-MM-dd");
                        return str;
                    }
                }

            ]];


            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }
            ];

            function Cheque(strReceID) {
                var w = 600;
                var h = 430;

                var conent = "../ChargesProcessNew/ChequeExChangeManage.aspx?ReceID=" + strReceID;

                HDialog.Open(w, h, conent, '支票', false, function callback(_Data) {

                });

            }
            function PrintSel(strReceID) {

                var row = $("#TableContainer").datagrid("getRows");
                for (var i = 0; i < row.length; i++) {
                    if (row[i].ReceID == strReceID) {
                        $('#RowData').val(JSON.stringify(row[i]));
                        $('#printsel').click();
                    }
                }

            }

            function Print(strReceID) {
                var row = $("#TableContainer").datagrid("getRows");
                for (var i = 0; i < row.length; i++) {
                    if (row[i].ReceID == strReceID) {
                        $('#RowData').val(JSON.stringify(row[i]));
                        $('#print').click();
                    }
                }

            }
            //var myview = $.extend({}, $.fn.datagrid.defaults.view, {
            //    renderFooter: function (target, container, frozen) {
            //        var opts = $.data(target, 'datagrid').options;
            //        var rows = $.data(target, 'datagrid').footer || [];
            //        var fields = $(target).datagrid('getColumnFields', frozen);
            //        var table = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'];

            //        for (var i = 0; i < rows.length; i++) {
            //            var styleValue = opts.rowStyler ? opts.rowStyler.call(target, i, rows[i]) : '';
            //            var style = styleValue ? 'style="' + styleValue + '"' : '';
            //            table.push('<tr class="datagrid-row" datagrid-row-index="' + i + '"' + style + '>');
            //            table.push(this.renderRow.call(this, target, fields, frozen, i, rows[i]));
            //            table.push('</tr>');
            //        }
            //        table.push('</tbody></table>');
            //        $(container).html(table.join(''));
            //    }
            //});

            function LoadList() {
                if ($('#ChargeMode').is(':checked')) {
                    $('#hiChargeMode').val('');
                } else {
                    $('#hiChargeMode').val('凤凰会物业券');
                }
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    showFooter: true,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("ReceiveFeesHis", "CustomerBillSign", "TableContainer", param);
                    },
                    rowStyler: function (rowIndex, rowData) {
                        //如果是页脚
                        if (rowData.Fids == 'footer') {
                            return 'background-color:#F4F4F4;border:none;'; // return inline style
                        }
                    },
                    onLoadSuccess: function (data) {
                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                Fids: 'footer',
                                CustName: "<span style='color:red'>小计</span>",
                                BillsAmount: "<span style='color:red'>" + compute("BillsAmount") + "</span>",
                                IsBank: 'footer'
                            }
                        ]);
                    }
                });
                $("#SearchDlg").dialog("close");

            }

            LoadList();

            $('#btnSave').click(function () {

                LoadList();

            });
            //指定列求和
            function compute(colName) {
                var rows = $('#TableContainer').datagrid('getRows');
                var total = 0;
                for (var i = 0; i < rows.length; i++) {
                    total += parseFloat(rows[i][colName]);
                }
                return ToDecimal(total, 2);
            }

        </script>
    </form>
</body>
</html>

