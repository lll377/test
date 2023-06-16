<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesReportNew1.aspx.cs" Inherits="M_Main.StatisReport.FeesReportNew1" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/export.js"></script>

    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: 230px;
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

        #CostNames {
            width: 550px;
            height: 30px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }

        #CommNames {
            width: 550px;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }
    </style>

    <script type="text/javascript">

        function Win_OnLoad() {
            var strPrintParms = getObject("PrintParms").value;
            if (strPrintParms != "") {
                showOperatWin(strPrintParms);

                getObject("PrintParms").value = "";
            }
        }

    </script>
</head>
<body scroll="no">
    <form id="NewFeesDueCutSearch" runat="server">
        <input id="AllData" size="1" type="hidden" name="AllData" runat="server" />
        <input id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <input id="IsGather" type="hidden" size="1" name="IsGather" runat="server" />
        <input id="hidCommId" type="hidden" name="hidCommId" runat="server" />
        <input id="hiStatisMome" type="hidden" name="hiStatisMome" runat="server" />
        <input id="hiCompanyID" type="hidden" name="hiCompanyID" runat="server" />
        <input id="hiCorpCostID" type="hidden" name="hiCorpCostID" runat="server" />
        <input id="hiDetailType" type="hidden" name="hiDetailType" runat="server" />
        <input id="hiIsPrec" type="hidden" name="hiIsPrec" runat="server" />
        <input type="checkbox" id="IsPrec" name="IsPrec" style="display: none;" />

        <input id="HiIsAll" type="hidden" name="HiIsAll" runat="server" value="1" />

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 820px; height: 260px; padding: 10px;">
            <table style="width: 100%; overflow: hidden;" class="DialogTable">

                <tr>
                    <td class="TdTitle" style="width: 200px;">管理项目</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();"></textarea>
                        <input id="hiCommNames" type="hidden"
                            name="hiCommNames" runat="server"><input id="CommIDs" type="hidden"
                                name="CommIDs" runat="server">
                        <input id="hiCommID" type="hidden" name="hiCommID" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch" colspan="3">
                        <input class="easyui-searchbox" searcher="SelCost" id="CostNames"
                            name="CostNames" runat="server" /><input id="CorpCostIDs" type="hidden"
                                name="CorpCostIDs" runat="server" /><input id="hiCostNames" type="hidden"
                                    name="hiCostNames" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">费项类型</td>
                    <td class="TdContentSearch">
                        <select id="ListType" name="ListType" runat="server">
                            <option value="1">费用大项</option>
                            <option value="0" selected="selected">费用小项</option>
                        </select>
                    </td>
                    <td class="TdTitle">交房状态</td>
                    <td class="TdContentSearch">
                        <input id="RoomStateNames" class="easyui-searchbox" searcher="SelRoomState"
                            name="RoomStateNames" runat="server" /><input id="RoomStates"
                                type="hidden" name="RoomStates" runat="server" />
                        <input id="hiRoomStateNames"
                            type="hidden" name="hiRoomStateNames" runat="server" />
                        <input style="width: 30px;" id="RoomStateNum" type="hidden"
                            size="14" name="RoomStateNum" runat="server" />
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle" style="width: 150px;">费用开始时间</td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" style="width: 163px;" onclick="WdatePicker({ startDate: '%y-%M', dateFmt: 'yyyy-MM', alwaysUseStartDate: true })" id="ChargeBeginDate" runat="server" name="ChargeBeginDate" /></td>
                    <td class="TdTitle" style="width: 150px;">费用结束时间</td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" style="width: 163px;" runat="server" onclick="WdatePicker({ startDate: '%y-%M', dateFmt: 'yyyy-MM', alwaysUseStartDate: true })" id="ChargeEndDate" name="ChargeEndDate" /></td>
                </tr>




                <tr>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch">
                        <input type="checkbox" id="IsRefund" name="IsRefund" style="display: none;" />
                        <input id="hiIsRefund" type="hidden" name="hiIsRefund" runat="server" style="display: none;">
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="JavaScript:ExcuteOnServer();">统计</a>
                    </td>
                </tr>
            </table>
        </div>

        <div id="DlgDetail" class="easyui-dialog" title="收费率明细" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1024px; height: 500px; padding: 10px;">
            <div id='tb'>
                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ToExcel();">Excel导出</a>
            </div>
            <div style="width: 90%; background-color: #cccccc;" id="TableContainerDetail"></div>
        </div>

        <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 750px; height: 320px; padding-left: 10px; padding-top: 5px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: red; font-size: 14px;'>
                <tr>
                    <td valign="top" style='color: red; font-size: 14px;'>备注：<br />
                        1、用于统计某一月或某几月系统中实际生成的应收费用金额，以及不同月份应收费用差异金额的原因分析；“T+1”表示不管统计条件如何设置，数据范围截止上日；<br />
                        2、交房状态：是指生成费用时的交房状态；<br />
                        3、接管户数：房屋“物业接管时间”≤当月31日的户数；同一月份，同一项目、各个费项的接管户数相同；“物业接管时间”为空的房屋不纳入统计；<br />
                        4、交房户数：房屋“实际交房时间”≤当月31日的户数；同一月份，同一项目、各个费项的接管户数相同；“实际交房时间”为空的房屋不纳入统计；<br />
                        5、计费户数：某一费项“计费户数”为当月生成了该费项应收费用的户数；全部费项“计费户数”为当月生成了任何一个费项应收费用的户数；多个费项均生成了应收费用时，户数不重复计算；如果没有房号的客户也生成了应收费用，每个客户作为一户计算；<br />
                        6、应收金额：当月生成的应收费用金额；<br />
                        7、较上月差异金额：当月应收较上月应收增减金额，点击项目层级某一费项的“较上月差异金额”，查看当月与上月差异户数明细。<br />

                    </td>
                </tr>
            </table>
        </div>

        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>
        <input type="hidden" id="IsFirstLoad" name="IsFirstLoad" value="1" runat="server" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            $(function () {
                $("#CustTypeID").combobox('setValue', '');
                $("#ChargeMode").combobox('setValue', '');
                var hidCommId = parseInt($("#hidCommId").val());
                if (hidCommId == 0) {
                    $("#StatisMome").parent().parent().hide();
                }
            });

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $("#TableContainerDetail").css("height", "440px");
                var travelExpenseFrame = document.getElementById("pag");
                if ($("#hiCommID").val() != 0) {
                    $("#CommNames").attr('disabled', 'true');
                    $("#DiyTr").show();
                } else {
                    $("#DiyTr").hide();
                }
            }

            InitTableHeight();

            var Headcolumn = [
                [
                    {
                        title: '收费率报表（按金额）', colspan: 21
                    }
                ],
                [
                    {
                        title: '费用截止时间:' + $('#CutYearMonth').val() + ' 收款时间从:' + $('#ChargeBeginDate').val() + '到' + $('#ChargeEndDate').val(), colspan: 21, align: 'left'
                    }
                ],
                [
                    { field: 'Company', title: '单位', align: 'left', sortable: true, width: 100 },
                    { field: 'CorpCostName', title: '费用名称', align: 'left', sortable: true, width: 100 },

                    { field: '期初往年欠费', title: '期初往年欠费', align: 'center', sortable: true, width: 120 },
                    { field: '本年前期欠费', title: '本年前期欠费', align: 'center', sortable: true, width: 120 },

                    { field: '本月应收', title: '本月应收', align: 'center', sortable: true, width: 120 },

                    { field: '实收往年', title: '往年', align: 'center', sortable: true, width: 120 },
                    { field: '实收本月', title: '本月', align: 'center', sortable: true, width: 120 },
                    { field: '实收本年', title: '本年', align: 'center', sortable: true, width: 120 },
                    { field: '实收小计', title: '小计', align: 'center', sortable: true, width: 120 },

                    { field: '冲抵往年', title: '往年', align: 'center', sortable: true, width: 120 },
                    { field: '冲抵本月', title: '本月', align: 'center', sortable: true, width: 120 },
                    { field: '冲抵本年', title: '本年', align: 'center', sortable: true, width: 120 },
                    { field: '冲抵小计', title: '小计', align: 'center', sortable: true, width: 120 },

                    { field: '减免往年', title: '往年', align: 'center', sortable: true, width: 120 },
                    { field: '减免本月', title: '本月', align: 'center', sortable: true, width: 120 },
                    { field: '减免本年', title: '本年', align: 'center', sortable: true, width: 120 },
                    { field: '减免小计', title: '小计', align: 'center', sortable: true, width: 120 },

                    { field: '欠收往年', title: '欠收往年', align: 'center', sortable: true, width: 120 },
                    { field: '欠收本年', title: '欠收本年', align: 'center', sortable: true, width: 120 },
                    { field: '欠收小计', title: '欠收小计', align: 'center', sortable: true, width: 120 },

                    {
                        field: '往年欠费回收率', title: '往年欠费回收率(%)', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return value + "%";
                            }
                        }
                    },
                    {
                        field: '本月收缴率', title: '本月收缴率(%)', align: 'center', sortable: true, width: 500, formatter: function (value) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    }
                ]
            ];

            var ExcelCol = [
                { field: 'Company', title: '单位', align: 'left', sortable: true, width: 100 },
                { field: 'CorpCostName', title: '费用名称', align: 'left', sortable: true, width: 100 },

                { field: '期初往年欠费', title: '期初往年欠费', align: 'center', sortable: true, width: 120 },
                { field: '本年前期欠费', title: '本年前期欠费', align: 'center', sortable: true, width: 120 },

                { field: '本月应收', title: '本月应收', align: 'center', sortable: true, width: 120 },

                { field: '实收往年', title: '往年', align: 'center', sortable: true, width: 120 },
                { field: '实收本月', title: '本月', align: 'center', sortable: true, width: 120 },
                { field: '实收本年', title: '本年', align: 'center', sortable: true, width: 120 },
                { field: '实收小计', title: '小计', align: 'center', sortable: true, width: 120 },

                { field: '冲抵往年', title: '往年', align: 'center', sortable: true, width: 120 },
                { field: '冲抵本月', title: '本月', align: 'center', sortable: true, width: 120 },
                { field: '冲抵本年', title: '本年', align: 'center', sortable: true, width: 120 },
                { field: '冲抵小计', title: '小计', align: 'center', sortable: true, width: 120 },

                { field: '减免往年', title: '往年', align: 'center', sortable: true, width: 120 },
                { field: '减免本月', title: '本月', align: 'center', sortable: true, width: 120 },
                { field: '减免本年', title: '本年', align: 'center', sortable: true, width: 120 },
                { field: '减免小计', title: '小计', align: 'center', sortable: true, width: 120 },

                { field: '欠收往年', title: '欠收往年', align: 'center', sortable: true, width: 120 },
                { field: '欠收本年', title: '欠收本年', align: 'center', sortable: true, width: 120 },
                { field: '欠收小计', title: '欠收小计', align: 'center', sortable: true, width: 120 },

                { field: '往年欠费回收率', title: '往年欠费回收率(%)', align: 'center', sortable: true, width: 160 },
                { field: '本月收缴率', title: '本月收缴率(%)', align: 'center', sortable: true, width: 500 }
            ];

            var column = [
                [
                    {
                        colspan: 1, rowspan: 2, width: 100, align: 'center', field: '应收合计', title: '应收合计', formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0.00);
                            }
                        }
                    },
                    { colspan: 5, title: 'X月' }
                ],
                [
                    {
                        field: '接管户数1', title: '接管户数(1)', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0.00);
                            }
                        }
                    },
                    {
                        field: '交房户数1', title: '交房户数(2)', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0.00);
                            }
                        }
                    },
                    {
                        field: '计费户数1', title: '计费户数(3)', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0.00);
                            }
                        }
                    },
                    {
                        field: '应收金额1', title: '应收金额(4)', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0.00);
                            }
                        }
                    },
                    {
                        field: '环比及差异1', title: '环比及差异(5)', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0.00);
                            }
                        }
                    }

                ]
            ];

            var frozenColumns = [[
                { field: 'OrganNameNew', title: '项目名称', align: 'left', sortable: true, width: 300 },
                { field: 'CorpCostName', title: '费用名称', align: 'left', sortable: true, width: 100 },
            ]];

            function SearchDlg() {
                btnClear_OnClick();
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
            function SearchDlg2() {
                $('#DlgMemo').parent().appendTo($("form:first"))
                $('#DlgMemo').dialog('open');
            }

            function setIsSQLData() {

                document.getElementById('hiIsSQLData').value = 1;

                var vIsPrec = document.getElementById('IsPrec').checked;
                if (vIsPrec) {
                    document.getElementById('hiIsPrec').value = "1";
                }
                else {
                    document.getElementById('hiIsPrec').value = "0";
                }

                var vIsRefund = document.getElementById('IsRefund').checked;
                if (vIsRefund) {
                    document.getElementById('hiIsRefund').value = "1";
                }
                else {
                    document.getElementById('hiIsRefund').value = "0";
                }
            }

            var intervalProcess;

            var toolbar = [
                {
                    text: '统计',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#IsGather').val("0");
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }, '-',
                {
                    text: '显示明细',
                    iconCls: 'icon-search',
                    handler: function () {
                        $("#HiIsAll").val("");
                        LoadList(1, 500);

                    }
                }, '-',
                {
                    text: '显示汇总',
                    iconCls: 'icon-search',
                    handler: function () {
                        $("#HiIsAll").val("1");
                        LoadList(1, 500);

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
                            Export('应收统计报表Excel', $('#TableContainer'));
                        }
                    }
                }, '-',
                {
                    text: '备注',
                    iconCls: 'icon-help',
                    handler: function () {
                        $('#DlgMemo').parent().appendTo($("form:first"))
                        $('#DlgMemo').dialog('open');
                    }
                }
            ];



        </script>

        <script type="text/javascript">
            var ProgressInterval;

            function OpenDetail(commid, y, m, corpcostid) {
                var w = $(window).width() * 0.8;
                var h = $(window).height() * 0.8;

                HDialog.Open(w, h, "../StatisReport/FeesReportNew1Detail.aspx?CommID=" + commid + "&DiffMonth=" + y + "-" + m + "&CorpCostID=" + corpcostid + "&Ram=" + Math.random(), '差异明细表', false, function (_data) {

                });
            }

            function InitColums() {
                var c1 = "", c2 = "";
                var begintime = new Date($("#ChargeBeginDate").val());
                var endtime = new Date($("#ChargeEndDate").val());

                for (var i = 1; i < 13; i++) {
                    var m = begintime.getMonth() + 1;
                    c1 += " ,{ colspan: 6, title: '" + begintime.getFullYear() + "-" + m + "月' }";

                    c2 += " { field: '接管户数" + i + "', title: '接管户数(1)', align: 'center', sortable: true, width: 120,formatter: function (value, row, index){var str = value; if(str!=\"\"){return formatNumberRgx(str)}else{return '0.00'}} },";
                    c2 += " { field: '交房户数" + i + "', title: '交房户数(2)', align: 'center', sortable: true, width: 120,formatter: function (value, row, index){var str = value; if(str!=\"\"){return formatNumberRgx(str)}else{return '0.00'}} },";
                    c2 += " { field: '收费面积" + i + "', title: '收费面积(3)', align: 'center', sortable: true, width: 120,formatter: function (value, row, index){var str = value; if(str!=\"\"){return formatNumberRgx(str)}else{return '0.00'}} },";
                    c2 += " { field: '计费户数" + i + "', title: '计费户数(4)', align: 'center', sortable: true, width: 120,formatter: function (value, row, index){var str = value; if(str!=\"\"){return formatNumberRgx(str)}else{return '0.00'}} },";
                    c2 += " { field: '应收金额" + i + "', title: '应收金额(5)', align: 'center', sortable: true, width: 120,formatter: function (value, row, index){var str = value; if(str!=\"\"){return formatNumberRgx(str)}else{return '0.00'}} },";
                    c2 += " { field: '环比及差异金额" + i + "', title: '较上月差异金额(6)', align: 'center', sortable: true, width: 120 , formatter: function (value, row, index) {";
                    c2 += "  var str =  formatNumberRgx(value);  if ( row.CommID != \"999999\"  && row.CommID != \"undefined\"  && row.CorpCostName != \"全部费项\") {";
                    c2 += "       str = '<a style=\"color:blue;\" href=\"#\" onclick=\"OpenDetail(' + row.CommID + '," + begintime.getFullYear() + "," + m + ",' + row.CorpCostid + ')\" >'+str+'</a> '; } ";
                    c2 += " else{ if(str==\"\"){ str='0.00'}else{ str =  formatNumberRgx(value);}  }";
                    c2 += "     return  str ;";
                    c2 += " } },";


                    m = m + 1;
                    var tt = "";
                    if (m == 13) {
                        tt = (begintime.getFullYear() + 1) + "-01"
                    }
                    else {
                        tt = begintime.getFullYear() + "-" + m
                    }
                    begintime = new Date(tt);

                    if (begintime > endtime) {
                        break;
                    }
                }

                var columStr = " [ [";
                columStr += "       { colspan: 1, rowspan: 2, width: 100, align: 'center', field: '应收合计', title: '应收合计',formatter: function (value, row, index){var str = value; if(str!=\"\"){return formatNumberRgx(str)}else{return '0.00'}} }";
                columStr += c1;
                columStr += "  ], [" + c2;
                columStr += "  ] ]";
                //alert(columStr);
                console.log(columStr);
                column = eval("(" + columStr + ")");

            }


            function InitExcelColums() {
                var c1 = "", c2 = "";
                var begintime = new Date($("#ChargeBeginDate").val());
                var endtime = new Date($("#ChargeEndDate").val());
                var colSum = 3;
                for (var i = 1; i < 13; i++) {
                    colSum += 5;
                    var m = begintime.getMonth() + 1;
                    c1 += " ,{ colspan: 6, title: '" + begintime.getFullYear() + "-" + m + "月' }";

                    c2 += " { field: '接管户数" + i + "', title: '接管户数', align: 'center', sortable: true, width: 120, formatter: function (value, row, index){var str = value; if(str!=\"\"){return formatNumberRgx(str)}else{return '0.00'}} },";
                    c2 += " { field: '交房户数" + i + "', title: '交房户数', align: 'center', sortable: true, width: 120, formatter: function (value, row, index){var str = value; if(str!=\"\"){return formatNumberRgx(str)}else{return '0.00'}} },";
                    c2 += " { field: '收费面积" + i + "', title: '收费面积', align: 'center', sortable: true, width: 120, formatter: function (value, row, index){var str = value; if(str!=\"\"){return formatNumberRgx(str)}else{return '0.00'}} },";
                    c2 += " { field: '计费户数" + i + "', title: '计费户数', align: 'center', sortable: true, width: 120, formatter: function (value, row, index){var str = value; if(str!=\"\"){return formatNumberRgx(str)}else{return '0.00'}} },";
                    c2 += " { field: '应收金额" + i + "', title: '应收金额', align: 'center', sortable: true, width: 120, formatter: function (value, row, index){var str = value; if(str!=\"\"){return formatNumberRgx(str)}else{return '0.00'}} },";
                    c2 += " { field: '环比及差异金额" + i + "', title: '较上月差异金额', align: 'center', sortable: true, width: 120  , formatter: function (value, row, index) ";

                    c2 += " { var str = value; if ( row.CommID != \"999999\"  && row.CommID != \"undefined\"  && row.CorpCostName != \"全部费项\")";
                    c2 += " {  str = '<a style=\"color:blue;\" href=\"#\" onclick=\"OpenDetail(' + row.CommID + '," + begintime.getFullYear() + "," + m + ",' + row.CorpCostid + ')\" >'+value+'</a> ';}";
                    c2 += " else{ if(str==\"\"){ str='0.00'}else{ str = value; }  }";
                    c2 += " return formatNumberRgx(str) ;}";
                    c2 += " },";

                    m = m + 1;
                    var tt = "";
                    if (m == 13) {
                        tt = (begintime.getFullYear() + 1) + "-01"
                    }
                    else {
                        tt = begintime.getFullYear() + "-" + m
                    }
                    begintime = new Date(tt);

                    if (begintime > endtime) {
                        break;
                    }
                }

                var columStr = " [  [";
                columStr += "      {  title: '应收统计报表', colspan: " + colSum + "  }";
                columStr += "      ], [";
                columStr += "       { colspan: 1, rowspan: 2, width: 100, align: 'center', field: 'OrganNameNew', title: '项目名称' },";
                columStr += "       { colspan: 1, rowspan: 2, width: 100, align: 'center', field: 'CorpCostName', title: '费用名称' },";
                columStr += "       { colspan: 1, rowspan: 2, width: 100, align: 'center', field: '应收合计', title: '应收合计' }";
                columStr += c1;
                columStr += "  ], [" + c2;
                columStr += "  ] ]";
                //  alert(columStr);
                Headcolumn = eval("(" + columStr + ")");
                var excCol = " [ {  width: 100, align: 'center', field: 'OrganNameNew', title: '项目名称' },";
                excCol += "       {   width: 100, align: 'center', field: 'CorpCostName', title: '费用名称' },";
                excCol += "       {   width: 100, align: 'center', field: '应收合计', title: '应收合计' },";
                excCol += c2;
                excCol += "    ]";

                // alert(excCol);
                ExcelCol = eval("(" + excCol + ")");

            }

            function ExcuteOnServer() {

                var btime = $("#ChargeBeginDate").val();
                var etime = $("#ChargeEndDate").val();
                if (btime == '' || etime == '') {
                    HDialog.Info('请选择费用时间！');
                    return false;
                }
                var begintime = new Date($("#ChargeBeginDate").val());
                var endtime = new Date($("#ChargeEndDate").val());


                InitColums();


                if (begintime > endtime) {
                    HDialog.Info('费用结束时间不能小于费用开始时间！');
                    return false;
                }
                var total = (endtime - begintime) / (1000 * 60 * 60 * 24);

                if (total > 370) {
                    HDialog.Info('费用时间跨度不能超过12个月！');
                    return false;
                }


                var tmpCommID = $('#CommIDs').val();
                if (tmpCommID == '') {
                    HDialog.Info('请选择管理项目！');
                    return false;
                }


                var tmpCostNames = $('#CostNames').val();
                if (tmpCostNames == '') {
                    HDialog.Info('请选择费用项目！');
                    return false;
                }


                document.getElementById('hiIsSQLData').value = "1";

                var vIsPrec = document.getElementById('IsPrec').checked;

                if (vIsPrec) {
                    document.getElementById('hiIsPrec').value = "1";
                }
                else {
                    document.getElementById('hiIsPrec').value = "0";
                }

                var vIsRefund = document.getElementById('IsRefund').checked;
                if (vIsRefund) {
                    document.getElementById('hiIsRefund').value = "1";
                }
                else {
                    document.getElementById('hiIsRefund').value = "0";
                }
                $('#IsFirstLoad').val("0");
                $("#SearchDlg").dialog("close");
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);

                //LoadList(1, 500);
                //$('#SearchDlg').dialog('close');
                // btnClear_OnClick();
            }

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('FeesReportNew1', 'StartTask', $('#NewFeesDueCutSearch').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function LoadList(page, rows) {
                var statisMome = $("#StatisMome option:selected").val();
                var title = "";
                if (statisMome == 0) title = "单位名称";
                else if (statisMome == 1) title = "楼宇名称";
                else if (statisMome == 2) title = "资源名称";
                else if (statisMome == 3) title = "客户名称";

                // frozenColumns[0][0].title = title;

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    title: '',
                    nowrap: false,
                    pageSize: 200,
                    pageList: [200, 500, 800, 1000, 2000],
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    remoteSort: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("FeesReportNew1", "LoadData", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });

            }

            LoadList(1, 500);

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('FeesReportNew1', 'TakeProgress', $('#NewFeesDueCutSearch').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {

                            LoadList(1, 500);
                            CloseProgress();
                        }
                        else {
                            SetProgress(Obj);

                            if (Obj[0].Curr == '100') {
                                $('#hiIsSQLData').val('1');
                                LoadList(1, 500);
                                CloseProgress();
                            }
                            else {
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //显示进度
            function ShowProgress() {
                var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                var ht = parseInt($(window).scrollTop());
                $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 250) / 2, top: ht + 240 });
            }

            //关闭进度
            function CloseProgress() {
                clearInterval(ProgressInterval);
                $(".datagrid-mask").hide();
                $(".datagrid-mask-msg").hide();
            }
            //设置进度
            function SetProgress(Obj) {
                $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
                $('#DivMsg').html(Obj[0].MessageInfo);
            }


            function ToExcel() {
                var StatisMome = $('#hiStatisMome').val();
                var CompanyID = $('#hiCompanyID').val();
                var CorpCostID = $('#hiCorpCostID').val(); //document.getElementById('hiCorpCostID').value;
                var DetailType = $('#hiDetailType').val(); //document.getElementById('hiDetailType').value;
                window.location.href = "../CorpCostStatistNew/FeesCorpChargeRate_NewDetailCre.aspx"
                    + "?StatisMome=" + StatisMome
                    + "&CompanyID=" + CompanyID
                    + "&CorpCostID=" + CorpCostID
                    + "&DetailType=" + DetailType;
            }

            function SelCommInfo() {

                var w = $(window).width() * 0.8;
                var h = $(window).height() * 0.8;

                HDialog.Open(w, h, '../DialogNew/SelComm.aspx?IsCheck=1&isCommID=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommIDs").val(arrRet.id);
                    $("#CommNames").val(arrRet.name);
                });
            }


            function SelRoomState() {

                var strRoomStates = "";

                HDialog.Open('700', '450', "../dialogNew/MultiRoomStateDlg.aspx" + "?RoomStates=" + strRoomStates + "&Ram=" + Math.random(), '房屋状态选择', false, function (_data) {
                    var varReturn = _data;

                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");
                        $('#RoomStateNames').searchbox('setValue', varObjects[1]);
                        $('#RoomStates').val(varObjects[0]);
                    }

                });
            }

            function SelCost() {
                HDialog.Open('700', '450', "../dialogNew/MultiCorpCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                    var varReturn = _data;

                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");

                        $('#CorpCostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);
                    }

                });

            }

            function SelBuild() {
                var tmpCommID = $('#CommIDs').val();

                HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx" + "?CommID=" + tmpCommID, '楼宇选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");
                        var BuildSNums = "";
                        var BuildNames = "";
                        $('#BuildSNums').val(BuildSNums);
                        $('#BuildNames').searchbox('setValue', BuildNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                BuildSNums = BuildSNums + "," + varObjects[i].split(',')[0];
                                BuildNames = BuildNames + "," + varObjects[i].split(',')[1];
                            }
                        }
                        $('#BuildSNums').val(BuildSNums.substring(1, BuildSNums.length));
                        $('#BuildNames').searchbox('setValue', BuildNames.substring(1, BuildNames.length));
                    }
                });
            }

            function SelCarpark() {
                var tmpCommID = $('#CommIDs').val();

                HDialog.Open('700', '400', "../dialogNew/MultiCarparkDlg.aspx" + "?CommID=" + tmpCommID, '车位区域选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");


                        var CarparkIDs = "";
                        var CarparkNames = "";
                        $('#CarparkIDs').val(CarparkIDs);
                        $('#CarparkNames').searchbox('setValue', CarparkNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                CarparkIDs = CarparkIDs + "," + varObjects[i].split(',')[0];
                                CarparkNames = CarparkNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#CarparkIDs').val(CarparkIDs.substring(1, CarparkIDs.length));
                        $('#CarparkNames').searchbox('setValue', CarparkNames.substring(1, CarparkNames.length));

                    }
                });
            }

            function btnClear_OnClick() {

                //$('#CommIDs').val('');
                //$('#CommNames').searchbox('setValue', '');

                $('#RoomStates').val('');
                $('#RoomStateNames').searchbox('setValue', '');
                $('#hiRoomStateNames').val('');

                $('#CorpCostIDs').val('');
                $('#CostNames').searchbox('setValue', '');
                $('#hiCostNames').val('');

                $('#IsPrec').val('');
                $('#IsRefund').val('');
                //$('#IsProperty').val('');

            }

            function Export(strXlsName, exportGrid) {
                $.tool.DataPostNoLoading('FeesReportNew1', 'LoadData', '&HiIsAll=' + $('#HiIsAll').val() + '&page=1&rows=10000',
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
                        debugger;
                        if (_Data != '[]') {

                            InitExcelColums();
                            var statisMome = $("#StatisMome option:selected").val();
                            var title = "";
                            if (statisMome == 0) title = "单位名称";
                            else if (statisMome == 1) title = "楼宇名称";
                            else if (statisMome == 2) title = "资源名称";
                            else if (statisMome == 3) title = "客户名称";
                            // Headcolumn[1][0].title = '费用截止时间:' + $('#CutYearMonth').val() + ' 收款时间从:' + $('#ChargeBeginDate').val() + '到' + $('#ChargeEndDate').val();
                            // Headcolumn[2][0].title = title;
                            // ExcelCol[0].title = title;

                            var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                            var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                            var l = $('<input type="hidden" id="txtName" name="txtName" />');
                            var aa = ChangeToTableyyy(Obj.rows, Headcolumn, ExcelCol);

                            debugger;
                            i.val(ChangeToTableyyy(Obj.rows, Headcolumn, ExcelCol));
                            i.appendTo(f);
                            l.val(strXlsName);
                            l.appendTo(f);
                            f.appendTo(document.body).submit();
                            document.body.removeChild(f);
                        }
                        else {

                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

                //var rows = exportGrid.datagrid("getRows");


            }



            function ChangeToTableyyy(printDatagrid, HeadcolumnsList, columnsList) {
                var tableString = '<table cellspacing="0" class="pb">';
                var frozenColumns = undefined;  // 得到frozenColumns对象
                var columns = HeadcolumnsList; //printDatagrid.datagrid("options").columns;    // 得到columns对象
                var nameList = columnsList;

                // 载入title
                if (typeof columns != 'undefined' && columns != '') {
                    $(columns).each(function (index) {
                        tableString += '\n<tr>';
                        if (typeof frozenColumns != 'undefined' && typeof frozenColumns[index] != 'undefined') {
                            for (var i = 0; i < frozenColumns[index].length; ++i) {
                                if (!frozenColumns[index][i].hidden) {
                                    tableString += '\n<th width="' + frozenColumns[index][i].width + '"';
                                    if (typeof frozenColumns[index][i].rowspan != 'undefined' && frozenColumns[index][i].rowspan > 1) {
                                        tableString += ' rowspan="' + frozenColumns[index][i].rowspan + '"';
                                    }
                                    if (typeof frozenColumns[index][i].colspan != 'undefined' && frozenColumns[index][i].colspan > 1) {
                                        tableString += ' colspan="' + frozenColumns[index][i].colspan + '"';
                                    }
                                    tableString += '>' + frozenColumns[0][i].title + '</th>';
                                }
                            }
                        }
                        for (var i = 0; i < columns[index].length; ++i) {
                            if (!columns[index][i].hidden) {
                                tableString += '\n<th width="' + columns[index][i].width + '"';
                                if (typeof columns[index][i].rowspan != 'undefined' && columns[index][i].rowspan > 1) {
                                    tableString += ' rowspan="' + columns[index][i].rowspan + '"';
                                }
                                if (typeof columns[index][i].colspan != 'undefined' && columns[index][i].colspan > 1) {
                                    tableString += ' colspan="' + columns[index][i].colspan + '"';
                                }
                                tableString += '>' + columns[index][i].title + '</th>';
                            }
                        }
                        tableString += '\n</tr>';
                    });
                }
                // 载入内容
                var rows = printDatagrid; // 这段代码是获取当前页的所有行
                for (var i = 0; i < rows.length; i++) {
                    tableString += '\n<tr>';
                    for (var j = 0; j < nameList.length; j++) {


                        tableString += '\n<td';
                        if (nameList[j].align != 'undefined' && nameList[j].align != '') {
                            tableString += ' style="text-align:' + nameList[j].align + ';"';
                        }
                        tableString += '>';
                        var FiledName = nameList[j].field;
                        tableString += rows[i][FiledName];
                        tableString += '</td>';
                    }
                    tableString += '\n</tr>';
                }
                tableString += '\n</table>';
                return tableString;
            }


            function formatNumberRgx(num) {
                if (num != "" && num != undefined) {
                    var parts = num.toString().split(".");
                    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    return parts.join(".");
                } else {
                    return "0.00";
                }

            };

        </script>

    </form>
</body>
</html>
