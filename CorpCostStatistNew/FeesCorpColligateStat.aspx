<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesCorpColligateStat.aspx.cs" Inherits="M_Main.CorpCostStatistNew.FeesCorpColligateStat" %>

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
<body>
    <form id="NewFeesDueCutSearch" runat="server">
        <input id="AllData" size="1" type="hidden" name="AllData" runat="server" />
        <input id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <input id="IsDetail" type="hidden" name="IsDetail" runat="server" />
        <input id="hiIsPrec" type="hidden" value="1" name="hiIsPrec" runat="server" />
        <input id="IsGather" type="hidden" size="1" name="IsGather" runat="server" />
        <input id="hiCommNames" type="hidden" name="hiCommNames" runat="server">
        <input id="hiCommID" type="hidden" name="hiCommID" runat="server">
        <input id="CommIDs" type="hidden" name="CommIDs" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 800px; height: 250px;">
            <table style="width: 100%; overflow: hidden" class="DialogTable">
                <tr>
                    <td class="TdTitle">项目名称
                    </td>
                    <td class="TdContent" colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用时间从</td>
                    <td class="TdContentSearch">
                        <input id="EditBeginDate"
                            onclick="WdatePicker()" class="Wdate" style="width: 40%;" name="EditBeginDate" runat="server"></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input id="EditEndDate"
                            onclick="WdatePicker()" class="Wdate" style="width: 40%;" name="EditEndDate" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">统计范围</td>
                    <td class="TdContentSearch">
                        <select id="ListType" name="ListType" runat="server">
                            <option value="2">费用大项</option>
                            <option value="0">费用小项</option>
                        </select>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" searcher="SelCost" id="CostNames"
                            name="CostNames" runat="server" />
                        <input id="CorpCostIDs" type="hidden" name="CorpCostIDs" runat="server" />
                        <input id="hiCostNames" type="hidden" name="hiCostNames" runat="server" /></td>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ExcuteOnServer();">统计</a>
                    </td>
                </tr>
            </table>
        </div>

        <div id="DlgDetail" class="easyui-dialog" title="费用综合统计明细" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1024px; height: 500px; padding: 10px;">
            <div style="width: 90%; background-color: #cccccc;" id="TableContainerDetail"></div>
        </div>
        <div id='tb'>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ToExcel();">Excel导出</a>
        </div>
        <div id='tbtitle' style='height: 24px; color: Red'></div>

        <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 550px; height: 180px; padding-left: 10px; padding-top: 5px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red'>
                <tr>
                    <td rowspan="4" width="40px" valign="top" style='color: Black;'>备注：</td>
                    <td style='line-height: 20px'>1、各个费项的期初预交余额、期末预交余额均包含单项预存和预收后期费用，比如本期实收后期是指本期单项预存和预收后期费用，本期退款后期是指本期单项预存和预收后期费用的退款。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>2、期末预交余额=期初预交余额+本期实收后期-本期预交冲抵前期、本期、后期-本期退款后期，期末欠费=期初欠费+本期应收-前期实收本期-本期实收前期、本期-前期预交冲抵本期-本期预交冲抵前期、本期-前期减免冲销本后期-本期减免冲销前期、本期。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>3、如果存在综合预存，那么可能会用综合预存去冲抵某一费项，所以某一费项的前期预交余额+本期预交收款-本期预交退款-本期预交冲抵，不一定等于期末预交余额，此时只能通过合计进行检核。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>；4、实收中未计合同违约金。</td>
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
            function CkIsPrec(obj) {
                $('#hiIsPrec').val('0');
                if ($(obj).prop("checked")) {
                    $('#hiIsPrec').val('1');
                }
            }

            function SelCommInfo() {
                if ($('#hiCommID').val() != '') {
                    return;
                }
                else {
                    HDialog.Open(700, 400, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#CommIDs").val(arrRet.id);
                        $("#CommNames").val(arrRet.name);
                    });
                }
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

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $("#TableContainerDetail").css("height", "440px");
            }

            InitTableHeight();


            var toolbar = [
                {
                    text: '统计',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#IsGather').val("1");
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }, '-',
                {
                    text: '显示明细',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#hiIsSQLData').val("-1");
                        $('#IsGather').val("0");
                        LoadList(1, 500);
                    }
                }, '-',
                {
                    text: '显示汇总',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#hiIsSQLData').val("-1");
                        $('#IsGather').val("1");
                        LoadList(1, 500);
                    }
                }
                , '-',
                {
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {

                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成报表');
                        }
                        else {
                            Export('综合统计报表（不含收费率）Excel', $('#TableContainer'));
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

            var frozenColumns = [[
                        { field: 'OrganName', title: '区域', width: 100, align: 'left', sortable: true },
                        { field: 'CommName', title: '管理项目', align: 'left', sortable: true, width: 100 },
                        { field: 'CostName', title: '费用名称', align: 'left', sortable: true },
                        { field: 'StanName', title: '标准名称', align: 'left', sortable: true }
            ]]

            var column = [
                    [
                        { field: 'BeginDebtsAmount1', rowspan: 2, title: '期初欠费', align: 'left', sortable: true, width: 100 },
                        { field: 'BeginDebtsAmount2', rowspan: 2, title: '期初未退', align: 'left', sortable: true, width: 100 },


                        { field: 'BeginPrecPayAmount', rowspan: 2, title: '期初预交余额', align: 'left', sortable: true, width: 100 },
                         {
                             field: 'CurDueAmount', rowspan: 2, title: '本期应收金额', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                                 //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,1);\">" + value + "</a>";
                                 return value;
                             }
                         },
                        {
                            field: 'BefPaidThisAmount', rowspan: 2, title: '前期实收本期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,2);\">" + value + "</a>";
                                return value;
                            }
                        },
                        { colspan: 3, title: '本期实收' },
                        {
                            field: 'BefPrecThisAmount', rowspan: 2, title: '前期预交冲抵本期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,6);\">" + value + "</a>";
                                return value;
                            }
                        },
                        { colspan: 3, title: '本期预交冲抵' },
                        {
                            field: 'Fab_Cc_WaivAmount', rowspan: 2, title: '前期减免冲销本期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,10);\">" + value + "</a>";
                                return value;
                            }
                        },
                        { colspan: 3, title: '本期减免冲销' },
                        { colspan: 3, title: '本期退款' },

                        { field: 'EndDebtsAmount1', rowspan: 2, title: '期末欠费', align: 'left', sortable: true, width: 100 },
                        { field: 'EndDebtsAmount2', rowspan: 2, title: '期末未退', align: 'left', sortable: true, width: 100 },

                        { field: 'EndPrecPayAmount', rowspan: 2, title: '期末预交余额', align: 'left', sortable: true, width: 100 }
                    ], [

                        {
                            field: 'BefPaidAmount', title: '前期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,3);\">" + value + "</a>";
                                return value;
                            }
                        },
                        {
                            field: 'CurPaidAmount', title: '本期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,4);\">" + value + "</a>";
                                return value;
                            }
                        },
                        {
                            field: 'AftPaidAmount', title: '后期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,5);\">" + value + "</a>";
                                return value;
                            }
                        },
                        {
                            field: 'BefPrecAmount', title: '前期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,7);\">" + value + "</a>";
                                return value;
                            }
                        },
                        {
                            field: 'CurPrecAmount', title: '本期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,8);\">" + value + "</a>";
                                return value;
                            }
                        },
                        {
                            field: 'AftPrecAmount', title: '后期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,9);\">" + value + "</a>";
                                return value;
                            }
                        },
                        {
                            field: 'BefWaivAmount', title: '前期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,11);\">" + value + "</a>";
                                return value;
                            }
                        },
                        {
                            field: 'CurWaivAmount', title: '本期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,12);\">" + value + "</a>";
                                return value;
                            }
                        },
                        {
                            field: 'AftWaivAmount', title: '后期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,13);\">" + value + "</a>";
                                return value;
                            }
                        },
                        {
                            field: 'BefRefundAmount', title: '前期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,14);\">" + value + "</a>";
                                return value;
                            }
                        },
                        {
                            field: 'CurRefundAmount', title: '本期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,15);\">" + value + "</a>";
                                return value;
                            }
                        },
                        {
                            field: 'AftRefundAmount', title: '后期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,16);\">" + value + "</a>";
                                return value;
                            }
                        }

                    ]

            ];


            var Headcolumn = [
                [
                    {
                        title: '综合统计报表（不含收费率）', colspan: 31
                    }
                ],
                [
                    {
                        title: '费用时间从:' + $('#EditBeginDate').val() + '到' + $('#EditEndDate').val(), colspan: 31, align: 'left'
                    }
                ],
                    [
                        { field: 'OrganName', rowspan: 2, title: '区域', width: 100, align: 'left', sortable: true },
                        { field: 'CommName', rowspan: 2, title: '管理项目', align: 'left', sortable: true, width: 100 },
                        { field: 'CostName', rowspan: 2, title: '费用名称', align: 'left', sortable: true, width: 100 },
                        { field: 'StanName', rowspan: 2, title: '标准名称', align: 'left', sortable: true, width: 100 },
                        { field: 'BeginDebtsAmount1', rowspan: 2, title: '期初欠费', align: 'left', sortable: true, width: 100 },
                        { field: 'BeginDebtsAmount2', rowspan: 2, title: '期初未退', align: 'left', sortable: true, width: 100 },


                        { field: 'BeginPrecPayAmount', rowspan: 2, title: '期初预交余额', align: 'left', sortable: true, width: 100 },
                        { field: 'CurDueAmount', rowspan: 2, title: '本期应收金额', align: 'left', sortable: true, width: 100 },
                        { field: 'BefPaidThisAmount', rowspan: 2, title: '前期实收本期', align: 'left', sortable: true, width: 100 },
                        { colspan: 3, title: '本期实收' },
                        { field: 'BefPrecThisAmount', rowspan: 2, title: '前期预交冲抵本期', align: 'left', sortable: true, width: 100 },
                        { colspan: 3, title: '本期预交冲抵' },
                        { field: 'Fab_Cc_WaivAmount', rowspan: 2, title: '前期减免冲销本期', align: 'left', sortable: true, width: 100 },
                        { colspan: 3, title: '本期减免冲销' },
                        { colspan: 3, title: '本期退款' },

                        { field: 'EndDebtsAmount1', rowspan: 2, title: '期末欠费', align: 'left', sortable: true, width: 100 },
                        { field: 'EndDebtsAmount2', rowspan: 2, title: '期末未退', align: 'left', sortable: true, width: 100 },

                        { field: 'EndPrecPayAmount', rowspan: 2, title: '期末预交余额', align: 'left', sortable: true, width: 100 }
                    ], [
                        { field: 'BefPaidAmount', title: '前期', align: 'left', sortable: true, width: 100 },
                        { field: 'CurPaidAmount', title: '本期', align: 'left', sortable: true, width: 100 },
                        { field: 'AftPaidAmount', title: '后期', align: 'left', sortable: true, width: 100 },
                        { field: 'BefPrecAmount', title: '前期', align: 'left', sortable: true, width: 100 },
                        { field: 'CurPrecAmount', title: '本期', align: 'left', sortable: true, width: 100 },
                        { field: 'AftPrecAmount', title: '后期', align: 'left', sortable: true, width: 100 },
                        { field: 'BefWaivAmount', title: '前期', align: 'left', sortable: true, width: 100 },
                        { field: 'CurWaivAmount', title: '本期', align: 'left', sortable: true, width: 100 },
                        { field: 'AftWaivAmount', title: '后期', align: 'left', sortable: true, width: 100 },
                        { field: 'BefRefundAmount', title: '前期', align: 'left', sortable: true, width: 100 },
                        { field: 'CurRefundAmount', title: '本期', align: 'left', sortable: true, width: 100 },
                        { field: 'AftRefundAmount', title: '后期', align: 'left', sortable: true, width: 100 }

                    ]
            ];

            var ExcelCol = [
                         { field: 'OrganName', title: '区域', width: 100, align: 'left', sortable: true },
                        { field: 'CommName', title: '管理项目', align: 'left', sortable: true, width: 100 },
                        { field: 'CostName', title: '费用名称', align: 'left', sortable: true },
                        { field: 'StanName', title: '标准名称', align: 'left', sortable: true },
                        { field: 'BeginDebtsAmount1', title: '期初欠费', align: 'left', sortable: true, width: 100 },
                        { field: 'BeginDebtsAmount2', title: '期初未退', align: 'left', sortable: true, width: 100 },

                        { field: 'BeginPrecPayAmount', title: '期初预交余额', align: 'left', sortable: true, width: 100 },
                        { field: 'CurDueAmount', title: '本期应收金额', align: 'left', sortable: true, width: 100 },
                        { field: 'BefPaidThisAmount', title: '前期实收本期', align: 'left', sortable: true, width: 100 },
                        { field: 'BefPaidAmount', title: '前期', align: 'left', sortable: true, width: 100 },
                        { field: 'CurPaidAmount', title: '本期', align: 'left', sortable: true, width: 100 },
                        { field: 'AftPaidAmount', title: '后期', align: 'left', sortable: true, width: 100 },
                        { field: 'BefPrecThisAmount', title: '前期预交冲抵本期', align: 'left', sortable: true, width: 100 },
                        { field: 'BefPrecAmount', title: '前期', align: 'left', sortable: true, width: 100 },
                        { field: 'CurPrecAmount', title: '本期', align: 'left', sortable: true, width: 100 },
                        { field: 'AftPrecAmount', title: '后期', align: 'left', sortable: true, width: 100 },
                        { field: 'Fab_Cc_WaivAmount', title: '前期减免冲销本期', align: 'left', sortable: true, width: 100 },
                        { field: 'BefWaivAmount', title: '前期', align: 'left', sortable: true, width: 100 },
                        { field: 'CurWaivAmount', title: '本期', align: 'left', sortable: true, width: 100 },
                        { field: 'AftWaivAmount', title: '后期', align: 'left', sortable: true, width: 100 },
                        { field: 'BefRefundAmount', title: '前期', align: 'left', sortable: true, width: 100 },
                        { field: 'CurRefundAmount', title: '本期', align: 'left', sortable: true, width: 100 },
                        { field: 'AftRefundAmount', title: '后期', align: 'left', sortable: true, width: 100 },

                        { field: 'EndDebtsAmount1', title: '期末欠费', align: 'left', sortable: true, width: 100 },
                        { field: 'EndDebtsAmount2', title: '期末未退', align: 'left', sortable: true, width: 100 },

                        { field: 'EndPrecPayAmount', title: '期末预交余额', align: 'left', sortable: true, width: 100 }
            ];

            var columnDetail = [[
                { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 100 },
                { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 100 },
                { field: 'BuildArea', title: '建筑面积', align: 'left', sortable: true, width: 100 },
                { field: 'CostName', title: '费用名称', align: 'left', sortable: true, width: 100 },
                { field: 'ParkName', title: '车位编号', align: 'left', sortable: true, width: 100 },
                { field: 'FeeDueYearMonth', title: '费用日期', align: 'left', sortable: true, width: 100 },
                {
                    field: 'AccountsDueDate', title: '应收日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                        var str = row.AccountsDueDate.ToCustomizeDate();
                        return str;
                    }
                },
                {
                    field: 'FeesStateDate', title: '开始日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                        var str = row.FeesStateDate.ToCustomizeDate();
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '结束日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                        var str = row.FeesEndDate.ToCustomizeDate();
                        return str;
                    }
                },
                { field: 'FeesAmount', title: '金额', align: 'left', sortable: true, width: 100 },
                { field: 'DueAmount', title: '应收金额', align: 'left', sortable: true, width: 100 },
                { field: 'PaidAmount', title: '实收金额', align: 'left', sortable: true, width: 100 },
                { field: 'PrecAmount', title: '预交冲抵', align: 'left', sortable: true, width: 100 },
                { field: 'WaivAmount', title: '减免冲销', align: 'left', sortable: true, width: 100 },
                { field: 'RefundAmount', title: '退款金额', align: 'left', sortable: true, width: 100 },
                { field: 'ExpenseAmount', title: '付款金额', align: 'left', sortable: true, width: 100 },
                { field: 'IsCommisionName', title: '是否佣金', align: 'left', sortable: true, width: 100 }

            ]]


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

            }

            function ShowDetail(sStatID, DetailType) {

                var strDetailType = "";
                switch (DetailType) {
                    case 1:
                        strDetailType = 'Fab_DueAmount';
                        break;
                    case 2:
                        strDetailType = 'BefPaidThisAmount';//Fab_Cc_PaidAmount
                        break;
                    case 3:
                        strDetailType = 'Fa_Ccd_PaidAmount';
                        break;
                    case 4:
                        strDetailType = 'CurPaidAmount';//Fab_Ccd_PaidAmount
                        break;
                    case 5:
                        strDetailType = 'AftPaidAmount';
                        break;
                    case 6:
                        strDetailType = 'BefPrecThisAmount';//Fab_Cc_PrecAmount
                        break;
                    case 7:
                        strDetailType = 'BefPrecAmount';// Fa_Ccd_PrecAmount
                        break;
                    case 8:
                        strDetailType = 'CurPrecAmount';//Fab_Ccd_PrecAmount
                        break;
                    case 9:
                        strDetailType = 'AftPrecAmount';//Fb_Ccd_PrecAmount
                        break;
                    case 10:
                        strDetailType = 'Fab_Cc_WaivAmount';
                        break;
                    case 11:
                        strDetailType = 'Fa_Ccd_WaivAmount';
                        break;
                    case 12:
                        strDetailType = 'Fab_Ccd_WaivAmount';
                        break;
                    case 13:
                        strDetailType = 'Fb_Ccd_WaivAmount';
                        break;
                    case 14:
                        strDetailType = 'Fa_Ccd_RefundAmount';
                        break;
                    case 15:
                        strDetailType = 'Fab_Ccd_RefundAmount';
                        break;
                    case 16:
                        strDetailType = 'AftRefundAmount';
                        break;
                    case 17:
                        strDetailType = 'Fa_Ccd_ExpenseAmount';
                        break;
                    case 18:
                        strDetailType = 'Fab_Ccd_ExpenseAmount';
                        break;
                    case 19:
                        strDetailType = 'Fb_Ccd_ExpenseAmount';
                        break;
                }

                document.getElementById('hiStatID').value = sStatID;
                document.getElementById('hiDetailType').value = strDetailType;


                $("#TableContainerDetail").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=MultiFeesColligateStatist&Command=MultiFeesColligateDetail&' + $("#NewFeesDueCutSearch").serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    pageSize: 500,
                    pageList: [500, 1000, 2000],
                    columns: columnDetail,
                    fitColumns: false,
                    singleSelect: true,
                    nowrap: false,
                    pagination: true,
                    width: "100%",
                    toolbar: '#tb',
                    sortOrder: "asc"
                });

                $('#DlgDetail').parent().appendTo($("form:first"))
                $('#DlgDetail').dialog('open');
            }



            var intervalProcess;




            function ToPrint() {
                $.tool.DataGet('MultiFeesColligateStatist', 'MultiFeesColligatePrint', $('#NewFeesDueCutSearch').serialize(),
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
        </script>

        <script type="text/javascript">
            var ProgressInterval;

            function ExcuteOnServer() {
                document.getElementById('hiIsSQLData').value = "1";
                $('#IsFirstLoad').val("0"); // 只有在统计过后才不是第一次加载
                $("#SearchDlg").dialog("close");
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);
                btnClear_OnClick();
            }

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('FeesCorpColligate', 'StartTask', $('#NewFeesDueCutSearch').serialize(),
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
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    title: '',
                    nowrap: false,
                    pageSize: 500,
                    pageList: [500, 1000, 2000],
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
                        param = $.JQForm.GetParam("FeesCorpColligate", "LoadData", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
            }

            LoadList(1, 500);

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('FeesCorpColligate', 'TakeProgress', $('#NewFeesDueCutSearch').serialize(),
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
                $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
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
                var StatID = document.getElementById('hiStatID').value;
                var DetailType = document.getElementById('hiDetailType').value;
                window.location.href = "../CostStatist/MultiFeesColligateStatistDetailCre.aspx?StatID=" + StatID + "&DetailType=" + DetailType;
            }

            function SelBuild() {

                HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx", '楼宇选择', false, function callback(_Data) {

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

            function SelRegion() {

                HDialog.Open('700', '400', "../dialogNew/MultiRegionDlg.aspx", '组团选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");
                        var RegionSNums = "";
                        var RegionNames = "";

                        $('#RegionSNums').val(RegionSNums);
                        $('#RegionNames').searchbox('setValue', RegionNames);
                        $('#hiRegionNames').val(RegionNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {

                                RegionSNums = RegionSNums + "," + varObjects[i].split(',')[2];
                                RegionNames = RegionNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#RegionSNums').val(RegionSNums.substring(1, RegionSNums.length));
                        $('#RegionNames').searchbox('setValue', RegionNames.substring(1, RegionNames.length));

                        $('#hiRegionNames').val(RegionNames);

                    }
                });

            }


            function SelCarpark() {

                HDialog.Open('700', '400', "../dialogNew/MultiCarparkDlg.aspx", '车位区域选择', false, function callback(_Data) {


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

            function SelPark() {

                HDialog.Open('700', '400', "../dialogNew/MultiParkDlg.aspx", '车位选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新                        

                        var data = _Data.split('|');
                        if (data.length > 0) {
                            var ParkIDs = "";
                            var ParkNames = "";

                            for (var i = 0; i < data.length; i++) {
                                if (data[i] != "") {
                                    var obj = JSON.parse(data[i]);
                                    if (obj.ParkID != 0) {
                                        ParkIDs = ParkIDs + "," + obj.ParkID;
                                        ParkNames = ParkNames + ',' + obj.ParkName;
                                    }
                                }
                            }

                            $('#ParkIDs').val(ParkIDs.substring(1, ParkIDs.length));
                            $('#ParkNames').searchbox('setValue', ParkNames.substring(1, ParkNames.length));
                        }
                    }
                });

            }


            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var w = $(window).width();
                var h = $(window).height();

                var conent = "../DialogNew/CustDlg.aspx";

                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);

                    $.tool.DataPost2('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
                        function Init() {
                        },
                        function callback(_Data) {

                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (varObjects.length > 0) {

                                var RoomData = [];
                                for (var i = 0; i < varObjects.length; i++) {

                                    var vIsDelLive = varObjects[i].IsDelLive;
                                    var strTmp = "";

                                    if (vIsDelLive == 1) {
                                        strTmp = "(历史)";
                                    }
                                    var RoomID = varObjects[i].RoomID;
                                    var RoomSign = varObjects[i].RoomSign;
                                    var Buildarea = varObjects[i].BuildArea;

                                    var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;

                                    RoomData.push({ "RoomText": RoomText, "RoomID": RoomID + "|" + Buildarea });

                                }

                                $('#SelectRoomID').combobox({
                                    data: RoomData,
                                    valueField: 'RoomID',
                                    textField: 'RoomText',
                                    onChange: function (n, o) {

                                        var data = $('#SelectRoomID').combobox('getData');
                                        if (data.length > 0) {
                                            for (var i = 0; i < data.length; i++) {
                                                if (n == data[i].RoomID) {

                                                    $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                                    //var buildArea = data[i].RoomID.split("|")[1];
                                                    //$('#BuildArea').val(buildArea);
                                                    $('#RoomID').val(data[i].RoomID.split("|")[0]);

                                                    break;
                                                }
                                            }
                                        }


                                    }
                                });
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });

                });
            }

            function SelRoom() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/RoomDlg.aspx";

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);

                    //$('#BuildArea').val(data.BuildArea);
                    //$('#CalcArea').val(data.BuildArea);
                });

            }

            function SelStan() {
                var tmpCostIDs = $('#CostIDs').val();

                if (tmpCostIDs == "") {
                    HDialog.Info("请选择费用项目,此项不能为空!");

                    $('#btnSelCost').focus();
                    return false;
                }

                var w = 700;
                var h = 400;

                HDialog.Open('700', '400', "../dialogNew/MultiStanDlg.aspx?CostIDs=" + tmpCostIDs + "&IsShowHis=1" + "&Ram=" + Math.random(), '收费标准选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#StanIDs').val(varObjects[0]);
                        $('#StanNames').searchbox('setValue', varObjects[1]);

                        var varObjects = _Data.split("|");
                        var StanIDs = "";
                        var StanNames = "";

                        $('#StanIDs').val(StanIDs);
                        $('#StanNames').searchbox('setValue', StanNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                StanIDs = StanIDs + "," + varObjects[i].split(',')[0];
                                StanNames = StanNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#StanIDs').val(StanIDs.substring(1, StanIDs.length));
                        $('#StanNames').searchbox('setValue', StanNames.substring(1, StanNames.length));

                    }
                });

                return false;
            }

            function SelRooms() {
                var varReturn;

                var w = $(window).width();;
                var h = $(window).height();;

                HDialog.Open(w, h, "../dialogNew/MultiRoomDlg.aspx", '房屋多选', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新

                        var data = _Data;// SelAll + "◆" + SelRoomSigns + "◆" + SelRoomIDs;
                        var SelAll = data.split('◆')[0];
                        var SelRoomSigns = data.split('◆')[1];
                        var SelRoomIDs = data.split('◆')[2];

                        if (SelAll == "1") {
                            $('#RoomSigns').searchbox('setValue', '全部');
                        }
                        else {
                            $('#RoomSigns').searchbox('setValue', SelRoomSigns);;
                        }

                        $('#SelRoomSigns').val(SelRoomSigns);
                        $('#SelRoomIDs').val(SelRoomIDs);
                        $('#RoomIDs').val(SelRoomIDs);

                        $('#SelAll').val(SelAll);

                        return true;
                    }
                });

                return false;
            }


            function SelRoomState() {

                var strRoomStates = "";

                HDialog.Open('700', '450', "../dialogNew/MultiRoomStateDlg.aspx" + "?RoomStates=" + strRoomStates + "&Ram=" + Math.random(), '房屋状态选择', false, function (_data) {
                    var varReturn = _data;

                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");

                        $('#RoomStates').val(varObjects[0]);
                        $('#RoomStateNames').searchbox('setValue', varObjects[1]);
                        $('#hiRoomStateNames').val(varObjects[0]);
                        var arrRoomStateSNums = varObjects[0].split(',');
                        $('#RoomStateNum').val(arrRoomStateSNums.length);
                    }

                });
            }

            function btnClear_OnClick() {

                $('#BuildSNums').val('');
                $('#BuildNames').searchbox('setValue', '');
                $('#RegionSNums').val('');
                $('#RegionNames').searchbox('setValue', '');
                $('#hiRegionNames').val('');

                $('#CustTypeID').val('');
                $('#ChargeTypeID').val('');

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                //$('#RoomState').val('');
                $('#SearchRange').val('');
                $('#BankName').val('');

                $('#CarparkIDs').val('');
                $('#CarparkNames').searchbox('setValue', '');

                $('#ParkIDs').val('');
                $('#ParkNames').searchbox('setValue', '');

                $('#CostIDs').val('');
                $('#CostNames').searchbox('setValue', '');

                $('#StanIDs').val('');
                $('#StanNames').searchbox('setValue', '');

                $('#RoomStates').val('');
                $('#RoomStateNames').searchbox('setValue', '');
                $('#hiRoomStateNames').val('');
                $('#RoomStateNum').val('');

                $('#IsPrec').val('');
                $('#IsProperty').val('');

            }

            function FeesToExcel() {
                var rowData = $('#TableContainer').datagrid('getData');
                if (rowData == '') {
                    HDialog.Info('请先生成报表');
                }
                else {
                    Export('综合统计报表Excel', $('#TableContainer'));
                }

            }

            function Export(strXlsName, exportGrid) {
                var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                var l = $('<input type="hidden" id="txtName" name="txtName" />');
                i.val(ChangeToTable3(exportGrid, Headcolumn, ExcelCol));
                i.appendTo(f);
                l.val(strXlsName);
                l.appendTo(f);
                f.appendTo(document.body).submit();
                document.body.removeChild(f);
            }
        </script>

    </form>
</body>
</html>
