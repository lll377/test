<%@ Page Language="c#" CodeBehind="AdvertisingHandManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.AdvertisingNew.AdvertisingHandManage" %>

<!DOCTYPE HTML  >
<html>
<head>
    <title>AdvertisingHandManage</title>
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
    <script language="javascript">
        function CheckData() {
            if (AdvertisingHandManage.CustName.value == "") {
                HDialog.Info("请选择客户名称,此项不能为空!");
                AdvertisingHandManage.CustName.focus();
                return false;
            }
            return true;
        }

        function btnSelRoom_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/RoomDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);

            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                AdvertisingHandManage.RoomID.value = varObjects[0];
                AdvertisingHandManage.RoomSign.value = varObjects[2];
                AdvertisingHandManage.MobilePhone.value = varObjects[4];

                AdvertisingHandManage.CustID.value = varObjects[1];
                AdvertisingHandManage.CustName.value = varObjects[3];
                //alert(varReturn);

                return true;
            }

            return false;
        }

        function btnSelCust_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/CustDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);
            //alert("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                AdvertisingHandManage.CustID.value = varObjects[0];
                AdvertisingHandManage.CustName.value = varObjects[1];
                AdvertisingHandManage.MobilePhone.value = varObjects[3];

                AdvertisingHandManage.RoomSign.value = "";
                AdvertisingHandManage.RoomID.value = "";

                return true;
            }

            return false;
        }

        function SelRoomID_OnChange() {
            AdvertisingHandManage.RoomID.value = AdvertisingHandManage.SelRoomID.options[AdvertisingHandManage.SelRoomID.selectedIndex].value;
            AdvertisingHandManage.RoomSign.value = AdvertisingHandManage.SelRoomID.options[AdvertisingHandManage.SelRoomID.selectedIndex].text;

        }
        function WinLoad() {
            var strPrintParms = getObject("PrintParms").value;
            if (strPrintParms != "") {
                showOperatWin(strPrintParms);

                getObject("PrintParms").value = "";
            }
        }
        //-->
    </script>
</head>
<body onload="WinLoad()">
    <form id="AdvertisingHandManage" method="post" runat="server">
        <input id="hiOPType" type="hidden" size="1" name="hiOPType" runat="server">
        <input id="HandID" type="hidden" size="1" name="HandID" runat="server">
        <input id="AdvertisingID" type="hidden" size="1" name="AdvertisingID" runat="server">
        <input id="RegionalID" type="hidden" size="1" name="RegionalID" runat="server">
        <input id="PrintParms" type="hidden" size="1" name="PrintParms" runat="server">

        <table class="DialogTable" style="width:100%;">
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">广告位信息</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">广告位区域</td>
                <td class="TdContent">
                    <asp:Label ID="RegionalName" runat="server"></asp:Label></td>
                <td class="TdTitle">广告位编号</td>
                <td class="TdContent">
                    <asp:Label ID="AdvertisingSign" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">广告位名称</td>
                <td class="TdContent">
                    <asp:Label ID="AdvertisingName" runat="server"></asp:Label></td>
                <td class="TdTitle">广告位尺寸</td>
                <td class="TdContent">
                    <asp:Label ID="AdvertisingSize" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">广告位面积</td>
                <td class="TdContent">
                    <asp:Label ID="AdvertisingArea" runat="server"></asp:Label></td>
                <td class="TdTitle">收费标准</td>
                <td class="TdContent">
                    <asp:Label ID="StanName" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">广告位办理</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" id="CustName" data-options="editable:false" name="CustName" searcher="SelCust" runat="server" />

                    <input id="CustID" type="hidden" size="1" name="CustID" runat="server">
                </td>
                <td class="TdTitle">可选房号</td>
                <td class="TdContentSearch">
                    <select id="SelectRoomID" class="easyui-combobox" name="SelectRoomID" data-options="editable:false,panelHeight: '100px'" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                        <option selected></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" id="RoomSign" data-options="editable:false" name="RoomSign" searcher="SelRoom" runat="server" />

                    <input id="RoomID" type="hidden" size="1" name="RoomID" runat="server">
                </td>
                <td class="TdTitle">联系电话</td>
                <td class="TdContent">
                    <input id="MobilePhone" style="width: 140px;" type="text" name="MobilePhone" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">开始时间</td>
                <td class="TdContentSearch">
                    <input id="BeginDate" class="easyui-datebox" data-options="editable:false" type="text" name="BeginDate" runat="server"></td>
                <td class="TdTitle">结束时间</td>
                <td class="TdContentSearch">
                    <input id="EndDate" class="easyui-datebox" data-options="editable:false" type="text" name="EndDate" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">经办人</td>
                <td class="TdContent">
                    <input id="AdmiMan" style="width: 140px;" type="text" name="AdmiMan" runat="server"></td>
                <td class="TdTitle">办理时间</td>
                <td class="TdContentSearch">
                    <input id="AdmiDate" class="easyui-datebox" data-options="editable:false" type="text" name="AdmiDate" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle" colspan="4"></td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <input class="button" id="btnSave" onclick="javascript: if (CheckData() == false) return false;"
                        type="button" value="保存" name="btnFilter" runat="server">             
                    <input class="button" id="BtnPrint" type="button" style="width:140px;"
                        value="打印广告办理登记表" name="BtnPrint" runat="server">
                    <input class="button" id="btnReturn" type="button" value="放弃返回" name="btnFilter" runat="server">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
<script type="text/javascript">
    //获取用户的联系电话
    $(function () {


        var type = $("#hiOPType").val();
        if(type == "edit") {
            $.ajax({
                type: "Post",
                url: "AdvertisingHandManage.aspx/GetMobilePhone",
                data: "{'strCustID':'" + $("#CustID").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#MobilePhone").val(data.d);
                },
                error: function (err) {
                    $("#MobilePhone").val("");
                }
            });

            $.tool.DataGet('Choose', 'CustRoomSigns', $('#AdvertisingHandManage').serialize(),
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
                        $('#SelectRoomID').combobox('setValue', $("#RoomID").val());
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
            
        }

    });
    var w = $(window).width();
    var h = $(window).height();
    $("#btnReturn").click(function () {
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
          $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);

            $('#CustID').val(data.CustID);

            //获取用户的联系电话
            $.ajax({
                type: "Post",
                url: "AdvertisingHandManage.aspx/GetMobilePhone",
                data: "{'strCustID':'" + data.CustID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#MobilePhone").val(data.d);
                },
                error: function (err) {
                    $("#MobilePhone").val("");
                }
            });

            $.tool.DataGet('Choose', 'CustRoomSigns', $('#AdvertisingHandManage').serialize(),
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
          $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/RoomDlg.aspx";

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
        $(this).css("width", document.body.clientWidth * 0.19 * 0.73);
    });

</script>
