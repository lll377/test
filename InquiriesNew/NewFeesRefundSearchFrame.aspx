<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewFeesRefundSearchFrame.aspx.cs" Inherits="M_Main.InquiriesNew.NewFeesRefundSearchFrame" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>

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
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>

    <style type="text/css">
        .panel-body {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .datagrid-mask-msg {
            height: 40px;
        }

        .tabs-container .tabs-left .panel-body {
            margin-left: 0px;
        }

        .panel-body2 {
            margin-left: 20%;
            width: 80%;
        }
    </style>

</head>
<body>
    <form id="frmForm">

        <input style=" WIDTH: 8px" id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server"/>
<input style=" WIDTH: 8px" id="hiLoginUserCode" size="1" type="hidden" name="hiLoginUserCode" runat="server"/>
<input style=" WIDTH: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server"/>
<input style=" WIDTH: 8px" id="hiLoadFeesPaid" size="1" type="hidden" name="hiLoadFeesPaid" runat="server"/>
<input style=" WIDTH: 8px" id="hiLoadFeesPaidPrec" size="1" type="hidden" name="hiLoadFeesPaidPrec" runat="server"/>
<input style=" WIDTH: 8px" id="hiLoadFeesPaidLt" size="1" type="hidden" name="hiLoadFeesPaidLt" runat="server"/>

        
        <input type="hidden" id="SelectRoomList" name="SelectRoomList" value="" runat="server" />
        <input type="hidden" id="SelRoomIDs" name="SelRoomIDs" value="" runat="server" />
        <input type="hidden" id="SelRoomSigns" name="SelRoomSigns" value="" runat="server" />

        <input id="BuildSNums" type="hidden"
            size="1" name="BuildSNums" runat="server" /><input id="hiBuildNames" type="hidden"
                size="1" name="hiBuildNames" runat="server" designtimedragdrop="492" />
        <input id="hiRoomSigns" size="1" type="hidden" name="hiRoomSigns" runat="server" />
        <input id="RoomIDs" size="1" type="hidden" name="RoomIDs" runat="server" />
        <input id="hiRegionNames" size="1" type="hidden" name="hiRegionNames" runat="server" />

        <input id="hiParkNames" class="easyui-validatebox" size="1" type="hidden" name="hiParkNames" runat="server" />
        <input id="ParkIDs" class="easyui-validatebox" size="1" type="hidden" name="ParkIDs" runat="server" />
        <input id="hiCostNames" class="easyui-validatebox" size="1" type="hidden" name="hiCostNames" runat="server" />
        <input id="RegionSNums" size="1" type="hidden" name="RegionSNums" runat="server" />
    
         <input style=" WIDTH: 32px" id="PageIndex" size="1" type="hidden" name="PageIndex"
							    runat="server"><input style="HEIGHT: 21px; WIDTH: 24px" id="PrintParms" size="1" type="hidden" name="PrintParms"
							    runat="server"><input style=" WIDTH: 24px" id="CostGeneType" size="1" type="hidden" name="CostGeneType"
							    runat="server"><input style="HEIGHT: 21px; WIDTH: 24px" id="OptCode" size="1" type="hidden" name="OptCode"
							    runat="server"><input style="HEIGHT: 21px; WIDTH: 24px" id="Flag" size="1" type="hidden" name="Flag" runat="server">

        <input id="selTabID" type="hidden" name="selTabID" />

        <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td>退款时间从  <input type="text" class="Wdate" id="SetBeginDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"   runat="server" name="SetBeginDate"/>&nbsp;到&nbsp;<input type="text"  runat="server" class="Wdate" id="SetEndDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  name="SetEndDate"/></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" onclick=" JavaScript:LoadData(); " class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">快速查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                  
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" onclick=" JavaScript:ExcuteOnServer(); " class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">更多查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" onclick="ToExcel();" class="l-btn l-btn-small l-btn-plain" group="" id="ssyccddc"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">实收/预收/冲抵退款明细输出</span><span class="l-btn-icon icon-page_white_excel">&nbsp;</span></span></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" onclick="ToExcel2();" class="l-btn l-btn-small l-btn-plain" group="" id="yctkdc"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">预存退款明细输出</span><span class="l-btn-icon icon-page_white_excel">&nbsp;</span></span></a></td>
                    
                     <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td style="padding-left: 70px">
                      
                    </td>
                </tr>
              </table>
             <table cellspacing="0" cellpadding="0">
                <tr>
                    <td >
                          <div id="divhj">
                            <table cellspacing="0" cellpadding="0" style="color: red">
                                <tr>
                                    <td>实收/冲抵退款小计:</td>
                                    <td>
                                        <div class="datagrid-btn-separator"></div>
                                    </td>
                                    <td style="width: 70px; text-align: center">
                                        <div id="sstkje"></div>
                                    </td>
                                    <td>
                                        <div class="datagrid-btn-separator"></div>
                                    </td>
                                    <td>预存退款小计:</td>
                                    <td>
                                        <div class="datagrid-btn-separator"></div>
                                    </td>
                                    <td style="width: 70px; text-align: center">
                                        <div id="yctkje"></div>
                                    </td>
                                    <td>
                                        <div class="datagrid-btn-separator"></div>
                                    </td>
                                    <td>全部合计:</td>
                                    <td>
                                        <div class="datagrid-btn-separator"></div>
                                    </td>
                                    <td style="width: 70px; text-align: center">
                                        <div id="hjje"></div>
                                    </td>
                                    <td>
                                        <div class="datagrid-btn-separator"></div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="tabs-container">
            <div class="tabs-left" id="DivLeft" style="margin: 0px;">
                <ul class="nav nav-tabs">
                    <li class="active" refsel="1" name="ssmx" refid="Tab1" refpage="NewReceiveFeesHisBrowse" reftype="实收/预收/冲抵退款明细">
                        <a data-toggle="tab" href="#tab-1"><i class="fa fa-cogs "></i>实收/冲抵退款明细</a>
                    </li>
                    <li class="" refsel="0" refid="Tab2" name="ysmx" refpage="NewHaveFeesEnquiries" reftype="预存退款明细">
                        <a data-toggle="tab" href="#tab-2"><i class="fa fa-cogs "></i>预存退款明细</a>
                    </li>
                   


                </ul>
                <div class="tab-content ">
                    <div id="tab-1" class="tab-pane active">
                        <div class="panel-body2" style="padding: 0px; position: absolute;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer1" style="margin-left: 0px">1</div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">
                        <div class="panel-body2" style="padding: 0px; position: absolute;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer2">2</div>
                            </div>
                        </div>
                    </div>
                    

                </div>
            </div>
        </div>


        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 430px;">


            <table class="DialogTable">
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
               
                <tr>
                      <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <input id="RegionNames" class="easyui-searchbox" searcher="SelRegion" data-options="editable:false"
                            size="14" name="RegionNames" runat="server"></td>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <input id="BuildNames" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false"
                            name="BuildNames" runat="server" /></td>
                  
                </tr>
                 <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                <tr>
                    <td class="TdTitle">楼宇类型</td>
                    <td class="TdContentSearch">
                        <select id="BuildType" name="BuildType" runat="server">
                            <option selected></option>
                        </select></td>

                    <td class="TdTitle">交房状态</td>
                    <td class="TdContentSearch">
                        <select id="RoomState" name="RoomState" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                 <tr>
                    <td colspan="4" style="height: 5px"></td>
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
                    <td colspan="4" style="height: 5px"></td>
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
                        <select id="SelRoomID" onchange="javascript:SelRoomID_OnChange();" class="easyui-combobox" style="width: 150px" name="SelRoomID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                 <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" class="easyui-searchbox" searcher="SelRoom" name="RoomSign" data-options="editable:false" runat="server" />
                        <input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                            size="1" name="RoomID" runat="server" /><input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="hiRoomSign" runat="server" />

                    </td>
                    <td class="TdTitle">退款类型</td>
                    <td class="TdContentSearch"><select  id="BusinessType" name = "BusinessType" runat="server">
										<option value = 0 selected>全部</option>
										<option Value="1">实收</option>
										<option Value="2">冲抵</option>
                                        <option Value="3">预收</option>
									</select></td>
                </tr>
              <tr>
                    <td colspan="4" style="height: 5px"></td>
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
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                 <tr>
						<TD  class="TdTitle" >退款人
						</TD>
						<TD class="TdContentSearch" ><SELECT  id="UserCode" name="UserCode" runat="server">
									<OPTION selected></OPTION>
								</SELECT></TD>
						<TD class="TdTitle" >退款方式
						</TD>
						<TD class="TdContentSearch"><SELECT  id="ChargeMode" name="ChargeMode" runat="server">
								<OPTION selected></OPTION>
							</SELECT></TD>
					</TR>
                 <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                <tr>
                    <td class="TdTitle">开始退款票号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-textbox" id="StartBillsSign" name="StartBillsSign" runat="server"></td>
                    <td class="TdTitle">截止退款票号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-textbox" id="EndBillsSign" name="EndBillsSign" runat="server"></td>
                </tr>
                
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>

                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:LoadData(); ">确定筛选</a>

                    </td>

                </tr>
            </table>
        </div>

         <input style=" WIDTH: 8px" id="CostIDs" class="easyui-validatebox"  size="1"
										type="hidden" name="CostIDs" runat="server"/>
    <input style=" WIDTH: 8px" id="StanIDs" class="easyui-validatebox"  size="1"
											type="hidden" name="StanIDs" runat="server"/>
    <input style=" WIDTH: 8px" id="hiStanNames" class="easyui-validatebox"  size="1"
											type="hidden" name="hiStanNames" runat="server"/>


        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $(".Frm").css({ "height": h + "px" });
                //$(".datagrid-wrap panel-body panel-body-noheader panel-body-noborder").css({ "margin": "0px" });
                $("[class='datagrid-wrap panel-body panel-body-noheader panel-body-noborde']").css({ "margin": "0px" });
                var h1 = $('#divtt').height();
                h = h - h1;
              
              
             
                $("#TableContainer1").css("height", h + "px");
                $("#TableContainer2").css("height", h + "px");
                $("#TableContainer3").css("height", h + "px");

                $('#selTabID').val(1);
                $('#ssyccddc').show();
                $('#yctkdc').hide();

            }
            InitTableHeight();

            $(".tabs-container li").click(function () {



                $('#tab-1').attr("class", "tab-pane");
                $('#tab-2').attr("class", "tab-pane");
                $('#tab-3').attr("class", "tab-pane");


                $('#ssmx').attr("refsel", "0");
                $('#ysmx').attr("refsel", "0");
                $('#ltmx').attr("refsel", "0");



                $('#ssmx').attr("class", "");
                $('#ysmx').attr("class", "");
                $('#ltmx').attr("class", "");

                
                 switch ($(this).attr("name")) {

                    case "ssmx":
                        $('#selTabID').val(1);
                        $('#tab-1').attr("class", "tab-pane active");
                        $('#ssmx').attr("refsel", "1");
                        $('#ssmx').attr("class", "active");
                        LoadListPaid();
                        $('#divhj').show();
                        $('#ssyccddc').show();
                        $('#yctkdc').hide();
                        break;
                    case "ysmx":
                        $('#selTabID').val(2);
                        $('#tab-2').attr("class", "tab-pane active");
                        $('#ysmx').attr("refsel", "1");
                        $('#ysmx').attr("class", "active");
                        LoadList2();
                        $('#divhj').show();
                        $('#ssyccddc').hide();
                        $('#yctkdc').show();
                        break;


                }

            });


            function LoadData() {
                document.getElementById('hiIsSQLData').value = 1;

                switch ($('#selTabID').val()) {
                    case "1":
                        LoadList();
                        break;
                    case "2":
                        LoadList2();
                        break;
                }

            }


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
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });


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
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });

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
            function ExcuteOnServer()
            {
                btnClear_OnClick();
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }

            var column = [[


                 { field: 'BuildArea', title: '建筑面积', align: 'left', sortable: true, width: 100 },
                 //{ field: 'ChargeDate', title: '收款/冲抵时间', align: 'left', sortable: true, width: 170 },
                 //{ field: 'BillsSign', title: '收据号码', align: 'left', sortable: true, width: 100 },
                 {
                     field: 'FeesDueDate', title: '应收日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                         var str = formatDate(row.FeesDueDate, "yyyy-MM-dd");
                         return str;
                     }
                 },
                 { field: 'CostName', title: '费用名称', align: 'left', sortable: true, width: 150 },
                 { field: 'ChargeAmount', title: '收款/冲抵金额', align: 'left', sortable: true, width: 100 },
                 { field: 'LateFeeAmount', title: '合同违约金', align: 'left', sortable: true, width: 100 },
                 //{ field: 'ChargeUserName', title: '收款人', align: 'left', sortable: true, width: 100 },
                 //{ field: 'SubDatatime', title: '提交时间', align: 'left', sortable: true, width: 170 },
                 //{ field: 'AuditDate', title: '审核时间', align: 'left', sortable: true, width: 170 },
                 { field: 'RefundDate', title: '退款时间', align: 'left', sortable: true, width: 170 },
                 { field: 'UserName', title: '退款人', align: 'left', sortable: true, width: 100 },
                 { field: 'RefundAllAmount', title: '已退金额', align: 'left', sortable: true, width: 100 },
                 { field: 'RefundBillSNum', title: '退款票号', align: 'left', sortable: true, width: 100 },
                 { field: 'RefundMode', title: '退款方式', align: 'left', sortable: true, width: 100 },
                 { field: 'RefundMemo', title: '备注', align: 'left', sortable: true, width: 100 }
            ]];
            var frozenColumns = [[
                    { field: 'BusinessTypeName', title: '退款类型', align: 'left', sortable: true, width: 100 },
                    { field: 'CustName', title: '客户名称', align: 'left', sortable: true, fixed: true, width: 200 },
                    { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, fixed: true, width: 170 },
                    { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, fixed: true, width: 120 }

            ]];

            var column2 = [[
             { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 100 },
             { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 100 },
             { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, width: 100 },
             { field: 'PrecDate', title: '退款时间', align: 'left', sortable: true, width: 170 },
             { field: 'BillsSign', title: '退票票据', align: 'left', sortable: true, width: 100 },
             { field: 'RefundPrecAmount', title: '退款金额', align: 'left', sortable: true, width: 100 },
             { field: 'UserName', title: '退款人', align: 'left', sortable: true, width: 100 },
             { field: 'PrecMemo', title: '备注', align: 'left', sortable: true, width: 100 }

            ]];


            function btnClear_OnClick() {
                document.getElementById('CustID').value = "";
                document.getElementById('CustName').value = "";
                document.getElementById('hiCustName').value = "";

                document.getElementById('RoomID').value = "";
                document.getElementById('RoomSign').value = "";
                document.getElementById('hiRoomSign').value = "";

                document.getElementById('CostIDs').value = "";
                document.getElementById('CostNames').value = "";
                document.getElementById('hiCostNames').value = "";
             

                document.getElementById('RoomIDs').value = "";
          
                document.getElementById('hiRoomSigns').value = "";
               

                document.getElementById('CustTypeID').value = "";
                document.getElementById('ChargeTypeID').value = "";

                document.getElementById('ParkIDs').value = "";
                document.getElementById('ParkNames').value = "";
                document.getElementById('hiParkNames').value = "";
                document.getElementById('ParkNum').value = "";

                document.getElementById('CarparkIDs').value = "";
                document.getElementById('CarparkNames').value = "";
                document.getElementById('hiCarparkNames').value = "";
                document.getElementById('CarparkNum').value = "";

                document.getElementById('RoomState').value = "";
                document.getElementById('BuildType').value = "";

                document.getElementById('RegionSNums').value = "";
                document.getElementById('RegionNames').value = "";
                document.getElementById('hiRegionNames').value = "";
                document.getElementById('RegionNum').value = "";

            }




            function Win_OnLoad() {
                var strPrintParms = getObject("PrintParms").value;
                if (strPrintParms != "") {
                    showOperatWin(strPrintParms);

                    getObject("PrintParms").value = "";
                }
            }

            function LoadList() {
                $("#TableContainer1").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: '100%',
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    showFooter: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("NewFeesRefundSearch", "RefundFees", "TableContainer1", param);
                    },
                    rowStyler: function (index, row) {
                      
                    }, onLoadSuccess: function (data) {

                        $.tool.DataPostNoLoading('NewFeesRefundSearch', "RefundAllAmount", $('#frmForm').serialize(),
                          function Init() {
                            
                          },
                          function callback(_Data) {

                              var varObjects = _Data.split("|");
                              $('#sstkje').html(varObjects[0]);
                              $('#yctkje').html(varObjects[1]);
                              $('#hjje').html(varObjects[2]);
                             

                          },
                          function completeCallback() {

                          },
                          function errorCallback() {
                             
                          });

                    }
                });
                $('#SearchDlg').dialog('close');
            }
            document.getElementById('hiIsSQLData').value = -1;
            LoadList();

            function ExcuteOnServer() {

                document.getElementById('hiIsSQLData').value = "1";
               
                //btnClear_OnClick();
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');

            }


            function LoadList2() {
                $("#TableContainer2").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column2,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: '100%',
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    showFooter: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("NewFeesRefundSearch", "RefundPrecFees", "TableContainer2", param);
                    },
                    rowStyler: function (index, row) {
                      
                    }, onLoadSuccess: function (data) {

                        $.tool.DataPostNoLoading('NewFeesRefundSearch', "RefundAllAmount", $('#frmForm').serialize(),
                       function Init() {

                       },
                       function callback(_Data) {

                           var varObjects = _Data.split("|");
                           $('#sstkje').html(varObjects[0]);
                           $('#yctkje').html(varObjects[1]);
                           $('#hjje').html(varObjects[2]);

                           

                       },
                       function completeCallback() {

                       },
                       function errorCallback() {

                       });
                    }
                });
                $('#SearchDlg').dialog('close');
            }



            function ToExcel()
            {
                var rowData = $('#TableContainer1').datagrid('getData');
                if (rowData.total == '0')
                {
                    HDialog.Info('暂无结果集');
                }
                else
                {
                    window.location.href = "../InquiriesNew/FeesRefundSearchCre.aspx";
                }
                
            }

            function ToExcel2() {
                var rowData = $('#TableContainer2').datagrid('getData');
                if (rowData.total == '0') {
                    HDialog.Info('暂无结果集');
                }
                else {
                    window.location.href = "../InquiriesNew/FeesPrecRefundSearchCreExcel.aspx";
                }
                
            }
        </script>
    </form>
</body>
</html>
