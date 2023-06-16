<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesReportNew1_1.aspx.cs" Inherits="M_Main.StatisReport.FeesReportNew1_1" %>


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
                <tr style="display:none;">
                    <td class="TdTitle">费项类型</td>
                    <td class="TdContentSearch">
                        <select id="ListType" name="ListType" runat="server">
                            <option value="1">费用大项</option>
                            <option value="0" selected="selected">费用小项</option>
                        </select>
                    </td>
                    <td class="TdTitle"> </td>
                    <td class="TdContentSearch">
                       
                    </td>

                </tr>
                 <tr style="display:none;">
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
                    <%--<input type="checkbox" id="IsRefund" name="IsRefund" style="display: none;" />
                        <input id="hiIsRefund" type="hidden" name="hiIsRefund" runat="server" style="display: none;">--%>
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

        <div id="DlgDetail" class="easyui-dialog" title="理论应收统计表" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1024px; height: 500px; padding: 10px;">
            <div id='tb'>
                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ToExcel();">Excel导出</a>
            </div>
            <div style="width: 90%; background-color: #cccccc;" id="TableContainerDetail"></div>
        </div>

          <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 750px; height: 190px; padding-left: 10px; padding-top: 5px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: red; font-size:14px;'>
                <tr>
                    <td valign="top" style='color: red; font-size:14px;'>备注：<br />
                       1、用于统计根据当前系统绑定在客户名下的计费标准、单价、面积等信息测算的理论应收金额；“T+0”表示数据范围截止当前；<br />
