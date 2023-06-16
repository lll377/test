<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesReportNew1Detail.aspx.cs" Inherits="M_Main.StatisReport.FeesReportNew1Detail" %>


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
        <input id="CommIDs" type="hidden" name="CommIDs" runat="server" />
        <input id="DiffMonth" type="hidden" name="DiffMonth" runat="server" />
        <input id="CorpCostID" type="hidden" name="CorpCostID" runat="server" />

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>

        <div id="DlgDetail" class="easyui-dialog" title="收费率明细" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1024px; height: 500px; padding: 10px;">
            <div id='tb'>
                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ToExcel();">Excel导出</a>
            </div>
            <div style="width: 90%; background-color: #cccccc;" id="TableContainerDetail"></div>
        </div>

        <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 550px; height: 240px; padding-left: 10px; padding-top: 5px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red'>
                <tr>
                    <td valign="top" style='color: red'>备注：<br />
                        1、需要在差异明细表中体现的数据：<br />
                        （1）同一户，上月有应收，本月无应收；<br />
                        （2）同一户，上月无应收，本月有应收；<br />
                        （3）同一户，上月、本月均有应收，但是存在差异；<br />
                        2、不需在差异明细表中体现的数据：<br />
                        如果同一户上月、本月应收金额相等，不在差异明细表中体现。<br />
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
             
            var column = [
                [
                    { colspan: 4, title: '上月' },
                    { colspan: 4, title: '当月' },
                    { colspan: 1, rowspan: 2, width: 100, align: 'center', field: '差异金额', title: '差异金额' }
                ],
                [
                    { field: '上月交房状态', title: '交房状态', align: 'center', sortable: true, width: 120 },
                    { field: '上月计费面积', title: '计费面积', align: 'center', sortable: true, width: 120 },
                    { field: '上月收费标准', title: '收费标准', align: 'center', sortable: true, width: 120 },
                    { field: '上月应收金额', title: '应收金额', align: 'center', sortable: true, width: 120 },
                    { field: '当月交房状态', title: '交房状态', align: 'center', sortable: true, width: 120 },
                    { field: '当月计费面积', title: '计费面积', align: 'center', sortable: true, width: 120 },
                    { field: '当月收费标准', title: '收费标准', align: 'center', sortable: true, width: 120 },
                    { field: '当月应收金额', title: '应收金额', align: 'center', sortable: true, width: 120 } 

                ]
            ];

            var frozenColumns = [[
                { field: '房屋编号', title: '房号', align: 'left', sortable: true, width: 200 },
                { field: '客户名称', title: '客户名称', align: 'left', sortable: true, width: 100 },
                { field: 'CorpCostName', title: '费用名称', align: 'left', sortable: true, width: 100 }
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
                    text: '备注',
                    iconCls: 'icon-help',
                    handler: function () {
                        $('#DlgMemo').parent().appendTo($("form:first"))
                        $('#DlgMemo').dialog('open');
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
                            // Export('预存统计表Excel', $('#TableContainer'));
                            window.location.href = 'FeesReportNew1DetailToExcel.aspx';
                        }
                    }
                }
            ];


        </script>

        <script type="text/javascript">
            var ProgressInterval;

            function InitColums() {
                var c1 = "", c2 = "";
                var begintime = new Date($("#ChargeBeginDate").val());
                var endtime = new Date($("#ChargeEndDate").val());

                for (var i = 1; i < 13; i++) {
                    var m =  begintime.getMonth() + 1 ;
                    c1 += " ,{ colspan: 5, title: '" + begintime.getFullYear() + "-" + m + "月' }";

                    c2 += " { field: '接管户数" + i + "', title: '接管户数', align: 'center', sortable: true, width: 120 },";
                    c2 += " { field: '交房户数" + i + "', title: '交房户数', align: 'center', sortable: true, width: 120 },";
                    c2 += " { field: '计费户数" + i + "', title: '计费户数', align: 'center', sortable: true, width: 120 },";
                    c2 += " { field: '应收金额" + i + "', title: '应收金额', align: 'center', sortable: true, width: 120 },";
                    c2 += " { field: '环比及差异金额" + i + "', title: '较上月差异金额', align: 'center', sortable: true, width: 120 },";
                    // begintime = new Date()
                  
                    m = m + 1;
                    var tt = "";
                    if (m == 13) {
                        tt = (begintime.getFullYear() + 1) + "-01"
                    }
                    else {
                        tt = begintime.getFullYear() + "-" + m
                    } 
                    begintime = new Date(tt);
                   // alert(begintime);
                   // alert(tt + "====" + begintime + "====" + endtime);
                    if (begintime > endtime) { 
                        break;
                    }
                }
                 
                var columStr = " [ [";
                columStr += "       { colspan: 1, rowspan: 2, width: 100, align: 'center', field: '应收合计', title: '应收合计' }";
                columStr += c1;
                columStr += "  ], [" + c2;
                columStr += "  ] ]";
                alert(columStr);
                column = eval("(" + columStr + ")");

            }
            function getQuery(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) { return pair[1]; }
                }
                return (false);
            }
            function ExcuteOnServer() {
                
                $("#CommIDs").val(getQuery("CommID"));
                $("#DiffMonth").val(getQuery("DiffMonth"));
                $("#CorpCostID").val(getQuery("CorpCostID"));
                


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
                $.tool.DataPostNoLoading('FeesReportNew1Detail', 'StartTask', $('#NewFeesDueCutSearch').serialize(),
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
                        param = $.JQForm.GetParam("FeesReportNew1Detail", "LoadData", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });

            }

            LoadList(1, 500);

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('FeesReportNew1Detail', 'TakeProgress', $('#NewFeesDueCutSearch').serialize(),
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
                var statisMome = $("#StatisMome option:selected").val();
                var title = "";
                if (statisMome == 0) title = "单位名称";
                else if (statisMome == 1) title = "楼宇名称";
                else if (statisMome == 2) title = "资源名称";
                else if (statisMome == 3) title = "客户名称";
                Headcolumn[1][0].title = '费用截止时间:' + $('#CutYearMonth').val() + ' 收款时间从:' + $('#ChargeBeginDate').val() + '到' + $('#ChargeEndDate').val();
                Headcolumn[2][0].title = title;
                ExcelCol[0].title = title;

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
            ExcuteOnServer();
        </script>

    </form>
</body>
</html>
