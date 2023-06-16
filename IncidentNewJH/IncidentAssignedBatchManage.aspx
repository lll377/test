<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentAssignedBatchManage.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentAssignedBatchManage" %>

<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title></title>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framedialog_fourcol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>



</head>
<body onload="Win_OnLoad()" style="overflow-y: auto">
    <form id="frmForm" runat="server">
        <input id="IncidentID" size="1" type="hidden" name="IncidentID" runat="server">
        <input id="IncidentMan" type="hidden" name="IncidentMan" runat="server">
        <input id="hiplace" name="hiplace" type="hidden" runat="server" />
        <input type="hidden" id="hiIncidentIDs" name="IncidentAssignedIncidentIDs" />

        <input id="BigCorpTypeID" name="BigCorpTypeID" type="hidden" runat="server" />
        <input id="BigCorpTypeCode" name="BigCorpTypeCode" type="hidden" runat="server" />
        <input id="hiIsTouSu" name="hiIsTouSu" type="hidden" runat="server" />

        <input style="width: 8px; height: 21px" id="PrintParms" size="1" type="hidden" name="PrintParms" runat="server">
        <input id="IncidentNum" name="IncidentNum" type="hidden" runat="server" />
        <input id="IncidentContent" name="IncidentContent" type="hidden" runat="server" />
        <input id="CoordinateNum" name="CoordinateNum" type="hidden" runat="server" />
        <input id="DealLimit" name="DealLimit" type="hidden" runat="server" />
        <input type="hidden" id="AssistPersonIDs" name="AssistPersonIDs" runat="server" />
        <input type="hidden" id="AssistNames" name="AssistNames" runat="server" />
        <table id="Header_TableMain" class="DialogTable" style="width: 100%; height: 100%;">
            <tr>
                <td valign="top">
                    <table style="width: 100%; height: 100%; line-height: 30px">
                        <tbody>
                            <tr>
                                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">分派(快速分派)</td>
                            </tr>
                            <tr>
                                <td class="TdTitle">报事责任</td>
                                <td class="TdContent">
                                    <input id="IncidentP1" type="radio" value="物业类" name="IncidentP" runat="server" />物业类
                                    <input id="IncidentP2" type="radio" value="地产类" name="IncidentP" runat="server" />地产类
                                    <input id="Duty" type="hidden" name="Duty" runat="server" />
                                </td>
                                <td class="TdTitle">报事类别</td>
                                <td class="TdContentSearch">
                                    <input type="text" class="easyui-searchbox" style="width: 76%" id="TypeName" name="TypeName" data-options="required:true,editable:false"
                                        searcher="SelTypeName" runat="server" />
                                    <input style="width: 8px; height: 22px" id="TypeID" class="easyui-validatebox" size="1" type="hidden" name="TypeID" runat="server">
                                    <input class="easyui-validatebox" id="hiTypeName" style="height: 22px; width: 8px" type="hidden" size="1" name="hiCostName" runat="server">
                                    <input id="TypeCode" name="TypeCode" type="hidden" />
                                </td>
                            </tr>

                            <tr>

                                <td class="TdTitle">分派人</td>
                                <td class="TdContent">
                                    <input class="easyui-validatebox" id="DispMan" name="DispMan" readonly="readonly" runat="server" />
                                </td>
                                <td class="TdTitle">分派时间</td>
                                <td class="TdContent">
                                    <input class="easyui-validatebox" id="DispDate" name="DispDate" readonly="readonly" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">责任人</td>
                                <td class="TdContentSearch">
                                    <input type="text" class="easyui-searchbox" style="width: 76%;" id="DealMan" name="DealMan" data-options="required:true, editable:false"
                                        searcher="SelDealMan" runat="server" />
                                    <input style="width: 16px; height: 22px" id="UserCodes" size="1" type="hidden" name="UserCodes" runat="server" />
                                </td>
                                <td class="TdTitle">协助人</td>
                                <td class="TdContent">
                                    <input name="CoorganizerUserList" type="text" id="CoorganizerUserList" onclick="ExaCoorganizer()" style="width: 76%;" runat="server" />
                                    <input name="DealManCheckedUserLists" type="hidden" id="DealManCheckedUserLists" disabled="disabled" readonly="readonly" runat="server" />
                                    <input name="CoorganizerUser" type="hidden" id="CoorganizerUser" runat="server" />
                                    <input name="CoorganizerUserCode" type="hidden" id="CoorganizerUserCode" runat="server" />

                                </td>
                            </tr>

                            <tr>
                                <td class="TdTitle" rowspan="2">
                                    <input id="DispRemarksTitle" style="height: 22px; width: 32px" type="hidden" size="1" name="DispRemarksTitle" runat="server">分派备注:</td>
                                <td class="TdContent" rowspan="2" colspan="4">
                                    <textarea style="width: 90%; height: 45px" class="easyui-validatebox" id="DispRemarks" name="DispRemarks"
                                        runat="server"></textarea>
                                </td>
                                <%--   <td class="TdTitle"></td>
                                  <td class="TdContent" ></td>--%>
                            </tr>

                            <tr>
                                <td class="TdContent" style="width: 80px; height: 40px"></td>
                            </tr>
                            <tr>
                                <td colspan="4" class="DialogTdSubmit" style="text-align: center">
                                    <input type="button" class="button" value="保存" id="BtnSave" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input class="button" type="button" value="保存并打印" onclick="javascript: printCheckData();" runat="server" />
                                    <input id="BtnSapt" class="button" visible="true" style="display: none;" value="保存并打印" type="button" name="BtnSapt" runat="server">&nbsp;&nbsp;&nbsp;
                                    <input type="button" class="button" value="放弃返回" id="BtnReturn" />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </td>
            </tr>
        </table>



        <script type="text/javascript">

            function Win_OnLoad() {
                var strPrintParms = getObject("PrintParms").value;

                if (strPrintParms != "") {
                    //alert(strPrintParms);			
                    showOperatWin(strPrintParms);

                    getObject("PrintParms").value = "";
                    HDialog.Close(1);
                }
            }



            $("#BtnSave").click(function () {
                if ($("#DealMan").val() == "") {
                    HDialog.Info("请选择责任人!");
                    return false;
                }
                $.tool.DataPostAsync('IncidentAssignedNew', 'batch', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            parent.layer.alert('分派成功');
                            Cache.SetData("IncidentAssignedIDs", "");
                            HDialog.Close(1);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    }, false);
            });

            function printCheckData() {
                if ($("#DealMan").val() == "") {
                    HDialog.Info("请选择责任人!");
                    return false;
                }

                $("#BtnSapt").click();
                $("#btnSave").attr("disabled", "disabled");
                $("#BtnSapt").attr("disabled", "disabled");
                return true;

            }


            $("#BtnReturn").click(function () {
                close();
            });

            function close() {
                Cache.SetData("IncidentAssignedIDs", "");
                HDialog.Close();
            }

            function InitFunction() {
                var h = $(window).height() - 420;
                $("#TableContainer").css("height", h + "px");
                $("#hiIncidentIDs").val(Cache.GetData("IncidentAssignedIDs"));
            }
            InitFunction();


            function Int() {

                var duty = $("#Duty").val();
                $(":radio[name='IncidentP'][value='" + duty + "']").prop("checked", "checked");

                console.log(duty);

                if ($('#AssistNames').val() != '') {
                    $("#CoorganizerUser").val($('#AssistNames').val());
                    $("#CoorganizerUserList").val($('#AssistNames').val());
                }
                if ($('#AssistPersonIDs').val() != '') {
                    $("#CoorganizerUserCode").val($('#AssistPersonIDs').val());
                }

            }

            Int();

            $(function () {
                $("#IncidentP1").change(function () {

                    $("#TypeID").val('');
                    $("#hiTypeName").val('');
                    $("#TypeName").searchbox("setValue", '');
                    $('#TypeCode').val('');

                    $("#DealMan").searchbox("setValue", '');
                    $("#UserCodes").val('');

                    console.log($("#IncidentP1").is('checked'));
                    if ($("#IncidentP2").is('checked')) {
                        $("#Duty").attr('value', $("#IncidentP2").val())

                        //console.log('1');
                        //console.log($("#Duty").val());
                    }
                    else {
                        $("#Duty").attr('value', $("#IncidentP1").val())
                        //console.log('1111');
                        //console.log($("#Duty").val());
                    }

                });

                $("#IncidentP2").change(function () {

                    $("#TypeID").val('');
                    $("#hiTypeName").val('');
                    $("#TypeName").searchbox("setValue", '');
                    $('#TypeCode').val('');

                    $("#DealMan").searchbox("setValue", '');
                    $("#UserCodes").val('');
                    if ($("#IncidentP1").is('checked')) {
                        $("#Duty").attr('value', $("#IncidentP1").val())

                        //console.log('2');
                        //console.log($("#Duty").val());
                    }
                    else {
                        $("#Duty").attr('value', $("#IncidentP2").val())


                        //console.log('2222222');
                        //console.log($("#Duty").val());
                    }


                });

            })



            function SelTypeName() {
                var duty = $("input[name='IncidentP']:checked").val();
                if ($("#hirbplace").val() == 1 && $("#RoomID").val() == '') {
                    HDialog.Info('请先选择房屋编号');
                }
                else {
                    var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlg.aspx";
                    if (duty == "地产类") {
                        UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlgLazyRadioLoad.aspx";
                    }
                    HDialog.Open('800', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=1&Duty=' + duty + '&IsCheck=1&IsBigClass=1&IsEdit=true&IncidentPlace=' + $("#hirbplace").val(), '选择报事类别', false, function callback(_Data) {
                        //HDialog.Open('800', '500', '../DialogNew/NewCorpIncidentTypeBigDlg.aspx?ClassID=1&Duty=' + duty + '&IsCheck=1&IsEdit=true', '选择报事类别', false, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        //alert(arrRet.FullTypeName);
                        $("#TypeID").val(arrRet.id);
                        $("#hiTypeName").val(arrRet.TypeName);
                        $("#TypeName").searchbox("setValue", arrRet.TypeName);
                        $('#TypeCode').val(arrRet.code);
                        //$("#RatedWorkHour").val(arrRet.RatedWorkHour);
                        //$("#KPIRatio").val(arrRet.KPIRatio);
                        $("#DealLimit").val(arrRet.DealLimit);

                        $("#BigCorpTypeID").val(arrRet.id);
                        $('#BigCorpTypeCode').val(arrRet.code);
                        //$("#BigTypeName").searchbox("setValue", arrRet.TypeName);
                        $("#DealMan").searchbox("setValue", '');
                        $("#UserCodes").val('');


                    });
                }
            }

            function SelDealMan() {
                if ($("#TypeName").searchbox('getValue') == "") {
                    HDialog.Info('请选择报事类别');
                }
                else {
                    var BigCorpTypeID = $("#BigCorpTypeID").val();
                    //alert(BigCorpTypeID);
                    if (BigCorpTypeID.indexOf(',') == 0) {
                        BigCorpTypeID = BigCorpTypeID.substring(1, BigCorpTypeID.length);
                    }
                    if (BigCorpTypeID.lastIndexOf(',') == BigCorpTypeID.length - 1) {
                        BigCorpTypeID = BigCorpTypeID.substring(0, BigCorpTypeID.length - 1);
                    }
                    HDialog.Open('640', '480', '../DialogNew/IncidentDealMan.aspx?IsAssignedBatch=1&BigCorpTypeID=' + BigCorpTypeID, '选择责任人', false, function callback(_Data) {
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
                    var BigCorpTypeID = $("#BigCorpTypeID").val();
                    if (BigCorpTypeID.indexOf(',') == 0) {
                        BigCorpTypeID = BigCorpTypeID.substring(1, BigCorpTypeID.length);
                    }
                    if (BigCorpTypeID.lastIndexOf(',') == BigCorpTypeID.length - 1) {
                        BigCorpTypeID = BigCorpTypeID.substring(0, BigCorpTypeID.length - 1);
                    }
                    HDialog.Open('740', '480', '../DialogNew/IncidentDealManChecked.aspx?IsAssignedBatch=1&BigCorpTypeID=' + BigCorpTypeID + '&CheckedUserLists=' + $("#DealManCheckedUserLists").val(), '选择协助人', false,
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
                            $("#CoorganizerUserList").val(username);
                            return true;
                        });
                }
            }
        </script>

    </form>
</body>
</html>