2、计费数量：某一费项“计费数量”为当前系统中该费项绑定在客户上的计费标准条数；全部费项“计费数量”为各个费项“计费数量”的合计；<br />
3、年应收金额：本年各月理论应收金额的合计；<br />
4、月应收金额：根据当前系统中绑定在客户上的计费标准、单价、面积等信息测算的月度理论应收金额；<br />


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
                        title: '理论应收统计表', colspan: 17
                    }
                ], 
                [
                    { field: 'OrganName', title: '公司名称', align: 'left', sortable: true, width: 200 },
                    { field: 'CommName', title: '项目名称', align: 'left', sortable: true, width: 200 },

                    { field: 'CorpCostName', title: '费用名称', align: 'center', sortable: true, width: 120 },
                    { field: '户数', title: '计费数量', align: 'center', sortable: true, width: 120 },
                    { field: '年应收金额', title: '年应收金额', align: 'center', sortable: true, width: 120 },
                    { field: '1月应收', title: '1月应收', align: 'center', sortable: true, width: 120 },
                    { field: '2月应收', title: '2月应收', align: 'center', sortable: true, width: 120 },
                    { field: '3月应收', title: '3月应收', align: 'center', sortable: true, width: 120 },
                    { field: '4月应收', title: '4月应收', align: 'center', sortable: true, width: 120 },
                    { field: '5月应收', title: '5月应收', align: 'center', sortable: true, width: 120 },
                    { field: '6月应收', title: '6月应收', align: 'center', sortable: true, width: 120 },
                    { field: '7月应收', title: '7月应收', align: 'center', sortable: true, width: 120 },
                    { field: '8月应收', title: '8月应收', align: 'center', sortable: true, width: 120 },
                    { field: '9月应收', title: '9月应收', align: 'center', sortable: true, width: 120 },
                    { field: '10月应收', title: '10月应收', align: 'center', sortable: true, width: 120 },
                    { field: '11月应收', title: '11月应收', align: 'center', sortable: true, width: 120 },
                    { field: '12月应收', title: '12月应收', align: 'center', sortable: true, width: 120 } 
                ]
            ];

            var ExcelCol = [
                { field: 'OrganName', title: '公司名称', align: 'left', sortable: true, width: 200 },
                { field: 'CommName', title: '项目名称', align: 'left', sortable: true, width: 200 },

                { field: 'CorpCostName', title: '费用名称', align: 'center', sortable: true, width: 120 },
                { field: '户数', title: '计费数量', align: 'center', sortable: true, width: 120 },
                { field: '年应收金额', title: '年应收金额', align: 'center', sortable: true, width: 120 },
                { field: '1月应收', title: '1月应收', align: 'center', sortable: true, width: 120 },
                { field: '2月应收', title: '2月应收', align: 'center', sortable: true, width: 120 },
                { field: '3月应收', title: '3月应收', align: 'center', sortable: true, width: 120 },
                { field: '4月应收', title: '4月应收', align: 'center', sortable: true, width: 120 },
                { field: '5月应收', title: '5月应收', align: 'center', sortable: true, width: 120 },
                { field: '6月应收', title: '6月应收', align: 'center', sortable: true, width: 120 },
                { field: '7月应收', title: '7月应收', align: 'center', sortable: true, width: 120 },
                { field: '8月应收', title: '8月应收', align: 'center', sortable: true, width: 120 },
                { field: '9月应收', title: '9月应收', align: 'center', sortable: true, width: 120 },
                { field: '10月应收', title: '10月应收', align: 'center', sortable: true, width: 120 },
                { field: '11月应收', title: '11月应收', align: 'center', sortable: true, width: 120 },
                { field: '12月应收', title: '12月应收', align: 'center', sortable: true, width: 120 }
            ];

            var column = [ 
                [
                    { field: 'OrganName', title: '公司名称', align: 'left', sortable: true, width: 200 },
                    { field: 'CommName', title: '项目名称', align: 'left', sortable: true, width: 200 },

                    { field: 'CorpCostName', title: '费用名称', align: 'center', sortable: true, width: 120 },
                    { field: '户数', title: '计费数量', align: 'center', sortable: true, width: 120 },
                    { field: '年应收金额', title: '年应收金额', align: 'center', sortable: true, width: 120 },
                    { field: '1月应收', title: '1月应收', align: 'center', sortable: true, width: 120 },
                    { field: '2月应收', title: '2月应收', align: 'center', sortable: true, width: 120 },
                    { field: '3月应收', title: '3月应收', align: 'center', sortable: true, width: 120 },
                    { field: '4月应收', title: '4月应收', align: 'center', sortable: true, width: 120 },
                    { field: '5月应收', title: '5月应收', align: 'center', sortable: true, width: 120 },
                    { field: '6月应收', title: '6月应收', align: 'center', sortable: true, width: 120 },
                    { field: '7月应收', title: '7月应收', align: 'center', sortable: true, width: 120 },
                    { field: '8月应收', title: '8月应收', align: 'center', sortable: true, width: 120 },
                    { field: '9月应收', title: '9月应收', align: 'center', sortable: true, width: 120 },
                    { field: '10月应收', title: '10月应收', align: 'center', sortable: true, width: 120 },
                    { field: '11月应收', title: '11月应收', align: 'center', sortable: true, width: 120 },
                    { field: '12月应收', title: '12月应收', align: 'center', sortable: true, width: 120 }, 

                ]
            ];
             

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
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {

                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成报表');
                        }
                        else {
                            Export('理论应收统计报表Excel', $('#TableContainer'));
                        }
                    }
                }
                , '-',
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
             


          

            function ExcuteOnServer() {

               
                var tmpCommID = $('#CommIDs').val();
                if (tmpCommID == '') {
                    HDialog.Info('请选择管理项目！');
                    return false;
                }

                 

                document.getElementById('hiIsSQLData').value = "1";

                
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
                $.tool.DataPostNoLoading('FeesReportNew1_1', 'StartTask', $('#NewFeesDueCutSearch').serialize(),
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
                        param = $.JQForm.GetParam("FeesReportNew1_1", "LoadData", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });

            }

            LoadList(1, 500);

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('FeesReportNew1_1', 'TakeProgress', $('#NewFeesDueCutSearch').serialize(),
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
                $.tool.DataPostNoLoading('FeesReportNew1_1', 'LoadData',   '&page=1&rows=10000',
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data); 
                        if (_Data != '[]') {
                            
                            var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                            var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                            var l = $('<input type="hidden" id="txtName" name="txtName" />');
                           
                            var aa = ChangeToTableyyy(Obj.rows, Headcolumn, ExcelCol);
                           
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
                var parts = num.toString().split(".");
                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                return parts.join(".");
            };

        </script>

    </form>
</body>
</html>
