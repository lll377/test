<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaleParkingHandManage.aspx.cs" Inherits="M_Main.CarparkNew.SaleParkingHandManage" %>


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

   
</head>
<body>

    <form id="FrmForm" runat="server">
        <input id="hiParkID" type="hidden" size="1" name="hiParkID" runat="server" />
        <input id="hiCustID" type="hidden" size="1" name="hiCustID" runat="server" />
        <input id="hiRoomID" type="hidden" size="1" name="hiRoomID" runat="server" />
        <input id="hiHandID" type="hidden" size="1" name="hiHandID" runat="server" />
        <input id="hiStanID" type="hidden" size="1" name="hiStanID" runat="server" />
         <input id="hiInput" type="hidden" size="1" name="hiInput" runat="server" />
        <input id="PropertyUses" type="hidden" runat="server" />
        <input id="ParkCategory" type="hidden" size="1" name="ParkCategory" runat="server" />

        <table class="DialogTable" id="Table1" style="background-color: #FFFFFF; height: 100%;">
            <tr>
                <td class="TdTitle" colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">车位登记信息</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">车位区域</td>
                <td class="TdContentSearch">
                    <input id="CarparkName" disabled name="CarparkName" runat="server" />
                </td>
                <td class="TdTitle">车位类型</td>
                <td class="TdContentSearch">
                    <input id="ParkType" disabled name="ParkType" runat="server" />
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
                    <asp:DropDownList ID="PropertyRight" runat="server">
                        <asp:ListItem Value="自有产权" Selected="True">自有产权</asp:ListItem>
                        <asp:ListItem Value="业主产权">业主产权</asp:ListItem>
                        <asp:ListItem Value="共有产权">共有产权</asp:ListItem>
                        <asp:ListItem Value="产权不明">产权不明</asp:ListItem>
                        <asp:ListItem Value="其它产权">其它产权</asp:ListItem>

                    </asp:DropDownList>
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
                <td class="TdTitle">费用名称</td>
                <td class="TdContent">
                    <input id="CostName" name="CostName" runat="server" />
                    <input type="hidden" name="CostID" id="CostID" runat="server" /></td>
                <td class="TdTitle">收费标准</td>
                <td class="TdContentSearch">
                    <input class="easyui-validatebox" data-options="required:true" id="StanName" disabled name="StanName" runat="server" />
                    <input type="hidden" name="StanID" id="StanID" runat="server" />
                </td>
                <td class="TdTitle">备 注</td>
                <td class="TdContentSearch">
                    <input id="ParkMemo" name="ParkMemo" runat="server" />
                </td>
                <td></td>
                <td></td>
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
                <td class="TdTitle">计费周期</td>
                <td class="TdContent">
                    <select id="ChargeCycle" name="ChargeCycle" data-options="required:true" runat="server">
                        <option></option>
                    </select>
                </td>
                <td class="TdTitle">是否使用</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="DrUse" runat="server">
                        <asp:ListItem Value="0">否</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="TdTitle">计费开始时间</td>
                <td class="DialogTdDateContent">
                    <input id="ParkStartDate" data-options="required:true" class="easyui-datebox" name="ParkStartDate" runat="server" />
                </td>
                <td class="TdTitle">计费结束时间</td>
                <td class="DialogTdDateContent">
                    <input id="ParkEndDate" data-options="required:true" class="easyui-datebox" name="ApplyDate" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">已交费时间至</td>
                <td class="TdContentSearch">
                    <input id="lbParkEndDate" disabled name="lbParkEndDate" runat="server" />
                </td>
                <td class="TdTitle">停车卡号</td>
                <td class="TdContentSearch">
                    <input id="ParkingCarSign" name="ParkingCarSign" runat="server" />
                </td>
                <td class="TdTitle">车牌号码</td>
                <td class="TdContentSearch">
                    <input id="CarSign" name="CarSign" runat="server" />
                </td>
                <td class="TdTitle">车辆类型</td>
                <td class="TdContentSearch">
                    <input id="CarType" name="CarType" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">车辆品牌</td>
                <td class="TdContentSearch">
                    <input id="FacBrands" name="FacBrands" runat="server" />
                </td>
                <td class="TdTitle">颜&nbsp;&nbsp;&nbsp;色</td>
                <td class="TdContentSearch">
                    <input id="CarColor" name="CarColor" runat="server" />
                </td>
                <td class="TdTitle">排&nbsp;&nbsp;&nbsp;&nbsp;量</td>
                <td class="TdContentSearch">
                    <input id="CarEmission" value="5.0" name="CarEmission" runat="server" />
                </td>
                <td class="TdTitle">是否收取其它费用</td>
                <td class="TdContentSearch">

                    <asp:RadioButton ID="RbYes" runat="server" GroupName="Rb" Checked="True" Text="是"></asp:RadioButton>
                    <asp:RadioButton ID="RbNo" runat="server" GroupName="Rb" Text="否" Style="z-index: 0"></asp:RadioButton>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">是否挂牌</td>
                <td class="TdContentSearch">
                    <asp:RadioButton Style="z-index: 0" ID="ListingYes" runat="server" Text="是" GroupName="Listing" Checked="True"></asp:RadioButton>
                    <asp:RadioButton Style="z-index: 0" ID="ListingNo" runat="server" Text="否" GroupName="Listing"></asp:RadioButton>
                </td>
                <td class="TdTitle">挂牌时间</td>
                <td class="DialogTdDateContent">
                    <input id="ListingData" name="ListingData" class="easyui-datebox" runat="server" />
                </td>
                <td class="TdTitle">受 理 人</td>
                <td class="TdContentSearch">
                    <input id="handling" name="handling" runat="server" />
                </td>
                <td class="TdTitle">受理时间</td>
                <td class="DialogTdDateContent">
                    <input id="HandDate" name="HandDate" class="easyui-datebox" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdSubmit" style="text-align: center; padding-top: 10px; padding-bottom: 14%;" colspan="8">
                    <input class="button" id="btnSave" onclick="javascript: if (CheckData() == false) return false;"
                        type="button" value="保存" name="btnFilter" runat="server" />&nbsp;&nbsp;
					                            <input class="button" id="btnReturn" type="button" value="返回" name="btnFilter" runat="server" />&nbsp;&nbsp;
					       
                                           
                </td>
            </tr>
        </table>

    </form>
