<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentProcessingVerbalTransmit.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentProcessingVerbalTransmit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>报事转发</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="LastTypeName" name="LastTypeName" runat="server" />
        <input type="hidden" id="LastDealMan" name="LastDealMan" runat="server" />
        <input type="hidden" id="LastDuty" name="LastDuty" runat="server" />
        <input id="IncidentID" name="IncidentID" type="hidden" runat="server" />
        <input id="IncidentPlace" name="IncidentPlace" type="hidden" runat="server" />
        <input id="DrClass" name="DrClass" type="hidden" runat="server" />
        <input id="CommID" name="CommID" type="hidden" runat="server" />




        <input id="hiplace" name="hiplace" type="hidden" runat="server" />
        <input type="hidden" id="hiIncidentIDs" name="IncidentAssignedIncidentIDs" />

        <input id="BigCorpTypeID" name="BigCorpTypeID" type="hidden" runat="server" />
        <input id="BigCorpTypeCode" name="BigCorpTypeCode" type="hidden" runat="server" />
        <input id="hiIsTouSu" name="hiIsTouSu" type="hidden" runat="server" />

        <input id="hiReserveDate" name="hiReserveDate" type="hidden" runat="server" />

        <table class="DialogTable" style="line-height: 25px;">
            <tr>
                <td class="TdTitle">转发情况</td>
                <td class="TdContent" colspan="3">
                    <textarea id="TransmitReasons" name="TransmitReasons" rows="4" class="easyui-validatebox" style="height: 100px; width: 95%" data-options="required:true" cols="20" runat="server"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">报事责任</td>
                <td class="TdContentSearch">
                    <input type="radio" name="IncidentDuty" id="Property" value="物业类" runat="server" />物业类
                    <input type="radio" name="IncidentDuty" id="land" value="地产类" runat="server" />地产类                    
                  <input id="Duty" name="Duty" value="物业类" type="hidden" runat="server" />

                </td>
                <td class="TdTitle">报事类别</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-searchbox" data-options="required:true,editable:false" id="TypeName" name="TypeName"
                        style="width: 76%;" searcher="SelTypeName" runat="server" />
                    <input type="hidden" id="TypeID" name="TypeID" runat="server" />
                    <input type="hidden" id="TypeCode" name="TypeCode" runat="server" />
                    <input type="hidden" id="IsTousu" name="IsTousu" runat="server" />
                    <input type="hidden" id="DealLimit" name="DealLimit" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">责任人</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-searchbox" style="width: 76%;" data-options="required:true,editable:false" id="DealMan" name="DealMan" searcher="SelDealMan" runat="server" />
                    <input id="UserCodes" type="hidden" name="UserCodes" runat="server" />
                </td>
                <td class="TdTitle Coorganizer">协助人</td>
                <td class="TdContentSearch Coorganizer">
                    <input id="CoorganizerUserList" name="CoorganizerUserList" runat="server" searcher="ExaCoorganizer" class="easyui-searchbox" options="ditable:false" style="width: 76%;" />
                    <input id="DealManCheckedUserLists" type="hidden" name="DealManCheckedUserLists" runat="server" disabled readonly="readonly" runat="server" />
                    <input id="CoorganizerUser" type="hidden" name="CoorganizerUser" runat="server" />
                    <input id="CoorganizerUserCode" type="hidden" name="CoorganizerUserCode" runat="server" />
                </td>
            </tr>
            <tr>

                <td class="TdTitle">转发人</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="TransmitUserName" readonly name="TransmitUserName" type="text" runat="server" />
                    <input id="TransmitUserCode" name="TransmitUserCode" type="hidden" runat="server" />
                </td>
                <td class="TdTitle">转发时间</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="TransmitDateTime" readonly name="TransmitDateTime" runat="server" />
                </td>
            </tr>

            <tr>
                <td style="text-align: center; padding-top: 10px;" colspan="4">
                    <input class="button" type="button" value="保存" id="btnSave" name="btnSave" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="button" id="btnReturn" type="button" value="放弃返回" name="btnReturn" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<script type="text/javascript">
    $(function () {
        $(":radio").click(function () {
            $('#Duty').val($(this).val());
            $("#TypeName").searchbox("setValue", '');
            $("#TypeID").val('');
            $("#TypeCode").val('');
            $("#DealMan").searchbox("setValue", '');
            $("#UserCodes").val('');
        });
    });

    function Int() {

        var duty = $("#Duty").val();
        $(":radio[name='IncidentDuty'][value='" + duty + "']").prop("checked", "checked");
        //alert($("#BigCorpTypeID").val());
        //alert($("#BigCorpTypeCode").val());

    }

    Int();

    function SelDealMan() {
        if ($("#TypeName").searchbox('getValue') == "") {
            HDialog.Info('请选择报事类别');
        }
        else {

            var typeID = $("#TypeID").val();
            if (typeID.indexOf(',') == 0) {
                typeID = typeID.substring(1, typeID.length);
            }
            if (typeID.lastIndexOf(',') == typeID.length - 1) {
                typeID = typeID.substring(0, typeID.length - 1);
            }
            // alert(typeID);
            HDialog.Open('640', '480', '../DialogNew/IncidentDealMan.aspx?BigCorpTypeID=' + typeID + "&IsTransmit=0&IncidentID=" + $("#IncidentID").val(), '选择处理人员', false, function callback(_Data) {
                var arrRet = _Data.split('\t');
                $("#DealMan").searchbox("setValue", arrRet[1]);
                $("#UserCodes").val(arrRet[0]);
            });
        }
    }

    function ExaCoorganizer() {
        if ($("#TypeName").searchbox('getValue') == "") {
            HDialog.Info('请选择报事类别');
        }
        else {
            var BigCorpTypeID = $("#TypeID").val();
            if (BigCorpTypeID.indexOf(',') == 0) {
                BigCorpTypeID = BigCorpTypeID.substring(1, BigCorpTypeID.length);
            }
            if (BigCorpTypeID.lastIndexOf(',') == BigCorpTypeID.length - 1) {
                BigCorpTypeID = BigCorpTypeID.substring(0, BigCorpTypeID.length - 1);
            }
            HDialog.Open('740', '480', '../DialogNew/IncidentDealManChecked.aspx?IsTransmit=0&BigCorpTypeID=' + BigCorpTypeID + '&CheckedUserLists=' + $("#DealManCheckedUserLists").val() + '&IncidentID=' + $("#IncidentID").val(), '选择协助人', false,
                function callback(_Data) {
                    $("#DealManCheckedUserLists").val(_Data);
                    var arrRet = _Data.split(',');
                    var username = "";
                    var usercode = "";
                    for (var i = 0; i < arrRet.length; i++) {
                        if (arrRet[i] != '') {
                            username += arrRet[i].split('|')[1] + ",";
                            usercode += arrRet[i].split('|')[0] + ",";
                        }
                    }
                    if (username != "") {
                        username = username.substring(0, username.length - 1);
                        usercode = usercode.substring(0, usercode.length - 1);
                    }
                    $("#CoorganizerUserCode").val(usercode);
                    $("#CoorganizerUser").val(username);
                    //$("#CoorganizerUserList").val(username);
                    $("#CoorganizerUserList").searchbox("setValue", username);
                    return true;
                });
        }
    }

    function SelTypeName() {
        var duty = $("#Duty").val();
        //var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlg.aspx";
        //if (duty == "地产类") {
        //    UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlgLazyRadioLoad.aspx";
        //}
        //HDialog.Open('800', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=' + $("#DrClass").val() + '&Duty=' + duty + '&IsCheck=1&IsEdit=true&IncidentPlace=', '选择报事类别', false, function callback(_Data) {
        HDialog.Open('800', '500', '../DialogNew/NewCorpIncidentTypeBigDlg.aspx?ClassID=1&Duty=' + duty + '&IsCheck=1&IsEdit=true', '选择报事类别', false, function callback(_Data) {
            var arrRet = JSON.parse(_Data);
            //alert(arrRet.code);
            $("#TypeID").val(arrRet.id);
            $("#TypeName").searchbox("setValue", arrRet.TypeName);
            $('#TypeCode').val(arrRet.code);
            $("#IsTousu").val(arrRet.IsTouSu);
            $("#BigCorpTypeCode").val(arrRet.code);
            if (IncidentPlace.value == '户内') {
                $("#DealLimit").val(arrRet.DealLimit);
            } else if (IncidentPlace.value == '公区') {
                $("#DealLimit").val(arrRet.DealLimit2);
            }

            //检查是否具有分派权限
            $.tool.DataGet('IncidentCheckPost', 'CheckIncidentTypeAssignedPost', 'BigCorpTypeID=' + arrRet.id,
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "false") {
                        $('.Coorganizer').hide();
                    } else {
                        $('.Coorganizer').show();
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });

        });
    }


    $("#btnReturn").click(function () {
        HDialog.Close();
    });

    $("#btnSave").click(function () {
        var tranReasons = $('#TransmitReasons').val();
        if (!tranReasons) {
            HDialog.Info('请输入转发情况');
            return;
        }
        if (tranReasons.length > 500) {
            HDialog.Info('转发情况最多只能输入500个字');
            return;
        }
        var typename = $('#TypeName').searchbox('getValue');
        if (!typename) {
            HDialog.Info('报事类别不能为空');
            return;
        }
        var dealMan = $('#DealMan').searchbox('getValue');
        if (!dealMan) {
            HDialog.Info('责任人不能为空');
            return;
        }
        //查询之前是否有转发记录
        $.tool.DataPost('IncidentProcessingNew', "tranbookVerification", $('#frmForm').serialize(),
            function Init() {
            },
            function callback(_Data) {
                var data = _Data.split('|');
                if (data[0] == "true") {
                    if (data[1] != undefined && data[1] != "" && data[1].length > 0) {
                        if (confirm(data[1]) == false) {
                            return false;
                        }
                    }
                    VerbalTransmit();
                }
                else {
                    HDialog.Info(data[1]);
                    return false;
                }
            },
            function completeCallback() {
            },
            function errorCallback() {

            });

    });
    ///验证是否有转发记录
    function VerbalTransmit() {
        $.tool.DataPost('IncidentProcessingNew', "VerbalTransmit", $('#frmForm').serialize(),
            function Init() {
            },
            function callback(_Data) {
                var data = _Data;
                if (data == "true") {
                    HDialog.Info('转发成功');
                    HDialog.Close('1');
                }
                else if (data == "false1") {
                    HDialog.Info('该报事已在其他地方处理完结，不能转为书面报事');
                    HDialog.Close('1');
                } else {
                    HDialog.Info('转发失败');
                }
            },
            function completeCallback() {
            },
            function errorCallback() {

            });
    }
</script>
