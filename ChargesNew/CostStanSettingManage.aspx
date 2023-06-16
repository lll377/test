<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostStanSettingManage.aspx.cs" Inherits="M_Main.ChargesNew.CostStanSettingManage" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

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

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

</head>
<body>
    <form id="FrmForm">
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
        <input id="IID" type="hidden" name="IID" runat="server" />
        <table class="DialogTable">
            <tr>
                <td class="TdTitle">客户名称
                </td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" id="CustName" maxlength="50" name="CustName" searcher="SelCust" data-options="editable:false" runat="server" />
                    <input type="hidden" name="CustID" id="CustID" runat="server" />
                </td>
                <td class="TdTitle">可选房号
                </td>
                <td class="TdContentSearch">
                    <select id="SelectRoomID" class="easyui-combobox" data-options="editable:false" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                        <option selected></option>
                    </select>
                </td>
            </tr>

            <tr>
                <td class="TdTitle">房屋编号
                </td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" id="RoomSign" maxlength="50" name="RoomSign" searcher="SelRoom" data-options="editable:false" runat="server" />
                    <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                </td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
            </tr>

            <tr>
                <td class="TdTitle">费用名称</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" searcher="SelCostStan" maxlength="50" data-options="editable:false" id="CostName" name="CostName" runat="server" />
                    <input type="hidden" name="CostID" id="CostID" runat="server" /></td>
                <td class="TdTitle">收费标准</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="StanName" maxlength="50" readonly name="StanName" runat="server" />
                    <input type="hidden" name="StanID" id="StanID" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">计算方式</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="StanFormulaName" maxlength="50" readonly name="StanFormulaName" runat="server" />
                    <input type="hidden" id="StanFormula" maxlength="50" name="StanFormula" runat="server" />
                </td>
                <td class="TdTitle">计费周期
                </td>
                <td class="TdContent">
                    <select id="ChargeCycle" name="ChargeCycle" class="easyui-validatebox" data-options="required:true" runat="server">
                        <option selected></option>
                    </select>
                    <select id="ChargeCycle2" name="ChargeCycle2" class="easyui-validatebox" data-options="required:true" runat="server">
                        <option selected></option>
                    </select>
                    <input id="hiChargeCycle" type="hidden" size="1" name="hiChargeCycle"
                        runat="server" />

                </td>
            </tr>
            <tr>
                <td class="TdTitle">计费方式</td>
                <td class="TdContent">
                    <select id="PayType" name="PayType" runat="server">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle">计费开始日期</td>
                <td class="TdContentSearch">
                    <input id="CalcBeginDate" class="Wdate" onclick="WdatePicker()" name="CalcBeginDate" runat="server" /></td>

            </tr>
            <tr>
                <td class="TdTitle">出租时自动转给租户</td>
                <td class="TdContent">
                    <select id="IsInherit" name="IsInherit" runat="server">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
            </tr>
            <tr id="TrMeter">

                <td class="TdTitle">表计</td>
                <td class="TdContent">
                    <select id="MeterSign" name="MeterSign" runat="server"></select>
                    <select id="MeterSign2" name="MeterSign2" runat="server"></select>

                    <input id="hiMeterSign" size="1" type="hidden" name="hiMeterSign" runat="server" /></td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>

            </tr>
            <tr id="TrBuild" runat="server">
                <td class="TdTitle">建筑面积</td>
                <td class="TdContent">
                    <input id="BuildArea" readonly class="easyui-validatebox" name="BuildArea" runat="server" /></td>
                <td class="TdTitle">计算面积</td>
                <td class="TdContent">
                    <input id="CalcArea" readonly class="easyui-validatebox" name="CalcArea" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="4" class="DialogTdSubmit">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
        <script type="text/javascript">

            function InitFunction() {
                var wi = document.body.clientWidth * 0.3;

                $('#CustName').css("width", wi + 'px');
                $('#RoomSign').css("width", wi + 'px');



                $('#SelectRoomID').css("width", wi + 'px');
                $('#ChargeCycle').css("width", wi + 'px');
                $('#IsInherit').css("width", wi + 'px');
                $('#MeterSign').css("width", wi + 'px');

                $('#CostName').css("width", wi + 'px');
                $('#StanName').css("width", wi + 'px');

                $('#StanFormulaName').css("width", wi * 0.98 + 'px');
                $('#CalcBeginDate').css("width", wi + 'px');
                
                //$('#MeterSign').attr("disabled", "disabled");

                $('#ChargeCycle2').hide();
                $('#MeterSign2').hide();
                if ($('#hiOPType').val() != "update") {

                    $('#TrBuild').hide();
                    $('#TrMeter').hide();
                    $('#ChargeCycle').val('');
                    $('#ChargeCycle2').val('');
                    $('#BuildArea').attr("disabled", "disabled");
                    $('#CalcArea').attr("disabled", "disabled");
                    if ($('#CustID').val() != '') {
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
                                        var CalcArea = varObjects[i].CalcArea;

                                        RoomData.push({ "RoomText": RoomText, "RoomID": RoomID + "|" + Buildarea + "|" + CalcArea });

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
                                                        var buildArea = data[i].RoomID.split("|")[1];
                                                        var calcArea = data[i].RoomID.split("|")[2];
                                                        $('#BuildArea').val(buildArea);
                                                        $('#CalcArea').val(calcArea);
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
                    }
                }
                else {
                    $('#CustName').attr("disabled", "disabled");
                    $('#RoomSign').attr("disabled", "disabled");
                    $('#SelectRoomID').attr("disabled", "disabled");


                    if ($('#StanFormula').val() == "4") {
                        $('#TrBuild').hide();
                        $('#TrMeter').show();
                    }
                    else {
                        $('#TrMeter').hide();
                    }
                }


            }
            InitFunction();


            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/CustDlg.aspx";
                var w = 1000;
                var h = 600;

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
                                    var CalcArea = varObjects[i].CalcArea;

                                    var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;

                                    RoomData.push({ "RoomText": RoomText, "RoomID": RoomID + "|" + Buildarea + "|" + CalcArea });

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
                                                    var buildArea = data[i].RoomID.split("|")[1];
                                                    var calcArea = data[i].RoomID.split("|")[2];
                                                    $('#BuildArea').val(buildArea);
                                                    $('#CalcArea').val(calcArea);
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
            function SelRoom() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/RoomDlg.aspx";

                var w = 1000;
                var h = 600;

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);

                    console.log(data)
                    $('#BuildArea').val(data.BuildArea);
                    $('#CalcArea').val(data.CalcArea);
                });

            }


            function SelCostStan() {
                var CostName = $('#CostName').val();
                var OPType = $('#hiOPType').val();

                if (OPType != "update") {
                    CostName = "";
                }
                var conent = "../DialogNew/StanDlg.aspx?CostName=" + CostName;


                HDialog.Open(800, 600, conent, '费用标准选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    if (data.attributes.SysCostSign == "B0002") {
                        HDialog.Info("车位类的标准请到车位办理去设置！");
                        return;
                    }
                    $('#CostID').val(data.attributes.CostID);
                    $('#CostName').searchbox('setValue', data.attributes.CostName);
                    $('#StanID').val(data.attributes.StanID);
                    $('#StanName').val(data.attributes.StanName);
                    $('#StanFormulaName').val(data.attributes.StanFormulaName);

                    $("#ChargeCycle").find("option").remove();
                    //$('#MeterSign').attr("disabled", "disabled");
                    $('#ChargeCycle2').hide();
                    $('#MeterSign2').hide();

                    var ChargeCycleSel = document.getElementById("ChargeCycle");
                    ChargeCycleSel.options.length = 0;
                    $("#ChargeCycle2").children("option").each(function () {
                        var text = $(this).text();
                        var val = $(this).val();
                        
                        ChargeCycleSel.options[ChargeCycleSel.length] = new Option(text, val);
                    });

                    var MeterSignSel = document.getElementById("MeterSign");
                    MeterSignSel.options.length = 0;
                    $("#MeterSign2").children("option").each(function () {
                        var text = $(this).text();
                        var val = $(this).val();
      
                        MeterSignSel.options[MeterSignSel.length] = new Option(text, val);
                    });

                    if (data.attributes.StanFormula == "20" || data.attributes.StanFormula == "21" || data.attributes.StanFormula == "22"
                        || data.attributes.StanFormula == "23" || data.attributes.StanFormula == "24")

                        for (var i = 12; i > 0; i--) {
                            if (i != 12 && i != 9 && i != 6 && i != 3)
                                document.getElementById("ChargeCycle").options.remove(i);
                        }

                    $("#ChargeCycle").children("option").each(function () {
                        var temp_value = $(this).val();
                        if (temp_value == data.attributes.ChargeCycle) {
                            $(this).attr("selected", "selected");
                        }
                    });
                    if (data.attributes.StanFormula == "4") {

                        $('#MeterSign').removeAttr("disabled");
                        var tt = data.attributes.SysCostSign;
                        if (tt.indexOf('S') > -1) {
                            var slenth = document.getElementById("MeterSign").options.length;
                            var ttype = tt.substr(1, 1);
                            for (var j = slenth - 1; j >= 0; j--) {
                                var mtype = document.getElementById("MeterSign").options[j].value;
                                if (ttype != mtype.substring(0, 1)) {
                                    document.getElementById("MeterSign").options.remove(j);
                                }
                            }
                        }
                    }
                    else {
                        $('#MeterSign').attr("disabled", "disabled");
                    }

                    if (data.attributes.SysCostSign.indexOf('B') > -1) {
                        $('#TrBuild').show();
                        $('#BuildArea').removeAttr("disabled");
                        $('#CalcArea').removeAttr("disabled");
                    }
                    //if (data.attributes.SysCostSign.indexOf('S') > -1)
                    if (data.attributes.StanFormula == "4")
                    {
                        $('#TrMeter').show();
                    }

                    if (OPType == "update") {

                        if (data.attributes.StanFormula != "4") {
                            $('#MeterSign').attr("disabled", "disabled");
                            $("#MeterSign2").attr("disabled", "disabled");
                        }
                        else {
                            $('#MeterSign').removeAttr("disabled");
                             $('#MeterSign2').removeAttr("disabled");
                        }
                    }
                   
                });
                 
               
            }

            $("#BtnSave").click(function () {


                $('#CustName').removeAttr("disabled");
                $('#RoomSign').removeAttr("disabled");
                $('#SelectRoomID').removeAttr("disabled");

                var cmd = $("#hiOPType").val();

                var CustID = $('#CustID').val();
                var RoomID = $('#RoomID').val();
                var CostID = $('#CostID').val();
                var StanID = $('#StanID').val();
                var IsInherit = $('#IsInherit').val();
                var ChargeCycle = $('#ChargeCycle').val();

                var CalcBeginDate = $('#CalcBeginDate').val();
                var MeterSign = $('#MeterSign').val();
                var IID = $('#IID').val();
                var CalcArea = $('#CalcArea').val();
                var PayType = $('#PayType').val();

                if (CustID == "") {
                    HDialog.Info("请选择要设置收费标准的客户");
                }
                else if (CostID == "") {
                    HDialog.Info("请选择要设置收费项目");
                }
                else if (StanID == "") {
                    HDialog.Info("请选择要设置收费标准");
                }
                else if (ChargeCycle == '') {
                    HDialog.Info("请选择计费周期");
                }
                else {

                    var param = "IID=" + IID + "&CustID=" + CustID + "&RoomID=" + RoomID + "&CostID=" + CostID + "&StanID=" + StanID + "&IsInherit=" + IsInherit + "&ChargeCycle=" + ChargeCycle + "&CalcBeginDate=" + CalcBeginDate + "&MeterSign=" + MeterSign + "&CalcArea=" + CalcArea + "&PayType=" + PayType;

                    $.tool.DataPostChk('FrmForm', 'CostStanSetting', cmd, param,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                HDialog.Info('保存成功');


                                CustName = $('#CustName').searchbox('getValue');

                                RoomSign = $('#RoomSign').searchbox('getValue');

                                var str = '1'
                                if (CustID != '');
                                {
                                    str = str + "|" + CustID;
                                }
                                if (RoomID != '');
                                {
                                    str = str + "|" + RoomID;
                                }
                                if (CustName != '');
                                {
                                    str = str + "|" + CustName;
                                }
                                if (RoomSign != '');
                                {
                                    str = str + "|" + RoomSign;
                                }

                                HDialog.Close(str);
                            } else {
                                 HDialog.Info('保存失败');
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {

                        });
                }
            });
            $("#BtnReturn").click(function () {
                HDialog.Close();
            });


        </script>
    </form>
</body>
</html>
