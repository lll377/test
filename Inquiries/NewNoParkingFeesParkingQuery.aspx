<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewNoParkingFeesParkingQuery.aspx.cs" Inherits="M_Main.Inquiries.NewNoParkingFeesParkingQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/jquery-datagird-extended.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
    <!--
    function btnClear_OnClick() {

        $('#BuildNames').searchbox('setValue', '');
        $('#BuildSNums').val('');


        $('#RegionNames').searchbox('setValue', '');
        $('#RegionSNums').val('');
        $('#hiRegionNames').val('');

        $('#CustTypeID').val('');
        $('#ChargeTypeID').val('');

        $('#CustName').searchbox('setValue', '');
        $('#CustID').val('');
        $('#hiCustName').val('');

        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

        $('#RoomSign').searchbox('setValue', '');
        $('#RoomID').val('');
        $('#hiRoomSign').val('');

        $('#CostNames').searchbox('setValue', '');
        $('#CostIDs').val('');

        //
        $('#CustName2').searchbox('setValue', '');
        $('#CustID2').val('');
        $('#hiCustName2').val('');

        $('#RoomSign2').searchbox('setValue', '');
        $('#RoomID2').val('');
        $('#hiRoomSign2').val('');

        $('#CostNames2').searchbox('setValue', '');
        $('#CostIDs2').val('');

        //
        $('#BuildNames3').searchbox('setValue', '');
        $('#BuildSNums3').val('');

        $('#RegionNames3').searchbox('setValue', '');
        $('#RegionSNums3').val('');
        $('#hiRegionNames3').val('');

        $('#ChargeTypeID3').val('');

        //
        $('#BuildNames4').searchbox('setValue', '');
        $('#BuildSNums4').val('');

        $('#RegionNames4').searchbox('setValue', '');
        $('#RegionSNums4').val('');
        $('#hiRegionNames4').val('');

        $('#ChargeTypeID4').val('');

        //
        $('#BuildNames5').searchbox('setValue', '');
        $('#BuildSNums5').val('');

        $('#RegionNames5').searchbox('setValue', '');
        $('#RegionSNums5').val('');
        $('#hiRegionNames5').val('');

        $('#ChargeTypeID5').val('');

        $('#ParkName5').val('');
    }
    </script>
