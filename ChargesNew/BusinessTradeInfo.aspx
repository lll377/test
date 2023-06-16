<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BusinessTradeInfo.aspx.cs" Inherits="M_Main.ChargesNew.BusinessTradeInfo" %>

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
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="ReceID" name="ReceID" value="" runat="server" />
        <input type="hidden" id="SelectRoomList" name="SelectRoomList" value="" runat="server" />
        <input type="hidden" id="SelRoomIDs" name="SelRoomIDs" value="" runat="server" />
        <input type="hidden" id="SelRoomSigns" name="SelRoomSigns" value="" runat="server" />

        <input id="BuildSNums" type="hidden" name="BuildSNums" runat="server" />
        <input id="hiBuildNames" type="hidden" name="hiBuildNames" runat="server" designtimedragdrop="492" />
        <input id="hiRoomSigns" type="hidden" name="hiRoomSigns" runat="server" />
        <input id="RoomIDs" type="hidden" name="RoomIDs" runat="server" />
        <input id="hiRegionNames" type="hidden" name="hiRegionNames" runat="server" />

        <input id="hiParkNames" type="hidden" name="hiParkNames" runat="server" />
        <input id="ParkIDs" type="hidden" name="ParkIDs" runat="server" />
        <input id="hiCostNames" type="hidden" name="hiCostNames" runat="server" />
        <input id="RegionSNums" type="hidden" name="RegionSNums" runat="server" />
        <input id="hiCommID" type="hidden" name="hiCommID" runat="server" />
        <input id="hiLoginUserCode" type="hidden" name="hiLoginUserCode" runat="server" />
        <input id="hiIsSQLData" type="hidden" name="hiIsSQLData" runat="server" />
        <input id="CostIDs" type="hidden" name="CostIDs" runat="server" />
        <input id="StanIDs" type="hidden" name="StanIDs" runat="server" />
        <input id="hiStanNames" type="hidden" name="hiStanNames" runat="server" />
        <input id="PageIndex" type="hidden" name="PageIndex" runat="server" />
        <input id="PrintParms" type="hidden" name="PrintParms" runat="server" />
        <input id="CostGeneType" type="hidden" name="CostGeneType" runat="server" />
        <input id="OptCode" type="hidden" name="OptCode" runat="server" />
        <input id="Flag" type="hidden" name="Flag" runat="server" />
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 350px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">费用时间从</td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" style="width: 40%" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EditBeginDate" runat="server" name="EditBeginDate" />到<input type="text" runat="server" class="Wdate" style="width: 40%" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EditEndDate" name="EditEndDate" /></td>
                    <td class="TdTitle">时间类型</td>
                    <td class="TdContentSearch">
                        <select id="FeesDateType" name="FeesDateType" runat="server">
                            <option value="1" selected>费用日期</option>
                            <option value="2">应收日期</option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋多选</td>
                    <td class="TdContentSearch" colspan="3">
                        <input id="RoomSigns"
                            name="RoomSigns" style="width: 90%" searcher="SelRooms" class="easyui-searchbox" data-options="editable:false" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <input id="BuildNames" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false"
                            name="BuildNames" runat="server" /></td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <input id="RegionNames" class="easyui-searchbox" searcher="SelRegion" data-options="editable:false"
                            size="14" name="RegionNames" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户类别</td>
                    <td class="TdContentSearch">
                        <select id="CustTypeID" name="CustTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">收费类型</td>
                    <td class="TdContentSearch">
                        <select id="ChargeTypeID" name="ChargeTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust"
                            name="CustName" class="easyui-searchbox" data-options="editable:false" runat="server" /><input id="CustID" style="width: 8px; height: 19px" type="hidden"
                                size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                    size="1" name="hiCustName" runat="server" />

                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" style="width: 150px" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" class="easyui-searchbox" searcher="SelRoom" name="RoomSign" data-options="editable:false" runat="server" />
                        <input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                            size="1" name="RoomID" runat="server" /><input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="hiRoomSign" runat="server" />
                    </td>
                    <td class="TdTitle">交房状态</td>
                    <td class="TdContentSearch" style="display:none;">
                        <%--<select id="RoomState" name="RoomState" runat="server" style="display:none;">
                            <option selected></option>
                        </select>--%>
                        <input id="RoomState" type="hidden" name="RoomState" value="" />
                    </td>
                    <%--<td class="TdContentSearch">
                        <input id="RoomStateNames" style="width:90%" class="easyui-searchbox" searcher="SelRoomState" name="RoomStateNames" runat="server" />
                    </td>--%>  
                    <%--组团区域--%>
                    <%--<td class="TdContentSearch">
                        <input id="RoomStateNames" class="easyui-searchbox" searcher="SelRoomState" data-options="editable:false" size="14" name="RoomState" runat="server">
                    </td>--%>
                    <td class="TdContentSearch">
                        <input id="RoomStates" type="hidden" name="RoomStates" value="" />
                        <input id="hiRoomStateNames" type="hidden" name="hiRoomStateNames" value="" />    
                        <input id="RoomStateNum" type="hidden" name="RoomStateNum" value="" />                         
                        <input id="RoomStateNames" style="width:63%" class="easyui-searchbox" searcher="SelRoomState" name="RoomStateNames" runat="server" />
                    </td>   
                    <%--组团区域--%>
                </tr>
                <tr>
                    <td class="TdTitle">车位区域</td>
                    <td class="TdContentSearch">
                        <input id="CarparkNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCarpark"
                            name="CarparkNames" runat="server">
                        <input class="Control_ItemInput" id="CarparkIDs" style="width: 8px;" type="hidden"
                            size="1" name="CarparkIDs" runat="server"><input class="Control_ItemInput" id="hiCarparkNames" style="width: 8px;" type="hidden"
                                size="1" name="hiCarparkNames" runat="server">
                    </td>
                    <td class="TdTitle">车位</td>
                    <td class="TdContentSearch">
                        <input id="ParkNames" class="easyui-searchbox" data-options="editable:false" searcher="SelPark"
                            name="ParkNames" runat="server">
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCost"
                            name="CostNames" runat="server"></td>
                    <td class="TdTitle">收费标准</td>
                    <td class="TdContentSearch">
                        <input id="StanNames" class="easyui-searchbox" data-options="editable:false" searcher="SelStan"
                            name="StanNames" runat="server">
                    </td>
                </tr>
                <tr>

                    <td class="TdTitle">是否冻结</td>
                    <td class="TdContentSearch">
                        <select id="IsFreeze" name="IsFreeze" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">固定电话</td>
                    <td class="TdContentSearch">
                        <input id="MobilePhone" name="MobilePhone" class="easyui-textbox" />
                    </td>
                </tr>

                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:ExcuteOnServer(); ">确定筛选</a>

                    </td>

                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            //交房状态
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

            var w = $(window).width();
            var h = $(window).height();

            function InitFunction() {
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            function SelBuild() {
                var varReturn;
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

            function SelCost() {
                var varReturn;

                var w = 700;
                var h = 400;

                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);

                    }
                });

                return false;
            }

            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

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
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/RoomDlg.aspx";

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

            function SelStan() {
                var tmpCostIDs = $('#CostIDs').val();

                if (tmpCostIDs == "") {
                    HDialog.Info("请选择费用项目,此项不能为空!");
                    NewFeesDueCutSearch.btnSelCost.focus();
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

                var w = $(window).width();
                var h = $(window).height();

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

                        var reg = new RegExp("\\|", "g");//g,表示全部替换。
                        var temSelRoomIDs = SelRoomIDs.replace(reg, ',');
                        $('#RoomIDs').val(temSelRoomIDs);

                        $('#SelAll').val(SelAll);

                        return true;
                    }
                });

                return false;
            }


            function ExcuteOnServer() {

                document.getElementById('hiIsSQLData').value = 1;
                GetFlag();

                LoadList();
                $('#SearchDlg').dialog('close');
            }
            function GetFlag() {

                var strFlag = "";
                var strCostIDs = document.getElementById('CostIDs').value;
                var strRoomIDs = document.getElementById('RoomIDs').value;
                var strParkIDs = document.getElementById('ParkIDs').value;

                if (strCostIDs != "") {
                    strFlag = strFlag + "A";
                }
                if (strRoomIDs != "") {
                    strFlag = strFlag + "B";
                }
                if (strParkIDs != "") {
                    strFlag = strFlag + "C";
                }
                document.getElementById('Flag').value = strFlag;

            }
            function GetFXMX() {
                GetFlag();
                var strFlag = document.getElementById('Flag').value;

                var CommID = document.getElementById('hiCommID').value;
                var UserCode = document.getElementById('hiLoginUserCode').value;

                var strSQL = "";
                if (CommID != undefined && CommID != "") {
                    strSQL = strSQL + "  and CommID = " + CommID + " ";
                }
                strSQL = strSQL + " and UserCode = '" + UserCode + "' ";


                window.location.href = "FeesDueCutSearchCre.aspx?Flag=" + strFlag + "&strSQL=" + strSQL;
            }
            function GetFXHZ() {
                GetFlag();
                var strFlag = document.getElementById('Flag').value;

                var CommID = document.getElementById('hiCommID').value;
                var UserCode = document.getElementById('hiLoginUserCode').value;

                var strSQL = "";
                if (CommID != undefined && CommID != "") {
                    strSQL = strSQL + "  and CommID = " + CommID + " ";
                }
                strSQL = strSQL + " and UserCode = '" + UserCode + "' ";

                window.location.href = "FeesDueCutSearchSecCre.aspx?Flag=" + strFlag + "&strSQL=" + strSQL;
            }


            //重写DataGrid,支持更改页脚样式
            var myview = $.extend({}, $.fn.datagrid.defaults.view, {
                renderFooter: function (target, container, frozen) {
                    var opts = $.data(target, 'datagrid').options;
                    var rows = $.data(target, 'datagrid').footer || [];
                    var fields = $(target).datagrid('getColumnFields', frozen);
                    var table = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'];

                    for (var i = 0; i < rows.length; i++) {
                        var styleValue = opts.rowStyler ? opts.rowStyler.call(target, i, rows[i]) : '';
                        var style = styleValue ? 'style="' + styleValue + '"' : '';
                        table.push('<tr class="datagrid-row" datagrid-row-index="' + i + '"' + style + '>');
                        table.push(this.renderRow.call(this, target, fields, frozen, i, rows[i]));
                        table.push('</tr>');
                    }
                    table.push('</tbody></table>');
                    $(container).html(table.join(''));
                }
            });

            var frozenColumns = [[                
                { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 200 },
                { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 200 },
                { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, width: 100 }               
            ]]

            var column = [
               [
                   { title: '交房状态', field: 'NowStateName', rowspan: 2, align: 'center', sortable: true, fixed: true, width: 100 },                   
                   { title: '车位编号', field: 'ParkName', rowspan: 2, align: 'center', sortable: true, fixed: true, width: 100 },
                   { title: '客户固定电话', field: 'MobilePhone', rowspan: 2, align: 'center', sortable: true, fixed: true, width: 100 },
                   { title: '建筑面积', field: 'BuildArea', rowspan: 2, align: 'center', sortable: true, fixed: true, width: 100 },
                   { title: '费用名称', field: 'CostName', rowspan: 2, align: 'center', sortable: true, fixed: true, width: 100 },
                   { title: '标准名称', field: 'StanName', rowspan: 2, align: 'center', sortable: true, fixed: true, width: 100 }, 
                  {
                      field: 'FeesDueDate', rowspan: 2, title: '费用日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                          var str = formatDate(row.FeesDueDate, "yyyy-MM-dd");
                          return str;
                      }
                  },
                   {
                       field: 'AccountsDueDate', rowspan: 2, title: '应收日期', align: 'center', sortable: true, width: 100, fixed: true, formatter: function (value, row, index) {
                           var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                           return str;
                       }
                   },
                   {
                       field: 'FeesStateDate', rowspan: 2, title: '开始日期', align: 'center', sortable: true, width: 100, fixed: true, formatter: function (value, row, index) {
                           var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                           return str;
                       }
                   },
                   {
                       field: 'FeesEndDate', rowspan: 2, title: '结束日期', align: 'center', sortable: true, fixed: true, width: 100, formatter: function (value, row, index) {
                           var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                           return str;
                       }
                   },
                    { field: 'StartDegree', rowspan: 2, title: '起度', align: 'left', sortable: true, width: 70 },
                    { field: 'EndDegree', rowspan: 2, title: '止度', align: 'left', sortable: true, width: 70 },
                    { field: 'CalcAmount', rowspan: 2, title: '数量1', align: 'left', sortable: true, width: 70 },
                    { field: 'CalcAmount2', rowspan: 2, title: '数量2', align: 'left', sortable: true, width: 70 },
                   { field: 'TaxRate', rowspan: 2, title: '税率', align: 'center', sortable: true, fixed: true, width: 100 },
                   { title: '应收金额', colspan: 3, align: 'center', sortable: true, fixed: true, width: 300, },
                   { title: '实收金额', colspan: 3, align: 'center', sortable: true, fixed: true, width: 300 }, 
                   { title: '预交冲抵', colspan: 3, align: 'left', sortable: true, width: 300 }, 
                   { title: '减免冲销', colspan: 3, align: 'left', sortable: true, width: 300 },
                   { title: '退款金额', field: 'RefundAmount', rowspan: 2, align: 'left', sortable: true, width: 100 },
                   { title: '欠收金额', colspan: 3, align: 'left', sortable: true, width: 300 },
                   { title: '是否预收', field: 'IsPrecName', rowspan: 2, align: 'left', sortable: true, width: 100 },
                   { title: '备注', field: 'FeesMemo', rowspan: 2, align: 'left', sortable: true, width: 100 }
               ], [
                   //应收金额
                   { field: 'DueAmount', title: '含税金额', align: 'left', sortable: true, width: 100 },
                   { field: 'DueAmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
                   { field: 'DueAmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 },

                   //实收
                   { field: 'PaidAmount', title: '含税金额', align: 'left', sortable: true, width: 100 },
                   { field: 'PaidAmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
                   { field: 'PaidAmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 },

                   //预交冲抵
                   { field: 'PrecAmount', title: '含税金额', align: 'left', sortable: true, width: 100 },
                   { field: 'PrecAmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
                   { field: 'PrecAmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 },

                   //减免
                   { field: 'WaivAmount', title: '含税金额', align: 'left', sortable: true, width: 100 },
                   { field: 'WaivAmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
                   { field: 'WaivAmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 },

                   //欠费金额
                   { field: 'DebtsAmount', title: '含税金额', align: 'left', sortable: true, width: 100 },
                   { field: 'DebtsAmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
                   { field: 'DebtsAmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 }
               ]
            ];

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {

                        SearchDlg();
                    }
                }
                , '-', {
                    text: '按费项明细导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        GetFXMX();
                    }
                }, '-', {
                    text: '按费项汇总导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        GetFXHZ();
                    }
                }
            ];

            function SearchDlg() {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
                btnClear_OnClick();

                setIsSQLData();
            }

            function setIsSQLData() {
                document.getElementById('hiIsSQLData').value = 1;
            }

            function btnClear_OnClick() {

                $('#BuildSNums').val('');
                $('#BuildNames').searchbox('setValue', '');

                $('#CustName').searchbox('setValue', '');


                document.getElementById('CustID').value = "";
                // document.getElementById('CustName').value = "";
                $('#CustName').searchbox('setValue', '');
                document.getElementById('hiCustName').value = "";

                document.getElementById('RoomID').value = "";
                // document.getElementById('RoomSign').value = "";
                $('#RoomSign').searchbox('setValue', '');
                document.getElementById('hiRoomSign').value = "";

                document.getElementById('CostIDs').value = "";
                //  document.getElementById('CostNames').value = "";
                $('#CostNames').searchbox('setValue', '');
                document.getElementById('hiCostNames').value = "";
                document.getElementById('CostNum').value = "";

                document.getElementById('StanIDs').value = "";
                // document.getElementById('StanNames').value = "";
                $('#StanNames').searchbox('setValue', '');
                document.getElementById('hiStanNames').value = "";
                document.getElementById('StanNum').value = "";

                document.getElementById('RoomIDs').value = "";
                // document.getElementById('RoomSigns').value = "";
                $('#RoomSigns').searchbox('setValue', '');
                document.getElementById('hiRoomSigns').value = "";
                document.getElementById('RoomNum').value = "";

                //document.getElementById('RegionSNum').value = "";
                document.getElementById('CustTypeID').value = "";
                document.getElementById('ChargeTypeID').value = "";

                document.getElementById('ParkIDs').value = "";
                //document.getElementById('ParkNames').value = "";
                $('#ParkNames').searchbox('setValue', '');

                document.getElementById('hiParkNames').value = "";
                document.getElementById('ParkNum').value = "";

                document.getElementById('CarparkIDs').value = "";
                document.getElementById('CarparkNames').value = "";
                document.getElementById('hiCarparkNames').value = "";
                document.getElementById('CarparkNum').value = "";

                document.getElementById('RoomState').value = "";

                document.getElementById('SelRoomID').options.length = 0;
                document.getElementById('RegionSNums').value = "";
                document.getElementById('RegionNames').value = "";
                document.getElementById('hiRegionNames').value = "";
                document.getElementById('RegionNum').value = "";

            }

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
                    toolbar: null,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    view: myview,
                    sortOrder: "asc",
                    showFooter: true,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("PayAccount", "SelectFeesDueSeach", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        if (row.FeesID == 'footer') {
                            return 'background-color:#F4F4F4;border:none;'; // return inline style
                        }
                    },
                    onLoadSuccess: function (data) {

                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                FeesID: 'footer',
                                CustName: "<span style='color:red'>累计合计</span>",
                                DueAmount: "<span style='color:red'>0</span>",
                                DueAmountTax: "<span style='color:red'>0</span>",
                                DueAmountTaxAmount: "<span style='color:red'>0</span>",
                                PaidAmount: "<span style='color:red'>0</span>",
                                PaidAmountTax: "<span style='color:red'>0</span>",
                                PaidAmountTaxAmount: "<span style='color:red'>0</span>",
                                PrecAmount: "<span style='color:red'>0</span>",
                                PrecAmountTax: "<span style='color:red'>0</span>",
                                PrecAmountTaxAmount: "<span style='color:red'>0</span>",
                                WaivAmount: "<span style='color:red'>0</span>",
                                WaivAmountTax: "<span style='color:red'>0</span>",
                                WaivAmountTaxAmount: "<span style='color:red'>0</span>",
                                RefundAmount: "<span style='color:red'>0</span>",
                                DebtsAmount: "<span style='color:red'>0</span>",
                                DebtsAmountTax: "<span style='color:red'>0</span>",
                                DebtsAmountTaxAmount: "<span style='color:red'>0</span>"
                            }
                        ]);
                        if (document.getElementById('hiIsSQLData').value != "-1") {
                            $.tool.DataPostNoLoading('FeesDueSeach', "SelectFeesDueSeachSum", $('#frmForm').serialize(),
                                function Init() {
                                    //加载页脚
                                    $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            FeesID: 'footer',
                                            CustName: "<span style='color:red'>累计合计</span>",
                                            DueAmount: "<span style='color:red'>0</span>",
                                            DueAmountTax: "<span style='color:red'>0</span>",
                                            DueAmountTaxAmount: "<span style='color:red'>0</span>",
                                            PaidAmount: "<span style='color:red'>0</span>",
                                            PaidAmountTax: "<span style='color:red'>0</span>",
                                            PaidAmountTaxAmount: "<span style='color:red'>0</span>",
                                            PrecAmount: "<span style='color:red'>0</span>",
                                            PrecAmountTax: "<span style='color:red'>0</span>",
                                            PrecAmountTaxAmount: "<span style='color:red'>0</span>",
                                            WaivAmount: "<span style='color:red'>0</span>",
                                            WaivAmountTax: "<span style='color:red'>0</span>",
                                            WaivAmountTaxAmount: "<span style='color:red'>0</span>",
                                            RefundAmount: "<span style='color:red'>0</span>",
                                            DebtsAmount: "<span style='color:red'>0</span>",
                                            DebtsAmountTax: "<span style='color:red'>0</span>",
                                            DebtsAmountTaxAmount: "<span style='color:red'>0</span>"
                                        }
                                    ]);
                                },
                                function callback(_Data) {

                                    var Data = eval("(" + _Data + ")"); //转换为json对象
                                    var obj = Data.rows[0];
                                    //加载页脚
                                    $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            FeesID: 'footer',
                                            CustName: "<span style='color:red'>累计合计</span>",
                                            DueAmount: "<span style='color:red'>" + obj.DueAmount + "</span>",
                                            DueAmountTax: "<span style='color:red'>" + obj.DueAmountTax + "</span>",
                                            DueAmountTaxAmount: "<span style='color:red'>" + obj.DueAmountTaxAmount + "</span>",
                                            PaidAmount: "<span style='color:red'>" + obj.PaidAmount + "</span>",
                                            PaidAmountTax: "<span style='color:red'>" + obj.PaidAmountTax + "</span>",
                                            PaidAmountTaxAmount: "<span style='color:red'>" + obj.PaidAmountTaxAmount + "</span>",
                                            PrecAmount: "<span style='color:red'>" + obj.PrecAmount + "</span>",
                                            PrecAmountTax: "<span style='color:red'>" + obj.PrecAmountTax + "</span>",
                                            PrecAmountTaxAmount: "<span style='color:red'>" + obj.PrecAmountTaxAmount + "</span>",
                                            WaivAmount: "<span style='color:red'>" + obj.WaivAmount + "</span>",
                                            WaivAmountTax: "<span style='color:red'>" + obj.WaivAmountTax + "</span>",
                                            WaivAmountTaxAmount: "<span style='color:red'>" + obj.WaivAmountTaxAmount + "</span>",
                                            RefundAmount: "<span style='color:red'>" + obj.RefundAmount + "</span>",
                                            DebtsAmount: "<span style='color:red'>" + obj.DebtsAmount + "</span>",
                                            DebtsAmountTax: "<span style='color:red'>" + obj.DebtsAmountTax + "</span>",
                                            DebtsAmountTaxAmount: "<span style='color:red'>" + obj.DebtsAmountTaxAmount + "</span>"

                                        }
                                    ]);
                                },
                                function completeCallback() {

                                },
                                function errorCallback() {
                                    //加载页脚
                                    $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            FeesID: 'footer',
                                            CustName: "<span style='color:red'>累计合计</span>",
                                            DueAmount: "<span style='color:red'>0</span>",
                                            DueAmountTax: "<span style='color:red'>0</span>",
                                            DueAmountTaxAmount: "<span style='color:red'>0</span>",
                                            PaidAmount: "<span style='color:red'>0</span>",
                                            PaidAmountTax: "<span style='color:red'>0</span>",
                                            PaidAmountTaxAmount: "<span style='color:red'>0</span>",
                                            PrecAmount: "<span style='color:red'>0</span>",
                                            PrecAmountTax: "<span style='color:red'>0</span>",
                                            PrecAmountTaxAmount: "<span style='color:red'>0</span>",
                                            WaivAmount: "<span style='color:red'>0</span>",
                                            WaivAmountTax: "<span style='color:red'>0</span>",
                                            WaivAmountTaxAmount: "<span style='color:red'>0</span>",
                                            RefundAmount: "<span style='color:red'>0</span>",
                                            DebtsAmount: "<span style='color:red'>0</span>",
                                            DebtsAmountTax: "<span style='color:red'>0</span>",
                                            DebtsAmountTaxAmount: "<span style='color:red'>0</span>"

                                        }
                                    ]);
                                });
                        }
                    }
                });

            }

            document.getElementById('hiIsSQLData').value = -1;

            LoadList();

        </script>
    </form>
</body>
</html>


