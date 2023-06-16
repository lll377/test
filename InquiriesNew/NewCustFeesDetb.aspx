<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewCustFeesDetb.aspx.cs" Inherits="M_Main.InquiriesNew.NewCustFeesDetb" %>





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


        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 330px;">
            <table class="DialogTable">
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
               <tr>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <input id="RegionNames" class="easyui-searchbox" searcher="SelRegion" data-options="editable:false" size="14" name="RegionNames" runat="server"/>
                    </td>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <input id="BuildNames" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false" name="BuildNames" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                <tr>
                    <td class="TdTitle">楼宇类型</td>
                    <td class="TdContentSearch">
                        <select style="z-index: 0" id="BuildType" name="BuildType" runat="server">
                            <option selected="selected"></option>
                        </select>
                    </td>
                    <td class="TdTitle">交房状态</td>
                    <td class="TdContentSearch">
                        <select id="RoomState" name="RoomState" runat="server">
                            <option selected="selected"></option>
                        </select></td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户类别</td>
                    <td class="TdContentSearch">
                        <select id="CustTypeID" name="CustTypeID" runat="server">
                            <option selected="selected"></option>
                        </select></td>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust" name="CustName" class="easyui-searchbox" data-options="editable:false" runat="server" />
                        <input id="CustID" style="width: 8px; height: 19px" type="hidden" size="1" name="CustID" runat="server" />
                        <input id="hiCustName" style="width: 12px; height: 19px" type="hidden" size="1" name="hiCustName" runat="server" />
                    </td>
                </tr>
               <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                <tr>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelRoomID"  class="easyui-combobox" style="width: 150px" name="SelRoomID" runat="server">
                            <option selected="selected"></option>
                        </select></td>

                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" class="easyui-searchbox" searcher="SelRoom" name="RoomSign" data-options="editable:false" runat="server" />
                        <input id="RoomID" style="width: 8px; height: 22px" type="hidden" size="1" name="RoomID" runat="server" />
                        <input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden" size="1" name="hiRoomSign" runat="server" />
                    </td>
                </tr>
                
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                <tr>
                    <td class="TdTitle">车位区域</td>
                    <td class="TdContentSearch">
                        <input id="CarparkNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCarpark" name="CarparkNames" runat="server"/>
                        <input class="Control_ItemInput" id="CarparkIDs" style="width: 8px;" type="hidden" size="1" name="CarparkIDs" runat="server"/>
                        <input class="Control_ItemInput" id="hiCarparkNames" style="width: 8px;" type="hidden" size="1" name="hiCarparkNames" runat="server"/>
                    </td>
                    <td class="TdTitle">车位</td>
                    <td class="TdContentSearch">
                        <input id="ParkNames" class="easyui-searchbox" data-options="editable:false" searcher="SelPark" name="ParkNames" runat="server"/>
                    </td>
                </tr>
              <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                  
                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch" colspan="3">
                        <input id="CostNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCost" name="CostNames" runat="server"/></td>
                     
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
 
                <tr>
                    <td colspan="4" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ExcuteOnServer()">确定筛选</a>&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="btnClear_OnClick();">清&nbsp;&nbsp;空</a>
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
                //$("#CustTypeID").combobox('setValue', '');
                //$("#ChargeMode").combobox('setValue', '');
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
                    { field: 'custname', title: '客户名称', align: 'left', sortable: true, width: 200 },
                    { field: 'roomsign', title: '房屋编号', align: 'left', sortable: true, width: 200 },

                    { field: 'RoomStateName', title: '交房状态', align: 'center', sortable: true, width: 120 },
                    { field: 'ParkName', title: '车位编号', align: 'center', sortable: true, width: 120 },
                    { field: 'costname', title: '费用项目', align: 'center', sortable: true, width: 120 },
                    { field: 'feesenddata', title: '缴费截止时间', align: 'center', sortable: true, width: 120 } 
                ]
            ];

            var ExcelCol = [
                { field: 'custname', title: '客户名称', align: 'left', sortable: true, width: 200 },
                { field: 'roomsign', title: '房屋编号', align: 'left', sortable: true, width: 200 },

                { field: 'RoomStateName', title: '交房状态', align: 'center', sortable: true, width: 120 },
                { field: 'ParkName', title: '车位编号', align: 'center', sortable: true, width: 120 },
                { field: 'costname', title: '费用项目', align: 'center', sortable: true, width: 120 },
                { field: 'feesenddate', title: '缴费截止时间', align: 'center', sortable: true, width: 150 } 
            ];

            var column = [
                [
                    { field: 'custname', title: '客户名称', align: 'left', sortable: true, width: 200 },
                    { field: 'roomsign', title: '房屋编号', align: 'left', sortable: true, width: 200 },

                    { field: 'RoomStateName', title: '交房状态', align: 'center', sortable: true, width: 120 },
                    { field: 'ParkName', title: '车位编号', align: 'center', sortable: true, width: 120 },
                    { field: 'costname', title: '费用项目', align: 'center', sortable: true, width: 120 },
                    { field: 'feesenddate', title: '缴费截止时间', align: 'center', sortable: true, width: 150 }  
                ]
            ];


            

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
                //, '-',
                //{
                //    text: '备注',
                //    iconCls: 'icon-help',
                //    handler: function () {
                //        $('#DlgMemo').parent().appendTo($("form:first"))
                //        $('#DlgMemo').dialog('open');
                //    }
                //}
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
                $.tool.DataPostNoLoading('FeesReportNew3_4', 'StartTask', $('#NewFeesDueCutSearch').serialize(),
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
                        param = $.JQForm.GetParam("FeesReportNew3_4", "LoadData", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                        $("#SearchDlg").dialog("close");
                    }
                });

            }

            LoadList(1, 500);

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('FeesReportNew3_4', 'TakeProgress', $('#NewFeesDueCutSearch').serialize(),
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
            function SelCust() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });
                var w = 700;
                var h = 400;
                var conent = "../DialogNew/CustDlg.aspx";
                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $.tool.DataGet('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
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
                                $('#SelRoomID').combobox({
                                    data: RoomData,
                                    valueField: 'RoomID',
                                    textField: 'RoomText',
                                    onChange: function (n, o) {
                                        var data = $('#SelRoomID').combobox('getData');
                                        if (data.length > 0) {
                                            for (var i = 0; i < data.length; i++) {
                                                if (n == data[i].RoomID) {

                                                    $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                                    var buildArea = data[i].RoomID.split("|")[1];
                                                    $('#BuildArea').val(buildArea);
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
                    $('#BuildArea').val(data.BuildArea);
                    $('#CalcArea').val(data.BuildArea);
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

            function SelPark() {
                HDialog.Open('700', '400', "../dialogNew/MultiParkDlg.aspx", '车位选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");
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
                $.tool.DataPostNoLoading('FeesReportNew3_4', 'LoadData', '&page=1&rows=10000',
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
