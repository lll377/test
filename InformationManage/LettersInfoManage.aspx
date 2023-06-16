<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LettersInfoManage.aspx.cs" Inherits="M_Main.HouseInfoManage.LettersInfoManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script language="javascript" src="../jscript/ajax.js"></script>
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
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style>
        body {
            overflow-y: scroll;
        }
    </style>
</head>
<body>
    <form id="LettersForm" method="post" runat="server">
        <table class="DialogTable" id="Table1">
            <tr>
                <td colspan="4"></td>
            </tr>
            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContentSearch">
                    <input id="CustName" searcher="SelCust" name="CustName" class="easyui-searchbox" data-options="editable:false,required:true" runat="server" />
                    <input id="CustID" style="width: 8px; height: 19px" type="hidden"  name="CustID" runat="server" />
                    <input id="hiCustName" style="width: 12px; height: 19px" type="hidden"  name="hiCustName" runat="server" />
                </td>
                <td class="TdTitle">可选房号</td>
                <td class="TdContentSearch">
                    <select id="SelRoomID" onchange="javascript:SelRoomID_OnChange();" class="easyui-combobox" paneimaxheight="100px"
                            data-options="editable:false,panelHeight:'auto'" style="width: 145px" name="SelRoomID" runat="server">
                        <option selected="selected"></option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle">房屋名称</td>
                <td class="TdContentSearch">
                    <input id="RoomSign" class="easyui-searchbox" searcher="SelRoom" data-options="editable:false,required:true" name="RoomSign" runat="server" />
                    <input id="RoomID" style="width: 8px; height: 22px" type="hidden"  name="RoomID" runat="server" />
                    <input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"  name="hiRoomSign" runat="server" />
                </td>
                <td class="TdTitle" style="text-align: center;">发函时间</td>
                <td class="TdContentSearch">
                    <input type="text" id="LetterTime" name="LetterTime" class="Wdate easyui-validatebox"  data-options="required:true"  runat="server" onclick="WdatePicker()" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">函件类型</td>
                <td class="TdContentSearch">
                    <select name="LetterType" id="LetterType"  class="easyui-combobox"  paneimaxheight="100px"
                            data-options="editable:false,panelHeight:'auto',required:true"  style="width: 145px" runat="server">
                    </select>
                </td>
                <td class="TdTitle">发函机构</td>
                <td class="TdContentSearch">
                    <input type="text" id="LetterMechanism" class="easyui-validatebox" data-options="required:true" name="LetterMechanism" runat="server" />
                    <input type="hidden" id="LettersID" name="LettersID" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">发函人/单位</td>
                <td class="TdContentSearch">
                    <input type="text" id="SentPeople" class="easyui-validatebox" data-options="required:true" name="SentPeople" runat="server" />
                </td>
                <td class="TdTitle">收函人</td>
                <td class="TdContentSearch">
                    <input type="text" id="LetterCollector" class="easyui-validatebox" data-options="required:true" name="LetterCollector" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">收函地址</td>
                <td class="TdContentSearch">
                    <input type="text" id="LetterAddress" class="easyui-validatebox" data-options="required:true" name="LetterAddress" runat="server" />
                </td>
                <td class="TdTitle">发函缘由</td>
                <td class="TdContentSearch">
                    <select name="LetterReason" id="LetterReason" class="easyui-combobox" paneimaxheight="100px"
                            data-options="editable:false,panelHeight:'auto'"  style="width: 145px" runat="server">
                        <option value="欠费催缴">欠费催缴</option>
                        <option value="违章告知">违章告知</option>
                        <option value="侵权告知">侵权告知</option>
                        <option value="其他">其他</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle" style="text-align: center;">函号</td>
                <td class="TdContentSearch">
                    <input type="text" id="LetterNo" name="LetterNo" runat="server" />
                </td>
                <td class="TdTitle" style="text-align: center;">金额</td>
                <td class="TdContentSearch">
                    <input type="text" id="Amounts" name="Amounts" class="easyui-numberbox" precision="2" runat="server" />元
                </td>
            </tr>
            <tr>
                <td class="TdTitle" style="text-align: center;">函件简要内容与要求</td>
                <td colspan="3">
                    <textarea id="Contents" name="Contents" runat="server" style="width: 84%;"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle" style="text-align: center;">承办人</td>
                <td class="TdContentSearch">
                    <input type="text" id="Undertaker" name="Undertaker" runat="server" />
                </td>
                <td class="TdTitle" style="text-align: center;">函件结果</td>
                <td class="TdContentSearch" colspan="3">
                    <select name="LetterResult" id="LetterResult" class="easyui-combobox" paneimaxheight="100px"
                            data-options="editable:false,panelHeight:'auto'"  style="width: 145px" runat="server">
                        <option value="已签收">已签收</option>
                        <option value="退回">退回</option>
                        <option value="其他">其他</option>
                    </select>
                </td>
            </tr>

        </table>

        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 60px; line-height: 20px; background-color: #f5f5f5; margin-right: 45px;">
            <table class="DialogTable" id="Table6">
                <tr>
                    <td style="text-align: center;" class="DialogTdSubmit">
                        <input class="button" id="btnSave" type="button" value="保存" name="btnSave" runat="server" />
                        <input class="button" id="btnReturn" type="button" value="关闭" name="btnFilter" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script>

    $(function () {

        $("#btnReturn").click(function () {
            close("1");
        })

        //保存
        $("#btnSave").click(function () {
            $.tool.DataPostChk('LettersForm', 'LettersInfo', 'Insert', $('#LettersForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    var data = _Data.split("|");
                    if (data[0] == "true") {
                        HDialog.Info(data[1]);
                        close("1");
                    }
                    else {
                        HDialog.Info(data[1]);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {

                })
        })
    })

    function close(callparm) {
        HDialog.Close(callparm);
    }

    function SelRoomID_OnChange() {
        LettersInfoManage.RoomID.value = LettersInfoManage.SelRoomID.options[LettersInfoManage.SelRoomID.selectedIndex].value;
        LettersInfoManage.RoomSign.value = LettersInfoManage.SelRoomID.options[LettersInfoManage.SelRoomID.selectedIndex].text;
    }

    function SelCust() {
        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

        var w = 800;
        var h = 400;
        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);
            $('#EntrustMobile').val(data.MobilePhone);
            $('#EntrustCustID').val(data.CustName);

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

    function SelSigong() {
        $('#ConsUnit').searchbox("setValue", '');
        $('#UnitID').val('');
        var w = 700;
        var h = 400;
        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#ConsUnit').searchbox("setValue", data.CustName);
            $('#UnitID').val(data.CustID);
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
        HDialog.Open(w + 170, h + 170, conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').searchbox("setValue", data.RoomName);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);
            $('#RoomID').val(data.RoomID);
            $('#BuildArea').val(data.BuildArea);
            $('#CalcArea').val(data.BuildArea);
        });

    }

</script>
