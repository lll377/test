<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParkCategoryManage.aspx.cs" Inherits="M_Main.CarparkNew.ParkCategoryManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ParkingManage</title>
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
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>

</head>
<body>
    <form id="FrmForm">
        <input id="ParkID" type="hidden" name="ParkID" runat="server" />
        <input id="hiCarparkID" type="hidden" name="CarparkID" runat="server" />
        <input id="HandID" type="hidden" name="HandID" runat="server" />
        <table class="DialogTable" id="tab1">
            <tr>
                <td style="background-color: #e6e6e6; height: 25px;" align="center" colspan="8">车位登记信息</td>
            </tr>
            <tr>
                <td class="TdTitle">车位类别</td>
                <td class="TdContentSearch">
                    <select id="ParkCategory" name="ParkCategory" data-options="editable:false,panelHeight: 'auto'" disabled="disabled" class="easyui-combobox" runat="server">
                        <option value="0">固定车位</option>
                        <option value="1" selected>非固定车位</option>
                    </select></td>
                <td class="TdTitle">车位区域</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" style="width: 83%;" data-options="editable:false,required:true" type="text" id="CarparkName" searcher="SelCarparkName" name="CarparkName" runat="server" />
                    <input type="hidden" id="CarparkID" name="CarparkID" runat="server" />
                </td>
                <td class="TdTitle">车位类型</td>
                <td class="TdContentSearch">
                    <select id="ParkType" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="ParkType" runat="server">
                    </select>
                </td>
                <td class="TdTitle">车位编号</td>
                <td class="TdContent">
                    <input type="text" style="width: 82%;" readonly="readonly" id="ParkName" name="ParkName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">车位面积</td>
                <td class="TdContent">
                    <input type="text" style="width: 82%;" class="easyui-validatebox" id="ParkArea" name="ParkArea" runat="server" />
                </td>
                <td class="TdTitle">泊车数量</td>
                <td class="TdContent">
                    <input type="text" style="width: 82%;" class="easyui-validatebox" id="ParkingNum" name="ParkingNum" runat="server" />
                </td>
                <td class="TdTitle">产权性质</td>
                <td class="TdContentSearch">
                    <select id="PropertyRight" name="PropertyRight" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">                        
                        <option value="业主产权">业主产权</option>
                        <option value="共有产权">共有产权</option>
                        <option value="人防产权（房产）">人防产权（房产）</option>
                        <option value="人防产权（业主共有）">人防产权（业主共有）</option>
                        <option value="产权不明">产权不明</option>
                        <option value="其它产权">其它产权</option>
                        <option value="自有产权模式一(抵扣)">自有产权模式一(抵扣)</option>
                        <option value="自有产权模式二(常规)">自有产权模式二(常规)</option>
                    </select>
                </td>
                <td class="TdTitle">使用状态</td>
                <td class="TdContentSearch">
                    <select id="PropertyUses" data-options="editable:false,panelHeight: 'auto'" disabled="disabled" class="easyui-combobox" name="PropertyUses" runat="server">
                        <option value="产权人自用">产权人自用</option>
                        <option value="产权人出租" selected>产权人出租</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle"></td>
                <td class="TdContentSearch">
                    <input type="button" class="button" value="标准选择" id="BtnSelCost" />
                </td>
                <td class="TdTitle">费用名称</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" style="width: 82%;" data-options="required:true" id="CostName" name="CostName" runat="server" />
                    <input type="hidden" name="CostID" id="CostID" runat="server" /></td>
                <td class="TdTitle">收费标准</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" style="width: 82%;" data-options="required:true" id="StanName" name="StanName" runat="server" />
                    <input type="hidden" name="StanID" id="StanID" runat="server" />
                </td>
                <td class="TdTitle">是否签订物业服务协议</td>
                <td class="TdContentSearch">
                    <select id="IsPropertyService" name="IsPropertyService" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">业主名称</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" style="width: 83%;" data-options="editable:false,required:true" id="CustName" name="CustName" searcher="SelCust" runat="server" />
                    <input type="hidden" name="CustID" id="CustID" runat="server" />
                </td>
                <td class="TdTitle">可选房号</td>
                <td class="TdContentSearch">
                    <select id="SelectRoomID" class="easyui-combobox" data-options="editable:false,panelHeight: '300px'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                        <option selected></option>
                    </select>
                </td>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" style="width: 83%;" id="RoomSign" data-options="editable:false" name="RoomSign" searcher="SelRoom" runat="server" />
                    <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td style="background-color: #e6e6e6; height: 25px;" align="center" colspan="8">车位办理信息</td>
            </tr>
            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" style="width: 83%;" data-options="editable:false,required:true" id="CustName2" name="CustName" searcher="SelCust2" runat="server" />
                    <input type="hidden" name="CustID" id="CustID2" runat="server" />
                </td>
                <td class="TdTitle">可选房号</td>
                <td class="TdContentSearch">
                    <select id="SelectRoomID2" class="easyui-combobox" data-options="editable:false,panelHeight: '300px'" name="SelectRoomID2" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                        <option selected></option>
                    </select>
                </td>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" style="width: 83%;" id="RoomSign2" data-options="editable:false" name="RoomSign2" searcher="SelRoom2" runat="server" />
                    <input type="hidden" name="RoomID2" id="RoomID2" runat="server" />
                </td>
                <td class="TdTitle">联系电话</td>
                <td class="TdContent">
                    <input type="text" style="width: 82%;" class="easyui-validatebox" id="Phone" name="Phone" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">协议开始时间</td>
                <td class="DialogTdDateContent">
                    <input id="ProtocolStartDate" style="width: 83%;" class="easyui-datebox" name="ProtocolStartDate" runat="server" />
                </td>
                <td class="TdTitle">协议结束时间</td>
                <td class="DialogTdDateContent">
                    <input id="ProtocolEndDate" style="width: 83%;" class="easyui-datebox" name="ProtocolEndDate" runat="server" />
                </td>
                <td class="TdTitle">计费周期</td>
                <td class="TdContentSearch">
                    <select id="ChargeCycle" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="ChargeCycle" runat="server">
                        <option selected></option>
                    </select>
                </td>
                <td class="TdTitle">是否使用</td>
                <td class="TdContentSearch">
                    <select id="DrUse" name="DrUse" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                        <option value="1">是</option>
                        <option value="0">否</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">计费开始时间 </td>
                <td class="DialogTdDateContent">
                    <input id="ParkStartDate" style="width: 83%;" class="easyui-datebox" name="ParkStartDate" runat="server" />
                </td>
                <td class="TdTitle">计费结束时间</td>
                <td class="DialogTdDateContent">
                    <input id="ParkEndDate" style="width: 83%;" class="easyui-datebox" name="ParkEndDate" runat="server" />
                </td>
                <td class="TdTitle">已交费时间至</td>
                <td class="TdContent">
                    <input type="text" style="width: 82%;" class="easyui-validatebox" id="lbParkEndDate" name="lbParkEndDate" runat="server" />
                </td>
                <td class="TdTitle">停车卡号</td>
                <td class="TdContent">
                    <input type="text" style="width: 82%;" id="ParkingCarSign" name="ParkingCarSign" runat="server" />
                </td>

            </tr>
            <tr style="display: none">
                <td class="TdTitle">车牌号码</td>
                <td class="TdContent">
                    <input type="text" style="width: 82%;" id="CarSign" name="CarSign" class="easyui-validatebox" runat="server" />
                </td>
                <td class="TdTitle">车辆类型</td>
                <td class="TdContent">
                    <input type="text" style="width: 82%;" class="easyui-validatebox" id="CarType" name="CarType" runat="server" />
                </td>
                <td class="TdTitle">车辆品牌</td>
                <td class="TdContent">
                    <input id="FacBrands" style="width: 82%;" name="FacBrands" runat="server" />
                </td>
                <td class="TdTitle">颜&nbsp;&nbsp;&nbsp; 色</td>
                <td class="TdContent">
                    <input type="text" style="width: 82%;" id="CarColor" class="easyui-validatebox" name="CarColor" runat="server" />
                </td>
            </tr>
            <tr style="display: none">
                <td class="TdTitle">排&nbsp;&nbsp;&nbsp; 量</td>
                <td class="TdContent">
                    <input id="CarEmission" style="width: 82%;" class="easyui-validatebox" name="CarEmission" runat="server" />
                </td>

                <td class="TdTitle">车主姓名</td>
                <td class="TdContentSearch">
                    <input id="CarHostName" name="CarHostName" runat="server" />
                </td>
                <td class="TdTitle">受 理 人</td>
                <td class="TdContent">
                    <input id="handling" style="width: 82%;" name="handling" runat="server" />
                </td>
                <td class="TdTitle">受理时间</td>
                <td class="DialogTdDateContent">
                    <input type="text" style="width: 83%;" class="easyui-datebox" id="HandDate" name="HandDate" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">收取其他费用</td>
                <td class="TdContentSearch">
                    <select id="IsInput" name="IsInput" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="color: #ff0000">*备注：车位办理后，请登记车辆信息。
                </td>
            </tr>
            <tr>
                <td style="text-align: center; padding-top: 20px;" colspan="8" class="DialogTdSubmit">
                    <input type="button" class="button" value="保 存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" value="关 闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
