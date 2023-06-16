<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewFeesDebtCutSearch3.aspx.cs" Inherits="M_Main.InquiriesNew.NewFeesDebtCutSearch3" %>

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

        <div class="datagrid-mask" style="height: 100%; width: 150%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>
        <input style="width: 8px" id="hiRoomSigns" size="1" type="hidden" name="hiRoomSigns" runat="server" />
        <input style="width: 8px" id="RoomIDs" size="1" type="hidden" name="RoomIDs" runat="server" />
        <input style="width: 8px" id="hiRegionNames" size="1" type="hidden" name="hiRegionNames" runat="server" />
        <input style="width: 8px" id="CustID" class="easyui-validatebox" size="1" type="hidden" name="CustID" runat="server" />
        <input style="width: 12px" id="hiCustName" class="easyui-validatebox" size="1" type="hidden" name="hiCustName" runat="server" />
        <input style="width: 8px" id="RoomID" class="easyui-validatebox" size="1" type="hidden" name="RoomID" runat="server" />
        <input style="width: 8px" id="hiRoomSign" class="easyui-validatebox" size="1" type="hidden" name="hiRoomSign" runat="server" />
        <input style="width: 8px" id="CarparkIDs" class="easyui-validatebox" size="1" type="hidden" name="CarparkIDs" runat="server" />
        <input style="width: 8px" id="hiCarparkNames" class="easyui-validatebox" size="1" type="hidden" name="hiCarparkNames" runat="server" />
        <input style="width: 8px" id="hiParkNames" class="easyui-validatebox" size="1" type="hidden" name="hiParkNames" runat="server" />
        <input style="width: 8px" id="ParkIDs" class="easyui-validatebox" size="1" type="hidden" name="ParkIDs" runat="server" />
        <input style="width: 8px" id="hiCostNames" class="easyui-validatebox" size="1" type="hidden" name="hiCostNames" runat="server" />
        <input style="width: 8px" id="RegionSNums" size="1" type="hidden" name="RegionSNums" runat="server" />
        <input style="width: 8px" id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server" />
        <input style="width: 8px" id="hiLoginUserCode" size="1" type="hidden" name="hiLoginUserCode" runat="server" />
        <input style="width: 8px" id="BuildSNums" size="1" type="hidden" name="BuildSNums" runat="server" />
        <input style="width: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />




        <input id="CostIDs" class="easyui-validatebox" size="1" type="hidden" name="CostIDs" runat="server" />
        <input id="StanIDs" class="easyui-validatebox" size="1" type="hidden" name="StanIDs" runat="server" />
        <input id="hiStanNames" class="easyui-validatebox" size="1" type="hidden" name="hiStanNames" runat="server" />
        <input style="height: 22px; width: 32px" id="Hidden14" size="1" type="hidden" name="PageIndex"
            runat="server" /><input style="height: 21px; width: 24px" id="Hidden15" size="1" type="hidden" name="PrintParms"
                runat="server" /><input style="height: 22px; width: 24px" id="Hidden16" size="1" type="hidden" name="CostGeneType"
                    runat="server" /><input style="height: 21px; width: 24px" id="Hidden17" size="1" type="hidden" name="OptCode"
                        runat="server" /><input style="height: 21px; width: 24px" id="Hidden18" size="1" type="hidden" name="Flag" runat="server">

        <div id="tb">
            <table border="0" style="font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td style="width: auto;" align="left">收款截止时间&nbsp;<input type="text" class="Wdate"
                        onclick="WdatePicker()" id="FeesStopEndDate" runat="server" name="FeesStopEndDate" />&nbsp;
             时间类型&nbsp;<select id="FeesDateType" name="FeesDateType" runat="server">
                 <option value="1" selected>费用日期</option>
                 <option value="2">应收日期</option>
             </select>&nbsp;
             费用时间从&nbsp;<input type="text" class="Wdate"
                 onclick="WdatePicker()" id="EditBeginDate" runat="server" name="EditBeginDate" />&nbsp;到&nbsp;<input type="text" runat="server" class="Wdate"
                     onclick="WdatePicker()" id="EditEndDate" name="EditEndDate" /></td>
                    <td><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="setIsSQLData();">生成欠费</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="SearchDlg();">筛选条件</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="ToExcel();">Excel导出</a>


                        <input style="height: 22px; width: 32px" id="PageIndex" size="1" type="hidden" name="PageIndex"
                            runat="server" /><input style="height: 21px; width: 24px" id="PrintParms" size="1" type="hidden" name="PrintParms"
                                runat="server" /><input style="height: 22px; width: 24px" id="CostGeneType" size="1" type="hidden" name="CostGeneType"
                                    runat="server" /><input style="height: 21px; width: 24px" id="OptCode" size="1" type="hidden" name="OptCode"
                                        runat="server" /><input style="height: 21px; width: 24px" id="Flag" size="1" type="hidden" name="Flag" runat="server" />
                    </td>
                </tr>
            </table>
        </div>



        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1024px; height: 330px; padding: 10px;">
            <table class="DialogTable">
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
                            name="CustName" class="easyui-searchbox" data-options="editable:false" runat="server" /><input id="Hidden1" style="width: 8px; height: 19px" type="hidden"
                                size="1" name="CustID" runat="server" /><input id="Hidden2" style="width: 12px; height: 19px" type="hidden"
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
                        <input id="Hidden3" style="width: 8px; height: 22px" type="hidden"
                            size="1" name="RoomID" runat="server" /><input id="Hidden4" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="hiRoomSign" runat="server" />

                    </td>
                    <td class="TdTitle">房屋状态</td>
                    <td class="TdContentSearch">
                        <select id="RoomState" name="RoomState" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">查询范围</td>
                    <td class="TdContentSearch">
                        <select id="SearchRange" name="SearchRange" runat="server">
                            <option value="0" selected>全部客户</option>
                            <option value="1">银行代收客户</option>
                            <option value="2">非银行代收客户</option>
                        </select></td>
                    <td class="TdTitle">代收银行</td>
                    <td class="TdContentSearch">
                        <select id="BankName" name="BankName" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">车位区域</td>
                    <td class="TdContentSearch">
                        <input id="CarparkNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCarpark"
                            name="CarparkNames" runat="server">
                        <input class="Control_ItemInput" id="Hidden5" style="width: 8px;" type="hidden"
                            size="1" name="CarparkIDs" runat="server"><input class="Control_ItemInput" id="Hidden6" style="width: 8px;" type="hidden"
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
                    <td class="TdTitle">欠费时间</td>
                    <td class="TdContentSearch">
                        <select id="CompSymbol1" name="CompSymbol1" runat="server">
                            <option selected></option>
                        </select><input style="width: 100px" id="Comp_Month" class="Control_Iteminput" onkeypress="CheckNumeric();"
                            maxlength="50" size="26" name="Comp_Month" runat="server">月</td>
                    <td class="TdTitle">欠费金额</td>
                    <td class="TdContentSearch">
                        <select id="CompSymbol2" name="CompSymbol2" runat="server">
                            <option selected></option>
                        </select><input style="width: 100px;" id="Comp_Amount" class="Control_Iteminput" onkeypress="CheckNumeric();"
                            maxlength="50" size="26" name="Comp_Amount" runat="server">元</td>
                </tr>
                <%-- <tr>
                    <td class="TdTitle">是否垫付</td>
                    <td class="TdContentSearch">
                        <select id="IsProperty" name="IsProperty" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">是否预收</td>
                    <td class="TdContentSearch">
                        <select id="IsPrec" name="IsPrec" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>--%>

                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:ExcuteOnServer(); ">确定筛选</a>

                    </td>
                </tr>
            </table>
        </div>


        <div class="easyui-datagrid" id="TableContainer">
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");

                $("#scExcel").attr('disabled', 'disabled');
            }


            var w = $(window).width();
            var h = $(window).height();


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

            InitTableHeight();
            var NewCol = [[


                { field: 'BuildArea', title: '建筑面积', align: 'left', sortable: true, width: 100 },
                { field: 'StateName', title: '房屋状态', align: 'left', sortable: true, width: 100 },
                { field: 'MobilePhone', title: '联系电话', align: 'left', sortable: true, width: 100 }

            ]];

            var frozenColumns = [[
                { field: '客户名称', title: '客户名称', align: 'left', sortable: true, width: 100 },
                { field: '房屋编号', title: '房屋编号', align: 'left', sortable: true, width: 100 },
                { field: '房屋名称', title: '房屋名称', align: 'left', sortable: true, width: 100 },
                { field: '组团区域', title: '组团区域', align: 'left', sortable: true, width: 100 }
            ]];
            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function SearchDlg() {

                btnClear_OnClick();
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
            var intervalProcess;

            function setIsSQLData() {
                document.getElementById('hiIsSQLData').value = 1;
                //  Static(1, top.ListPageSize);
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 5000);
            }



            function Static(page, rows) {
                //第一次统计生成统计表
                $.tool.DataPostNoLoading('FeesDebtSearchNew2', 'LoadData', "page=" + page + "&rows=" + rows + "&" + $('#frmForm').serialize(),
                    function Init() {

                    },
                    function callback(_Data) {

                        var Data = _Data;
                        var Data = eval("(" + _Data + ")"); //转换为json对象
                        SetEasyUiColumn(Data);
                        LoadListBindingColumn(Data, rows);
                        if ($('#hiIsSQLData').val() == '1') {
                            $('#hiIsSQLData').val('2');
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                        return false;
                    });
            }




            function SetEasyUiColumn(_Data) {
                var col = "";
                var obj = "";
                if (_Data.rows.length > 0) {
                    obj = _Data.rows[0];
                    var i = 0;
                    for (var attr in obj) {
                        i = i + 1;
                        if (attr != "客户名称" && attr != "房屋编号" && attr != "房屋名称" && attr != "组团区域") {
                            col = col + "," + "{ field: \'" + attr + "\', title: \'" + attr + "\', align: \'left\', sortable: true,width:150}";
                        }

                    }

                    col = col.substr(1, col.length);
                    col = "[[" + col + "]]";
                    NewCol = eval(col);
                }

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

            function LoadListBindingColumn(_Data, rows) {

                $("#TableContainer").datagrid({
                    data: _Data,
                    method: "get",
                    loadMsg: '',
                    pageSize: rows,
                    pageList: top.ListPageList,
                    columns: NewCol,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    frozenColumns: frozenColumns,
                    remoteSort: false,
                    singleSelect: true,
                    width: "100%",
                    toolbar: '#tb',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    showFooter: true,
                    onHeaderContextMenu: function (e, field) {
                        e.preventDefault();
                        if (!cmenu) {
                            createColumnMenu();
                        }
                        cmenu.menu('show', {
                            left: e.pageX,
                            top: e.pageY
                        });
                    },
                    rowStyler: function (index, row) {
                        if (row.客户名称 == '[合计]') {
                            return 'color:red;';
                        }
                        //if (row.客户名称 == 'footer') {
                        //    return 'background-color:#F4F4F4;border:none;'; // return inline style
                        //}
                    },
                    onLoadSuccess: function () {
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

                                    document.getElementById('hiIsSQLData').value = 2;
                                    Static(Pn, Ps);
                                    $('#TableContainer').datagrid('options').pageNumber = Pn;
                                    $('#TableContainer').datagrid('options').pageSize = Ps;
                                }
                            });
                        }

                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                //客户名称: 'footer',
                                客户名称: "<span style='color:red'>累计合计</span>",
                                合计欠费: "<span style='color:red'>0</span>",
                            }
                        ]);

                        if (document.getElementById('hiIsSQLData').value != "-1") {
                            $.tool.DataPostNoLoading('FeesDebtSearchNew2', "NewFeesDebtCutSearch3Sum", $('#frmForm').serialize(),
                                function Init() {
                                    //加载页脚
                                    $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            客户名称: "<span style='color:red'>累计合计</span>",
                                            合计欠费: "<span style='color:red'>0</span>",
                                        }
                                    ]);
                                },
                                function callback(_Data) {

                                    var Data = eval("(" + _Data + ")"); //转换为json对象
                                    var obj = Data.rows[0];
                                    //加载页脚
                                    $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            客户名称: "<span style='color:red'>累计合计</span>",
                                            合计欠费: "<span style='color:red'>" + obj.TotalAmount + "</span>",
                                        }
                                    ]);
                                },
                                function completeCallback() {

                                },
                                function errorCallback() {
                                    //加载页脚
                                    $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            客户名称: "<span style='color:red'>累计合计</span>",
                                            合计欠费: "<span style='color:red'>0</span>",
                                        }
                                    ]);
                                });
                        }

                    },
                    onLoadError: function () {
                        HDialog.Info('按费用明细生成失败！在操作完成之前超时时间已过或服务器未响应。!');
                    }
                });

            }

            document.getElementById('hiIsSQLData').value = -1;

            function LoadList() {
                Static(1, top.ListPageSize);
            }

            //初始化加载数据
            LoadList();
            //展示进度
            ShowProgress();
            //获取执行情况进度
            ProgressInterval = setInterval("TakeProgress()", 5000);

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('FeesDebtSearchNew2', 'StartTask', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        //  LoadData();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('FeesDebtSearchNew2', 'TakeProgress', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {

                            LoadList();
                            CloseProgress();
                        }
                        else {
                            SetProgress(Obj);

                            if (Obj[0].Curr == '100') {

                                LoadList();

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

            $(window).resize(function () {
                $('#TableContainer').datagrid('resize')
            });

        </script>

        <script type="text/javascript">


            function btnClear_OnClick() {


                document.getElementById('CustID').value = "";
                document.getElementById('hiCustName').value = "";

                document.getElementById('RoomID').value = "";

                $('#CustName').searchbox('setValue', '');
                document.getElementById('hiCustName').value = "";

                document.getElementById('RoomID').value = "";
                $('#RoomSign').searchbox('setValue', '');

                document.getElementById('hiRoomSign').value = "";

                document.getElementById('CostIDs').value = "";
                $('#CostNames').searchbox('setValue', '');
                document.getElementById('hiCostNames').value = "";

                document.getElementById('StanIDs').value = "";
                $('#StanNames').searchbox('setValue', '');
                document.getElementById('hiStanNames').value = "";

                document.getElementById('RoomIDs').value = "";

                document.getElementById('CustTypeID').value = "";
                document.getElementById('ChargeTypeID').value = "";

                document.getElementById('ParkIDs').value = "";
                $('#ParkNames').searchbox('setValue', '');
                document.getElementById('hiParkNames').value = "";

                document.getElementById('CarparkIDs').value = "";
                document.getElementById('CarparkNames').value = "";
                document.getElementById('hiCarparkNames').value = "";

                document.getElementById('Comp_Month').value = "";
                document.getElementById('Comp_Amount').value = "";


                document.getElementById('RegionSNums').value = "";
                document.getElementById('RegionNames').value = "";
                document.getElementById('hiRegionNames').value = "";

            }

            function ExcuteOnServer() {

                $('#SearchDlg').dialog('close');
                if ($('#StaticType').val() != '') {
                    $.messager.confirm('提示', '是否重新生成欠费', function (r) {
                        if (r) {

                            setIsSQLData();
                        }
                        else {

                            document.getElementById('hiIsSQLData').value = 2;
                            $('#scExcel').linkbutton('enable');
                            LoadList();
                            $('#SearchDlg').dialog('close');

                        }
                    });
                }
                else {
                    setIsSQLData();
                }

            }


            function ToExcel() {
                window.location.href = '../InquiriesNew/NewFeesDebtCutSearch3ToExcel.aspx?CostIDs=' + document.getElementById('CostIDs').value;
            }

        </script>
    </form>
</body>
</html>

