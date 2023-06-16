<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewFeesPaidSearchFrame.aspx.cs" Inherits="M_Main.InquiriesNew.NewFeesPaidSearchFrame" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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

        <div class="datagrid-mask" style="height: 100%; width: 150%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 70px; border: 1px solid #cccccc; z-index: 99999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <input type="hidden" id="SelectRoomList" name="SelectRoomList" value="" runat="server" />
        <input type="hidden" id="SelRoomIDs" name="SelRoomIDs" value="" runat="server" />
        <input type="hidden" id="SelRoomSigns" name="SelRoomSigns" value="" runat="server" />
        <input style="width: 8px" id="hPropertyUses" size="1" type="hidden" name="hPropertyUses" runat="server" />
        <input style="width: 8px" id="hPropertyRights" size="1" type="hidden" name="hPropertyRights" runat="server" />
        <input style="width: 8px" id="hParkingPropertyUses" size="1" type="hidden" name="hParkingPropertyUses" runat="server" />
        <input id="BuildSNums" type="hidden" size="1" name="BuildSNums" runat="server" />
        <input id="hiBuildNames" type="hidden" size="1" name="hiBuildNames" runat="server" designtimedragdrop="492" />
        <input id="hiRoomSigns" size="1" type="hidden" name="hiRoomSigns" runat="server" />
        <input id="RoomIDs" size="1" type="hidden" name="RoomIDs" runat="server" />
        <input id="hiRegionNames" size="1" type="hidden" name="hiRegionNames" runat="server" />
        <input id="hiParkNames" class="easyui-validatebox" size="1" type="hidden" name="hiParkNames" runat="server" />
        <input id="ParkIDs" class="easyui-validatebox" size="1" type="hidden" name="ParkIDs" runat="server" />
        <input id="hiCostNames" class="easyui-validatebox" size="1" type="hidden" name="hiCostNames" runat="server" />
        <input id="RegionSNums" size="1" type="hidden" name="RegionSNums" runat="server" />
        <input id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server" />
        <input id="hiLoginUserCode" size="1" type="hidden" name="hiLoginUserCode" runat="server" />
        <input id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <input id="CostIDs" class="easyui-validatebox" size="1" type="hidden" name="CostIDs" runat="server" />
        <input id="StanIDs" class="easyui-validatebox" size="1" type="hidden" name="StanIDs" runat="server" />
        <input id="hiStanNames" class="easyui-validatebox" size="1" type="hidden" name="hiStanNames" runat="server" />
        <input style="height: 22px; width: 32px" id="PageIndex" size="1" type="hidden" name="PageIndex" runat="server" />
        <input style="height: 21px; width: 24px" id="PrintParms" size="1" type="hidden" name="PrintParms" runat="server" />
        <input style="height: 22px; width: 24px" id="CostGeneType" size="1" type="hidden" name="CostGeneType" runat="server" />
        <input style="height: 21px; width: 24px" id="OptCode" size="1" type="hidden" name="OptCode" runat="server" />
        <input style="height: 21px; width: 24px" id="Flag" size="1" type="hidden" name="Flag" runat="server" />
        <input id="selTabID" type="hidden" name="selTabID" />

        <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td>收款时间从<input type="text" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="SetBeginDate" runat="server" name="SetBeginDate" />&nbsp;到&nbsp;<input type="text" runat="server" class="Wdate" onclick="    WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="SetEndDate" name="SetEndDate" /></td>
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
                    <td><a href="javascript:void(0)" onclick="ToExcel();" class="l-btn l-btn-small l-btn-plain" group="" id="ssysdc"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">实收明细输出</span><span class="l-btn-icon icon-page_white_excel">&nbsp;</span></span></a>
                        <a href="javascript:void(0)" onclick="ToExcel3();" class="l-btn l-btn-small l-btn-plain" group="" id="ycmxdc"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">预存明细输出</span><span class="l-btn-icon icon-page_white_excel">&nbsp;</span></span></a>
                        <a href="javascript:void(0)" onclick="ToExcel2();" class="l-btn l-btn-small l-btn-plain" group="" id="ltjzdc"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">零头结转输出</span><span class="l-btn-icon icon-page_white_excel">&nbsp;</span></span></a>
                        <a href="javascript:void(0)" onclick="ToExcelWriteOff();" class="l-btn l-btn-small l-btn-plain" group="" id="ssyscxdc"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">实收/预收冲销明细输出</span><span class="l-btn-icon icon-page_white_excel">&nbsp;</span></span></a>
                    </td>
                    <td style="color: red">&nbsp;&nbsp;*右键表头显示隐藏列</td>
                    <td style="padding-left: 70px"></td>
                </tr>
            </table>
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <div id="divhj">
                            <table cellspacing="0" cellpadding="0" style="color: red">
                                <tr>
                                    <td>实收小计:</td>
                                    <td>
                                        <div class="datagrid-btn-separator"></div>
                                    </td>
                                    <td style="width: 70px; text-align: center">
                                        <div id="ssje"></div>
                                    </td>
                                    <td>
                                        <div class="datagrid-btn-separator"></div>
                                    </td>

                                    <td>合同违约金小计: </td>
                                    <td>
                                        <div class="datagrid-btn-separator"></div>
                                    </td>
                                    <td style="width: 70px; text-align: center">
                                        <div id="wyj"></div>
                                    </td>
                                    <td>
                                        <div class="datagrid-btn-separator"></div>
                                    </td>

                                    <td>零头结转小计:</td>
                                    <td>
                                        <div class="datagrid-btn-separator"></div>
                                    </td>
                                    <td style="width: 70px; text-align: center">
                                        <div id="ltje"></div>
                                    </td>
                                    <td>
                                        <div class="datagrid-btn-separator"></div>
                                    </td>

                                    <td>预存小计:</td>
                                    <td>
                                        <div class="datagrid-btn-separator"></div>
                                    </td>
                                    <td style="width: 70px; text-align: center">
                                        <div id="ycje"></div>
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

                                    <td>预收小计:</td>
                                    <td>
                                        <div class="datagrid-btn-separator"></div>
                                    </td>
                                    <td style="width: 70px; text-align: center">
                                        <div id="ysje" style=""display:none;"></div>
                                    </td>
                                    <td>
                                        <div class="datagrid-btn-separator"></div>
                                    </td> 
                                    
                                    <td>
                                        <div></div>
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
                    <li class="active" refsel="1" name="ssmx" refid="Tab1" refpage="NewReceiveFeesHisBrowse" reftype="实收费用明细">
                        <a data-toggle="tab" href="#tab-1"><i class="fa fa-cogs "></i>实收费用明细</a>
                    </li>
                    <li class="" refsel="0" refid="Tab2" name="ysmx" refpage="NewHaveFeesEnquiries" reftype="预收费用明细">
                        <a data-toggle="tab" href="#tab-2"><i class="fa fa-cogs "></i>预存费用明细</a>
                    </li>
                    <li class="" refsel="0" refid="Tab3" name="ltmx" refpage="NewReceiveAdvanceFeesHisBrowse" reftype="零头结转明细">
                        <a data-toggle="tab" href="#tab-3"><i class="fa fa-cogs "></i>零头结转明细</a>
                    </li>
                    <li class="" refsel="0" refid="Tab4" name="jmcd" refpage="WaiversFeeOffsetSearchDetail" reftype="减免冲抵查询">
                        <a data-toggle="tab" href="#tab-4"><i class="fa fa-cogs "></i>减免冲抵查询</a>
                    </li>
                    <li class="" refsel="0" refid="Tab5" name="yjcd" refpage="PreCostsOffsetSearch" reftype="预交冲抵查询">
                        <a data-toggle="tab" href="#tab-5"><i class="fa fa-cogs "></i>预交冲抵查询</a>
                    </li>
                    <li class="" refsel="0" refid="Tab6" name="cxmx" refpage="NewReceiveFeesWriteOffBrowse" reftype="实收/预收冲销费用明细">
                        <a data-toggle="tab" href="#tab-6"><i class="fa fa-cogs "></i>冲销明细查询</a>
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
                    <div id="tab-3" class="tab-pane">
                        <div class="panel-body2" style="padding: 0px; position: absolute;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer3">3</div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-4" class="tab-pane">
                        <div class="panel-body2" style="padding: 0px; position: absolute;">
                            <div class="Frm">
                                <iframe id="WaiversFeeOffsetSearchDetail" style="width: 100%; border: none; border-left: 1px solid #cccccc" class="Frm"></iframe>
                            </div>
                        </div>
                    </div>
                    <div id="tab-5" class="tab-pane">
                        <div class="panel-body2" style="padding: 0px; position: absolute;">
                            <div class="Frm">
                                <iframe id="PreCostsOffsetSearch" style="width: 100%; border: none; border-left: 1px solid #cccccc" class="Frm"></iframe>
                            </div>
                        </div>
                    </div>
                    <div id="tab-6" class="tab-pane">
                        <div class="panel-body2" style="padding: 0px; position: absolute;">
                            <div class="Frm">
                                <iframe id="WriteoffSearch" style="width: 100%; border: none; border-left: 1px solid #cccccc" class="Frm"></iframe>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>


        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 480px;">
            <table class="DialogTable">
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                <tr>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <input id="RegionNames" class="easyui-searchbox" searcher="SelRegion" data-options="editable:false" size="14" name="RegionNames" runat="server" />
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
                        <select id="SelRoomID" class="easyui-combobox" style="width: 150px" name="SelRoomID" runat="server">
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
                    <td class="TdTitle">房屋多选</td>
                    <td class="TdContentSearch" colspan="3">
                        <input id="RoomSigns" name="RoomSigns" style="width: 90%" searcher="SelRooms" class="easyui-searchbox" data-options="editable:false" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                <tr>
                    <td class="TdTitle">车位区域</td>
                    <td class="TdContentSearch">
                        <input id="CarparkNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCarpark" name="CarparkNames" runat="server" />
                        <input class="Control_ItemInput" id="CarparkIDs" style="width: 8px;" type="hidden" size="1" name="CarparkIDs" runat="server" />
                        <input class="Control_ItemInput" id="hiCarparkNames" style="width: 8px;" type="hidden" size="1" name="hiCarparkNames" runat="server" />
                    </td>
                    <td class="TdTitle">车位</td>
                    <td class="TdContentSearch">
                        <input id="ParkNames" class="easyui-searchbox" data-options="editable:false" searcher="SelPark" name="ParkNames" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                <tr>
                    <td class="TdTitle">收费类型</td>
                    <td class="TdContentSearch">
                        <select id="ChargeTypeID" name="ChargeTypeID" runat="server">
                            <option selected="selected"></option>
                        </select>
                    </td>
                    <td class="TdTitle">时间类型</td>
                    <td class="TdContentSearch">
                        <select id="FeesDateType">
                            <option value="1" selected="selected">费用日期</option>
                            <option value="2">应收日期</option>
                        </select></td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                <tr>
                    <td class="TdTitle">费用时间从</td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" class="Wdate" style="width: 40%" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EditBeginDate" runat="server" name="EditBeginDate" />
                        &nbsp;到&nbsp;
                        <input type="text" runat="server" class="Wdate" style="width: 40%" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EditEndDate" name="EditEndDate" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCost" name="CostNames" runat="server" /></td>
                    <td class="TdTitle">收费标准</td>
                    <td class="TdContentSearch">
                        <input id="StanNames" class="easyui-searchbox" data-options="editable:false" searcher="SelStan" name="StanNames" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>

                <tr>
                    <td class="TdTitle">收 款 人</td>
                    <td class="TdContentSearch">
                        <%--<select id="UserCode" name="UserCode" runat="server">
                            <option selected="selected"></option>
                        </select>--%>
                        <%--searcher="SelUserCode"--%>
                        <input id="UserNames" class="easyui-searchbox" searcher="SelUserName" data-options="editable:false" name="UserNames" runat="server" />
                        <input class="Control_ItemInput" id="UserCodes" style="width: 8px;" type="hidden" size="1" name="UserCodes" runat="server" />
                        <input class="Control_ItemInput" id="hiUserNames" style="width: 8px;" type="hidden" size="1" name="hiUserNames" runat="server" />
                    </td>
                    <td class="TdTitle">收款方式</td>
                    <td class="TdContentSearch">
                        <%--<select id="ChargeMode" name="ChargeMode" runat="server">
                            <option selected="selected"></option>
                        </select>--%>
                        <input type="hidden" id="ChargeMode" name="ChargeMode" runat="server"/>
                       <select id="ChargeModes" name="ChargeModes" class="easyui-combobox" paneimaxheight="100px"
                            data-options="editable:false,panelHeight:'135px',multiple:true," runat="server" style="width: 50%">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                <tr>
                    <td class="TdTitle">开始票号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-textbox" id="StartBillsSign" name="StartBillsSign" runat="server" />
                    </td>
                    <td class="TdTitle">截止票号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-textbox" id="EndBillsSign" name="EndBillsSign" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                <tr>
                    <td class="TdTitle">代收银行</td>
                    <td class="TdContentSearch">
                        <select id="BankName" name="BankName" runat="server">
                            <option selected="selected"></option>
                        </select></td>
                    <td class="TdTitle">合并显示</td>
                    <td class="TdContentSearch">
                        <input type="checkbox"  id='CkIsCombRow' name="CkIsCombRow" /><input type="hidden" name='IsCombRow' id='IsCombRow' />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px"></td>
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
                    <td class="TdTitle">车位产权性质</td>
                    <td class="TdContentSearch">
                        <select id="ParkingPropertyUses" name="ParkingPropertyUses" runat="server">
                            <option selected="selected"></option>
                            <option value="自有产权">自有产权</option>
                            <option value="业主产权">业主产权</option>
                            <option value="共有产权">共有产权</option>
                            <option value="产权不明">产权不明</option>
                            <option value="其它产权">其它产权</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:LoadData();">确定筛选</a>&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="btnClear_OnClick();">清&nbsp;&nbsp;空</a>
                    </td>

                </tr>
            </table>

        </div>

        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $(".Frm").css({ "height": h + "px" });
                $("[class='datagrid-wrap panel-body panel-body-noheader panel-body-noborde']").css({ "margin": "0px" });
                var h1 = $('#divtt').height();
                h = h - h1;
                $("#TableContainer1").css("height", h + "px");
                $("#TableContainer2").css("height", h + "px");
                $("#TableContainer3").css("height", h + "px");
                $("#TableContainer4").css("height", h + "px");
                $("#TableContainer6").css("height", h + "px");
                $('#selTabID').val(1);
                $('#ssysdc').show();
                $('#ycmxdc').hide();
                $('#ltjzdc').hide();
                $('#jmcddc').hide();
                $('#yjcddc').hide();
                $('#ssyscxdc').hide();
            }
            InitTableHeight();

            $(".tabs-container li").click(function () {
                $('#tab-1').attr("class", "tab-pane");
                $('#tab-2').attr("class", "tab-pane");
                $('#tab-3').attr("class", "tab-pane");
                $('#tab-4').attr("class", "tab-pane");
                $('#tab-5').attr("class", "tab-pane");
                $('#tab-6').attr("class", "tab-pane");

                $('#ssmx').attr("refsel", "0");
                $('#ysmx').attr("refsel", "0");
                $('#ltmx').attr("refsel", "0");
                $('#jmcd').attr("refsel", "0");
                $('#yjcd').attr("refsel", "0");
                $('#yjcd').attr("refsel", "0");
                $('#cxmx').attr("refsel", "0");

                $('#ssmx').attr("class", "");
                $('#ysmx').attr("class", "");
                $('#ltmx').attr("class", "");
                $('#jmcd').attr("class", "");
                $('#yjcd').attr("class", "");
                $('#cxmx').attr("class", "");

                switch ($(this).attr("name")) {

                    case "ssmx":
                        $('#selTabID').val(1);
                        $('#tab-1').attr("class", "tab-pane active");
                        $('#ssmx').attr("refsel", "1");
                        $('#ssmx').attr("class", "active");
                        LoadListPaid();
                        $('#divhj').show();
                        $("#divtt").show();

                        $('#ssysdc').show();
                        $('#ycmxdc').hide();
                        $('#ltjzdc').hide();
                        $('#jmcddc').hide();
                        $('#yjcddc').hide();
                        $('#ssyscxdc').hide();
                        break;
                    case "ysmx":
                        $('#selTabID').val(2);
                        $('#tab-2').attr("class", "tab-pane active");
                        $('#ysmx').attr("refsel", "1");
                        $('#ysmx').attr("class", "active");
                        LoadListPrec();
                        $('#divhj').show();
                        $("#divtt").show();

                        $('#ssysdc').hide();
                        $('#ycmxdc').show();
                        $('#ltjzdc').hide();
                        $('#jmcddc').hide();
                        $('#yjcddc').hide();
                        $('#ssyscxdc').hide();
                        break;
                    case "ltmx":

                        $('#selTabID').val(3);
                        $('#tab-3').attr("class", "tab-pane active");
                        $('#ltmx').attr("refsel", "1");
                        $('#ltmx').attr("class", "active");
                        LoadListPaidLt();
                        //$('#divhj').hide();
                        $('#divhj').show();
                        $("#divtt").show();

                        $('#ssysdc').hide();
                        $('#ycmxdc').hide();
                        $('#ltjzdc').show();
                        $('#jmcddc').hide();
                        $('#yjcddc').hide();
                        $('#ssyscxdc').hide();
                        break;
                    case "jmcd":
                        $('#selTabID').val(4);
                        $('#tab-4').attr("class", "tab-pane active");
                        $('#jmcd').attr("refsel", "1");
                        $('#jmcd').attr("class", "active");
                        $('#divhj').hide();
                        $("#divtt").hide();

                        $('#ssysdc').hide();
                        $('#ycmxdc').hide();
                        $('#ltjzdc').hide();
                        $('#ssyscxdc').hide();
                        var refpage = "../ChargesNew/" + $(this).attr("refpage") + ".aspx";
                        $("#WaiversFeeOffsetSearchDetail").attr("src", refpage);
                        break;
                    case "yjcd":
                        $('#selTabID').val(5);
                        $('#tab-5').attr("class", "tab-pane active");
                        $('#yjcd').attr("refsel", "1");
                        $('#yjcd').attr("class", "active");
                        $('#divhj').hide();
                        $("#divtt").hide();
                        var refpage = "../ChargesNew/" + $(this).attr("refpage") + ".aspx";
                        $("#PreCostsOffsetSearch").attr("src", refpage);
                        $('#ssysdc').hide();
                        $('#ycmxdc').hide();
                        $('#ltjzdc').hide();
                        $('#ssyscxdc').hide();
                        break;
                    case "cxmx":
                        $('#selTabID').val(6);
                        $('#tab-6').attr("class", "tab-pane active");
                        $('#cxmx').attr("refsel", "1");
                        $('#cxmx').attr("class", "active");

                        $('#divhj').hide();
                        $("#divtt").hide();

                        var refpage = "../StatisReport/WriteOff_Comm.aspx";
                        $("#WriteoffSearch").attr("src", refpage);
                        $('#ssysdc').hide();
                        $('#ycmxdc').hide();
                        $('#ltjzdc').hide();
                        $('#ssyscxdc').hide();
                        break;
                }
            });

            function LoadListFeesWriteOff() {
                var isCheck = document.getElementById('CkIsCombRow').checked;
                if (isCheck) {
                    document.getElementById('IsCombRow').value = "1";
                }
                else {
                    document.getElementById('IsCombRow').value = "0";
                }
                $("#TableContainer6").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: columnWriteOff,
                    frozenColumns: frozenColumnsWriteOff,
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
                    showFooter: true,
                    onHeaderContextMenu: function (e, field) {
                        e.preventDefault();
                        if (!cmenuWriteOff) {
                            createColumnMenuWriteOff();
                        }
                        cmenuWriteOff.menu('show', {
                            left: e.pageX,
                            top: e.pageY
                        });
                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("FeesPaidNewSearch", "LoadDataWriteOff", "TableContainer6", param);
                    },
                    onLoadSuccess: function (data) {
                        document.getElementById('ssje').innerHTML = 0;
                        document.getElementById('wyj').innerHTML = 0;
                        document.getElementById('ysje').innerHTML = 0;
                        document.getElementById('ltje').innerHTML = 0;
                        document.getElementById('ycje').innerHTML = 0;
                        document.getElementById('hjje').innerHTML = 0;
                        if (document.getElementById('hiIsSQLData').value != "-1") {
                            $.tool.DataPostNoLoading('FeesPaidNewSearch', "LoadDataSum", $('#frmForm').serialize(),
                                function Init() {
                                    //加载页脚
                                    document.getElementById('ssje').innerHTML = 0;
                                    document.getElementById('wyj').innerHTML = 0;
                                    document.getElementById('ysje').innerHTML = 0;
                                    document.getElementById('ltje').innerHTML = 0;
                                    document.getElementById('ycje').innerHTML = 0;
                                    document.getElementById('hjje').innerHTML = 0;
                                },
                                function callback(_Data) {
                                    if (_Data.length > 1) {
                                        var vssje = parseFloat(_Data.split(',')[0]);
                                        var vwyj = parseFloat(_Data.split(',')[1]);
                                        var vysje = parseFloat(_Data.split(',')[2]);
                                        var vltje = parseFloat(_Data.split(',')[4]);
                                        var vycje = parseFloat(_Data.split(',')[3]);
                                        var vhjje = parseFloat(_Data.split(',')[5]);
                                        document.getElementById('ssje').innerHTML = vssje;
                                        document.getElementById('wyj').innerHTML = vwyj;
                                        document.getElementById('ysje').innerHTML = vysje;
                                        document.getElementById('ltje').innerHTML = vltje;
                                        document.getElementById('ycje').innerHTML = vycje;
                                        document.getElementById('hjje').innerHTML = vhjje;
                                    }
                                },
                                function completeCallback() {

                                },
                                function errorCallback() {
                                    document.getElementById('ssje').innerHTML = 0;
                                    document.getElementById('wyj').innerHTML = 0;
                                    document.getElementById('ysje').innerHTML = 0;
                                    document.getElementById('ltje').innerHTML = 0;
                                    document.getElementById('ycje').innerHTML = 0;
                                    document.getElementById('hjje').innerHTML = 0;
                                });
                        }
                    }
                });
                $('#SearchDlg').dialog('close');
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
                HDialog.Open('700', '500', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {
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

                var w = $(window).width();
                var h = $(window).height();

                var conent = "../DialogNew/CustDlg.aspx";
                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $.tool.DataPostNoLoading('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
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

            function ExcuteOnServer() {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }

            var columnWriteOff = [
                [
                    { title: '客户信息', field: 'a1', colspan: 1, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
                    { title: '房屋信息', field: 'a2', colspan: 16, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
                    { title: '车位信息', field: 'a3', colspan: 11, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
                    { field: '费用名称', rowspan: 2, title: '费用名称', align: 'center', sortable: true, fixed: true, width: 200 },
                    { title: '收费标准', field: 'a4', colspan: 4, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
                    { field: '数量1', rowspan: 2, title: '数量1', align: 'center', sortable: true, fixed: true, width: 100 },
                    { field: '数量2', rowspan: 2, title: '数量2', align: 'center', sortable: true, fixed: true, width: 100 },
                    { title: '抄表信息', field: 'a5', colspan: 3, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },

                    { field: '费用日期', rowspan: 2, title: '费用日期', align: 'center', sortable: true, fixed: true, width: 150 },

                    {
                        field: 'FeesDueDate', rowspan: 2, title: '应收日期', align: 'center', sortable: true, width: 150, fixed: true, formatter: function (value, row, index) {
                            var str = formatDate(row.FeesDueDate, "yyyy-MM-dd");
                            return str;
                        }
                    },

                    {
                        field: '开始日期', rowspan: 2, title: '开始日期', align: 'center', sortable: true, width: 150, fixed: true, formatter: function (value, row, index) {
                            var str = formatDate(row.开始日期, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    {
                        field: '结束日期', rowspan: 2, title: '结束日期', align: 'center', sortable: true, fixed: true, width: 150, formatter: function (value, row, index) {
                            var str = formatDate(row.结束日期, "yyyy-MM-dd");
                            return str;
                        }
                    },

                    { field: '税率', title: '税率', rowspan: 2, align: 'center', sortable: true, fixed: true, width: 100 },
                    { field: 'ChargeDate', rowspan: 2, title: '收款时间', align: 'left', sortable: true, width: 150, fixed: true },
                    { field: '收据类别', rowspan: 2, title: '票据类别', align: 'left', sortable: true, width: 100, fixed: true },
                    { field: 'BillsSign', rowspan: 2, title: '票据号码', align: 'left', sortable: true, width: 150, fixed: true },
                    { title: '收款金额', colspan: 3, align: 'left', sortable: true, width: 100, fixed: true },

                    { title: '合同违约金', colspan: 3, align: 'left', sortable: true, width: 100, fixed: true },

                    { field: '收款人', rowspan: 2, title: '收款人', align: 'left', sortable: true, width: 100, fixed: true },
                    { field: 'ChargeMode', rowspan: 2, title: '收款方式', align: 'left', sortable: true, width: 100, fixed: true },
                    { field: '备注', rowspan: 2, title: '备注', align: 'left', sortable: true, width: 100, fixed: true, nowarp: false },
                    // { field: 'ssys', rowspan: 2, title: '实收/预收', align: 'left', sortable: true, width: 100, fixed: true, nowarp: false },
                    { field: 'BankName', rowspan: 2, title: '代收银行', width: 100, sortable: true, align: 'left', fixed: true }
                ], [
                    { field: '客户类别', title: '客户类别', width: 100, align: 'center', sortable: true, hidden: true },

                    { field: '管家', title: '管家', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '组团区域', title: '组团区域', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '楼宇名称', title: '楼宇名称', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '建筑面积', title: '建筑面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '套内面积', title: '套内面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '公摊面积', title: '公摊面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '花园面积', title: '花园面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '地下室面积', title: '地下室面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '计算面积', title: '计算面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '房屋产权性质', title: '房屋产权性质', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '楼宇类型', title: '楼宇类型', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'RoomPropertyUses', title: '使用性质', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '使用状态', title: '使用状态', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '交房状态', title: '交房状态', width: 100, align: 'center', sortable: true, hidden: true },
                    {
                        field: '房屋实际交房时间', title: '实际交房时间', width: 150, align: 'center', sortable: true, hidden: true, formatter: function (value, row, index) {
                            var str = formatDate(row.房屋实际交房时间, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    { field: '房屋考核条件', title: '考核条件', width: 100, align: 'center', sortable: true, hidden: true },

                    { field: '车位区域', title: '车位区域', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位路址', title: '车位路址', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位编号', title: '车位编号', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位面积', title: '车位面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位面积', title: '车位计算面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位类别', title: '车位类别', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位类型', title: '车位类型', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位产权性质', title: '产权性质', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位使用状态', title: '使用状态', width: 100, align: 'center', sortable: true, hidden: true },
                    {
                        field: '车位实际交付时间', title: '实际交付时间', width: 100, align: 'center', sortable: true, hidden: true, formatter: function (value, row, index) {
                            var str = formatDate(row.车位实际交付时间, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    { field: '车位考核条件', title: '考核条件', width: 100, align: 'center', sortable: true, hidden: true },

                    { field: '计费方式', title: '计费方式', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '计算方式', title: '计算方式', width: 150, align: 'center', sortable: true, hidden: true },
                    { field: '收费标准', title: '收费标准', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '计算周期', title: '计算周期', width: 100, align: 'center', sortable: true, hidden: true },

                    { field: '起度', title: '起度', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '止度', title: '止度', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '使用量', title: '用量', width: 100, align: 'center', sortable: true, hidden: true },

                    //收款金额
                    { field: '收款金额', title: '含税金额', align: 'left', sortable: true, width: 100 },
                    { field: '收款金额税费', title: '税费', align: 'left', sortable: true, width: 100 },
                    { field: '收款金额不含税金额', title: '不含税金额', align: 'left', sortable: true, width: 100 },

                    //合同违约金
                    { field: '合同违约金', title: '含税金额', align: 'left', sortable: true, width: 100 },
                    { field: '合同违约金税费', title: '税费', align: 'left', sortable: true, width: 100 },
                    { field: '合同违约金不含税金额', title: '不含税金额', align: 'left', sortable: true, width: 100 }
                ]
            ];

            var frozenColumnsWriteOff = [[
                { field: '客户名称', title: '客户名称', align: 'left', sortable: true, width: 100, fixed: true },
                { field: '房屋编号', title: '房屋编号', align: 'left', sortable: true, width: 100, fixed: true },
                { field: '房屋名称', title: '房屋名称', align: 'left', sortable: true, width: 150, fixed: true }
            ]];

            var cmenuListWriteOff = ['客户信息', '房屋信息', '车位信息', '收费标准', '抄表信息'];

            var cmenuColumnListWriteOff = [['a1', '客户类别']
                , ['a2', '管家', '组团区域',
                '楼宇名称', '建筑面积',
                '套内面积', '公摊面积',
                '花园面积', '地下室面积',
                '计算面积', 'RoomPropertyRights',
                '楼宇类型', 'RoomPropertyUses',
                '使用状态', '交房状态',
                '房屋实际交房时间', '房屋考核条件']
                , ['a3', '车位区域', '车位路址', '车位编号', '车位面积', '车位面积', '车位类别', '车位类型', '车位产权性质', '车位使用状态', '车位实际交付时间', '车位考核条件']
                , ['a4', '计费方式', '计算方式', '收费标准', '计算周期']
                , ['a5', '起度', '止度', '使用量']]

            var cmenuWriteOff;
            function createColumnMenuWriteOff() {
                cmenuWriteOff = $('<div/>').appendTo('body');
                cmenuWriteOff.menu({
                    onClick: function (item) {
                        var j = 0
                        for (var i = 0; i < cmenuListWriteOff.length; i++) {
                            if (item.name == cmenuListWriteOff[i]) {
                                j = i;
                                break;
                            }
                        }
                        var cmdWriteOff = 'hideColumn';
                        if (item.iconCls == 'icon-ok') {
                            cmdWriteOff = 'hideColumn';
                            cmenuWriteOff.menu('setIcon', {
                                target: item.target,
                                iconCls: 'icon-empty'
                            });
                        } else {
                            cmdWriteOff = 'showColumn';
                            cmenuWriteOff.menu('setIcon', {
                                target: item.target,
                                iconCls: 'icon-ok'
                            });
                        }
                        for (var k = 0; k < cmenuColumnListWriteOff[j].length; k++) {
                            $('#TableContainer6').datagrid(cmdWriteOff, cmenuColumnListWriteOff[j][k]);
                        }
                    }
                });

                for (var i = 0; i < cmenuListWriteOff.length; i++) {
                    var field = cmenuListWriteOff[i];
                    cmenuWriteOff.menu('appendItem', {
                        text: field,
                        name: field,
                        iconCls: 'icon-empty'
                    });
                }
            }

            var column = [
                [
                    { title: '客户信息', field: 'a1', colspan: 1, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
                    { title: '房屋信息', field: 'a2', colspan: 16, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
                    { title: '车位信息', field: 'a3', colspan: 11, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
                    { field: '费用名称', rowspan: 2, title: '费用名称', align: 'center', sortable: true, fixed: true, width: 200 },
                    { title: '收费标准', field: 'a4', colspan: 4, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },
                    { field: '数量1', rowspan: 2, title: '数量1', align: 'center', sortable: true, fixed: true, width: 100 },
                    { field: '数量2', rowspan: 2, title: '数量2', align: 'center', sortable: true, fixed: true, width: 100 },
                    { title: '抄表信息', field: 'a5', colspan: 3, align: 'center', sortable: true, fixed: true, width: 100, hidden: true },

                    { field: '费用日期', rowspan: 2, title: '费用日期', align: 'center', sortable: true, fixed: true, width: 150 },

                    {
                        field: 'FeesDueDate', rowspan: 2, title: '应收日期', align: 'center', sortable: true, width: 150, fixed: true, formatter: function (value, row, index) {
                            var str = formatDate(row.FeesDueDate, "yyyy-MM-dd");
                            return str;
                        }
                    },

                    {
                        field: '开始日期', rowspan: 2, title: '开始日期', align: 'center', sortable: true, width: 150, fixed: true, formatter: function (value, row, index) {
                            var str = formatDate(row.开始日期, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    {
                        field: '结束日期', rowspan: 2, title: '结束日期', align: 'center', sortable: true, fixed: true, width: 150, formatter: function (value, row, index) {
                            var str = formatDate(row.结束日期, "yyyy-MM-dd");
                            return str;
                        }
                    },

                    { field: '税率', title: '税率', rowspan: 2, align: 'center', sortable: true, fixed: true, width: 100 },
                    { field: 'ChargeDate', rowspan: 2, title: '收款时间', align: 'left', sortable: true, width: 150, fixed: true },
                    { field: '收据类别', rowspan: 2, title: '票据类别', align: 'left', sortable: true, width: 100, fixed: true },
                    { field: 'BillsSign', rowspan: 2, title: '票据号码', align: 'left', sortable: true, width: 150, fixed: true },
                    { title: '收款金额', colspan: 3, align: 'left', sortable: true, width: 100, fixed: true },
                    { title: '收入提取', colspan: 4, align: 'left', sortable: true, width: 100, fixed: true },
                    { title: '合同违约金', colspan: 3, align: 'left', sortable: true, width: 100, fixed: true },
                    { field: '收款人', rowspan: 2, title: '收款人', align: 'left', sortable: true, width: 100, fixed: true },
                    { field: 'ChargeMode', rowspan: 2, title: '收款方式', align: 'left', sortable: true, width: 100, fixed: true },
                    { field: '备注', rowspan: 2, title: '备注', align: 'left', sortable: true, width: 100, fixed: true, nowarp: false },
                    //{ field: 'ssys', rowspan: 2, title: '实收/预收', align: 'left', sortable: true, width: 100, fixed: true, nowarp: false },
                    { field: 'BankName', rowspan: 2, title: '代收银行', width: 100, sortable: true, align: 'left', fixed: true },
                    { field: 'IsWriteOffName', rowspan: 2, title: '是否冲销', width: 100, sortable: true, align: 'left', fixed: true }
                ], [
                    { field: '客户类别', title: '客户类别', width: 100, align: 'center', sortable: true, hidden: true },

                    { field: '管家', title: '管家', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '组团区域', title: '组团区域', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '楼宇名称', title: '楼宇名称', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '建筑面积', title: '建筑面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '套内面积', title: '套内面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '公摊面积', title: '公摊面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '花园面积', title: '花园面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '地下室面积', title: '地下室面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '计算面积', title: '计算面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'RoomPropertyRights', title: '产权性质', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '楼宇类型', title: '楼宇类型', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: 'RoomPropertyUses', title: '使用性质', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '使用状态', title: '使用状态', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '交房状态', title: '交房状态', width: 100, align: 'center', sortable: true, hidden: true },
                    {
                        field: '房屋实际交房时间', title: '实际交房时间', width: 150, align: 'center', sortable: true, hidden: true, formatter: function (value, row, index) {
                            var str = formatDate(row.房屋实际交房时间, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    { field: '房屋考核条件', title: '考核条件', width: 100, align: 'center', sortable: true, hidden: true },

                    { field: '车位区域', title: '车位区域', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位路址', title: '车位路址', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位编号', title: '车位编号', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位面积', title: '车位面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位面积', title: '车位计算面积', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位类别', title: '车位类别', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位类型', title: '车位类型', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位产权性质', title: '产权性质', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '车位使用状态', title: '使用状态', width: 100, align: 'center', sortable: true, hidden: true },
                    {
                        field: '车位实际交付时间', title: '实际交付时间', width: 100, align: 'center', sortable: true, hidden: true, formatter: function (value, row, index) {
                            var str = formatDate(row.车位实际交付时间, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    { field: '车位考核条件', title: '考核条件', width: 100, align: 'center', sortable: true, hidden: true },

                    { field: '计费方式', title: '计费方式', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '计算方式', title: '计算方式', width: 150, align: 'center', sortable: true, hidden: true },
                    { field: '收费标准', title: '收费标准', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '计算周期', title: '计算周期', width: 100, align: 'center', sortable: true, hidden: true },

                    { field: '起度', title: '起度', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '止度', title: '止度', width: 100, align: 'center', sortable: true, hidden: true },
                    { field: '使用量', title: '用量', width: 100, align: 'center', sortable: true, hidden: true },

                    //收款金额
                    { field: '收款金额', title: '含税金额', align: 'left', sortable: true, width: 100 },
                    { field: '收款金额税费', title: '税费', align: 'left', sortable: true, width: 100 },
                    { field: '收款金额不含税金额', title: '不含税金额', align: 'left', sortable: true, width: 100 },

                    //收入提取
                    { field: '佣金项目', title: '佣金项目', align: 'left', sortable: true, width: 100 },
                    { field: '收入提取含税金额', title: '含税金额', align: 'left', sortable: true, width: 100 },
                    { field: '收入提取税费', title: '税费', align: 'left', sortable: true, width: 100 },
                    { field: '收入不含税金额', title: '不含税金额', align: 'left', sortable: true, width: 100 },

                    //合同违约金
                    { field: '合同违约金', title: '含税金额', align: 'left', sortable: true, width: 100 },
                    { field: '合同违约金税费', title: '税费', align: 'left', sortable: true, width: 100 },
                    { field: '合同违约金不含税金额', title: '不含税金额', align: 'left', sortable: true, width: 100 }
                ]
            ];

            var frozenColumns = [[
                { field: '客户名称', title: '客户名称', align: 'left', sortable: true, width: 100, fixed: true },
                { field: '房屋编号', title: '房屋编号', align: 'left', sortable: true, width: 100, fixed: true },
                { field: '产权性质', title: '产权性质', align: 'left', sortable: true, width: 100, fixed: true },
                { field: '房屋名称', title: '房屋名称', align: 'left', sortable: true, width: 150, fixed: true }
            ]];

            var cmenuList = ['客户信息', '房屋信息', '车位信息', '收费标准', '抄表信息'];

            var cmenuColumnList = [['a1', '客户类别']
                , ['a2', '管家', '组团区域',
                '楼宇名称', '建筑面积',
                '套内面积', '公摊面积',
                '花园面积', '地下室面积',
                '计算面积', 'RoomPropertyRights',
                '楼宇类型', 'RoomPropertyUses',
                '使用状态', '交房状态',
                '房屋实际交房时间', '房屋考核条件']
                , ['a3', '车位区域', '车位路址', '车位编号', '车位面积', '车位面积', '车位类别', '车位类型', '车位产权性质', '车位使用状态', '车位实际交付时间', '车位考核条件']
                , ['a4', '计费方式', '计算方式', '收费标准', '计算周期']
                , ['a5', '起度', '止度', '使用量']]

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
                            $('#TableContainer1').datagrid(cmd, cmenuColumnList[j][k]);
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

            var column2 = [[
                { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 150, fixed: true },
                { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 150, fixed: true },
                { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, width: 150, fixed: true },
                { field: 'BillsSign', title: '收据号码', align: 'left', sortable: true, width: 150, fixed: true },
                { field: 'BillsDate', title: '收费日期', align: 'left', sortable: true, width: 150, fixed: true },
                { field: 'ChargeMode', title: '收款方式', align: 'left', sortable: true, width: 150, fixed: true },
                { field: 'PerSurplus', title: '结转金额', align: 'left', sortable: true, width: 150, fixed: true },
                { field: 'UserName', title: '收款人', align: 'left', sortable: true, width: 150, fixed: true }
            ]];

            var column3 = [[
                { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 100 },
                { field: 'ParkNames', title: '车位', align: 'left', sortable: true, width: 100 },
                { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 100 },
                { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, width: 100 },
                {
                    field: 'ActualSubDate', title: '实际交房时间', align: 'left', sortable: true, width: 100, fixed: true, formatter: function (value, row, index) {
                        var str = formatDate(row.ActualSubDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'BuildArea', title: '建筑面积', align: 'left', sortable: true, width: 100 },
                { field: 'PrecDate', title: '预交收款时间', align: 'left', sortable: true, width: 170 },
                { field: 'BillsSign', title: '收据号码', align: 'left', sortable: true, width: 100 },
                { field: 'CostNames', title: '冲抵费用项目', align: 'left', sortable: true, width: 100 },
                { field: 'PrecAmount', title: '预交金额', align: 'left', sortable: true, width: 100 },
                { field: 'UserName', title: '预交操作人', align: 'left', sortable: true, width: 100 },
                { field: 'AccountWayName', title: '处理方式', align: 'left', sortable: true, width: 100 },
                { field: 'ChargeMode', title: '收款方式', align: 'left', sortable: true, width: 100 },
                { field: 'PrecMemo', title: '备注', align: 'left', sortable: true, width: 100 }
            ]];

            function btnClear_OnClick() {

                document.getElementById('CustID').value = "";
                //document.getElementById('CustName').value = "";
                document.getElementById('hiCustName').value = "";
                $('#CustName').searchbox('setValue', "");
                //document.getElementById('RoomID').value = "";
                //document.getElementById('RoomSign').value = "";
                //document.getElementById('hiRoomSign').value = "";
                $('#RoomSign').searchbox('setValue', "");
                document.getElementById('CostIDs').value = "";
                document.getElementById('CostNames').value = "";
                $('#CostNames').searchbox('setValue', "");
                document.getElementById('hiCostNames').value = "";

                document.getElementById('StanIDs').value = "";
                $('#StanNames').searchbox('setValue', '');
                document.getElementById('hiStanNames').value = "";

                document.getElementById('RoomIDs').value = "";
                //document.getElementById('RoomSigns').value = "";
                $('#RoomSigns').searchbox('setValue', '');
                document.getElementById('hiRoomSigns').value = "";

                document.getElementById('CustTypeID').value = "";
                document.getElementById('ChargeTypeID').value = "";

                document.getElementById('ParkIDs').value = "";
                $('#ParkNames').searchbox('setValue', "");
                document.getElementById('hiParkNames').value = "";

                document.getElementById('CarparkIDs').value = "";
                $('#CarparkNames').searchbox('setValue', "");
                document.getElementById('hiCarparkNames').value = "";

                document.getElementById('RoomState').value = "";
                document.getElementById('BuildType').value = "";

                document.getElementById('RegionSNums').value = "";
                $('#RegionNames').searchbox('setValue', "");
                document.getElementById('hiRegionNames').value = "";

                $('#BuildNames').searchbox('setValue', "");
                $('#SelRoomID').searchbox('setValue', "");

                document.getElementById('EditBeginDate').value = "";
                document.getElementById('EditEndDate').value = "";

                document.getElementById("PropertyUses").value = "";
                document.getElementById("hPropertyUses").value = "";
                $('#ChargeMode').searchbox('setValue', "");

                $("#StartBillsSign").val("");
                $("#EndBillsSign").val("");
                $('#BankName').searchbox('setValue', "");

                document.getElementById("PropertyRights").value = "";
                document.getElementById("hPropertyRights").value = "";

                document.getElementById("ParkingPropertyUses").value = "";
                document.getElementById("hParkingPropertyUses").value = "";

            }

            function LoadListPaid() {
                var isCheck = document.getElementById('CkIsCombRow').checked;
                if (isCheck) {
                    document.getElementById('IsCombRow').value = "1";
                }
                else {
                    document.getElementById('IsCombRow').value = "0";
                }

                $("#TableContainer1").datagrid({
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
                    width: '100%',
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
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
                        if (row.FeesID == 'footer') {


                            return 'background-color:#F4F4F4;border:none;'; // return inline style
                        }
                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("FeesPaidNewSearch", "LoadData", "TableContainer1", param);
                    },
                    onLoadSuccess: function (data) {
                        document.getElementById('ssje').innerHTML = 0;
                        document.getElementById('wyj').innerHTML = 0;
                        document.getElementById('ysje').innerHTML = 0;
                        document.getElementById('ltje').innerHTML = 0;
                        document.getElementById('ycje').innerHTML = 0;
                        document.getElementById('hjje').innerHTML = 0;

                        //加载页脚
                        $('#TableContainer1').datagrid('reloadFooter', [
                            {
                                客户名称: "<span style='color: red'>累计合计</span>",
                                收款金额: "<span style='color:red'>0</span>",
                                收款金额税费: "<span style='color:red'>0</span>",
                                收款金额不含税金额: "<span style='color:red'>0</span>"
                            }
                        ]);

                        if (document.getElementById('hiIsSQLData').value != "-1") {
                            $.tool.DataPostNoLoading('FeesPaidNewSearch', "LoadDataSum", $('#frmForm').serialize(),
                                function Init() {
                                    //加载页脚
                                    document.getElementById('ssje').innerHTML = 0;
                                    document.getElementById('wyj').innerHTML = 0;
                                    document.getElementById('ysje').innerHTML = 0;
                                    document.getElementById('ltje').innerHTML = 0;
                                    document.getElementById('ycje').innerHTML = 0;
                                    document.getElementById('hjje').innerHTML = 0;

                                    //加载页脚
                                    $('#TableContainer1').datagrid('reloadFooter', [
                                        {
                                            客户名称: "<span style='color: red'>累计合计</span>",
                                            收款金额: "<span style='color:red'>0</span>",
                                            收款金额税费: "<span style='color:red'>0</span>",
                                            收款金额不含税金额: "<span style='color:red'>0</span>"
                                        }
                                    ]);
                                },
                                function callback(_Data) {
                                    if (_Data.length > 1) {
                                        var vssje = parseFloat(_Data.split(',')[0]);
                                        var vwyj = parseFloat(_Data.split(',')[1]);
                                        var vysje = parseFloat(_Data.split(',')[2]);
                                        var vltje = parseFloat(_Data.split(',')[4]);
                                        var vycje = parseFloat(_Data.split(',')[3]);
                                        var vhjje = parseFloat(_Data.split(',')[5]);


                                        var hsje = parseFloat(_Data.split(',')[6]);
                                        var sfje = parseFloat(_Data.split(',')[7]);
                                        var bhsje = parseFloat(_Data.split(',')[8]);

                                        document.getElementById('ssje').innerHTML = vssje;
                                        document.getElementById('wyj').innerHTML = vwyj;
                                        document.getElementById('ysje').innerHTML = vysje;
                                        document.getElementById('ltje').innerHTML = vltje;
                                        document.getElementById('ycje').innerHTML = vycje;
                                        document.getElementById('hjje').innerHTML = vhjje;

                                        //加载页脚
                                        $('#TableContainer1').datagrid('reloadFooter', [
                                            {
                                                客户名称: "<span style='color: red'>累计合计</span>",
                                                收款金额: "<span style='color:red'>" + hsje + "</span>",
                                                收款金额税费: "<span style='color:red'>" + sfje + "</span>",
                                                收款金额不含税金额: "<span style='color:red'>" + bhsje + "</span>"
                                            }
                                        ]);
                                    }
                                },
                                function completeCallback() {

                                },
                                function errorCallback() {
                                    document.getElementById('ssje').innerHTML = 0;
                                    document.getElementById('wyj').innerHTML = 0;
                                    document.getElementById('ysje').innerHTML = 0;
                                    document.getElementById('ltje').innerHTML = 0;
                                    document.getElementById('ycje').innerHTML = 0;
                                    document.getElementById('hjje').innerHTML = 0;
                                    $('#TableContainer1').datagrid('reloadFooter', [
                                        {
                                            客户名称: "<span style='color: red'>累计合计</span>",
                                            收款金额: "<span style='color:red'>0</span>",
                                            收款金额税费: "<span style='color:red'>0</span>",
                                            收款金额不含税金额: "<span style='color:red'>0</span>"
                                        }
                                    ]);
                                });
                        }
                    }
                });
                $('#SearchDlg').dialog('close');
            }

            function LoadListPrec() {
                $("#TableContainer2").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column3,
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
                    showFooter: true,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("NewFeesPaidSearch", "FeesPrec", "TableContainer2", param);
                    },
                    onLoadSuccess: function (data) {
                        document.getElementById('ssje').innerHTML = 0;
                        document.getElementById('wyj').innerHTML = 0;
                        document.getElementById('ysje').innerHTML = 0;
                        document.getElementById('ltje').innerHTML = 0;
                        document.getElementById('ycje').innerHTML = 0;
                        document.getElementById('hjje').innerHTML = 0;
                        if (document.getElementById('hiIsSQLData').value != "-1") {
                            $.tool.DataPostNoLoading('FeesPaidNewSearch', "LoadDataSum", $('#frmForm').serialize(),
                                function Init() {
                                    //加载页脚
                                    document.getElementById('ssje').innerHTML = 0;
                                    document.getElementById('wyj').innerHTML = 0;
                                    document.getElementById('ysje').innerHTML = 0;
                                    document.getElementById('ltje').innerHTML = 0;
                                    document.getElementById('ycje').innerHTML = 0;
                                    document.getElementById('hjje').innerHTML = 0;
                                },
                                function callback(_Data) {
                                    if (_Data.length > 1) {
                                        var vssje = parseFloat(_Data.split(',')[0]);
                                        var vwyj = parseFloat(_Data.split(',')[1]);
                                        var vysje = parseFloat(_Data.split(',')[2]);
                                        var vltje = parseFloat(_Data.split(',')[4]);
                                        var vycje = parseFloat(_Data.split(',')[3]);
                                        var vhjje = parseFloat(_Data.split(',')[5]);

                                        document.getElementById('ssje').innerHTML = vssje;
                                        document.getElementById('wyj').innerHTML = vwyj;
                                        document.getElementById('ysje').innerHTML = vysje;
                                        document.getElementById('ltje').innerHTML = vltje;
                                        document.getElementById('ycje').innerHTML = vycje;
                                        document.getElementById('hjje').innerHTML = vhjje;
                                    }
                                },
                                function completeCallback() {

                                },
                                function errorCallback() {
                                    document.getElementById('ssje').innerHTML = 0;
                                    document.getElementById('wyj').innerHTML = 0;
                                    document.getElementById('ysje').innerHTML = 0;
                                    document.getElementById('ltje').innerHTML = 0;
                                    document.getElementById('ycje').innerHTML = 0;
                                    document.getElementById('hjje').innerHTML = 0;
                                });
                        }
                    }
                });
                $('#SearchDlg').dialog('close');
            }

            function LoadListPaidLt() {
                $("#TableContainer3").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
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
                    showFooter: true,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("NewFeesPaidSearch", "FeesPaid3", "TableContainer3", param);
                    },
                    onLoadSuccess: function (data) {
                        document.getElementById('ssje').innerHTML = 0;
                        document.getElementById('wyj').innerHTML = 0;
                        document.getElementById('ysje').innerHTML = 0;
                        document.getElementById('ltje').innerHTML = 0;
                        document.getElementById('ycje').innerHTML = 0;
                        document.getElementById('hjje').innerHTML = 0;
                        if (document.getElementById('hiIsSQLData').value != "-1") {
                            $.tool.DataPostNoLoading('FeesPaidNewSearch', "LoadDataSum", $('#frmForm').serialize(),
                                function Init() {
                                    //加载页脚
                                    document.getElementById('ssje').innerHTML = 0;
                                    document.getElementById('wyj').innerHTML = 0;
                                    document.getElementById('ysje').innerHTML = 0;
                                    document.getElementById('ltje').innerHTML = 0;
                                    document.getElementById('ycje').innerHTML = 0;
                                    document.getElementById('hjje').innerHTML = 0;
                                },
                                function callback(_Data) {
                                    if (_Data.length > 1) {
                                        var vssje = parseFloat(_Data.split(',')[0]);
                                        var vwyj = parseFloat(_Data.split(',')[1]);
                                        var vysje = parseFloat(_Data.split(',')[2]);
                                        var vltje = parseFloat(_Data.split(',')[4]);
                                        var vycje = parseFloat(_Data.split(',')[3]);
                                        var vhjje = parseFloat(_Data.split(',')[5]);

                                        document.getElementById('ssje').innerHTML = vssje;
                                        document.getElementById('wyj').innerHTML = vwyj;
                                        document.getElementById('ysje').innerHTML = vysje;
                                        document.getElementById('ltje').innerHTML = vltje;
                                        document.getElementById('ycje').innerHTML = vycje;
                                        document.getElementById('hjje').innerHTML = vhjje;
                                    }
                                },
                                function completeCallback() {

                                },
                                function errorCallback() {
                                    document.getElementById('ssje').innerHTML = 0;
                                    document.getElementById('wyj').innerHTML = 0;
                                    document.getElementById('ysje').innerHTML = 0;
                                    document.getElementById('ltje').innerHTML = 0;
                                    document.getElementById('ycje').innerHTML = 0;
                                    document.getElementById('hjje').innerHTML = 0;
                                });
                        }
                    }
                });
                $('#SearchDlg').dialog('close');
            }

            document.getElementById('hiIsSQLData').value = -1;

            //初始化加载数据
            LoadListPaid();
            ////展示进度
            //ShowProgress();
            ////获取执行情况进度
            //ProgressInterval = setInterval("TakeProgress()", 5000);

            function LoadData() {
                $("#ChargeMode").val($("#ChargeModes").combobox('getValues'));
                document.getElementById('hiIsSQLData').value = 1;
                $("#hPropertyUses").val($("#PropertyUses").find("option:selected").text());
                $("#hPropertyRights").val($("#PropertyRights").find("option:selected").text());
                $("#hParkingPropertyUses").val($("#ParkingPropertyUses").find("option:selected").text());
                switch ($('#selTabID').val()) {
                    case "1":
                        SearchData();
                        break;
                    case "2":
                        LoadListPrec();
                        break;
                    case "3":
                        LoadListPaidLt();
                        break;
                    case "6":
                        SearchDataWriteOff();
                        break;
                }
            }

            function SearchDataWriteOff() {
                $('#hiIsSQLData').val('1');
                //启动任务
                StartTaskWriteOff();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgressWriteOff()", 5000);
            }

            function StartTaskWriteOff() {
                //启动一个任务
                $.tool.DataPostNoLoading('FeesPaidNewSearch', 'StartTaskWriteOff', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //获取进度
            function TakeProgressWriteOff() {
                $.tool.DataPostNoLoading('FeesPaidNewSearch', 'TakeProgressWriteOff', $('#frmForm').serialize(),
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
                                LoadListFeesWriteOff();
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

            function SearchData() {
                $('#hiIsSQLData').val('1');

                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 5000);
            }

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('FeesPaidNewSearch', 'StartTask', $('#frmForm').serialize(),
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
                $.tool.DataPostNoLoading('FeesPaidNewSearch', 'TakeProgress', $('#frmForm').serialize(),
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
                                LoadListPaid();
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

            function ToExcel3() {
                GetFlag();
                var strFlag = document.getElementById('Flag').value;
                window.location.href = "../Inquiries/FeesPrecSearchCre.aspx?Flag=" + strFlag;
            }

            function ToExcel() {
                GetFlag();
                var strFlag = document.getElementById('Flag').value;
                var isCheck = document.getElementById('CkIsCombRow').checked;
                var strIsCombShow = 0
                if (isCheck) {
                    strIsCombShow = 1;
                }
                else {
                    document.getElementById('IsCombRow').value = "0";
                    strIsCombShow = 0;
                }

                HDialog.Open(500, 150, "../InquiriesNew/SelectiveCompression.aspx", '选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var obj = JSON.parse(_Data);
                        if (obj == "0") {
                            window.location.href = "FeesPaidSearchCre.aspx?OType=0&Flag=" + strFlag + "&IsCombShow=" + strIsCombShow;
                        } else {
                            window.location.href = "FeesPaidSearchCre.aspx?OType=1&Flag=" + strFlag + "&IsCombShow=" + strIsCombShow;
                        }
                    }
                });

            }

            function SelUserName() {
                HDialog.Open('700', '400', "../dialogNew/MultiUserCodeDlgGroup.aspx", '收款人', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");


                        var UserCodes = "";
                        var UserNames = "";
                        $('#UserCodes').val(UserCodes);
                        $('#UserNames').searchbox('setValue', UserNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                UserCodes = UserCodes + "," + varObjects[i].split(',')[0];
                                UserNames = UserNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#UserCodes').val(UserCodes.substring(1, UserCodes.length));
                        $('#UserNames').searchbox('setValue', UserNames.substring(1, UserNames.length));

                    }
                });
            }

            function ToExcelWriteOff() {
                window.location.href = "FeesPaidSearchWriteOffCre.aspx";
            }

            function ToExcel2() {
                GetFlag();
                var strFlag = document.getElementById('Flag').value;
                //$.tool.DataGet('NewFeesPaidSearch', 'SurplusCre', $('#frmForm').serialize(),
                //    function Init() {
                //    },
                //    function callback(_Data) {
                //        var obj = JSON.parse(_Data);
                //        if (obj.rows.length > 0) {
                //            window.location.href = "FeesPaidSearchSurplusCre.aspx?Flag=" + strFlag;
                //        } else {
                //            HDialog.Info("没有需要导出的数据");
                //            return;
                //        }
                //    },
                //    function completeCallback() {
                //    },
                //    function errorCallback() {
                //    });

                var rows = $("#TableContainer3").datagrid('getRows');
                if (rows.length > 0) {
                    window.location.href = "FeesPaidSearchSurplusCre.aspx?Flag=" + strFlag;
                } else {
                    HDialog.Info("没有需要导出的数据");
                    return;
                }
            }

        </script>
    </form>
</body>
</html>

