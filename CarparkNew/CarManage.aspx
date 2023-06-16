<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarManage.aspx.cs" Inherits="M_Main.CarparkNew.CarManage" %>

<!DOCTYPE html>

<html>
<head>
    <title>CarparkManage</title>
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
        <input id="btnLoadRoom" type="button" hidden="hidden" name="btnLoadRoom" runat="server" onserverclick="btnLoadRoom_ServerClick" />

        <table class="DialogTable">
            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" data-options="required:true" id="CustName" type="text"
                        placeholder="输入或双击选择" autocomplete="off" name="CustName" runat="server">
                </td>
                <td class="TdTitle">可选房号
                </td>
                <td class="TdContent">
                    <asp:DropDownList ID="SelRoomID" runat="server" class="easyui-validatebox"
                        AutoPostBack="True" OnSelectedIndexChanged="SelRoomID_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContent">
                    <input type="text" id="RoomSign" class="easyui-validatebox" name="RoomSign" placeholder="输入或双击选择"
                        autocomplete="off" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">车牌号码</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" data-options="required:true" id="CarNum" type="text" name="CarNum"
                        runat="server">
                </td>
                <td class="TdTitle">车主名称</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" data-options="required:true" id="Owner" type="text" name="Owner"
                        runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">车辆品牌</td>
                <td class="TdContent">
                    <input id="Brand" type="text" maxlength="50" name="Brand" runat="server">
                </td>
                <td class="TdTitle">车辆类型</td>
                <td class="TdContent">
                    <select id="SelCategory" name="SelCategory" runat="server"></select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">车辆颜色</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Color" type="text" name="Color" runat="server">
                </td>
                <td class="TdTitle">车辆排量</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="Displacement" type="text" name="Displacement" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">备注</td>
                <td class="TdContent" colspan="3">
                    <input class="easyui-validatebox" id="Remark" type="text" name="Remark" runat="server"></td>
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
    control();
    $("#BtnSave").click(function () {
        var cmd = $("#hiOPType").val();

        var CustID = $('#CustID').val();
        var RoomID = $('#RoomID').val();
        var CarNum = $('#CarNum').val();
        if (CustID == "") {
            HDialog.Info("请选择客户名称");
        }
        else if (CarNum == "") {
            HDialog.Info("请输入车牌号码");
        }
        else if (isVehicleNumber(CarNum)==false) {
            HDialog.Info("请正确输入车牌号码");
        }
        else if (RoomID == "") {
            HDialog.Info("请选择房间编号");
        }
        else if (Owner == "") {
            HDialog.Info("请输入车主");
        }
        else {
            $.tool.DataPostChk('frmForm', 'Car', cmd, $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "1") {
                        parent.layer.alert('保存成功');
                        close("true");
                    }
                    if (_Data == "-1") {
                        parent.layer.alert('保存失败');
                    }
                    if (_Data == "-2") {
                        parent.layer.alert('保存失败，该车牌号已存在');
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
            $("#Owner").val(data.CustName);
            $("#SelRoomID").val('');
            $("#RoomID").val('');
            $("#btnLoadRoom").click();
        });
    })

    $('#RoomSign').dblclick(function (e) {
        var conent = "../DialogNew/RoomDlg.aspx";
        HDialog.Open('1000', '600', conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').val(data.RoomSign);
            $('#CustName').val(data.CustName);
            $("#Owner").val(data.CustName);
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

    //验证车牌号
    function isVehicleNumber(vehicleNumber) {
        var result = false;
        if (vehicleNumber.length == 7) {
            var express = /^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$/;
            result = express.test(vehicleNumber);
        }
        if (vehicleNumber.length == 8) {
            var express = /^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{5}[A-Z0-9挂学警港澳]{1}$/;
            result = express.test(vehicleNumber);
        }
        return result;
    }

    function control() {
        if ($('#CarID').val() != "") {
            $('#CustName').attr("disabled", "disabled");
            $('#SelRoomID').attr("disabled", "disabled");
            $('#RoomSign').attr("disabled", "disabled");
        }
        else {
            $('#CustName').removeAttr("disabled");
            $('#SelRoomID').removeAttr("disabled");
            $('#RoomSign').removeAttr("disabled");
        }
        if ($("#hiOPType").val() == "view") {
            $("#BtnSave").hide();
        }
        else
        {
            $("#BtnSave").show();
        }

    }
</script>