</body>
</html>

<script type="text/javascript">
    $("#btnReturn").click(function () {
        close("false");
    });
    function close(callparm) {
        HDialog.Close(callparm);
    }

    var w = $(window).width();
    var h = $(window).height();

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
        if (FrmForm.CustName.value == "") {
            HDialog.Info("请选择客户,此项不能为空!");
            FrmForm.CustName.focus();
            return false;
        }
        if (FrmForm.ParkStartDate.value == "") {
            HDialog.Info("请选择计费开始时间,此项不能为空!");
            FrmForm.ParkStartDate.focus();
            return false;
        }
        if (FrmForm.ParkEndDate.value == "") {
            HDialog.Info("请选择计费结束时间,此项不能为空!");
            FrmForm.ParkEndDate.focus();
            return false;
        }
        if (FrmForm.CarEmission.value == "") {
            HDialog.Info("请输入排量,此项不能为空!");
            FrmForm.CarEmission.focus();
            return false;
        }
        var varPropertyRight = rtrim(ltrim(FrmForm.PropertyRight.value));
        var varChargeCycle = rtrim(ltrim(FrmForm.ChargeCycle.value));

        if (varPropertyRight == "业主产权" && varChargeCycle == "0") {
            HDialog.Info("业主产权车位不允许选择无固定交费周期!");
            return false;
        }
        return true;
    }

    function ltrim(s) {
        return s.replace(/^\s*/, "");
    }//去右空格;<BR>
    function rtrim(s) {
        return s.replace(/\s*$/, "");
    }

</script>
