<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaleParkingManage.aspx.cs" Inherits="M_Main.CarparkNew.SaleParkingManage" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ParkingManage</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

</head>
<body>
    <form id="FrmForm">
        <input id="IsDetail" type="hidden" name="IsDetail" runat="server" />
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
        <input id="ParkID" type="hidden" name="ParkID" runat="server" />
        <input id="hiCarparkID" type="hidden" name="CarparkID" runat="server" />
        <input id="hiUseState" type="hidden" name="HandID" runat="server" />
        <table class="DialogTable" style="width: 100%; padding-top: 5px; line-height: 25px;">
            <tr>
                <td class="TdTitle">车位类别</td>
                <td class="TdContentSearch">
                    <select id="ParkCategory" name="ParkCategory" data-options="editable:false,panelHeight: 'auto'" disabled="disabled" class="easyui-combobox" runat="server">
                        <option value="0" selected>固定车位</option>
                        <option value="1">非固定车位</option>
                    </select></td>
                <td class="TdTitle">车位区域</td>
                <td class="TdContent">
                    <input style="width: 82%;" type="text" id="CarparkName" name="CarparkName" disabled="disabled" runat="server" />
                    <input type="hidden" id="CarparkID" name="CarparkID" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">车位类型</td>
                <td class="TdContentSearch">
                    <select id="ParkType" data-options="editable:false,panelHeight: '80px'" disabled="disabled" class="easyui-combobox" name="ParkType" runat="server">
                    </select>
                </td>
                <td class="TdTitle">车位编号</td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" disabled="disabled" id="ParkName" name="ParkName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">车位面积</td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox" id="ParkArea" name="ParkArea" disabled="disabled" runat="server" />
                </td>
                <td class="TdTitle">泊车数量</td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox" id="ParkingNum" name="ParkingNum" disabled="disabled" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">产权性质</td>
                <td class="TdContentSearch">
                    <select id="PropertyRight" name="PropertyRight" class="easyui-combobox" disabled="disabled" data-options="editable:false,panelHeight: 'auto'" runat="server">
                    </select>
                </td>
                <td class="TdTitle">使用状态</td>
                <td class="TdContentSearch">
                    <select id="PropertyUses" name="PropertyUses" class="easyui-combobox" disabled="disabled" data-options="editable:false,panelHeight: 'auto'" runat="server">
                        <option value="产权人自用">产权人自用</option>
                        <option value="产权人出租">产权人出租</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">费用名称</td>
                <td class="TdContent">
                    <input style="width: 82%;" disabled="disabled" id="CostName" name="CostName" runat="server" />
                    <input type="hidden" name="CostID" id="CostID" runat="server" /></td>
                <td class="TdTitle">收费标准</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" disabled="disabled" data-options="required:true" id="StanName" name="StanName" runat="server" />
                    <input type="hidden" name="StanID" id="StanID" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">业主名称</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" style="width: 82%;" data-options="editable:false,required:true" id="CustName" name="CustName" searcher="SelCust" runat="server" />
                    <input type="hidden" name="CustID" id="CustID" runat="server" />
                </td>
                <td class="TdTitle">可选房号</td>
                <td class="TdContentSearch">
                    <select id="SelectRoomID" class="easyui-combobox" data-options="editable:false,panelHeight: '80px'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                        <option selected></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" style="width: 82%;" id="RoomSign" data-options="editable:false,required:true" name="RoomSign" searcher="SelRoom" runat="server" />
                    <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                </td>
                <td class="TdTitle">合同交付时间</td>
                <td class="TdContent">
                    <input class="Wdate" disabled="disabled" id="ContSubDate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" maxlength="50" name="ContSubDate" runat="server" type="text" /></td>
            </tr>
            <tr>
                <td class="TdTitle">实际交付时间</td>
                <td class="TdContent">
                    <input class="Wdate" disabled="disabled" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="ActualSubDate" maxlength="50" name="ActualSubDate" onkeypress="CheckDate();" runat="server" type="text" /></td>
                <td class="TdTitle">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 注</td>
                <td class="TdContent">
                    <input type="text" id="ParkMemo" class="easyui-validatebox" disabled="disabled" name="ParkMemo" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="text-align: center; padding-top: 20px;" colspan="4" class="DialogTdSubmit">
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

    $("#BtnSave").click(function () {

        $('#CustName').removeAttr("disabled");
        $('#RoomSign').removeAttr("disabled");
        $('#SelectRoomID').removeAttr("disabled");

        var ParkID = $('#ParkID').val();
        var CustID = $('#CustID').val();
        var RoomID = $('#RoomID').val();
        $('#CarparkID').val($('#hiCarparkID').val())
        var CarparkID = $('#CarparkID').val();
        var ParkType = $('#ParkType').combobox('getText');
        var ParkArea = $('#ParkArea').val();
        var ParkName = $('#ParkName').val();
        var ParkingNum = $('#ParkingNum').val();
        var PropertyRight = $('#PropertyRight').combobox('getValue');
        var PropertyUses = $('#PropertyUses').combobox('getValue');
        var ContSubDate = $('#ContSubDate').val();
        var ActualSubDate = $('#ActualSubDate').val();
        var IsDelete = 0;
        var StanID = $('#StanID').val();
        var ParkCategory = 0;
        var ParkMemo = $('#ParkMemo').val();
        var IsPropertyService = 0;
        var CostID = $('#CostID').val();

        if (CustID == "") {
            HDialog.Info("请选择业主名称");
        }
        else if (CostID == "") {
            HDialog.Info("请选择要设置收费项目");
        }
        else if (StanID == "") {
            HDialog.Info("请选择要设置收费标准");
        }
        else {

            var param = "ParkID=" + ParkID + "&CustID=" + CustID + "&RoomID=" + RoomID + "&CarparkID=" + CarparkID
                + "&ParkType=" + ParkType + "&ParkArea=" + ParkArea + "&ParkName=" + ParkName + "&ParkingNum=" + ParkingNum
                + "&PropertyRight=" + PropertyRight + "&PropertyUses=" + PropertyUses + "&IsDelete=" + IsDelete + "&StanID=" + StanID
                + "&ParkCategory=" + ParkCategory + "&ParkMemo=" + ParkMemo + "&IsPropertyService=" + IsPropertyService + "&ContSubDate=" + ContSubDate + "&ActualSubDate=" + ActualSubDate;

            $.tool.DataPostChk('FrmForm', 'Parking', 'update', param,
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "true") {
                        parent.layer.alert('保存成功');
                        close("true");
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {

                });
        }
    });
    $("#BtnReturn").click(function () {
        close("false");
    });


    function close(callparm) {
        HDialog.Close(callparm);
    }



    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open('1000', '600', conent, '客户选择', false, function callback(_Data) {
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

    function SelRoom() {
        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
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

        });

    }

    $("select").each(function () {

        var key = $(this).attr("id");
        $(this).css("width", document.body.clientWidth * 0.36 * 0.89);
    });
</script>

