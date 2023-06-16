<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewFeesDailyCorpCommissBrowse.aspx.cs" Inherits="M_Main.NoticesNew.NewFeesDailyCorpCommissBrowse" %>


<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
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
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script src="../jscript/jquery-datagird-extended.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>

    <script language="javascript" type="text/javascript">
    <!--
    function btnClear_OnClick() {
        document.getElementById('RegionSNum').value = "";
        document.getElementById('BuildSNum').value = "全部";
        document.getElementById('UserCode').value = "全部";
        document.getElementById('ChargeMode').value = "全部";
        document.getElementById('CustTypeID').value = "全部";
        document.getElementById('ChargeTypeID').value = "全部";
        document.getElementById('RoomState').value = "";

    }




    function Win_OnLoad() {
        var strPrintParms = getObject("PrintParms").value;
        if (strPrintParms != "") {
            showOperatWin(strPrintParms);

            getObject("PrintParms").value = "";
        }
    }

    </script>
</head>
<body>
    <form id="frmForm" runat="server">

        <input style="width: 8px" id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server" />
        <input style="width: 8px" id="hiLoginUserCode" size="1" type="hidden" name="hiLoginUserCode" runat="server" />
        <input style="width: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <input style="width: 8px" id="hiLoadFeesPaid" size="1" type="hidden" name="hiLoadFeesPaid" runat="server" />
        <input style="width: 8px" id="hiLoadFeesPaidPrec" size="1" type="hidden" name="hiLoadFeesPaidPrec" runat="server" />
        <input style="width: 8px" id="hiLoadFeesPaidLt" size="1" type="hidden" name="hiLoadFeesPaidLt" runat="server" />
        <input style="width: 8px" id="ApplicationPath" size="1" type="hidden" name="ApplicationPath" runat="server" />
        <input style="width: 8px" id="hiDailyID" size="1" type="hidden" name="hiDailyID" runat="server" />

        <input style="width: 32px" id="PageIndex" size="1" type="hidden" name="PageIndex"
            runat="server"><input style="height: 21px; width: 24px" id="PrintParms" size="1" type="hidden" name="PrintParms"
                runat="server"><input style="width: 24px" id="CostGeneType" size="1" type="hidden" name="CostGeneType"
                    runat="server"><input style="height: 21px; width: 24px" id="OptCode" size="1" type="hidden" name="OptCode"
                        runat="server"><input style="height: 21px; width: 24px" id="Flag" size="1" type="hidden" name="Flag" runat="server">
        <input style="width: 8px" id="hiStatist" size="1" type="hidden" name="hiStatist" runat="server" />
        <div style="width: 100%; background-color: #ffffff;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 300px;">
            <table class="DialogTable">
                <tr>
                    <td colspan="4" align="center" style="height:100">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">开始时间从
                    </td>
                    <td class="DialogTdContent" colspan="3">
                        <input type="text" class="easyui-datetimebox" id="EditBeginDate" runat="server" name="EditBeginDate" />&nbsp;到&nbsp;<input type="text" runat="server" class="easyui-datetimebox" id="EditEndDate" name="EditEndDate" />

                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:ExcuteOnServer(); ">查询</a>

                    </td>
                </tr>
            </table>
        </div>
        <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 880px; height: 200px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red'>
                <tr>
                    <td rowspan="4" width="40px" valign="top" style='color: Black'>备注：</td>
                    <td>1、收入合计=实收+预交冲抵。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>2、收款合计=本期实收-本期退款+本期预交收款-本期预交退款+本期零头结转。<br />
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>3、前期预交余额、本期预交收款、本期预交退款、期末预交余额均包含单项预存费用。
                    </td>
                </tr>
                <tr>
                    <td>4、如果存在综合预存，那么可能会用综合预存去冲抵某一费项，所以某一费项的前期预交余额+本期预交收款-本期预交退款-本期预交冲抵，不一定等于期末预交余额，此时只能通过合计进行检核。</td>
                </tr>
            </table>
        </div>



        <input style="width: 8px" id="CostIDs" class="easyui-validatebox" size="1"
            type="hidden" name="CostIDs" runat="server">
        <input style="width: 8px" id="StanIDs" class="easyui-validatebox" size="1"
            type="hidden" name="StanIDs" runat="server">
        <input style="width: 8px" id="hiStanNames" class="easyui-validatebox" size="1"
            type="hidden" name="hiStanNames" runat="server">
        <input style="width: 8px" id="CostID" class="easyui-validatebox" size="1"
            type="hidden" name="CostID" runat="server">
        <input style="width: 8px" id="OPType" class="easyui-validatebox" size="1"
            type="hidden" name="OPType" runat="server">
        <input type="hidden" id="IsFirstLoad" name="IsFirstLoad" value="1" runat="server" />
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var frozenColumns = [
                [{ colspan: 2, title: '费用项目' }],
                [{ field: 'CorpCostName', title: '大项', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'CostName', title: '小项', fixed: true, align: 'left', sortable: true, width: 150 }]];


            var column = [[{ colspan: 3, title: '本期收入' },
            {
                field: 'RefundAmount', rowspan: 2, title: '退款', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                }
            },
            {
                field: 'BeforePrecAmount', rowspan: 2, title: '前期预交余额', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                }
            },
            {
                field: 'CurrPrecAmount', rowspan: 2, title: '本期预交收款', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                }
            },
            {
                field: 'RefundPrecAmount', rowspan: 2, title: '本期预交退款', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                }
            },
            {
                field: 'OffsetPrecTotalAmount', rowspan: 2, title: '本期预交冲抵', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                }
            },
            //{ field: 'OffsetPrec1Amount', rowspan: 2, title: '单项预存冲抵', fixed: true, align: 'left', sortable: true, width: 100 },
            //{ field: 'OffsetPrec2Amount', rowspan: 2, title: '综合预存冲抵', fixed: true, align: 'left', sortable: true, width: 100 },
            //{ field: 'OffsetPrec3Amount', rowspan: 2, title: '预收费用冲抵', fixed: true, align: 'left', sortable: true, width: 100 },
            {
                field: 'AfterPrecAmount', rowspan: 2, title: '期末预交余额', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                }
            },
            {
                field: 'PerSurplusAmount', rowspan: 2, title: '本期零头结转', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                }
            },
            {
                field: 'ExpenseAmount', rowspan: 2, title: '本期付款', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                }
            }], [
                {
                    field: 'TotalAmount', title: '合计', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                    }
                },
                {
                    field: 'ChargeAmount', title: '实收', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                    }
                },
                {
                    field: 'OffsetPrecAmount', title: '预交冲抵', fixed: true, align: 'left', sortable: true, width: 100, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                    }
                }
            ]];

            var Headcolumn = [[{ colspan: 2, title: '费用项目' }, { colspan: 3, title: '本期收入' },
            { field: 'RefundAmount', rowspan: 2, title: '退款', fixed: true, align: 'left', sortable: true, width: 100 },
            { field: 'BeforePrecAmount', rowspan: 2, title: '前期预交余额', fixed: true, align: 'left', sortable: true, width: 100 },
            { field: 'CurrPrecAmount', rowspan: 2, title: '本期预交收款', fixed: true, align: 'left', sortable: true, width: 100 },
            { field: 'RefundPrecAmount', rowspan: 2, title: '本期预交退款', fixed: true, align: 'left', sortable: true, width: 100 },
            { field: 'OffsetPrecTotalAmount', rowspan: 2, title: '本期预交冲抵', fixed: true, align: 'left', sortable: true, width: 100 },
            //{ field: 'OffsetPrec1Amount', rowspan: 2, title: '单项预存冲抵', fixed: true, align: 'left', sortable: true, width: 100 },
            //{ field: 'OffsetPrec2Amount', rowspan: 2, title: '综合预存冲抵', fixed: true, align: 'left', sortable: true, width: 100 },
            //{ field: 'OffsetPrec3Amount', rowspan: 2, title: '预收费用冲抵', fixed: true, align: 'left', sortable: true, width: 100 },
            { field: 'AfterPrecAmount', rowspan: 2, title: '期末预交余额', fixed: true, align: 'left', sortable: true, width: 100 },
            { field: 'PerSurplusAmount', rowspan: 2, title: '本期零头结转', fixed: true, align: 'left', sortable: true, width: 100 },
            { field: 'ExpenseAmount', rowspan: 2, title: '本期付款', fixed: true, align: 'left', sortable: true, width: 100 }], [
                { field: 'CorpCostName', title: '大项', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'CostName', title: '费用名称', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'TotalAmount', title: '合计', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'ChargeAmount', title: '实收', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'OffsetPrecAmount', title: '预交冲抵', fixed: true, align: 'left', sortable: true, width: 100 }
            ]];

            var ExcelCol = [[
                { field: 'CorpCostName', title: '费用大项', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'CostName', title: '费用名称', fixed: true, align: 'left', sortable: true, width: 150 },
                {
                    field: 'TotalAmount', title: '合计', fixed: true, align: 'left', sortable: true, width: 100
                },
                {
                    field: 'ChargeAmount', title: '实收', fixed: true, align: 'left', sortable: true, width: 100
                },
                {
                    field: 'OffsetPrecAmount', title: '预交冲抵', fixed: true, align: 'left', sortable: true, width: 100
                },
                {
                    field: 'RefundAmount', rowspan: 2, title: '退款', fixed: true, align: 'left', sortable: true, width: 100
                },
                {
                    field: 'BeforePrecAmount', rowspan: 2, title: '前期预交余额', fixed: true, align: 'left', sortable: true, width: 100
                },
                {
                    field: 'CurrPrecAmount', rowspan: 2, title: '本期预交收款', fixed: true, align: 'left', sortable: true, width: 100
                },
                {
                    field: 'RefundPrecAmount', rowspan: 2, title: '本期预交退款', fixed: true, align: 'left', sortable: true, width: 100
                },
                {
                    field: 'OffsetPrecTotalAmount', rowspan: 2, title: '本期预交冲抵', fixed: true, align: 'left', sortable: true, width: 100
                },
                //{ field: 'OffsetPrec1Amount', rowspan: 2, title: '单项预存冲抵', fixed: true, align: 'left', sortable: true, width: 100 },
                //{ field: 'OffsetPrec2Amount', rowspan: 2, title: '综合预存冲抵', fixed: true, align: 'left', sortable: true, width: 100 },
                //{ field: 'OffsetPrec3Amount', rowspan: 2, title: '预收费用冲抵', fixed: true, align: 'left', sortable: true, width: 100 },
                {
                    field: 'AfterPrecAmount', rowspan: 2, title: '期末预交余额', fixed: true, align: 'left', sortable: true, width: 100
                },
                {
                    field: 'PerSurplusAmount', rowspan: 2, title: '本期零头结转', fixed: true, align: 'left', sortable: true, width: 100
                },
                {
                    field: 'ExpenseAmount', rowspan: 2, title: '本期付款', fixed: true, align: 'left', sortable: true, width: 100
                }
            ]];

            function setIsSQLData() {

                document.getElementById('hiIsSQLData').value = 1;
            }
            function SearchDlg2() {
                $('#DlgMemo').parent().appendTo($("form:first"))
                $('#DlgMemo').dialog('open');
            }

            function Print() {
                $.tool.DataGet('FeesNotices', 'DailyCorpCommissPrint', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Data = eval("(" + _Data + ")"); //转换为json对象

                        if (Data.rows.length > 0) {
                            obj = Data.rows[0];
                            if (obj.EtFileName != "" && obj.FileName != "") {

                                var ReportURL = "../include/print.aspx?wj=" + obj.FileName + "&et=" + obj.EtFileName + ""
                                showOperatWin(ReportURL);
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成报表');
                        }
                        else {
                            Export('缴款日报表Excel', $('#TableContainer'));
                        }

                    }
                }, '-', {
                    text: '打印',
                    iconCls: 'icon-print',
                    handler: function () {
                        Print();
                    }
                }, '-',
                {
                    text: '备注',
                    iconCls: 'icon-help',
                    handler: function () {
                        $('#DlgMemo').parent().appendTo($("form:first"))
                        $('#DlgMemo').dialog('open');
                    }
                }];

            


            function Export(strXlsName, exportGrid) {
                var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                var l = $('<input type="hidden" id="txtName" name="txtName" />');
                i.val(ChangeToTable2(exportGrid, Headcolumn, ExcelCol));
                i.appendTo(f);
                l.val(strXlsName);
                l.appendTo(f);
                f.appendTo(document.body).submit();
                document.body.removeChild(f);
            }

            function LoadList(page, rows) {
                $.tool.DataPost('FeesNotices', 'DailyCorpCommiss', "page=" + page + "&rows=" + rows + "&" + $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Data = eval("(" + _Data + ")"); //转换为json对象

                        obj = Data.rows[0];
                        var title = "";
                        var EndDate = "";
                        try {
                            title = "时间从：" + obj.StartDate + "--" + obj.EndDate;
                        }
                        catch (e) {
                            title = "";
                        }
                        toolbar = [
                            {
                                text: '筛选',
                                iconCls: 'icon-search',
                                handler: function () {
                                    $('#SearchDlg').parent().appendTo($("form:first"))
                                    $('#SearchDlg').dialog('open');

                                }
                            }, '-',
                            {
                                text: '导出Excel',
                                iconCls: 'icon-page_white_excel',
                                handler: function () {
                                    var rowData = $('#TableContainer').datagrid('getData');
                                    if (rowData == '') {
                                        HDialog.Info('请先生成报表');
                                    }
                                    else {
                                        Export('缴款日报表Excel', $('#TableContainer'));
                                    }

                                }
                            }, '-', {
                                text: '打印',
                                iconCls: 'icon-print',
                                handler: function () {
                                    Print();

                                }
                            }, '-',
                            {
                                text: '备注',
                                iconCls: 'icon-help',
                                handler: function () {
                                    $('#DlgMemo').parent().appendTo($("form:first"))
                                    $('#DlgMemo').dialog('open');

                                }
                            }, '-',
                            {
                                text: "<span style='color:red'>" + title + "</span>"
                            }
                        ];

                        $("#TableContainer").datagrid({
                            data: Data,
                            method: "post",
                            title: '',
                            loadMsg: '',
                            pageSize: rows,
                            pageList: top.ListPageList,
                            columns: column,
                            frozenColumns: frozenColumns,
                            fitColumns: true,
                            singleSelect: true,
                            pagination: true,
                            remoteSort: false,
                            nowrap: false,
                            width: "100%",
                            border: false,
                            toolbar: toolbar,
                            rownumbers: true,
                            sortOrder: "asc",
                            onAfter: function (target) {
                                document.getElementById('hiIsSQLData').value = 0;
                                if (document.getElementById('hiIsSQLData').value != "-1") {
                                    document.getElementById('hiIsSQLData').value = 0;
                                }
                                var pg = $("#TableContainer").datagrid("getPager");
                                if (pg) {
                                    $(pg).pagination({
                                        onBeforeRefresh: function () {
                                        },
                                        onRefresh: function (pageNumber, pageSize) {
                                        },
                                        onChangePageSize: function () {
                                        },
                                        onSelectPage: function (Pn, Ps) {
                                            LoadList(Pn, Ps);

                                            if ($('#TableContainer').datagrid('options') != null) {
                                                $('#TableContainer').datagrid('options').pageNumber = Pn;
                                                $('#TableContainer').datagrid('options').pageSize = Ps;
                                            }
                                        }
                                    });
                                }
                            },
                            rowStyler: function (index, row) {
                                if (row.StatType == 1) {
                                    return 'color:red;';
                                }
                            },
                            onLoadSuccess: function (data) {
                                //修改 IsFirstLoad 为0代表不是第一次加载了
                                $('#IsFirstLoad').val("0");
                            },
                            onLoadError: function () {
                            }
                        });
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });
            }

            document.getElementById('hiIsSQLData').value = -1;

            LoadList(1, top.ListPageSize);


            function ExcuteOnServer() {

                document.getElementById('hiIsSQLData').value = "1";
                LoadList(1, top.ListPageSize);
                $('#SearchDlg').dialog('close');
            }


            function formatNumberRgx(num) {
                var parts = num.toString().split(".");
                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                return parts.join(".");
            };

        </script>


    </form>
</body>
</html>
