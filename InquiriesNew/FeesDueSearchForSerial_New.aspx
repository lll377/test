<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesDueSearchForSerial_New.aspx.cs" Inherits="M_Main.InquiriesNew.FeesDueSearchForSerial_New" %>

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
    <style type="text/css">
        #CommNames {
            width: 486px;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div class="datagrid-mask" style="height: 100%; width: 150%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <input type="hidden" id="SelectRoomList" name="SelectRoomList" value="" runat="server" />
        <input type="hidden" id="SelRoomIDs" name="SelRoomIDs" value="" runat="server" />
        <input type="hidden" id="SelRoomSigns" name="SelRoomSigns" value="" runat="server" />

        <input id="BuildSNums" type="hidden" size="1" name="BuildSNums" runat="server" />
        <input id="hiBuildNames" type="hidden" size="1" name="hiBuildNames" runat="server" />

        <input id="hiRoomSigns" size="1" type="hidden" name="hiRoomSigns" runat="server" />
        <input id="RoomIDs" size="1" type="hidden" name="RoomIDs" runat="server" />
        <input id="hiRegionNames" size="1" type="hidden" name="hiRegionNames" runat="server" />

        <input id="CustID" type="hidden" size="1" name="CustID" runat="server" />
        <input id="hiCustName" type="hidden" size="1" name="hiCustName" runat="server" />

        <input id="CarparkIDs" type="hidden" size="1" name="CarparkIDs" runat="server">
        <input id="hiCarparkNames" type="hidden" size="1" name="hiCarparkNames" runat="server">

        <input id="RoomID" type="hidden" size="1" name="RoomID" runat="server" />
        <input id="hiRoomSign" type="hidden" size="1" name="hiRoomSign" runat="server" />

        <input id="hiParkNames" size="1" type="hidden" name="hiParkNames" runat="server" />
        <input id="ParkIDs" size="1" type="hidden" name="ParkIDs" runat="server" />
        <input id="hiCostNames" size="1" type="hidden" name="hiCostNames" runat="server" />
        <input id="RegionSNums" size="1" type="hidden" name="RegionSNums" runat="server" />

        <input id="CommID" size="1" type="hidden" name="CommID" runat="server" />
        <input id="hiLoginUserCode" size="1" type="hidden" name="hiLoginUserCode" runat="server" />
        <input id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <input id="CostIDs" size="1" type="hidden" name="CostIDs" runat="server" />
        <input id="StanIDs" size="1" type="hidden" name="StanIDs" runat="server" />
        <input id="hiStanNames" size="1" type="hidden" name="hiStanNames" runat="server" />
        <input id="PageIndex" size="1" type="hidden" name="PageIndex" runat="server" />
        <input id="PrintParms" size="1" type="hidden" name="PrintParms" runat="server" />
        <input id="CostGeneType" size="1" type="hidden" name="CostGeneType" runat="server" />
        <input id="OptCode" size="1" type="hidden" name="OptCode" runat="server" />
        <input id="Flag" size="1" type="hidden" name="Flag" runat="server" />

        <input style="width: 8px" id="hPropertyUses" size="1" type="hidden" name="hPropertyUses" runat="server" />
        <input style="width: 8px" id="hPropertyRights" size="1" type="hidden" name="hPropertyRights" runat="server" />
        <input style="width: 8px" id="hParkingPropertyRights" size="1" type="hidden" name="hParkingPropertyRights" runat="server" />

        <div class="easyui-datagrid" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 430px;">

            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">项目</td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" readonly="readonly"  id="CommNames" onclick="SelCommInfo()" name="CommNames" runat="server" />
                        <input type="text" readonly="readonly" id="CommName" style="display: none" name="CommName" runat="server" />
                        <input id="hiCommNames" type="hidden" size="1" name="hiCommNames" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle"> </td>
                    <td class="TdContentSearch">
                        <input type="hidden" class="Wdate" onchange="ChangeIsDo()" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="CutEndDate"
                            runat="server" name="CutEndDate"  />&nbsp;
          
                    </td>
                    <td class="TdTitle">时间类型</td>
                    <td class="TdContentSearch">
                        <select id="FeesDateType" name="FeesDateType" runat="server" onchange="ChangeIsDo()">
                            <option value="1" selected="selected">费用日期</option>
                            <option value="2">应收日期</option>
                        </select>

                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用时间从</td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" class="Wdate" onchange="ChangeIsDo()" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EditBeginDate" runat="server" name="EditBeginDate" />&nbsp;到&nbsp;
						<input type="text" runat="server" onchange="ChangeIsDo()" class="Wdate" onclick="    WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EditEndDate" name="EditEndDate" />
                         
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <input id="BuildNames" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false"
                            name="BuildNames" runat="server" /></td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <input id="RegionNames" class="easyui-searchbox" searcher="SelRegion" data-options="editable:false"
                            name="RegionNames" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户类别</td>
                    <td class="TdContentSearch">
                        <select id="CustTypeID" name="CustTypeID" runat="server">
                            <option selected="selected"></option>
                        </select></td>
                    <td class="TdTitle">收费类型</td>
                    <td class="TdContentSearch">
                        <select id="ChargeTypeID" name="ChargeTypeID" runat="server">
                            <option selected="selected"></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust"
                            name="CustName" class="easyui-searchbox" data-options="editable:false" runat="server" />

                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" style="width: 150px" name="SelectRoomID" runat="server">
                            <option selected="selected"></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" class="easyui-searchbox" searcher="SelRoom" name="RoomSign" data-options="editable:false" runat="server" />
                    </td>
                    <td class="TdTitle">房屋状态</td>
                    <td class="TdContentSearch">
                        <select id="RoomState" name="RoomState" runat="server">
                            <option selected="selected"></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">车位区域</td>
                    <td class="TdContentSearch">
                        <input id="CarparkNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCarpark"
                            name="CarparkNames" runat="server">
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
                    <td class="TdTitle">实际交房时间从</td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" class="Wdate" style="width: 40%" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="RoomBgTime" runat="server" name="RoomBgTime" />&nbsp;到&nbsp;<input type="text" runat="server" class="Wdate" style="width: 40%" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="RoomEndTime" name="RoomEndTime" /></td>

                </tr>

                <tr>
                    <td class="TdTitle">车位交付时间从</td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" class="Wdate" style="width: 40%" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="ParkingBgTime" runat="server" name="ParkingBgTime" />&nbsp;到&nbsp;<input type="text" runat="server" class="Wdate" style="width: 40%" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="ParkingEndTime" name="ParkingEndTime" /></td>

                </tr>
                <tr>
                    <td class="TdTitle">房屋使用性质</td>
                    <td class="TdContentSearch">
                        <select id="PropertyUses" name="PropertyUses" runat="server">
                            <option selected="selected"></option>
                        </select></td>
                    <td class="TdTitle">房屋产权性质</td>
                    <td class="TdContentSearch">
                        <select id="PropertyRights" name="PropertyRights" runat="server">
                            <option selected="selected"></option>
                        </select>

                    </td>

                </tr>

                <tr>
                    <td class="TdTitle">是否冻结</td>
                    <td class="TdContentSearch">
                        <select id="IsFreeze" name="IsFreeze" runat="server">
                            <option selected="selected"></option>
                        </select></td>
                    <td class="TdTitle">车位产权性质</td>
                    <td class="TdContentSearch">

                        <select id="ParkingPropertyRights" name="ParkingPropertyRights" runat="server">
                            <option selected="selected"></option>
                            <option value="自有产权">自有产权</option>
                            <option value="业主产权">业主产权</option>
                            <option value="共有产权">共有产权</option>
                            <option value="产权不明">产权不明</option>
                            <option value="其它产权">其它产权</option>
                        </select>
                </tr>

                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:ExcuteOnServer(); ">确定筛选</a>

                    </td>

                </tr>
            </table>
        </div>

        <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 280px; height: 300px; padding-left: 10px; padding-top: 5px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red'>
                <tr>
                    <td rowspan="11" width="40px" valign="top" style="color: black;">备注:</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>1、客户名称：业主名称</td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>2、费用日期：费用归属日期</td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>3、应收日期：应该收取日期</td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>4、开始日期：费用开始日期</td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>5、结束日期：费用结束日期</td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>6、税率：增值税率</td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>7、收款时间：收取费用时间</td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>8、票据号码：收据编码</td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>9、发票号码：发票号</td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>10、佣金项目：佣金费用科目</td>
                </tr>
            </table>
        </div>

        <div id="tb">
            <table border="0" style="font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td style="width: auto;" align="left"></td>
                    <td></td>
                    <td><%--<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="setIsSQLData();LoadList();">生成应收</a>--%>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="SearchDlg();">筛选条件</a>
                        <a id='scExcel' href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="ToExcel();">Excel导出</a>
                        <a id='memo' href="#" class="easyui-linkbutton" data-options="iconCls:'icon-help'" onclick="MemoDlg();">备注</a>
                        <span style="color: red">*右键点击表头显示隐藏列。</span>
                    </td>
                </tr>
            </table>
        </div>
        <input id="HDueMode" type="hidden" runat="server" value="0" />

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                if ($("#CommID").val()=="") {
                    $("#CommNames").show();
                    $("#CommName").hide();
                } else {
                    $("#CommName").show();
                    $("#CommNames").hide();
                }
                
            }
            InitFunction();

            function SelCommInfo() {

                var w = $(window).width() * 0.7;
                HDialog.Open(w, 500, '../DialogNew/SelComm.aspx', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommID").val(arrRet.id);
                    $("#CommNames").val(arrRet.name);
                });
            }

            function SelBuild() {
                var commId=$("#CommID").val();
                if (commId == "") {
                    HDialog.Info("请选择需要统计的项目！");
                    return;
                }
                HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx?CommID=" + commId, '楼宇选择', false, function callback(_Data) {

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
                var commId = $("#CommID").val();
                if (commId == "") {
                    HDialog.Info("请选择需要统计的项目！");
                    return;
                }
                HDialog.Open('700', '400', "../dialogNew/MultiRegionDlg.aspx?CommID=" + commId, '组团选择', false, function callback(_Data) {

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
                var commId = $("#CommID").val();
                if (commId == "") {
                    HDialog.Info("请选择需要统计的项目！");
                    return;
                }
                HDialog.Open('700', '400', "../dialogNew/MultiCarparkDlg.aspx?CommID=" + commId, '车位区域选择', false, function callback(_Data) {

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
            function SelPark()
            {

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

                var w = 700;
                var h = 400;
                var commId = $("#CommID").val();
                if (commId == "") {
                    HDialog.Info("请选择需要统计的项目！");
                    return;
                }
                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx?CommID=" + commId, '收费项目选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);
                    }
                });
            }

            function SelCust() {
                var commId = $("#CommID").val();
                if (commId == "") {
                    HDialog.Info("请选择需要统计的项目！");
                    return;
                }
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var w = $(window).width();
                var h = $(window).height();

                var conent = "../DialogNew/CustDlg.aspx?CommID=" + commId;

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
                var commId = $("#CommID").val();
                if (commId == "") {
                    HDialog.Info("请选择需要统计的项目！");
                    return;
                }
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });
               
                var conent = "../DialogNew/RoomDlg.aspx?CommId=" + commId;

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

            function SelStan() {
                var tmpCostIDs = $('#CostIDs').val();
                var commId = $("#CommID").val();
                if (commId == "") {
                    HDialog.Info("请选择需要统计的项目！");
                    return;
                }
                if (tmpCostIDs == "") {
                    HDialog.Info("请选择费用项目,此项不能为空!");
                    NewFeesDueSecCutSearch.btnSelCost.focus();
                    return false;
                }

                var w = 700;
                var h = 400;

                HDialog.Open('700', '400', "../dialogNew/MultiStanDlg.aspx?CostIDs=" + tmpCostIDs + "&IsShowHis=1" + "&Ram=" + Math.random()+"&CommID=" + commId, '收费标准选择', false, function callback(_Data) {

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
            }

            function SelRooms() {

                var w = $(window).width();
                var h = $(window).height();
                var commId = $("#CommID").val();
                if (commId == "") {
                    HDialog.Info("请选择需要统计的项目！");
                    return;
                }
                HDialog.Open(w, h, "../dialogNew/MultiRoomDlg.aspx?CommID=" + commId, '房屋多选', false, function callback(_Data) {

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
                    }
                });
            }


            function ExcuteOnServer() {

                if ($('#hiIsSQLData').val() == '-1' || $('#hiIsSQLData').val() == '1') {

                    $('#hiIsSQLData').val('2');

                    var commId = $("#CommID").val();
                    if (commId == "") {
                        HDialog.Info("请选择需要统计的项目！");
                        return;
                    }
                    //启动任务
                    StartTask();
                    //展示进度
                    ShowProgress();
                    //获取执行情况进度
                    ProgressInterval = setInterval("TakeProgress()", 1000);

                }
                else {

                    $('#hiIsSQLData').val('2');
                    $("#hPropertyUses").val($("#PropertyUses").find("option:selected").text());
                    $("#hPropertyRights").val($("#PropertyRights").find("option:selected").text());
                    $("#hParkingPropertyRights").val($("#ParkingPropertyRights").find("option:selected").text());
                    GetFlag();

                    LoadList();
                }
                $('#SearchDlg').dialog('close');

            }
            function GetFlag() {

                var strFlag = "";
                var strCostIDs = $('#CostIDs').val();
                var strRoomIDs = $('#RoomIDs').val();
                var strParkIDs = $('#ParkIDs').val();

                if (strCostIDs != "") {
                    strFlag = strFlag + "A";
                }
                if (strRoomIDs != "") {
                    strFlag = strFlag + "B";
                }
                if (strParkIDs != "") {
                    strFlag = strFlag + "C";
                }

                $('#Flag').val(strFlag);
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
                { field: 'CustName', title: '客户名称', align: 'left', sortable: true, fixed: true, width: 150 },
                { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, fixed: true, width: 150 },
                { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, fixed: true, width: 100 }

            ]]

            var column = [
                [
                    { title: '客户信息', field: 'a1', colspan: 2, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
                    { title: '房屋信息', field: 'a2', colspan: 16, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
                    { title: '车位信息', field: 'a3', colspan: 11, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
                    { title: '费用名称', field: 'CostName', rowspan: 2, align: 'center', sortable: true, fixed: true, width: 100 },
                    { title: '收费标准', field: 'a4', colspan: 4, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
                    { title: '抄表信息', field: 'a5', colspan: 3, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },

                    { field: 'FeeDueYearMonth', rowspan: 2, title: '费用日期', align: 'center', sortable: true, fixed: true, width: 150 },

                    {
                        field: 'AccountsDueDate', rowspan: 2, title: '应收日期', align: 'center', sortable: true, width: 150, fixed: true, formatter: function (value, row, index) {
                            var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                            return str;
                        }
                    },

                    {
                        field: 'FeesStateDate', rowspan: 2, title: '开始日期', align: 'center', sortable: true, width: 150, fixed: true, formatter: function (value, row, index) {
                            var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                            return str;
                        }
                    },

                    {
                        field: 'FeesEndDate', rowspan: 2, title: '结束日期', align: 'center', sortable: true, fixed: true, width: 150, formatter: function (value, row, index) {
                            var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                            return str;
                        }
                    },

                    { field: '增值税率', title: '税率', rowspan: 2, align: 'center', sortable: true, fixed: true, width: 100 },

                    { title: '应收金额', colspan: 3, align: 'center', sortable: true, fixed: true, width: 100, },
                    //{ title: '佣金费用', colspan: 4, align: 'center', sortable: true, fixed: true, width: 100, },
                    //{ title: '实收金额', colspan: 3, align: 'center', sortable: true, fixed: true, width: 100 },
                    //{ title: '预收金额', colspan: 3, align: 'left', sortable: true, width: 100 },
                    //{ title: '预收冲抵', colspan: 3, align: 'left', sortable: true, width: 100 },
                    //{ title: '预存冲抵', colspan: 3, align: 'left', sortable: true, width: 100 },
                    //{ title: '减免冲抵', colspan: 3, align: 'left', sortable: true, width: 100 },

                    //{ title: '实收合同违约金', colspan: 3, align: 'left', sortable: true, width: 100 },

                    //{ title: '冲销金额', colspan: 3, align: 'left', sortable: true, width: 100 },

                    //{ title: '截点欠收金额', colspan: 3, align: 'left', sortable: true, width: 100 },
                    //{ title: '截点合同违约金', colspan: 3, align: 'left', sortable: true, width: 100 },
                    //{ title: '实际欠费金额', colspan: 3, align: 'left', sortable: true, width: 100 },


                    //{ field: 'RefundAmount', rowspan: 2, title: '退款金额', align: 'left', sortable: true, width: 100 },
                    //{ field: 'RefundNoAmount', rowspan: 2, title: '未退金额', align: 'left', sortable: true, width: 100 },

                    { field: 'FeesMemo', rowspan: 2, title: '备注', align: 'left', sortable: true, width: 100 }
                ], [
                    { field: '客户类别', title: '客户类别', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'MobilePhone', title: '联系电话', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'UserName', title: '管家', width: 100, align: 'center', sortable: true, hidden: true },

                    { field: 'RegionName', title: '组团区域', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'BuildName', title: '楼宇名称', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '房屋建筑面积', title: '建筑面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '房屋套内面积', title: '套内面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '房屋公摊面积', title: '公摊面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '房屋花园面积', title: '花园面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '房屋地下室面积', title: '地下室面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '房屋计费面积', title: '计算面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '房屋产权性质', title: '产权性质', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '楼宇类型', title: '楼宇类型', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '房屋使用性质', title: '使用性质', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'RoomUsesState', title: '使用状态', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'NowStateName', title: '房屋状态', width: 100, align: 'center', sortable: true, hidden: true },
                    {
                        field: '房屋实际交房时间', title: '实际交房时间', width: 150, align: 'center', sortable: true, hidden: true, formatter: function (value, row, index) {
                            var str = formatDate(row.房屋实际交房时间, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    { field: 'RoomActualSubCondition', title: '考核条件', width: 100, align: 'center', sortable: true, hidden: true },

                    { field: 'CarparkName', title: '车位区域', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'ParkRoomSign', title: '车位路址', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'ParkName', title: '车位编号', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位面积', title: '车位面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位计费面积', title: '计算面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'ParkCategoryName', title: '车位类别', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'ParkType', title: '车位类型', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位产权性质', title: '产权性质', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'ParkPropertyUses', title: '使用状态', width: 100, align: 'center', sortable: true, hidden: true },
                    {
                        field: '车位实际交房时间', title: '实际交付时间', width: 100, align: 'center', sortable: true, hidden: true, formatter: function (value, row, index) {
                            var str = formatDate(row.车位实际交房时间, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    { field: 'ParkActualSubCondition', title: '考核条件', width: 100, align: 'center', sortable: true, hidden: true },

                    { field: 'PayTypeName', title: '计费方式', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'StanFormulaName', title: '计算方式', width: 150, align: 'center', sortable: true, hidden: true },
                    { field: 'StanAmount', title: '收费标准', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'ChargeCycleName', title: '计算周期', width: 100, align: 'center', sortable: true, hidden: true },

                    { field: 'StartDegree', title: '起度', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'EndDegree', title: '止度', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'Dosage', title: '用量', width: 100, align: 'center', sortable: true, hidden: true },

                    //应收金额
                    { field: 'DueAmount', title: '含税金额', align: 'left', sortable: true, width: 100 },
                    { field: 'DueAmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
                    { field: 'DueAmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 },

                    ////佣金费用

                    //{ field: '佣金科目', title: '佣金科目', align: 'left', sortable: true, width: 100 },
                    //{ field: '佣金含税金额', title: '含税金额', align: 'left', sortable: true, width: 100 },
                    //{ field: '佣金税费', title: '税费', align: 'left', sortable: true, width: 100 },
                    //{ field: '佣金不含税费', title: '不含税费', align: 'left', sortable: true, width: 100 },


                    ////实收
                    //{ field: 'PaidAmount', title: '含税金额', align: 'left', sortable: true, width: 100 },
                    //{ field: 'PaidAmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
                    //{ field: 'PaidAmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 },

                    ////预收
                    //{ field: 'PrecPaidAmount', title: '含税金额', align: 'left', sortable: true, width: 100 },
                    //{ field: 'PrecPaidAmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
                    //{ field: 'PrecPaidAmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 },

                    ////预收冲抵
                    //{ field: 'PrecOffset1Amount', title: '含税金额', align: 'left', sortable: true, width: 100 },
                    //{ field: 'PrecOffset1AmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
                    //{ field: 'PrecOffset1AmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 },

                    ////预存冲抵
                    //{ field: 'PrecOffset2Amount', title: '含税金额', align: 'left', sortable: true, width: 100 },
                    //{ field: 'PrecOffset2AmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
                    //{ field: 'PrecOffset2AmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 },
                    ////减免
                    //{ field: 'WaivAmount', title: '含税金额', align: 'left', sortable: true, width: 100 },
                    //{ field: 'WaivAmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
                    //{ field: 'WaivAmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 },

                    ////实收合同违约金
                    //{ field: 'LateFeeAmount', title: '含税金额', align: 'left', sortable: true, width: 100 },
                    //{ field: 'LateFeeAmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
                    //{ field: 'LateFeeAmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 },

                    ////冲销金额
                    //{ field: 'WriteOffAmount', title: '含税金额', align: 'left', sortable: true, width: 100 },
                    //{ field: 'WriteOffAmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
                    //{ field: 'WriteOffAmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 },

                    ////截点欠收金额
                    //{ field: 'DebtsCutAmount', title: '含税金额', align: 'left', sortable: true, width: 100 },
                    //{ field: 'DebtsCutAmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
                    //{ field: 'DebtsCutAmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 },
                    ////截点合同违约金
                    //{ field: 'LateFeeCutAmount', title: '含税金额', align: 'left', sortable: true, width: 100 },
                    //{ field: 'LateFeeCutAmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
                    //{ field: 'LateFeeCutAmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 },
                    ////实际欠费金额
                    //{ field: 'DebtsAmount', title: '含税金额', align: 'left', sortable: true, width: 100 },
                    //{ field: 'DebtsAmountTax', title: '税费', align: 'left', sortable: true, width: 100 },
                    //{ field: 'DebtsAmountTaxAmount', title: '不含税金额', align: 'left', sortable: true, width: 100 }
                ]
            ];

            function SearchDlg() {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
                btnClear_OnClick();

                setIsSQLData(0);


            }

            function MemoDlg() {
                $('#DlgMemo').parent().appendTo($("form:first"))
                $('#DlgMemo').dialog('open');
            }

            function ChangeIsDo() {
                $('#hiIsSQLData').val("1");
            }

            function setIsSQLData(obj) {
                $('#hiIsSQLData').val("1");

                $('#HDueMode').val(obj);


            }

            function btnClear_OnClick() {


                document.getElementById('CustID').value = "";
                document.getElementById('CustName').value = "";
                document.getElementById('hiCustName').value = "";

                document.getElementById('RoomID').value = "";
                document.getElementById('RoomSign').value = "";
                document.getElementById('hiRoomSign').value = "";

                document.getElementById('CostIDs').value = "";
                document.getElementById('CostNames').value = "";
                $('#CostNames').searchbox('setValue', "");
                document.getElementById('hiCostNames').value = "";

                document.getElementById('StanIDs').value = "";
                document.getElementById('StanNames').value = "";
                document.getElementById('hiStanNames').value = "";

                document.getElementById('RoomIDs').value = "";
                document.getElementById('RoomSigns').value = "";
                document.getElementById('hiRoomSigns').value = "";

                //document.getElementById('RegionSNum').value = "";
                document.getElementById('CustTypeID').value = "";
                document.getElementById('ChargeTypeID').value = "";

                document.getElementById('ParkIDs').value = "";
                document.getElementById('ParkNames').value = "";
                document.getElementById('hiParkNames').value = "";

                document.getElementById('CarparkIDs').value = "";
                document.getElementById('CarparkNames').value = "";
                document.getElementById('hiCarparkNames').value = "";

                document.getElementById('RoomState').value = "";

                document.getElementById('SelRoomID').options.length = 0;
                document.getElementById('RegionSNums').value = "";
                document.getElementById('RegionNames').value = "";
                document.getElementById('hiRegionNames').value = "";

                document.getElementById("PropertyUses").value = "";
                document.getElementById("hPropertyUses").value = "";


                document.getElementById("PropertyRights").value = "";
                document.getElementById("hPropertyRights").value = "";

                document.getElementById("ParkingPropertyRights").value = "";
                document.getElementById("hParkingPropertyRights").value = "";

                document.getElementById("RoomBgTime").value = "";
                document.getElementById("RoomEndTime").value = "";

                document.getElementById("ParkingBgTime").value = "";
                document.getElementById("ParkingEndTime").value = "";

            }

            function LoadList() {
                //alert($('#hiIsSQLData').val());
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
                    toolbar: '#tb',
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

                        param = $.JQForm.GetParam("NewFeesDueSecSearch_New", "LoadData", "TableContainer", param);
                    },
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
                        if (row.FeesID == 'footer') {
                            return 'background-color:#F4F4F4;border:none;'; // return inline style
                        }
                    },
                    onLoadSuccess: function (data) {
                        if (document.getElementById('hiIsSQLData').value != '-1') {
                            //加载页脚
                            $('#TableContainer').datagrid('reloadFooter', [
                                {
                                    FeesID: 'footer',
                                    CustName: "<span style='color:red'>累计合计</span>",
                                    DueAmount: "<span style='color:red'>0</span>",
                                    //PaidAmount: "<span style='color:red'>0</span>",

                                    //PrecPaidAmount: "<span style='color:red'>0</span>",
                                    //PrecOffset1Amount: "<span style='color:red'>0</span>",
                                    //PrecOffset2Amount: "<span style='color:red'>0</span>",
                                    //WaivAmount: "<span style='color:red'>0</span>",

                                    //LateFeeAmount: "<span style='color:red'>0</span>",
                                    //DebtsCutAmount: "<span style='color:red'>0</span>",
                                    //LateFeeCutAmount: "<span style='color:red'>0</span>",
                                    //DebtsAmount: "<span style='color:red'>0</span>",

                                    //RefundAmount: "<span style='color:red'>0</span>",
                                    //RefundNoAmount: "<span style='color:red'>0</span>",
                                    DueAmountTax: "<span style='color:red'>0</span>",
                                    DueAmountTaxAmount: "<span style='color:red'>0</span>",
                                    //PaidAmountTax: "<span style='color:red'>0</span>",
                                    //PaidAmountTaxAmount: "<span style='color:red'>0</span>",
                                    //PrecPaidAmountTax: "<span style='color:red'>0</span>",
                                    //PrecPaidAmountTaxAmount: "<span style='color:red'>0</span>",
                                    //PrecOffset1AmountTax: "<span style='color:red'>0</span>",
                                    //PrecOffset1AmountTaxAmount: "<span style='color:red'>0</span>",
                                    //PrecOffset2AmountTax: "<span style='color:red'>0</span>",
                                    //PrecOffset2AmountTaxAmount: "<span style='color:red'>0</span>",
                                    //WaivAmountTax: "<span style='color:red'>0</span>",
                                    //WaivAmountTaxAmount: "<span style='color:red'>0</span>",
                                    //LateFeeAmountTax: "<span style='color:red'>0</span>",
                                    //LateFeeAmountTaxAmount: "<span style='color:red'>0</span>",
                                    //DebtsCutAmountTax: "<span style='color:red'>0</span>",
                                    //DebtsCutAmountTaxAmount: "<span style='color:red'>0</span>",
                                    //LateFeeCutAmountTax: "<span style='color:red'>0</span>",
                                    //LateFeeCutAmountTaxAmount: "<span style='color:red'>0</span>",
                                    //DebtsAmountTax: "<span style='color:red'>0</span>",
                                    //DebtsAmountTaxAmount: "<span style='color:red'>0</span>"
                                }
                            ]);
                            if (document.getElementById('hiIsSQLData').value != "-1") {
                                $.tool.DataPostNoLoading('NewFeesDueSecSearch_New', "NewFeesDueSecSearchSum", $('#frmForm').serialize(),
                                    function Init() {
                                        //加载页脚
                                        $('#TableContainer').datagrid('reloadFooter', [
                                            {
                                                FeesID: 'footer',
                                                CustName: "<span style='color:red'>累计合计</span>",
                                                DueAmount: "<span style='color:red'>0</span>",
                                                //PaidAmount: "<span style='color:red'>0</span>",

                                                //PrecPaidAmount: "<span style='color:red'>0</span>",
                                                //PrecOffset1Amount: "<span style='color:red'>0</span>",
                                                //PrecOffset2Amount: "<span style='color:red'>0</span>",
                                                //WaivAmount: "<span style='color:red'>0</span>",

                                                //LateFeeAmount: "<span style='color:red'>0</span>",
                                                //DebtsCutAmount: "<span style='color:red'>0</span>",
                                                //LateFeeCutAmount: "<span style='color:red'>0</span>",
                                                //DebtsAmount: "<span style='color:red'>0</span>",

                                                //RefundAmount: "<span style='color:red'>0</span>",
                                                //RefundNoAmount: "<span style='color:red'>0</span>",

                                                DueAmountTax: "<span style='color:red'>0</span>",
                                                DueAmountTaxAmount: "<span style='color:red'>0</span>",
                                                //PaidAmountTax: "<span style='color:red'>0</span>",
                                                //PaidAmountTaxAmount: "<span style='color:red'>0</span>",
                                                //PrecPaidAmountTax: "<span style='color:red'>0</span>",
                                                //PrecPaidAmountTaxAmount: "<span style='color:red'>0</span>",
                                                //PrecOffset1AmountTax: "<span style='color:red'>0</span>",
                                                //PrecOffset1AmountTaxAmount: "<span style='color:red'>0</span>",
                                                //PrecOffset2AmountTax: "<span style='color:red'>0</span>",
                                                //PrecOffset2AmountTaxAmount: "<span style='color:red'>0</span>",
                                                //WaivAmountTax: "<span style='color:red'>0</span>",
                                                //WaivAmountTaxAmount: "<span style='color:red'>0</span>",
                                                //LateFeeAmountTax: "<span style='color:red'>0</span>",
                                                //LateFeeAmountTaxAmount: "<span style='color:red'>0</span>",
                                                //DebtsCutAmountTax: "<span style='color:red'>0</span>",
                                                //DebtsCutAmountTaxAmount: "<span style='color:red'>0</span>",
                                                //LateFeeCutAmountTax: "<span style='color:red'>0</span>",
                                                //LateFeeCutAmountTaxAmount: "<span style='color:red'>0</span>",
                                                //DebtsAmountTax: "<span style='color:red'>0</span>",
                                                //DebtsAmountTaxAmount: "<span style='color:red'>0</span>"


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
                                                //PaidAmount: "<span style='color:red'>" + obj.PaidAmount + "</span>",

                                                //PrecPaidAmount: "<span style='color:red'>" + obj.PrecPaidAmount + "</span>",
                                                //PrecOffset1Amount: "<span style='color:red'>" + obj.PrecOffset1Amount + "</span>",
                                                //PrecOffset2Amount: "<span style='color:red'>" + obj.PrecOffset2Amount + "</span>",
                                                //WaivAmount: "<span style='color:red'>" + obj.WaivAmount + "</span>",

                                                //LateFeeAmount: "<span style='color:red'>" + obj.LateFeeAmount + "</span>",
                                                //DebtsCutAmount: "<span style='color:red'>" + obj.DebtsCutAmount + "</span>",
                                                //LateFeeCutAmount: "<span style='color:red'>" + obj.LateFeeCutAmount + "</span>",
                                                //DebtsAmount: "<span style='color:red'>" + obj.DebtsAmount + "</span>",

                                                //RefundAmount: "<span style='color:red'>" + obj.RefundAmount + "</span>",
                                                //RefundNoAmount: "<span style='color:red'>" + obj.RefundNoAmount + "</span>",


                                                DueAmountTax: "<span style='color:red'>" + obj.DueAmountTax + "</span>",
                                                DueAmountTaxAmount: "<span style='color:red'>" + obj.DueAmountTaxAmount + "</span>",
                                                //PaidAmountTax: "<span style='color:red'>" + obj.PaidAmountTax + "</span>",
                                                //PaidAmountTaxAmount: "<span style='color:red'>" + obj.PaidAmountTaxAmount + "</span>",
                                                //PrecPaidAmountTax: "<span style='color:red'>" + obj.PrecPaidAmountTax + "</span>",
                                                //PrecPaidAmountTaxAmount: "<span style='color:red'>" + obj.PrecPaidAmountTaxAmount + "</span>",
                                                //PrecOffset1AmountTax: "<span style='color:red'>" + obj.PrecOffset1AmountTax + "</span>",
                                                //PrecOffset1AmountTaxAmount: "<span style='color:red'>" + obj.PrecOffset1AmountTaxAmount + "</span>",
                                                //PrecOffset2AmountTax: "<span style='color:red'>" + obj.PrecOffset2AmountTax + "</span>",
                                                //PrecOffset2AmountTaxAmount: "<span style='color:red'>" + obj.PrecOffset2AmountTaxAmount + "</span>",
                                                //WaivAmountTax: "<span style='color:red'>" + obj.WaivAmountTax + "</span>",
                                                //WaivAmountTaxAmount: "<span style='color:red'>" + obj.WaivAmountTaxAmount + "</span>",
                                                //LateFeeAmountTax: "<span style='color:red'>" + obj.LateFeeAmountTax + "</span>",
                                                //LateFeeAmountTaxAmount: "<span style='color:red'>" + obj.LateFeeAmountTaxAmount + "</span>",
                                                //DebtsCutAmountTax: "<span style='color:red'>" + obj.DebtsCutAmountTax + "</span>",
                                                //DebtsCutAmountTaxAmount: "<span style='color:red'>" + obj.DebtsCutAmountTaxAmount + "</span>",
                                                //LateFeeCutAmountTax: "<span style='color:red'>" + obj.LateFeeCutAmountTax + "</span>",
                                                //LateFeeCutAmountTaxAmount: "<span style='color:red'>" + obj.LateFeeCutAmountTaxAmount + "</span>",
                                                //DebtsAmountTax: "<span style='color:red'>" + obj.DebtsAmountTax + "</span>",
                                                //DebtsAmountTaxAmount: "<span style='color:red'>" + obj.DebtsAmountTaxAmount + "</span>"
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
                                                //PaidAmount: "<span style='color:red'>0</span>",

                                                //PrecPaidAmount: "<span style='color:red'>0</span>",
                                                //PrecOffset1Amount: "<span style='color:red'>0</span>",
                                                //PrecOffset2Amount: "<span style='color:red'>0</span>",
                                                //WaivAmount: "<span style='color:red'>0</span>",

                                                //LateFeeAmount: "<span style='color:red'>0</span>",
                                                //DebtsCutAmount: "<span style='color:red'>0</span>",
                                                //LateFeeCutAmount: "<span style='color:red'>0</span>",
                                                //DebtsAmount: "<span style='color:red'>0</span>",

                                                //RefundAmount: "<span style='color:red'>0</span>",
                                                //RefundNoAmount: "<span style='color:red'>0</span>",

                                                DueAmountTax: "<span style='color:red'>0</span>",
                                                DueAmountTaxAmount: "<span style='color:red'>0</span>",
                                                //PaidAmountTax: "<span style='color:red'>0</span>",
                                                //PaidAmountTaxAmount: "<span style='color:red'>0</span>",
                                                //PrecPaidAmountTax: "<span style='color:red'>0</span>",
                                                //PrecPaidAmountTaxAmount: "<span style='color:red'>0</span>",
                                                //PrecOffset1AmountTax: "<span style='color:red'>0</span>",
                                                //PrecOffset1AmountTaxAmount: "<span style='color:red'>0</span>",
                                                //PrecOffset2AmountTax: "<span style='color:red'>0</span>",
                                                //PrecOffset2AmountTaxAmount: "<span style='color:red'>0</span>",
                                                //WaivAmountTax: "<span style='color:red'>0</span>",
                                                //WaivAmountTaxAmount: "<span style='color:red'>0</span>",
                                                //LateFeeAmountTax: "<span style='color:red'>0</span>",
                                                //LateFeeAmountTaxAmount: "<span style='color:red'>0</span>",
                                                //DebtsCutAmountTax: "<span style='color:red'>0</span>",
                                                //DebtsCutAmountTaxAmount: "<span style='color:red'>0</span>",
                                                //LateFeeCutAmountTax: "<span style='color:red'>0</span>",
                                                //LateFeeCutAmountTaxAmount: "<span style='color:red'>0</span>",
                                                //DebtsAmountTax: "<span style='color:red'>0</span>",
                                                //DebtsAmountTaxAmount: "<span style='color:red'>0</span>"

                                            }
                                        ]);
                                    });
                            }
                        }
                    }
                });

            }


            var cmenuList = ['客户信息', '房屋信息', '车位信息', '收费标准', '抄表信息'];

            var cmenuColumnList = [['a1', '客户类别', 'MobilePhone']
                , ['a2', , 'UserName', 'RegionName', 'BuildName', '房屋建筑面积', '房屋套内面积', '房屋公摊面积', '房屋花园面积', '房屋地下室面积',
                '房屋计费面积', '房屋产权性质', '楼宇类型', '房屋使用性质', 'RoomUsesState', 'NowStateName',
                '房屋实际交房时间', 'RoomActualSubCondition']
                , ['a3', 'CarparkName', 'ParkRoomSign', 'ParkName', '车位面积', '车位计费面积', 'ParkCategoryName', 'ParkType'
                , '车位产权性质', 'ParkPropertyUses', '车位实际交房时间', 'ParkActualSubCondition']
                , ['a4', 'PayTypeName', 'StanFormulaName', 'StanAmount', 'ChargeCycleName']
                , ['a5', 'StartDegree', 'EndDegree', 'Dosage']]


            var cmenu;
            function createColumnMenu() {



                cmenu = $('<div/>').appendTo('body');
                cmenu.menu({
                    onClick: function (item) {


                        var j = 0
                        for (var i = 0; i < cmenuList.length; i++) {
                            if (item.name == cmenuList[i]) {
                                j = i;
                                break;
                            }
                        }

                        var cmd = 'hideColumn';
                        if (item.iconCls == 'icon-ok') {
                            cmd = 'hideColumn';
                            cmenu.menu('setIcon', {
                                target: item.target,
                                iconCls: 'icon-empty'
                            });

                        } else {
                            cmd = 'showColumn';

                            cmenu.menu('setIcon', {
                                target: item.target,
                                iconCls: 'icon-ok'
                            });
                        }
                        for (var k = 0; k < cmenuColumnList[j].length; k++) {

                            $('#TableContainer').datagrid(cmd, cmenuColumnList[j][k]);

                        }
                    }
                });




                for (var i = 0; i < cmenuList.length; i++) {
                    var field = cmenuList[i];

                    cmenu.menu('appendItem', {
                        text: field,
                        name: field,
                        iconCls: 'icon-empty'
                    });
                }
            }

            $('#hiIsSQLData').val("-1");


            function ToExcel() {
                HDialog.Open(500, 150, "../InquiriesNew/SelectiveCompression.aspx", '选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var obj = JSON.parse(_Data);
                        if (obj == "0") {
                            location.href = "FeesDueSearchForSerial_NewCre.aspx?OType=0";
                        } else {
                            location.href = "FeesDueSearchForSerial_NewCre.aspx?OType=1";
                        }
                    }
                });

            }
            $(document).ready(function () {

                $('#frmForm').find('input[type=checkbox]').bind('click', function () {

                    $('#frmForm').find('input[type=checkbox]').not(this).attr("checked", false);
                });

                //$('#hiIsSQLData').val("1");
            });

            //初始化加载数据
            LoadList();
            //展示进度
            ShowProgress();
            //获取执行情况进度
            ProgressInterval = setInterval("TakeProgress()", 1000);
             

            function SearchData() {


                $('#hiIsSQLData').val('1');
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);
            }


            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('NewFeesDueSecSearch_New', 'StartTask', $('#frmForm').serialize(),
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
                $.tool.DataPostNoLoading('NewFeesDueSecSearch_New', 'TakeProgress', $('#frmForm').serialize(),
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
        </script>
    </form>
</body>
</html>