</head>
    <body class="easyui-layout" scroll="no">
    <form id="NewFeesDueCutSearch" runat="server">
        <input style="width: 8px" id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server" />
        <input style="width: 8px" id="hiLoginUserCode" size="1" type="hidden" name="hiLoginUserCode" runat="server" />
        <input style="width: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <input style="width: 8px" id="tabindex" size="1" type="hidden" name="tabindex" runat="server" value="1" />

        <%--<div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 250px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <input id="RegionNames" class="easyui-searchbox" searcher="SelRegion" data-options="editable:false"
                            name="RegionNames" runat="server">
                        <input id="RegionSNums" size="1" type="hidden" name="RegionSNums" runat="server" />
                        <input id="hiRegionNames" size="1" type="hidden" name="hiRegionNames" runat="server" />
                    </td>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <input id="BuildNames" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false"
                            name="BuildNames" runat="server" />
                        <input id="BuildSNums" type="hidden" size="1" name="BuildSNums" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">收费类型</td>
                    <td class="TdContentSearch">
                        <select id="ChargeTypeID" name="ChargeTypeID" class="easyui-combobox" runat="server">
                            <option value="" selected></option>
                        </select></td>
                    <td class="TdTitle">客户类型</td>
                    <td class="TdContentSearch">
                        <select id="CustTypeID" name="CustTypeID" class="easyui-combobox" runat="server">
                            <option value="" selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust"
                            name="CustName" class="easyui-searchbox" data-options="editable:false" runat="server" />
                        <input id="CustID" type="hidden" size="1" name="CustID" runat="server" />
                        <input id="hiCustName" type="hidden" size="1" name="hiCustName" runat="server" /></td>
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
                        <input id="RoomID" type="hidden" size="1" name="RoomID" runat="server" />
                        <input id="hiRoomSign" type="hidden" size="1" name="hiRoomSign" runat="server" /></td>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCost"
                            name="CostNames" runat="server" />
                        <input id="CostIDs" class="easyui-validatebox" size="1" type="hidden" name="CostIDs" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ExcuteOnServer();LoadListAll();">查询</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="btnClear_OnClick();">清空</a> </td>
                </tr>
            </table>
        </div>--%>

        <%--<div id="SearchDlg2" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 250px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName2" searcher="SelCust2"
                            name="CustName2" class="easyui-searchbox" data-options="editable:false" runat="server" />
                        <input id="CustID2" type="hidden" size="1" name="CustID2" runat="server" />
                        <input id="hiCustName2" type="hidden" size="1" name="hiCustName2" runat="server" /></td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID2" style="width: 150px" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID2" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign2" class="easyui-searchbox" searcher="SelRoom2" name="RoomSign2" data-options="editable:false" runat="server" />
                        <input id="RoomID2" type="hidden" size="1" name="RoomID2" runat="server" />
                        <input id="hiRoomSign2" type="hidden" size="1" name="hiRoomSign2" runat="server" /></td>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostNames2" class="easyui-searchbox" data-options="editable:false" searcher="SelCost2"
                            name="CostNames2" runat="server" />
                        <input id="CostIDs2" class="easyui-validatebox" size="1" type="hidden" name="CostIDs2" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">变更时间从</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-datebox" id="EditBeginDate2" runat="server" name="EditBeginDate2" /></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-datebox" id="EditEndDate2" runat="server" name="EditEndDate2" /></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ExcuteOnServer();LoadListAll();">查询</a>
                        &nbsp;&nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="btnClear_OnClick();">清空</a></td>
                </tr>
            </table>
        </div>--%>
       <%-- <div id="SearchDlg3" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 250px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <input id="BuildNames3" class="easyui-searchbox" searcher="SelBuild3" data-options="editable:false"
                            name="BuildNames3" runat="server" />
                        <input id="BuildSNums3" type="hidden" size="1" name="BuildSNums3" runat="server" /></td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <input id="RegionNames3" class="easyui-searchbox" searcher="SelRegion3" data-options="editable:false"
                            name="RegionNames" runat="server">
                        <input id="RegionSNums3" size="1" type="hidden" name="RegionSNums3" runat="server" />
                        <input id="hiRegionNames3" size="1" type="hidden" name="hiRegionNames3" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">收费类型</td>
                    <td class="TdContentSearch">
                        <select id="ChargeTypeID3" name="ChargeTypeID3" class="easyui-combobox" runat="server">
                            <option value="" selected></option>
                        </select></td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign3" class="easyui-searchbox" searcher="SelRoom3" name="RoomSign3" data-options="editable:false" runat="server" />
                        <input id="RoomID3" type="hidden" size="1" name="RoomID3" runat="server" />
                        <input id="hiRoomSign3" type="hidden" size="1" name="hiRoomSign3" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ExcuteOnServer();LoadListAll();">查询</a>
                        &nbsp;&nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="btnClear_OnClick();">清空</a></td>

                </tr>
            </table>
        </div>--%>
        <div id="SearchDlg4" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 250px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch"><input id="BuildNames4" class="easyui-searchbox" searcher="SelBuild4" data-options="editable:false"
                                name="BuildNames4" runat="server" />
                        <input id="BuildSNums4"  type="hidden" size="1" name="BuildSNums4" runat="server"/></td>
                     <td class="TdTitle" >组团区域</td>
                    <td class="TdContentSearch" ><input id="RegionNames4" class="easyui-searchbox" searcher="SelRegion4" data-options="editable:false"
                            name="RegionNames4" runat="server">
                        <input  id="RegionSNums4" size="1" type="hidden" name="RegionSNums4" runat="server" />
                        <input  id="hiRegionNames4" size="1" type="hidden" name="hiRegionNames4" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">收费类型</td>
                    <td class="TdContentSearch">
                        <select id="ChargeTypeID4" name="ChargeTypeID4" class="easyui-combobox" runat="server">
                            <option value="" selected></option>
                        </select></td>
                     <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch"><INPUT  id="RoomSign4"  class="easyui-searchbox" searcher="SelRoom4" name="RoomSign4" data-options="editable:false" runat="server"/>
                        <INPUT  id="RoomID4" type="hidden" size="1" name="RoomID4" runat="server"/>
                        <INPUT  id="hiRoomSign4" type="hidden" size="1" name="hiRoomSign4" runat="server"/></td>
                 </tr>
                 <tr>
                    <td  colspan="4" style="text-align:center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ExcuteOnServer();LoadListAll();">查询</a>
                        &nbsp;&nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="btnClear_OnClick();">清空</a></td>
                                       
                </tr>
            </table>            
        </div>
         <%--<div id="SearchDlg5" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 250px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch"><input id="BuildNames5" class="easyui-searchbox" searcher="SelBuild5" data-options="editable:false"
                                name="BuildNames5" runat="server" />
                        <input id="BuildSNums5"  type="hidden" size="1" name="BuildSNums5" runat="server"/></td>
                     <td class="TdTitle" >组团区域</td>
                    <td class="TdContentSearch" ><input id="RegionNames5" class="easyui-searchbox" searcher="SelRegion5" data-options="editable:false"
                            name="RegionNames5" runat="server">
                        <input  id="RegionSNums5" size="1" type="hidden" name="RegionSNums5" runat="server" />
                        <input  id="hiRegionNames5" size="1" type="hidden" name="hiRegionNames5" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">收费类型</td>
                    <td class="TdContentSearch">
                        <select id="ChargeTypeID5" name="ChargeTypeID5" class="easyui-combobox" runat="server">
                            <option value="" selected></option>
                        </select></td>
                     <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch"><INPUT  id="RoomSign5"  class="easyui-searchbox" searcher="SelRoom5" name="RoomSign5" data-options="editable:false" runat="server"/>
                        <INPUT  id="RoomID5" type="hidden" size="1" name="RoomID5" runat="server"/>
                        <INPUT  id="hiRoomSign5" type="hidden" size="1" name="hiRoomSign5" runat="server"/></td>
                 </tr>
                 <tr>
                    <td class="TdTitle">车位编号</td>
                    <td class="TdContentSearch"><input id="ParkName5" class="easyui-textbox" name="ParkName5" type="text" /></td>
                      <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                 <tr>
                    <td  colspan="4" style="text-align:center"> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ExcuteOnServer();LoadListAll();">查询</a>
                        &nbsp;&nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="btnClear_OnClick();">清空</a></td>
                                       
                </tr>
            </table>            
        </div>--%>
        <div id="tt" style='overflow: hidden'>

            <div id="ysfl" style='overflow: hidden'>
                <div id="tt2" style='overflow: hidden'>
                    <%--<div title="客户当前标准查询" id="khdqbz" style='overflow: hidden;'>
                        <div style="width: 100%; background-color: #ffffff;" id="TableContainer"></div>
                    </div>--%>
                    <%--<div title="客户历史标准查询" id="khlsbz" style='overflow: hidden'>
                        <div style="width: 100%; background-color: #ffffff;" id="TableContainer2"></div>
                    </div>--%>
                <%--    <div title="未设物管费房屋查询" id="wswgf" style='overflow: hidden'>
                        <div style="width: 100%; background-color: #ffffff;" id="TableContainer3"></div>
                    </div>--%>
                    <div title="未设水电气费表计查询" id="wssdq" style='overflow: hidden'>                       
                        <div style="width: 100%; background-color: #ffffff;" id="TableContainer4"></div>
                    </div>
                    <%--<div title="未设车位费车位查询" id="wscw" style='overflow: hidden'>                       
                        <div style="width: 100%; background-color: #ffffff;" id="TableContainer5"></div>
                    </div>--%>
                </div>
            </div>

            <%--<div title="项目标准查询" style="width: 100%; overflow: hidden">
                <iframe id="pag" scrolling="no" frameborder="0" width="100%"></iframe>
            </div>

            <div title="佣金标准查询" style='overflow: hidden'>
                <iframe id="pag1" scrolling="no" frameborder="0" width="100%"></iframe>
            </div>

            <div title="收费比例查询" style='overflow: hidden'>
                <iframe id="pag2" scrolling="no" frameborder="0" width="100%"></iframe>
            </div>--%>
        </div>

        <div id='fyhj' style="height: 30px; vertical-align: middle; border-left: 0px; border-top: 0px; width: 73%">
        </div>

        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
            var w = $(window).width();
            var h = $(window).height();
            function InitTableHeight() {

                //var h1 = h - 110;
                //var h2 = h1 + 100;
                //$("#TableContainer").css("height", h + "px");
                //$("#TableContainer2").css("height", h + "px");
                //$("#TableContainer3").css("height", h + "px");
                $("#TableContainer4").css("height", h+ "px");
                //$("#TableContainer5").css("height", h1 + 25 + "px");

                //var travelExpenseFrame = document.getElementById("pag");
                //travelExpenseFrame.height = h;

                //var travelExpenseFrame1 = document.getElementById("pag1");
                //travelExpenseFrame1.height = h;

                //var travelExpenseFrame2 = document.getElementById("pag2");
                //travelExpenseFrame2.height = h;

                //$("#sfbzExcel").attr('disabled', true);
                //$("#wswgfExcel").attr('disabled', true);
                //$("#wssdqbjExcel").attr('disabled', true);
                //$("#wscwfcwExcel").attr('disabled', true);

            }

            InitTableHeight();

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


            function SelCost() {

                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);
                    }
                });

                return false;
            }

            function SelBuild3() {
                SelBuildIndex('3');
            }
            function SelBuild4() {
                SelBuildIndex('4');
            }
            function SelBuild5() {
                SelBuildIndex('5');
            }

            function SelBuildIndex(index) {
                var varReturn;

                HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx", '楼宇选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");
                        var BuildSNums = "";
                        var BuildNames = "";
                        $('#BuildSNums' + index).val(BuildSNums);
                        $('#BuildNames' + index).searchbox('setValue', BuildNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                BuildSNums = BuildSNums + "," + varObjects[i].split(',')[0];
                                BuildNames = BuildNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#BuildSNums' + index).val(BuildSNums.substring(1, BuildSNums.length));
                        $('#BuildNames' + index).searchbox('setValue', BuildNames.substring(1, BuildNames.length));
                    }
                });

            }

            function SelRegion3(index) {
                SelRegionIndex('3');
            }
            function SelRegion4(index) {
                SelRegionIndex('4');
            }
            function SelRegion5(index) {
                SelRegionIndex('5');
            }
            function SelRegionIndex(index) {

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

            function SelCust2() {
                SelCustIndex('2');
            }

            function SelCustIndex(index) {

                $('#CustName' + index).searchbox("setValue", '');
                $('#CustID' + index).val('');
                $('#RoomSign' + index).searchbox("setValue", '');
                $('#RoomID' + index).val('');
                $('#SelectRoomID' + index).combobox({ data: [], valueField: 'RoomID' + index, textField: 'RoomText' });

                var conent = "../DialogNew/CustDlg.aspx";

                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName' + index).searchbox("setValue", data.CustName);
                    $('#CustID' + index).val(data.CustID);


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

                                $('#SelectRoomID' + index).combobox({
                                    data: RoomData,
                                    valueField: 'RoomID',
                                    textField: 'RoomText',
                                    onChange: function (n, o) {


                                        var data = $('#SelectRoomID' + index).combobox('getData');
                                        if (data.length > 0) {
                                            for (var i = 0; i < data.length; i++) {
                                                if (n == data[i].RoomID) {

                                                    $('#RoomSign' + index).searchbox('setValue', data[i].RoomText);
                                                    var buildArea = data[i].RoomID.split("|")[1];
                                                    //$('#BuildArea'+ index).val(buildArea);
                                                    $('#RoomID' + index).val(data[i].RoomID.split("|")[0]);

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

            function SelRoom2() {
                SelRoomIndex('2');
            }
            function SelRoom3() {
                SelRoomIndex('3');
            }
            function SelRoom4() {
                SelRoomIndex('4');
            }
            function SelRoom5() {
                SelRoomIndex('5');
            }
            function SelRoomIndex(index) {
                $('#CustName' + index).searchbox("setValue", '');
                $('#CustID' + index).val('');
                $('#RoomSign' + index).searchbox("setValue", '');
                $('#RoomID' + index).val('');
                $('#SelectRoomID' + index).combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/RoomDlg.aspx";

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign' + index).searchbox("setValue", data.RoomSign);
                    $('#CustName' + index).searchbox("setValue", data.CustName);
                    $('#CustID' + index).val(data.CustID);
                    $('#RoomID' + index).val(data.RoomID);

                    //$('#BuildArea').val(data.BuildArea);
                    //$('#CalcArea').val(data.BuildArea);
                });

            }
            function SelCost2() {
                SelCostIndex('2')
            }
            function SelCostIndex(index) {
                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#CostIDs' + index).val(varObjects[0]);
                        $('#CostNames' + index).searchbox('setValue', varObjects[1]);

                    }
                });

                return false;
            }

            //var CostStanColumns = [[

            //    { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 200 },
            //    { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 100 },
            //    { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, width: 100 },
            //    { field: 'Buildarea', title: '建筑面积', align: 'left', sortable: true, width: 100 },
            //    { field: 'StateName', title: '交房状态', align: 'left', sortable: true, width: 100 },
            //    { field: 'ParkName', title: '车位编号', align: 'left', sortable: true, width: 100 },
            //    { field: 'CostName', title: '费用名称', align: 'left', sortable: true, width: 100 },
            //    { field: 'MeterName', title: '表计名称', align: 'left', sortable: true, width: 100 },
            //    { field: 'StanName', title: '标准名称', align: 'left', sortable: true, width: 200 },
            //    { field: 'StanAmount', title: '通用收费标准', align: 'left', sortable: true, width: 100 },
            //    { field: 'IsConditionName', title: '是否按条件计算', align: 'left', sortable: true, width: 100 },
            //    { field: 'CondStanAmount', title: '收费标准', align: 'left', sortable: true, width: 100 },
            //    { field: 'ChargeCycleName', title: '计费周期', align: 'left', sortable: true, width: 100 },
            //    { field: 'StanEndHit', title: '标准状态', align: 'left', sortable: true, width: 100 }
            //]];

            //var CostStanHisColumns = [[
            //    { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 100 },
            //    { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 100 },
            //    { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, width: 100 },
            //    { field: 'CostName', title: '费用名称', align: 'left', sortable: true, width: 100 },
            
            //    { field: 'StanName', title: '标准名称', align: 'left', sortable: true, width: 150 },
            //    { field: 'StanFormulaName', title: '计算方式', align: 'left', sortable: true, width: 150 },
            //    { field: 'StanAmount', title: '通用收费标准', align: 'left', sortable: true, width: 100 },
            //    { field: 'StanExplain', title: '标准说明', align: 'left', sortable: true, width: 200 },
            //    {
            //        field: 'ChargeCycle', title: '计费周期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
            //            var str = "";
            //            if (row.ChargeCycle == "0") {
            //                str = "无固定周期";
            //            }
            //            else if (row.ChargeCycle != "") {
            //                str = "按" + row.ChargeCycle + "月计费";
            //            }
            //            return str;
            //        }
            //    },
            //    {
            //        field: 'CalcBeginDate', title: '计费开始时间', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
            //            var str = row.CalcBeginDate.ToCustomizeDate();
            //            return str;
            //        }
            //    },
            //    {
            //        field: 'IsInherit', title: '出租时自动转移租户', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
            //            var str = "";
            //            if (row.IsInherit == "0") {
            //                str = "否";
            //            }
            //            else if (row.IsInherit == "1") {
            //                str = "是";
            //            }
            //            return str;
            //        }
            //    },
            //    { field: 'ChangeDate', title: '变更时间', align: 'left', sortable: true, width: 150 }
            //]];

            //var RoomNoStanColumns = [[
            //    { field: 'LiveTypeName', title: '业主/租户', align: 'left', sortable: true, width: 200 },
            //    { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 200 },
            //    { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 200 },
            //    { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, width: 200 }
            //]];

            var MeterNoStanColumns = [[
                { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 200 },
                { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, width: 200 },
                { field: 'MeterSign', title: '表计编号', align: 'left', sortable: true, width: 200 },
                { field: 'MeterName', title: '表计名称', align: 'left', sortable: true, width: 200 },
                { field: 'MeterTypeName', title: '表计类型', align: 'left', sortable: true, width: 200 }
            ]];
            //var ParkNoStanColumns = [[
            //    { field: 'CarparkName', title: '车位区域', align: 'left', sortable: true, width: 200 },
            //    { field: 'ParkType', title: '车位类型', align: 'left', sortable: true, width: 200 },
            //    { field: 'ParkName', title: '车位编号', align: 'left', sortable: true, width: 200 },
            //    { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 200 },
            //    { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 200 },
            //    { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, width: 200 }
            //]];
            var beforeLoad = function (param) {

                $("select").each(function () {

                    var key = $(this).attr("id");
                    if (key != "") {
                        if (!param[key]) {
                            param[key] = $(this).val();
                        }
                    }
                });

                $("input").each(function () {

                    var key = $(this).attr("id");
                    if (key != "") {
                        if (!param[key]) {
                            param[key] = $(this).val();
                        }
                    }
                });
            };

            //var toolbar1 = [
            //        {
            //            text: '筛选',
            //            iconCls: 'icon-search',
            //            handler: function () {

            //                $('#SearchDlg').parent().appendTo($("form:first"))
            //                $('#SearchDlg').dialog('open');
            //            }
            //        }
            //        , '-', {
            //            text: 'Excel导出',
            //            iconCls: 'icon-page_white_excel',
            //            handler: function () {
            //                window.location.href = "CostStanSettingCreExcel.aspx";
            //            }
            //        }
            //];

            //var toolbar2 = [
            //    {
            //        text: '筛选',
            //        iconCls: 'icon-search',
            //        handler: function () {
            //            $('#SearchDlg2').parent().appendTo($("form:first"))
            //            $('#SearchDlg2').dialog('open');
            //        }
            //    }
            //    , '-', {
            //        text: 'Excel导出',
            //        iconCls: 'icon-page_white_excel',
            //        handler: function () {
            //            window.location.href = 'CostStanSettingHisCre.aspx';
            //        }
            //    }
            //];

            //var toolbar3 = [
            //    {
            //        text: '筛选',
            //        iconCls: 'icon-search',
            //        handler: function () {
            //            $('#SearchDlg3').parent().appendTo($("form:first"))
            //            $('#SearchDlg3').dialog('open');
            //        }
            //    }
            //    , '-', {
            //        text: 'Excel导出',
            //        iconCls: 'icon-page_white_excel',
            //        handler: function () {
            //            window.location.href = "RoomNoStanSearchCre.aspx";
            //        }
            //    }
            //];

            var toolbar4 = [
              {
                  text: '筛选',
                  iconCls: 'icon-search',
                  handler: function () {
                      $('#SearchDlg4').parent().appendTo($("form:first"))
                      $('#SearchDlg4').dialog('open');
                  }
              }
              , '-', {
                  text: 'Excel导出',
                  iconCls: 'icon-page_white_excel',
                  handler: function () {
                      window.location.href = "MeterNoStanSearchCre.aspx";
                  }
              }
            ];

            //var toolbar5 = [
            //      {
            //          text: '筛选',
            //          iconCls: 'icon-search',
            //          handler: function () {
            //              $('#SearchDlg5').parent().appendTo($("form:first"))
            //              $('#SearchDlg5').dialog('open');
            //          }
            //      }
            //      , '-', {
            //          text: 'Excel导出',
            //          iconCls: 'icon-page_white_excel',
            //          handler: function () {
            //              window.location.href = "ParkingNoStanSearchCre.aspx";
            //          }
            //      }
            //];

            //function LoadList(loadMsg) {
            //    $("#TableContainer").datagrid({
            //        url: '/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=CostStanSeach&Command=CostStanSetting&' + $("#NewFeesDueCutSearch").serialize(),
            //        method: "post",
            //        loadMsg: loadMsg,
            //        pageSize: top.ListPageSize,
            //        pageList: top.ListPageList,
            //        columns: CostStanColumns,
            //        fitColumns: false,
            //        toolbar: toolbar1,
            //        border:false,
            //        singleSelect: true,
            //        nowrap: false,
            //        fitColumns: true,
            //        pagination: true,
            //        width: "100%",
            //        sortOrder: "asc",
            //        onBeforeLoad: beforeLoad,
            //        onLoadSuccess: function (data) {
            //            $('#SearchDlg').dialog('close');
            //        }
            //    });

            //}
            //function LoadList2(loadMsg) {

            //    $("#TableContainer2").datagrid({
            //        url: '/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=CostStanSeach&Command=CostStanSettingHis&' + $("#NewFeesDueCutSearch").serialize(),
            //        method: "post",
            //        loadMsg: loadMsg,
            //        pageSize: top.ListPageSize,
            //        pageList: top.ListPageList,
            //        columns: CostStanHisColumns,
            //        fitColumns: false,
            //        toolbar: toolbar2,
            //        singleSelect: true,
            //        nowrap: false,
            //        border: false,
            //        pagination: true,
            //        fitColumns: true,
            //        width: "100%",
            //        sortOrder: "asc",
            //        onBeforeLoad: beforeLoad,
            //        onLoadSuccess: function (data) {
            //            $('#SearchDlg2').dialog('close');
            //        }
            //    });

            //}

            //function LoadList3(loadMsg) {
            //    $("#TableContainer3").datagrid({
            //        url: '/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=CostStanSeach&Command=RoomNoStanSeach&' + $("#NewFeesDueCutSearch").serialize(),
            //        method: "post",
            //        loadMsg: loadMsg,
            //        pageSize: top.ListPageSize,
            //        pageList: top.ListPageList,
            //        columns: RoomNoStanColumns,
            //        fitColumns: false,
            //        toolbar: toolbar3,
            //        singleSelect: true,
            //        nowrap: false,
            //        pagination: true,
            //        fitColumns: true,
            //        width: "100%",
            //        sortOrder: "asc",
            //        onBeforeLoad: beforeLoad,
            //        onLoadSuccess: function (data) {
            //            $('#SearchDlg3').dialog('close');
            //        }
            //    });

            //}

            function LoadList4(loadMsg) {
                $("#TableContainer4").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=CostStanSeach&Command=MeterNoStanSeach&' + $("#NewFeesDueCutSearch").serialize(),
                    method: "post",
                    loadMsg: loadMsg,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: MeterNoStanColumns,
                    fitColumns: false,
                    toolbar: toolbar4,
                    singleSelect: true,
                    nowrap: false,
                    pagination: true,
                    fitColumns: true,
                    width: "100%",
                    sortOrder: "asc",
                    onBeforeLoad: beforeLoad,
                    onLoadSuccess: function (data) {
                        $('#SearchDlg4').dialog('close');
                    }
                });

            }
            //function LoadList5(loadMsg) {

            //    $("#TableContainer5").datagrid({
            //        url: '/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=CostStanSeach&Command=ParkNoStanSeach&' + $("#NewFeesDueCutSearch").serialize(),
            //        method: "post",
            //        loadMsg: loadMsg,
            //        pageSize: top.ListPageSize,
            //        pageList: top.ListPageList,
            //        columns: ParkNoStanColumns,
            //        fitColumns: false,
            //        toolbar: toolbar5,
            //        singleSelect: true,
            //        nowrap: false,
            //        fitColumns: true,
            //        pagination: true,
            //        width: "100%",
            //        sortOrder: "asc",
            //        onBeforeLoad: beforeLoad,
            //        onLoadSuccess: function (data) {
            //            $('#SearchDlg5').dialog('close');
            //        }
            //    });

            //}
            function ExcuteOnServer() {
                document.getElementById('hiIsSQLData').value = 1;

                $("#sfbzExcel").attr('disabled', false);
                $("#wswgfExcel").attr('disabled', false);
                $("#wssdqbjExcel").attr('disabled', false);
                $("#wscwfcwExcel").attr('disabled', false);

            }

            document.getElementById('hiIsSQLData').value = 1;
            LoadList4('');

        </script>

        <script type="text/javascript">

            //$('#tt').tabs({
            //    border: false,
            //    onSelect: function (title, index) {

            //        //  alert(title+' is selected');
            //        if (index == 0) {
            //            $('#pag').attr('src', '');
            //            $('#pag1').attr('src', '');
            //            $('#pag2').attr('src', '');
            //        }
            //        if (index == 1) {
            //            $('#pag').attr('src', 'NewCostStandardBrowse.aspx');
            //            $('#pag1').attr('src', '');
            //            $('#pag2').attr('src', '');
            //        }
            //        if (index == 2) {
            //            $('#pag').attr('src', '');
            //            $('#pag1').attr('src', 'NewCostCommissionStanBrowse.aspx');
            //            $('#pag2').attr('src', '');
            //        }
            //        if (index == 3) {
            //            $('#pag').attr('src', '');
            //            $('#pag1').attr('src', '');
            //            $('#pag2').attr('src', 'NewRoomStateDetailBrowse.aspx');                     
            //        }
            //    }
            //});

            function LoadListAll() {
                var index = $('#tabindex').val();

                //if (index == 0) {
                //if (document.getElementById('hiIsSQLData').value != "-1") {
                //    document.getElementById('hiIsSQLData').value = -1;
                //}
                //if (document.getElementById('hiIsSQLData').value == "-1") {
                //    LoadList('');
                //}
                //else {
                //    LoadList('数据加载中,请稍候...');
                //}
                //}
                //if (index == 1) {

                //if (document.getElementById('hiIsSQLData').value != "-1") {
                //    document.getElementById('hiIsSQLData').value = -1;
                //}
                //if (document.getElementById('hiIsSQLData').value == "-1") {
                //    LoadList2('');
                //}
                //else {
                //    LoadList2('数据加载中,请稍候...');
                //}

                //}
                //if (index == 2) {

                //if (document.getElementById('hiIsSQLData').value != "-1") {
                //    document.getElementById('hiIsSQLData').value = -1;
                //}
                //if (document.getElementById('hiIsSQLData').value == "-1") {
                //    btnClear_OnClick();
                //    LoadList3('');
                //}
                //else {
                //    LoadList3('数据加载中,请稍候...');
                //}
                //}
                //if (index == 3) {

                    if (document.getElementById('hiIsSQLData').value != "-1") {
                        document.getElementById('hiIsSQLData').value = 1;
                    }
                    if (document.getElementById('hiIsSQLData').value == "-1") {
                        btnClear_OnClick();
                        LoadList4('');
                    }
                    else {
                        LoadList4('数据加载中,请稍候...');
                    }
                //}
                //if (index == 4) {


                //    if (document.getElementById('hiIsSQLData').value != "-1") {
                //        document.getElementById('hiIsSQLData').value = -1;
                //    }
                //    if (document.getElementById('hiIsSQLData').value == "-1") {
                //        btnClear_OnClick();
                //        LoadList5('');
                //    }
                //    else {
                //        LoadList5('数据加载中,请稍候...');
                //    }
                //}
            }

            //$('#tt2').tabs({
            //    border: false,
            //    onSelect: function (title, index) {

            //        $('#tabindex').val(index);
            //        btnClear_OnClick();
            //        LoadListAll();
            //    }
            //});
            LoadListAll();
        </script>
    </form>
</body>
</html>