<script type="text/javascript">
    var w = $(window).width();
    var h = $(window).height();

    var IsSubmitFlag = true;
    $("#BtnSave").click(function () {
        if (IsSubmitFlag == false) {
            HDialog.Info("10秒内不要重复点击");
            return false;
        }

        IsSubmitFlag = false;
        setTimeout('IsSubmitFlag=true', 10000);
        $('#CustName').removeAttr("disabled");
        $('#RoomSign').removeAttr("disabled");
        $('#SelectRoomID').removeAttr("disabled");
        var cmd = "insert";
        //车位登记信息
        var ParkID = $('#ParkID').val();
        var CustID = $('#CustID').val();
        var RoomID = $('#RoomID').val();
        var CarparkID = $('#CarparkID').val();
        var ParkType = $('#ParkType').combobox('getText');
        var ParkArea = $('#ParkArea').val();
        var ParkName = $('#ParkName').val();
        var ParkingNum = $('#ParkingNum').val();
        var PropertyRight = $('#PropertyRight').combobox('getValue');
        var PropertyUses = $('#PropertyUses').combobox('getValue');
        var IsDelete = 0;
        var StanID = $('#StanID').val();
        var ParkCategory = 1;
        var UseState = "使用";
        var IsPropertyService = $('#IsPropertyService').combobox('getValue');
        //车位办理信息
        var HandID = $('#HandID').val();
        var CustID2 = $('#CustID2').val();
        var RoomID2 = $('#RoomID2').val();
        var ProtocolStartDate = $('#ProtocolStartDate').datebox('getValue');
        var ProtocolEndDate = $('#ProtocolEndDate').datebox('getValue');
        var ParkStartDate = $('#ParkStartDate').datebox('getValue');
        var ParkEndDate = $('#ParkEndDate').datebox('getValue');
        var handling = $('#handling').val();
        var HandDate = $('#HandDate').datebox('getValue');
        var ParkingCarSign = $('#ParkingCarSign').val();
        var CarSign = $('#CarSign').val();
        var CarType = $('#CarType').val();
        var ChargeCycle = $('#ChargeCycle').combobox('getValue');
        var FacBrands = $('#FacBrands').val();
        var CarColor = $('#CarColor').val();
        var CarEmission = $('#CarEmission').val();
        var Phone = $('#Phone').val();
        var IsUse = $('#DrUse').combobox('getValue');
        var IsInput = $('#IsInput').combobox('getValue');
        var CarHostName = $('#CarHostName').val();
        var CostID = $('#CostID').val();
        if (CustID == "") {
            HDialog.Info("请选择业主名称");
            return false;
        }
        else if (CostID == "") {
            HDialog.Info("请选择要设置收费项目");
            return false;
        }
            /*else if (CarSign == "") {
                HDialog.Info("请输入车牌号");
                return false;
            }
            else if (isVehicleNumber(CarSign) != true) {
                HDialog.Info("输入车牌号不合法");
                return false;
            }*/
        else if (StanID == "") {
            HDialog.Info("请选择要设置收费标准");
            return false;
        }
        else {

            var param = "ParkID=" + ParkID + "&CustID=" + CustID + "&RoomID=" + RoomID + "&CarparkID=" + CarparkID
                + "&ParkType=" + ParkType + "&ParkArea=" + ParkArea + "&ParkName=" + ParkName + "&ParkingNum=" + ParkingNum
                + "&PropertyRight=" + PropertyRight + "&PropertyUses=" + PropertyUses + "&IsDelete=" + IsDelete + "&StanID=" + StanID
                + "&ParkCategory=" + ParkCategory + "&UseState=" + UseState + "&IsPropertyService=" + IsPropertyService
                + "&HandID=" + HandID + "&CustID2=" + CustID2 + "&RoomID2=" + RoomID2 + "&ParkStartDate=" + ParkStartDate
                + "&ParkEndDate=" + ParkEndDate + "&handling=" + handling + "&HandDate=" + HandDate + "&ParkingCarSign=" + ParkingCarSign
                + "&ChargeCycle=" + ChargeCycle + "&CarSign=" + CarSign + "&CarType=" + CarType + "&FacBrands=" + FacBrands + "&CarColor=" + CarColor
                + "&CarEmission=" + CarEmission + "&Phone=" + Phone + "&IsUse=" + IsUse + "&IsInput=" + IsInput + "&CarHostName=" + CarHostName
                + "&ProtocolStartDate=" + ProtocolStartDate + "&ProtocolEndDate=" + ProtocolEndDate;

            $.tool.DataPostChk('FrmForm', 'ParkingLend', cmd, param,
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "true") {
                        parent.layer.alert('保存成功');
                        close("true");
                    }
                    else {
                        parent.layer.alert('保存过程中出现错误!');
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {

                });
        }
    });

    //验证车牌号
    function isVehicleNumber(vehicleNumber) {
        var result = false;
        if (vehicleNumber.length == 7) {
            var express = /^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$/;
            result = express.test(vehicleNumber);
        }
        return result;
    }

    $("#BtnReturn").click(function () {
        close("false");
    });

    $("#BtnSelCost").click(function () {
        var CostName = $('#CostName').val();
        var OPType = $('#hiOPType').val();

        if (OPType != "update") {
            CostName = "";
        }
        var conent = "../DialogNew/StanDlg.aspx?CostName=" + CostName + "&IsParking=ispark";
        HDialog.Open(w, h, conent, '费用标准选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CostID').val(data.attributes.CostID);
            $('#CostName').val(data.attributes.CostName);
            $('#StanID').val(data.attributes.StanID);
            $('#StanName').val(data.attributes.StanName);
        });
    });

    function close(callparm) {
        HDialog.Close(callparm);
    }

    function SelCarparkName() {
        $('#CarparkName').searchbox("setValue", '');
        $('#CarparkID').val('');

        var conent = "../DialogNew/CarparkDlg.aspx";

        HDialog.Open('600', '400', conent, '车位区域', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CarparkName').searchbox("setValue", data.CarparkName);
            $('#CarparkID').val(data.CarparkID);

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


            $.tool.DataGet('Choose', 'CustRoomSigns', $('#FrmForm').serialize(),
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
            var CustID2 = data.CustID;

            $('#CustID2').val(CustID2);


            $.tool.DataGet('Choose', 'CustRoomSigns', 'CustID=' + CustID2,
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

    $("select").each(function () {
        $(this).css("width", '83%');
    });

</script>

