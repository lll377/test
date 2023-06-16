<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParkingLendBrowse.aspx.cs" Inherits="M_Main.CarparkNew.ParkingLendBrowse" %>

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
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.min.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />
    <style>
        .tabs-container .panel-body {
            padding: 0px;
        }

        /*table tr {
            border: 1px double #F6F6F6;
        }*/
    </style>
</head>
<body>

    <form id="FrmForm" runat="server">
        <input id="hiParkID" type="hidden" size="1" name="hiParkID" runat="server" />
        <input id="hiCustID" type="hidden" size="1" name="hiCustID" runat="server" />
        <input id="HiTyep" type="hidden" size="1" name="HiTyep" runat="server" />
        <input id="hiRoomID" type="hidden" size="1" name="hiRoomID" runat="server" />
        <input id="hiOPType" type="hidden" size="1" name="hiOPType" runat="server" />
        <input id="hiHandID" type="hidden" size="1" name="hiHandID" runat="server" />
        <input id="hiStanID" type="hidden" size="1" name="hiStanID" runat="server" />
        <input id="FeesAmount" type="hidden" size="1" name="FeesAmount" runat="server" />
        <input id="hitype" type="hidden" size="1" name="hitype" runat="server" />
        <input id="hiInput" type="hidden" size="1" name="hiInput" runat="server" />
        <input id="PropertyUses" type="hidden" runat="server" />
        <input id="ParkCategory" type="hidden" size="1" name="ParkCategory" runat="server" />
        <input id="DUserState" type="hidden" size="1" name="DUserState" runat="server" />

        <div id="walkthrough-content" style="display: none;">
        </div>

        <div id="Divreport" name="Divreport" style="width: 100%;" class="easyui-layout" title="">
            <div class="tabs-container">
                <ul class="nav nav-tabs">
                    <li class="active" name="parkinfo" id="parkpage" refpage="" refsel="1">
                        <a data-toggle="tab" href="#tab-1" aria-expanded="false">车位信息</a>
                    </li>
                    <li class="" name="carinfo" id="carpage" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-5" aria-expanded="false">车辆信息</a>
                    </li>
                    <tr id="virTdfeesinfo">
                        <td>
                            <li class="" name="feesinfo" id="feespage" style="display: none;" refpage="" refsel="0">
                                <a data-toggle="tab" href="#tab-3" aria-expanded="false">租金费用输入</a>
                            </li>
                        </td>
                    </tr>
                    <li class="" name="otherfeesinfo" id="otherfeespage" style="display: none;" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-4" aria-expanded="false">其他费用输入</a>
                    </li>
                    <li class="" name="parkfeesinfo" id="parkfeespage" refpage="" refsel="0">
                        <a data-toggle="tab" href="#tab-2" aria-expanded="false">车位费用查询</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer1">
                                    <table class="DialogTable" id="Table1" style="background-color: #FFFFFF; height: 100%;">
                                        <tr>
                                            <td class="TdTitle" colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                                                <span style="font-size: 16px">车位登记信息</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle" id="vriCarparkName">车位区域</td>
                                            <td class="TdContentSearch">
                                                <input id="CarparkName" disabled name="CarparkName" runat="server" />
                                            </td>
                                            <td class="TdTitle">车位类型</td>
                                            <td class="TdContentSearch">
                                                <%--<input id="ParkType"  name="ParkType" runat="server" />--%>
                                                 <select id="ParkType" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="ParkType" runat="server">
                                                </select>

                                                <input id="hiCarparkID" type="hidden" size="1" name="CarparkID" runat="server" />
                                            </td>
                                            <td class="TdTitle">车位编号</td>
                                            <td class="TdContentSearch">
                                                <input id="ParkName" disabled name="ParkName" runat="server" /></td>
                                            <td class="TdTitle">车位面积</td>
                                            <td class="TdContentSearch">
                                                <input id="ParkArea" disabled name="ParkArea" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">泊车数量</td>
                                            <td class="TdContentSearch">
                                                <input id="ParkingNum" disabled name="ParkingNum" runat="server" />
                                            </td>
                                            <td class="TdTitle">产权性质</td>
                                            <td class="TdContentSearch">
                                                <asp:DropDownList ID="PropertyRight" Width="69%" Height="21" runat="server">
                                                    <asp:ListItem Value="业主产权">业主产权</asp:ListItem>
                                                    <asp:ListItem Value="共有产权">共有产权</asp:ListItem>
                                                    <asp:ListItem Value="人防产权（房产）">人防产权（房产）</asp:ListItem>
                                                    <asp:ListItem Value="人防产权（业主共有）">人防产权（业主共有）</asp:ListItem>
                                                    <asp:ListItem Value="产权不明">产权不明</asp:ListItem>
                                                    <asp:ListItem Value="其它产权">其它产权</asp:ListItem>
                                                    <asp:ListItem Value="自有产权模式一(抵扣)">自有产权模式一(抵扣)</asp:ListItem>
                                                    <asp:ListItem Value="自有产权模式二(常规">自有产权模式二(常规)</asp:ListItem>
                                                </asp:DropDownList>
                                                <%-- <select id="PropertyRight" class="easyui-combobox" name="PropertyRight" runat="server">
                                                    <option value="自有产权" selected>自有产权</option>
                                                    <option value="业主产权">业主产权</option>
                                                </select>--%>
                                            </td>
                                            <td class="TdTitle">合同交付时间</td>
                                            <td class="TdContentSearch">
                                                <input class="Wdate" id="ContSubDate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" disabled maxlength="50" name="ContSubDate" runat="server" type="text" /></td>
                                            <td class="TdTitle">实际交付时间</td>
                                            <td class="TdContentSearch">
                                                <input class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="ActualSubDate" maxlength="50" name="ActualSubDate" disabled onkeypress="CheckDate();" runat="server" type="text" /></td>

                                        </tr>
                                        <tr>
                                            <td style="line-height: 16px;" class="TdTitle">是否签订物业服务协议</td>
                                            <td class="TdContentSearch">
                                                <select id="IsPropertyService" name="IsPropertyService" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                                                    <option value="0">否</option>
                                                    <option value="1">是</option>
                                                </select>
                                            </td>

                                            <td class="TdTitle">业主名称</td>
                                            <td class="TdContentSearch">
                                                <input class="easyui-searchbox" data-options="required:true" id="CustName2" name="CustName2" searcher="SelCust2" runat="server" />
                                                <input type="hidden" name="CustID2" id="CustID2" runat="server" />
                                            </td>
                                            <td class="TdTitle">可选房号</td>
                                            <td class="TdContentSearch">
                                                <select id="SelectRoomID2" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID2" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                                                    <option selected></option>
                                                </select>
                                            </td>
                                            <td class="TdTitle">房屋编号</td>
                                            <td class="TdContentSearch">
                                                <input class="easyui-searchbox" id="RoomSign2" name="RoomSign" searcher="SelRoom2" runat="server" />
                                                <input type="hidden" name="RoomID2" id="RoomID2" runat="server" />
                                            </td>

                                        </tr>
                                        <tr>
                                            <%-- <td class="TdTitle"></td>
                                            <td class="TdContent">
                                                <input type="button" class="button" value="标准选择" id="BtnSelCost" />
                                            </td>--%>
                                            <td class="TdTitle">费用名称</td>
                                            <td class="TdContentSearch">
                                                <input class="easyui-searchbox" searcher="SelCost" data-options="editable:false,required:true" id="CostName" name="CostName" runat="server" />
                                                <input type="hidden" name="CostID" id="CostID" runat="server" /></td>
                                            <td class="TdTitle">收费标准</td>
                                            <td class="TdContentSearch">
                                                <input class="easyui-validatebox" data-options="required:true" id="StanName" disabled name="StanName" runat="server" />
                                                <input type="hidden" name="StanID" id="StanID" runat="server" />
                                            </td>
                                            <td class="TdTitle">备 注</td>
                                            <td class="TdContentSearch" colspan="3">
                                                <input id="ParkMemo" name="ParkMemo" style="width: 88%;" runat="server" />
                                            </td>
                                        </tr>
                                        <tr style="display: none;">
                                            <td class="TdTitle">说明</td>
                                            <td class="TdContentSearch" colspan="7"><span style="color: red">1、自有产权模式一(抵扣)：权属房产产权车位出租收入抵空置车位物业费。2、  自有产权模式二(常规)：权属房产产权车位出租收入归房产，物业公司收取空置车位物业费。</span></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle" colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                                                <span style="font-size: 16px">车位办理信息</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">客户名称</td>
                                            <td class="TdContentSearch">
                                                <input class="easyui-searchbox" data-options="required:true" id="CustName" name="CustName" searcher="SelCust" runat="server" />
                                                <input type="hidden" name="CustID" id="CustID" runat="server" />
                                            </td>
                                            <td class="TdTitle">可选房号</td>
                                            <td class="TdContentSearch">
                                                <select id="SelectRoomID" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                                                    <option selected></option>
                                                </select>
                                            </td>
                                            <td class="TdTitle">房屋编号</td>
                                            <td class="TdContentSearch">
                                                <input class="easyui-searchbox" id="RoomSign" name="RoomSign" searcher="SelRoom" runat="server" />
                                                <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                                            </td>
                                            <td class="TdTitle">联系电话</td>
                                            <td class="TdContentSearch">
                                                <input id="Phone" name="Phone" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">协议开始时间</td>
                                            <td class="DialogTdDateContent">
                                                <input id="ProtocolStartDate" class="easyui-datebox" name="ProtocolStartDate" runat="server" />
                                            </td>
                                            <td class="TdTitle">协议结束时间</td>
                                            <td class="DialogTdDateContent">
                                                <input id="ProtocolEndDate" class="easyui-datebox" name="ProtocolEndDate" runat="server" />
                                            </td>
                                            <td class="TdTitle">计费周期</td>
                                            <td class="TdContentSearch">
                                                <select id="ChargeCycle" name="ChargeCycle" data-options="required:true" runat="server">
                                                    <option></option>
                                                </select>
                                            </td>
                                            <td class="TdTitle">计费方式</td>
                                            <td class="TdContent">
                                                <select id="PayType" name="PayType" runat="server">
                                                    <option selected></option>
                                                </select>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td class="TdTitle">计费开始时间</td>
                                            <td class="DialogTdDateContent">
                                                <input id="ParkStartDate" data-options="required:true" class="easyui-datebox" name="ParkStartDate" runat="server" />
                                            </td>
                                            <td class="TdTitle">计费结束时间</td>
                                            <td class="DialogTdDateContent">
                                                <input id="ParkEndDate" data-options="required:true" class="easyui-datebox" name="ApplyDate" runat="server" />
                                            </td>
                                            <td class="TdTitle">已交费时间至</td>
                                            <td class="TdContentSearch">
                                                <input id="lbParkEndDate" disabled name="lbParkEndDate" runat="server" />
                                            </td>
                                            <td class="TdTitle">停车卡号</td>
                                            <td class="TdContentSearch">
                                                <input id="ParkingCarSign" name="ParkingCarSign" runat="server" />
                                                <input id="btnReadCard" class="button" style="width: 60px; height: 25px;" value="读卡" type="button" name="btnReadCard" runat="server" />
                                            </td>

                                        </tr>
                                        <tr style="display: none">
                                            <td class="TdTitle">车牌号码</td>
                                            <td class="TdContentSearch">
                                                <input id="CarSign" name="CarSign" class="easyui-validatebox" data-options="required:true" runat="server" />
                                            </td>
                                            <td class="TdTitle">车辆类型</td>
                                            <td class="TdContentSearch">
                                                <input id="CarType" name="CarType" runat="server" />
                                            </td>
                                            <td class="TdTitle">车辆品牌</td>
                                            <td class="TdContentSearch">
                                                <input id="FacBrands" name="FacBrands" runat="server" />
                                            </td>
                                            <td class="TdTitle">颜&nbsp;&nbsp;&nbsp;色</td>
                                            <td class="TdContentSearch">
                                                <input id="CarColor" name="CarColor" runat="server" />
                                            </td>

                                        </tr>
                                        <tr style="display: none">
                                            <td class="TdTitle">排&nbsp;&nbsp;&nbsp;&nbsp;量</td>
                                            <td class="TdContentSearch">
                                                <input id="CarEmission" value="5.0" name="CarEmission" runat="server" />
                                            </td>
                                            <td class="TdTitle">车主姓名</td>
                                            <td class="TdContentSearch">
                                                <input id="CarHostName" name="CarHostName" runat="server" />
                                            </td>
                                            <td class="TdTitle">是否挂牌</td>
                                            <td class="TdContentSearch">
                                                <%--<select id="IsListing" name="IsListing" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                                                    <option value="0">否</option>
                                                    <option value="1">是</option>
                                                </select>--%>
                                                <asp:RadioButton Style="z-index: 0" ID="ListingYes" runat="server" Text="是" GroupName="Listing" Checked="True"></asp:RadioButton>
                                                <asp:RadioButton Style="z-index: 0" ID="ListingNo" runat="server" Text="否" GroupName="Listing"></asp:RadioButton>
                                            </td>
                                            <td class="TdTitle">挂牌时间</td>
                                            <td class="DialogTdDateContent">
                                                <input id="ListingData" name="ListingData" class="easyui-datebox" runat="server" />
                                            </td>

                                        </tr>
                                        <tr>
                                            <td class="TdTitle">受 理 人</td>
                                            <td class="TdContentSearch">
                                                <input id="handling" name="handling" runat="server" />
                                            </td>
                                            <td class="TdTitle">受理时间</td>
                                            <td class="DialogTdDateContent">
                                                <input id="HandDate" name="HandDate" class="easyui-datebox" runat="server" />
                                            </td>
                                            <td class="TdTitle">是否使用</td>
                                            <td class="TdContentSearch">
                                                <asp:DropDownList ID="DrUse" runat="server">
                                                    <asp:ListItem Value="0">否</asp:ListItem>
                                                    <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="TdTitle">收取其它费用</td>
                                            <td class="TdContentSearch" colspan="5">
                                                <%--                                                <select id="IsInput" name="IsInput" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                                                    <option value="0">否</option>
                                                    <option value="1">是</option>
                                                </select>--%>
                                                <asp:RadioButton ID="RbYes" runat="server" GroupName="Rb" Checked="True" Text="是"></asp:RadioButton>
                                                <asp:RadioButton ID="RbNo" runat="server" GroupName="Rb" Text="否" Style="z-index: 0"></asp:RadioButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="color: #ff0000">*备注：车位办理后，请登记车辆信息。
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="DialogTdSubmit" style="text-align: center; padding-top: 10px; padding-bottom: 14%;" colspan="8">
                                                <input class="button" id="btnSave" onclick="javascript: if (CheckData() == false) return false;"
                                                    type="button" value="保存" name="btnFilter" runat="server" />&nbsp;&nbsp;
					                            <input class="button" id="btnReturn" type="button" value="返回" name="btnFilter" runat="server" />&nbsp;&nbsp;
					                            <%--<input class="button" style="width: 100px;" id="BtnFees" value="车位费用查询" type="button" name="btnAddFee" runat="server" />&nbsp;&nbsp;
                                                <input id="btnAddFee" style="width: 100px;" class="button" value="租金费用输入" type="button" name="btnAddFee" runat="server" />&nbsp;&nbsp;
                                                <input id="btnAddFee2" style="width: 100px;" class="button" value="其他费用输入" type="button" name="btnAddFee" runat="server" />--%>
                                           
                                            </td>
                                        </tr>

                                    </table>
                                    <asp:Panel ID="panel1" Visible="false" runat="server">
                                        <table>
                                            <tr>
                                                <td style="border: 1px solid #cccccc; width: 100%; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                                                    <span style="font-size: 16px">收费情况</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100%; height: 350px;">
                                                    <div style="width: 100%; height: 300px; background-color: #cccccc;" id="TableContainer">
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <iframe id="ParkingFeesSeach" src="" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                    <div id="tab-3" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <%--<iframe id="FeesSporadicManage" src="../ChargesNew/FeesSporadicManage.aspx" style="width: 100%; border: none;" class="Frm"></iframe>--%>
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer3">3</div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-4" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <%--<iframe id="FeesSporadicManage2" src="../ChargesNew/FeesSporadicManage.aspx" style="width: 100%; border: none;" class="Frm"></iframe>--%>
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer4">4</div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-5" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <iframe id="ParkingCarPage" src="" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

