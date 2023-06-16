<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParkingCarManage.aspx.cs" Inherits="M_Main.CarparkNew.ParkingCarManage" %>

<!DOCTYPE html>

<html>
<head>
    <title>ParkingCarManage</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

</head>
<body>
    <form id="frmForm" runat="server">
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
        <input id="CarID" type="hidden" name="CarID" runat="server" />
        <input id="CustID" type="hidden" name="CustID" runat="server" />
        <input id="RoomID" type="hidden" name="RoomID" runat="server" />
        <input id="Category" type="hidden" name="Category" runat="server" />
        <input id="ParkID" type="hidden" name="ParkID" runat="server" />
        <input id="btnLoadCar" type="button" hidden="hidden" name="btnLoadCar" runat="server" onserverclick="btnLoadCar_ServerClick" />
        <input id="btnLoadRoom" type="button" hidden="hidden" name="btnLoadRoom" runat="server" onserverclick="btnLoadRoom_ServerClick" />

        <table class="DialogTable">
            <tr>
                <td colspan="4" style="color:red" >*备注：如无可选车辆,请先为该客户（房屋）添加车辆</td>
            </tr>
            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContent">
                    <input   id="CustName" type="text"  placeholder="输入或双击选择" autocomplete="off" name="CustName" runat="server" disabled="disabled" >
                </td>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContent">
                    <input type="text"  id="RoomSign"  name="RoomSign" placeholder="输入或双击选择" AutoComplete="off" runat="server" disabled="disabled" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">可选房号
                </td>
                <td class="TdContent">
                    <asp:DropDownList ID="SelRoomID" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="SelRoomID_SelectedIndexChanged" disabled="disabled" >
                    </asp:DropDownList>
                </td>
                <td class="TdTitle">可选车辆</td>
                <td class="TdContent">
                    <asp:DropDownList ID="SelCarNum" runat="server"   AutoPostBack="True" OnSelectedIndexChanged="SelCarNum_SelectedIndexChanged"  >
                    </asp:DropDownList>
                    <span style="font-size:10px"><a href="#" id="addCar">添加车辆</a></span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">车牌号码</td>
                <td class="TdContent">
                    <input   id="CarNum" type="text" name="CarNum"
                        runat="server" disabled="disabled" >
                </td>
                <td class="TdTitle">车主名称</td>
                <td class="TdContent">
                    <input  id="Owner" type="text" name="Owner"
                        runat="server" disabled="disabled" >
                </td>
            </tr>
            <tr>
                <td class="TdTitle">车辆品牌</td>
                <td class="TdContent">
                    <input id="Brand" type="text" maxlength="50" name="Brand" runat="server" disabled="disabled" >
                </td>
                <td class="TdTitle">车辆类型</td>
                <td class="TdContent">
                    <select id="SelCategory" name="SelCategory" runat="server" disabled="disabled" ></select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">车辆颜色</td>
                <td class="TdContent">
                    <input  id="Color" type="text" name="Color" runat="server" disabled="disabled" >
                </td>
                <td class="TdTitle">车辆排量</td>
                <td class="TdContent">
                    <input id="Displacement" type="text" name="Displacement" runat="server" disabled="disabled" > 
                </td>
            </tr>
            <tr>
                <td class="TdTitle">备注</td>
                <td class="TdContent" colspan="3">
                    <input class="easyui-validatebox" id="Remark" type="text" name="Remark" runat="server" disabled="disabled" ></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr style="text-align: center;">
                <td colspan="4">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<script type="text/javascript">
    $("#BtnSave").click(function () {
        var cmd = $("#hiOPType").val();
        var ParkId = $("#ParkID").val();
        var CustID = $('#CustID').val();
        var RoomID = $('#RoomID').val();
        var CarID = $('#CarID').val();
        if (ParkId == "") {
            HDialog.Info("车位出错");
        }
        else if (CarID == "") {
            HDialog.Info("请选择车辆");
        }
        else {

            $.tool.DataPostChk('frmForm', 'ParkingCarDatePeriod', cmd, $('#frmForm').serialize(),
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

    $('#CustName').dblclick(function (e) {
        var conent = "../DialogNew/CustDlg.aspx";
        HDialog.Open('1000', '600', conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').val(data.CustName);
            $('#RoomSign').val('');
            $("#CustID").val(data.CustID);
            $("#btnLoadRoom").click();
        });
    })

    $('#RoomSign').dblclick(function (e) {
        var conent = "../DialogNew/RoomDlg.aspx";
        HDialog.Open('1000', '600', conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').val(data.RoomSign);
            $('#CustName').val(data.CustName);
            $('#CustID').val(data.CustID);
            $('#RoomID').val(data.RoomID);
            $("#btnLoadRoom").click();
        });
    })

    $('#SelCategory').combobox({
        onChange: function (n, o) {
            var myOptValue = $("#SelCategory").combobox("getText");
            $('#Category').val(myOptValue);
        }
    });

    $('#addCar').click(function (e) {
        var CustID = $('#CustID').val();
        var RoomID = $('#RoomID').val();
        var CustName = $('#CustName').val();
        var RoomSign = $('#RoomSign').val();
        var conent = "../CarParkNew/CarManage.aspx?CustID=" + CustID + "&RoomID=" + RoomID + "&CustName=" + CustName + "&RoomSign=" + RoomSign + "";
        HDialog.Open('800', '300', conent, '添加车辆', false, function callback(_Data) {
            console.log(_Data)
            //if (_Data == "true") {
                window.location.reload(true);
            //}
        });
    });
</script>