<script type="text/javascript">

    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }

    function IVRShowFeespage() {
        $('#tab-1').attr("class", "tab-pane");
        $('#tab-2').attr("class", "tab-pane");
        $('#tab-3').attr("class", "tab-pane");
        $('#tab-4').attr("class", "tab-pane");
        $('#tab-5').attr("class", "tab-pane");

        $('#parkinfo').attr("refsel", "0");
        $('#parkfeesinfo').attr("refsel", "0");
        $('#feesinfo').attr("refsel", "0");
        $('#otherfeesinfo').attr("refsel", "0");
        $('#carinfo').attr("refsel", "0");

        $('#parkinfo').attr("class", "");
        $('#parkfeesinfo').attr("class", "");
        $('#feesinfo').attr("class", "");
        $('#otherfeesinfo').attr("class", "");
        $('#carinfo').attr("class", "");

        $('#tab-3').attr("class", "tab-pane active");

        $("#parkpage").attr("class", "");

        $('#feespage').attr("refsel", "1");
        $('#feespage').attr("class", "active");

        LoadListFeesInfo();

    }

    function GetStepOneChild() {
        $('body').pagewalkthrough('close');
    }

    var w = $(window).width();
    var h = $(window).height();
    $(function () {

        InitPage();
        InitTableHeight();
        //LoadList();
        $('#tab-1').attr("class", "tab-pane active");
        if (GetQueryString("ivrShowType") == "1") {
            $("#feespage").attr("style", "");
            $('body').pagewalkthrough({
                name: 'introduction3',
                steps: [
                    {
                        wrapper: '#feespage',
                        popup: {
                            content: '点击“租金费用输入标签”',
                            type: 'tooltip',
                            position: 'bottom'
                        },
                        onLeave: function () {
                            IVRShowFeespage();
                        }
                    },
                    {
                        wrapper: '#virfeesinfoadd',
                        popup: {
                            content: '点击“租金费用输入”按钮',
                            type: 'tooltip',
                            position: 'right'
                        },
                        onLeave: function () {
                            FeesInfoInput(1);
                        }
                    }
                ],
                buttons: {
                    jpwNext: {
                        i18n: "下一步 &rarr;"
                    },
                    jpwFinish: {
                        i18n: "下一步 &rarr;"
                    },
                    jpwPrevious: {
                        i18n: "&larr; 上一步"
                    },
                    jpwClose: {
                        i18n: "关闭",
                    }
                }
            })

            $('body').pagewalkthrough('show');
        }


    })


    function InitTableHeight() {

        var h = $(window).height() - 40;

        $(".Frm").css({ "height": h + "px" });

        $("#TableContainer1").css("height", h + "px");
        //$("#TableContainer2").css("height", h + "px");
        $("#TableContainer3").css("height", h + "px");
        $("#TableContainer4").css("height", h + "px");
        $("#Table1").css("height", h + "px");
        //  $('#ChargeCycle').val('');
        //$("#TableContainer").css("height", "300px");
    }

    $(".tabs-container li").click(function () {
        $('#tab-1').attr("class", "tab-pane");
        $('#tab-2').attr("class", "tab-pane");
        $('#tab-3').attr("class", "tab-pane");
        $('#tab-4').attr("class", "tab-pane");
        $('#tab-5').attr("class", "tab-pane");

        $('#parkinfo').attr("refsel", "0");
        $('#parkfeesinfo').attr("refsel", "0");
        $('#feesinfo').attr("refsel", "0");
        $('#otherfeesinfo').attr("refsel", "0");
        $('#carinfo').attr("refsel", "0");

        $('#parkinfo').attr("class", "");
        $('#parkfeesinfo').attr("class", "");
        $('#feesinfo').attr("class", "");
        $('#otherfeesinfo').attr("class", "");
        $('#carinfo').attr("class", "");


        switch ($(this).attr("name")) {
            case "parkinfo":
                $('#tab-1').attr("class", "tab-pane active");
                $('#parkinfo').attr("refsel", "1");
                $('#parkinfo').attr("class", "active");

                break;
            case "parkfeesinfo":
                var ParkID = $("#hiParkID").val();
                var ParkName = $('#ParkName').val();
                var HandID = $("#hiHandID").val();
                $("#ParkingFeesSeach").attr("src", "ParkingFeesSeach.aspx?ParkID=" + ParkID + "&HandID=" + HandID + "&ParkName=" + ParkName + "");

                $('#tab-2').attr("class", "tab-pane active");
                $('#parkfeesinfo').attr("refsel", "1");
                $('#parkfeesinfo').attr("class", "active");
                break;
            case "feesinfo":

                $('#tab-3').attr("class", "tab-pane active");
                $('#feesinfo').attr("refsel", "1");
                $('#feesinfo').attr("class", "active");

                LoadListFeesInfo();
                break;
            case "otherfeesinfo":

                $('#tab-4').attr("class", "tab-pane active");
                $('#otherfeesinfo').attr("refsel", "1");
                $('#otherfeesinfo').attr("class", "active");

                LoadListOtherFeesInfo();
                break;
            case "carinfo":
                var ParkID = $("#hiParkID").val();
                var CustID = $("#CustID").val();
                var RoomID = $("#RoomID").val();
                var CustName = $("#CustName").val();
                var RoomSign = $("#RoomSign").val();

                $("#ParkingCarPage").attr("src", "ParkingCarPage.aspx?ParkID=" + ParkID + "&CustID=" + CustID + "&RoomID=" + RoomID +
                    "&CustName=" + CustName + "&RoomSign=" + RoomSign + "");
                $('#tab-5').attr("class", "tab-pane active");
                $('#carinfo').attr("refsel", "1");
                $('#carinfo').attr("class", "active");
                break;
        }

    });

    //$("#btnSave").click(function () {

    //    var cmd = $('#hiOPType').val();
    //    if (cmd == "Insert") {
    //        cmd = "insertparkinglend";
    //    } else {
    //        cmd = "editparkinglend";
    //    }
    //    //车位登记信息
    //    var ParkID = $('#hiParkID').val();
    //    var CustID = $('#CustID').val();
    //    var RoomID = $('#RoomID').val();
    //    var CarparkID = $('#hiCarparkID').val();
    //    var ParkType = $('#ParkType').val();
    //    var ParkArea = $('#ParkArea').val();
    //    var ParkName = $('#ParkName').val();
    //    var ParkingNum = $('#ParkingNum').val();
    //    var PropertyRight = $('#PropertyRight').combobox('getValue');
    //    var PropertyUses = $('#PropertyUses').val();
    //    var IsDelete = 0;
    //    var StanID = $('#hiStanID').val();
    //    var ParkCategory = $('#ParkCategory').val();
    //    var ParkMemo = $('#ParkMemo').val();
    //    var IsPropertyService = $('#IsPropertyService').combobox('getValue');
    //    //车位办理信息
    //    var HandID = $('#hiHandID').val();
    //    var CustID2 = $('#CustID2').val();
    //    var RoomID2 = $('#RoomID2').val();
    //    var ParkStartDate = $('#ParkStartDate').datebox('getValue');
    //    var ParkEndDate = $('#ParkEndDate').datebox('getValue');
    //    var handling = $('#handling').val();
    //    var HandDate = $('#HandDate').datebox('getValue');
    //    var ParkingCarSign = $('#ParkingCarSign').val();
    //    var CarSign = $('#CarSign').val();
    //    var CarType = $('#CarType').val();
    //    var ChargeCycle = $('#ChargeCycle').combobox('getValue');
    //    var FacBrands = $('#FacBrands').val();
    //    var CarColor = $('#CarColor').val();
    //    var CarEmission = $('#CarEmission').val();
    //    var Phone = $('#Phone').val();
    //    var IsUse = $('#DrUse').combobox('getValue');
    //    var IsInput = $('#IsInput').combobox('getValue');
    //    var ListingData = $('#ListingData').datebox('getValue');
    //    var IsListing = $('#IsListing').datebox('getValue');

    //    if (PropertyRight == "业主产权" && ChargeCycle == 0) {
    //        HDialog.Info("业主产权车位不允许选择无固定交费周期");
    //        return;
    //    }
    //    else {

    //        var param = "ParkID=" + ParkID + "&CustID=" + CustID + "&RoomID=" + RoomID + "&CarparkID=" + CarparkID
    //            + "&ParkType=" + ParkType + "&ParkArea=" + ParkArea + "&ParkName=" + ParkName + "&ParkingNum=" + ParkingNum
    //            + "&PropertyRight=" + PropertyRight + "&PropertyUses=" + PropertyUses + "&IsDelete=" + IsDelete + "&StanID=" + StanID
    //            + "&ParkCategory=" + ParkCategory + "&ParkMemo=" + ParkMemo + "&IsPropertyService=" + IsPropertyService
    //            + "&HandID=" + HandID + "&CustID2=" + CustID2 + "&RoomID2=" + RoomID2 + "&ParkStartDate=" + ParkStartDate
    //            + "&ParkEndDate=" + ParkEndDate + "&handling=" + handling + "&HandDate=" + HandDate + "&ParkingCarSign=" + ParkingCarSign
    //            + "&ChargeCycle=" + ChargeCycle + "&CarSign=" + CarSign + "&CarType=" + CarType + "&FacBrands=" + FacBrands + "&CarColor=" + CarColor
    //            + "&CarEmission=" + CarEmission + "&Phone=" + Phone + "&IsUse=" + IsUse + "&IsInput=" + IsInput + "&ListingData=" + ListingData
    //            + "&IsListing=" + IsListing;

    //        $.tool.DataPostChk('FrmForm', 'ParkingLend', cmd, param, function Init() {
    //        },
    //        function callback(_Data) {
    //            if (_Data == "true") {
    //                HDialog.Info('保存成功');
    //                close("true");
    //            }
    //        },
    //        function completeCallback() {
    //        },
    //        function errorCallback() {

    //        });
    //    }
    //});

    var toolbarfeesinfo = [
        {
            text: '租金费用输入',
            id: 'virfeesinfoadd',
            iconCls: 'icon-add',
            handler: function () {
                FeesInfoInput(0);
            }
        }, '-',
        {
            text: '修改',
            iconCls: 'icon-edit',
            handler: function () {
                var row = $("#TableContainer3").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('请选择修改项！');
                    return;
                }
                ViewDetail(row.FeesID, 1);
            }
        }, '-',
        {
            text: '删除',
            iconCls: 'icon-cancel',
            handler: function () {
                var row = $("#TableContainer3").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('请选择删除项！');
                    return;
                }

                Delfees(row.FeeDueYearMonth, row.FeesID, 1);
            }
        }
    ];

    var toolbarotherfeesinfo = [
        {
            text: '其他费用输入',
            iconCls: 'icon-add',
            handler: function () {
                OtherFeesInfoInput();
            }
        }, '-',
        {
            text: '修改',
            iconCls: 'icon-edit',
            handler: function () {
                var row = $("#TableContainer3").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('请选择修改项！');
                    return;
                }
                ViewDetail(row.FeesID, 2);
            }
        }, '-',
        {
            text: '删除',
            iconCls: 'icon-cancel',
            handler: function () {
                var row = $("#TableContainer3").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('请选择删除项！');
                    return;
                }

                Delfees(row.FeeDueYearMonth, row.FeesID, 2);
            }
        }
    ];

    function LoadListFeesInfo() {
        var param = "ParkID=" + $("#hiParkID").val() + "&HandID=" + $("#hiHandID").val() + "&CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&type=" + $("#hitype").val();
        $("#TableContainer3").datagrid({
            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=ParkingLend&Command=searchparkinglead&' + param,
            method: "get",
            title: '',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            remoteSort: false,
            fitColumns: true,
            singleSelect: true,
            pagination: true,
            rownumbers: true,
            toolbar: toolbarfeesinfo,
            width: "100%",
            border: false,
            sortOrder: "asc"
        });
    }

    function LoadListOtherFeesInfo() {
        var param = "ParkID=" + $("#hiParkID").val() + "&HandID=" + $("#hiHandID").val() + "&CustID=" + $("#CustID").val() + "&RoomID=" + $("#RoomID").val() + "&type=" + $("#hitype").val();
        $("#TableContainer4").datagrid({
            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=ParkingLend&Command=searchparkinglead&' + param,
            method: "get",
            title: '',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            remoteSort: false,
            fitColumns: true,
            singleSelect: true,
            pagination: true,
            rownumbers: true,
            toolbar: toolbarotherfeesinfo,
            width: "100%",
            border: false,
            sortOrder: "asc"
        });
    }

    var column = [[
        { field: 'CustName', title: '客户名称', width: 100, align: 'center', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 100, align: 'center', sortable: true },
        { field: 'CostName', title: '费用名称', width: 100, align: 'center', sortable: true },
        {
            field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'center', sortable: true
        },
        {
            field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'center', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'FeesStateDate', title: '开始日期', width: 100, align: 'center', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'FeesEndDate', title: '结束日期', width: 100, align: 'center', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'DueAmount', title: '应收金额', width: 80, align: 'center', sortable: true },
        { field: 'PaidAmount', title: '实收金额', width: 80, align: 'center', sortable: true },
        { field: 'PrecAmount', title: '预交冲抵', width: 80, align: 'center', sortable: true },
        { field: 'DebtsAmount', title: '欠收金额', width: 80, align: 'center', sortable: true }
    ]];

    function Delfees(strDate, strFeesID, flag) {

        $.tool.DataGet('ParkingLend', 'DelFeesCheck', 'strDate=' + strDate + '',
            function Init() {
            },
            function callback(_Data) {

                if (_Data != "") {
                    var res = _Data.split('|');
                    if (res[0] == "true") {
                        HDialog.Open(420, 210, '../DialogNew/FeesAmendDelDlg.aspx?FeesID=' + strFeesID + '',
                            '费用删除', false, function callback(_Data) {
                                if (_Data == "删除成功") {
                                    if (flag == 1) {
                                        LoadListFeesInfo();
                                    } else {
                                        LoadListOtherFeesInfo();
                                    }
                                    HDialog.Info("删除成功");
                                }
                            });
                    } else {
                        HDialog.info(res[1]);
                    }

                }
            },
            function completeCallback() {
            },
            function errorCallback() {
            });
    }



    //编辑
    function ViewDetail(strFeesID, flag) {

        var param = "";
        param = 'OPType=Edit&FeesID=' + strFeesID + '&HandID=' + $("#hiHandID").val() + '&type=' + $("#hitype").val() + '';

        HDialog.Open(w, h, '../ChargesNew/FeesSporadicManage.aspx?' + param,
            '费用修改', false, function callback(_Data) {
                if (_Data == "保存成功!") {
                    if (flag == 1) {
                        LoadListFeesInfo();
                    } else {
                        LoadListOtherFeesInfo();
                    }

                }
            });
    }

    function InitPage() {
        if ($("#hiOPType").val() == "Insert") {
            $("#BtnSelCost").attr('disabled', false);
            $("#CustName").attr("disabled", false);
            $("#RoomSign").attr("disabled", false);
            $('#btnAddFee').attr('disabled', true);
            $('#btnAddFee2').attr('disabled', true);

            $("#feespage").hide();
            $("#otherfeespage").hide();
        }
        else {
            $("#BtnSelCost").attr('disabled', true);
            $("#CustName").attr("disabled", true);
            $("#RoomSign").attr("disabled", true);
            $('#btnAddFee').attr('disabled', false);
            $('#btnAddFee2').attr('disabled', false);
            if ($("#ChargeCycle").val() == "0" && $("#DrUse").val() == "1") {
                $("#feespage").show();
                $("#otherfeespage").show();
            } else {
                $("#feespage").hide();
                $("#otherfeespage").hide();
            }

        }
    }

    $("#btnReturn").click(function () {
        //close("false");
        close("true");
    });
    function close(callparm) {
        HDialog.Close(callparm);
    }

    //查询车位费用
    $("#BtnFees").click(function () {
        var ParkID = $("#hiParkID").val();
        var ParkName = $('#ParkName').val();
        HDialog.Open(w, h, '../CarparkNew/ParkingFeesSeach.aspx?ParkID=' + ParkID + '&ParkName=' + ParkName, '车位历史费用查询', false, function callback(_Data) {

        });
    });

    //租金费用输入
    function FeesInfoInput(virShowType) {

        var param = "";
        var hiHandID = $("#hiHandID").val();
        var CostID = $("#CostID").val();
        var hiStanID = $("#hiStanID").val();
        if (hiHandID != "") {
            param += "&HandID=" + hiHandID;
        }
        if (CostID != "") {
            param += "&CostID=" + CostID + "$CostName=" + $("#CostName").val();
        }
        if (hiStanID != "") {
            param += "&StanID=" + StanID + "StanName=" + $("#StanName").val() + "FeesAmount=" + $("#FeesAmount").val();
        }
        var strCustID = $("#CustID").val();
        var strCustName = $('#CustName').searchbox("getValue");

        var strRoomID = $("#RoomID").val();
        var strRoomSign = $('#RoomSign').searchbox("getValue");
        if (virShowType == 1) {
            param += "&ShowType=1";
        }
        //保存现在操作客户资料
        $.ajax({
            type: "post",
            url: "ParkingLendBrowse.aspx/SaveInfo",
            data: "{'strCustID':'" + strCustID + "','strCustName':'" + strCustName + "','strRoomID':'" + strRoomID + "','strRoomSign':'" + strRoomSign + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                HDialog.Open(w, h, '../ChargesNew/FeesSporadicManage.aspx?a=a' + param, "租金费用输入", false, function callback(_Data) {

                    LoadListFeesInfo();
                    if (_Data == "true") {
                        HDialog.Close();
                    }
                });
                $('body').pagewalkthrough('close');

            },
            error: function (err) {

            }
        });

    }

    //其他费用输入
    function OtherFeesInfoInput() {
        var param = "";
        var hiHandID = $("#hiHandID").val();
        if (hiHandID != "") {
            param += "&HandID=" + hiHandID;
        }
        param += "&TmpFees=" + 1;

        var strCustID = $("#CustID").val();
        var strCustName = $('#CustName').searchbox("getValue");

        var strRoomID = $("#RoomID").val();
        var strRoomSign = $('#RoomSign').searchbox("getValue");
        //保存现在操作客户资料
        $.ajax({
            type: "post",
            url: "ParkingLendBrowse.aspx/SaveInfo",
            data: "{'strCustID':'" + strCustID + "','strCustName':'" + strCustName + "','strRoomID':'" + strRoomID + "','strRoomSign':'" + strRoomSign + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                HDialog.Open(w, h, '../ChargesNew/FeesSporadicManage.aspx?a=a' + param, "其他费用输入", false, function callback(_Data) {

                    LoadListOtherFeesInfo();
                });
            },
            error: function (err) {

            }
        });

    }


    function SelCost() {
        var CostName = $('#CostName').val();
        var OPType = $('#hiOPType').val();

        if (OPType != "update") {
            CostName = "";
        }
        var conent = "../DialogNew/StanDlg.aspx?CostName=" + CostName + "&IsParking=ispark";
        HDialog.Open(w, h, conent, '费用标准选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CostID').val(data.attributes.CostID);
            $('#CostName').searchbox("setValue", data.attributes.CostName);
            $('#StanID').val(data.attributes.StanID);
            $('#StanName').val(data.attributes.StanName);
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


            $.tool.DataGet('Choose', 'CustRoomSigns', 'CustID=' + data.CustID + '',
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
                            RoomData.push({ "RoomText": RoomText, "RoomID": RoomID });

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
                                            $('#RoomID').val(data[i].RoomID);
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

    function SelCust2() {

        $('#CustName2').searchbox("setValue", '');
        $('#CustID2').val('');
        $('#RoomSign2').searchbox("setValue", '');
        $('#RoomID2').val('');
        $('#SelectRoomID2').combobox('clear');

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName2').searchbox("setValue", data.CustName);

            $('#CustID2').val(data.CustID);


            $.tool.DataGet('Choose', 'CustRoomSigns', 'CustID=' + data.CustID + '',
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
                            RoomData.push({ "RoomText": RoomText, "RoomID": RoomID });

                        }
                        $('#SelectRoomID2').combobox({
                            data: RoomData,
                            valueField: 'RoomID',
                            textField: 'RoomText',
                            onChange: function (n, o) {


                                var data = $('#SelectRoomID2').combobox('getData');
                                if (data.length > 0) {
                                    for (var i = 0; i < data.length; i++) {
                                        if (n == data[i].RoomID) {

                                            $('#RoomSign2').searchbox('setValue', data[i].RoomText);
                                            $('#RoomID2').val(data[i].RoomID);
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

        });

    }

    function SelRoom2() {
        $('#CustName2').searchbox("setValue", '');
        $('#CustID2').val('');
        $('#RoomSign2').searchbox("setValue", '');
        $('#RoomID2').val('');
        $('#SelectRoomID2').combobox('clear');

        var conent = "../DialogNew/RoomDlg.aspx";

        HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign2').searchbox("setValue", data.RoomSign);
            $('#CustName2').searchbox("setValue", data.CustName);
            $('#CustID2').val(data.CustID);
            $('#RoomID2').val(data.RoomID);

        });

    }

    function CheckData() {


        if ($('#CustName').searchbox('getValue') == "") {
            HDialog.Info("请选择客户,此项不能为空!");
            FrmForm.CustName.focus();
            return false;
        }

        if ($('#ParkStartDate').datebox('getValue') == "") {
            HDialog.Info("请选择计费开始时间,此项不能为空!");
            FrmForm.ParkStartDate.focus();
            return false;
        }
        if ($('#ParkEndDate').datebox('getValue') == "") {
            HDialog.Info("请选择计费结束时间,此项不能为空!");
            FrmForm.ParkEndDate.focus();
            return false;
        }
        /*if (FrmForm.CarSign.value == "") {
            HDialog.Info("请输入车牌号,此项不能为空!");
            FrmForm.CarSign.focus();
            return false;
        }
        if (isVehicleNumber(FrmForm.CarSign.value) != true) {
            HDialog.Info("输入车牌号不合法,请重新输入!");
            FrmForm.CarSign.focus();
            return false;
        }
        if (FrmForm.CarEmission.value == "") {
            HDialog.Info("请输入排量,此项不能为空!");
            FrmForm.CarEmission.focus();
            return false;
        }*/
        //var varPropertyRight = rtrim(ltrim(FrmForm.PropertyRight.value));
        //var varChargeCycle = rtrim(ltrim(FrmForm.ChargeCycle.value));

        //if (varPropertyRight == "业主产权" && varChargeCycle == "0") {
        //    HDialog.Info("业主产权车位不允许选择无固定交费周期!");
        //    return false;
        //}
        $("#btnSave").hide();
        return true;
    }
    //验证车牌号
    function isVehicleNumber(vehicleNumber) {
        var result = false;
        if (vehicleNumber.length == 7) {
            var express = /^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$/;
            result = express.test(vehicleNumber);
        }
        return result;
    }
    function ltrim(s) {
        return s.replace(/^\s*/, "");
    }//去右空格;<BR>
    function rtrim(s) {
        return s.replace(/\s*$/, "");
    }

    if ($("#DUserState").val() == "使用") {

        $("#CustName2").attr('disabled', true);
        $("#SelectRoomID2").attr("disabled", true);
        $("#RoomSign2").attr("disabled", true);
        $('#CustName').attr('disabled', true);
        $('#SelectRoomID').attr('disabled', true);
        $('#RoomSign').attr('disabled', true);
    }

</script>
