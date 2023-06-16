<%@ Page Language="c#" CodeBehind="PublicMeterManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.PublicMeterManage" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>PublicMeterManage</title>
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
    <script type="text/javascript">
		<!--	
    function CheckData() {
        if (PublicMeterManage.MeterName.value == "") {
            HDialog.Info("请输入表计名称,此项不能为空!");
            PublicMeterManage.MeterName.focus();
            return false;
        }

        if (PublicMeterManage.CostID.value == "") {
            HDialog.Info("请选择费用项目,此项不能为空!");
            PublicMeterManage.btnSelCost.focus();
            return false;
        }
        if (PublicMeterManage.StanID.value == "") {
            HDialog.Info("请选择费用标准,此项不能为空!");
            PublicMeterManage.btnSelStan.focus();
            return false;
        }
        return true;
    }

    function btnSelCost_OnClick() {
        var tmpMeterTypes = "S" + PublicMeterManage.MeterType.value;

        var varReturn;
        varReturn = showModalDlg("../dialog/CorpCommCostDlg.aspx?MeterTypes=" + tmpMeterTypes + "&Ram=" + Math.random(), "", 500, 400);
        //HDialog.Info("["+varReturn+"]");
        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            PublicMeterManage.CostID.value = varObjects[0];
            PublicMeterManage.CostName.value = varObjects[2];
            PublicMeterManage.hiCostName.value = varObjects[2];

            return true;
        }

        return false;
    }

    function btnSelStan_OnClick() {
        var tmpCostID = PublicMeterManage.CostID.value;
        if (tmpCostID == "") {
            HDialog.Info("请选择费用项目,此项不能为空!");
            PublicMeterManage.btnSelCost.focus();
            return false;
        }

        var varReturn;
        varReturn = showModalDlg("../dialog/StanDlg.aspx?CostID=" + tmpCostID, "", 650, 400);
        //HDialog.Info("["+varReturn+"]");
        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            PublicMeterManage.StanID.value = varObjects[0];
            PublicMeterManage.StanName.value = varObjects[4];
            PublicMeterManage.hiStanName.value = varObjects[4];

            return true;
        }

        return false;
    }

    function btnSelCustSigns_OnClick() {
        var varPoolType = PublicMeterManage.PoolType.value;
        if (varPoolType != 4 && varPoolType != 14) {
            //PublicMeterManage.btnSelCustSigns.disabled = false;
            //PublicMeterManage.PoolType.value == "4";
            HDialog.Info("分摊方式需设置为'按表计用量分摊'!");
            return false;
        }
        else {
            //PublicMeterManage.btnSelCustSigns.disabled = true;
        }

        var varReturn;
        varReturn = showModalDlg("../dialog/CustSignsDlg.aspx" + "?Ram=" + Math.random(), "", 400, 300);

        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            PublicMeterManage.CustSigns.value = varObjects[0];
            PublicMeterManage.CustSignsName.value = varObjects[0];
            //PublicMeterManage.CustSignsName.value=varObjects[1];


            return true;
        }

        return false;
    }


    function checkFormAll(chk) {
        var val = document.PublicMeterManage.SelReturn.value
        var form = document.getElementById("PublicMeterManage");
        var chkval
        for (var i = 0; i < form.elements.length; i++) {
            chkval = "|" + form.elements[i].value;
            //选择
            if (form.elements[i].type == "checkbox") {
                form.elements[i].checked = chk.checked
                //付值
                if (form.elements[i].value != "on") {
                    if (form.elements[i].checked) {
                        if (val.indexOf(chkval) < 0) {
                            val = val + chkval
                        }
                    }
                    else {
                        val = val.replace(chkval, "")

                    }
                }
            }

        }
        document.PublicMeterManage.SelReturn.value = val

    }

    function checkFormOne(chk) {
        var val = document.PublicMeterManage.SelReturn.value;
        var chkval = "|" + chk.value;
        if (chk.checked) {
            if (val.indexOf(chkval) < 0) {
                val = val + chkval;
            }

        }
        else {
            val = val.replace(chkval, "")

        }
        document.PublicMeterManage.SelReturn.value = val;

    }

    function setcheckForm() {
        val = document.PublicMeterManage.SelReturn.value
        form = document.getElementById("PublicMeterManage");
        for (var i = 0; i < form.elements.length; i++) {
            if (form.elements[i].type == "checkbox") {
                if (form.elements[i].value != "on") {
                    if (val.indexOf(form.elements[i].value) < 0) {
                        form.elements[i].checked = false
                    }
                    else {
                        form.elements[i].checked = true
                    }
                }
            }
        }

    }

    function btnDel_onclick() {
        var varRe = PublicMeterManage.SelReturn.value;
        //HDialog.Info(varRe)
        if (varRe == "") {
            HDialog.Info("请选择!");
            return false;
        }
        if (confirm('请确认是否删除记录') == false) {
            return false;
        }
        else {
            return true;
        }

    }

    //-->
    </script>
</head>
<body style="overflow-y: auto">
    <form id="PublicMeterManage" method="post" runat="server">
        <div id="tishi" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 650px; height: 200px; padding: 10px;">
            <table id="tabtishi" cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red; display: none;'>

                <tr>
                    <td rowspan="5" width="40px" valign="top" style='color: Black'>备注：</td>
                    <td>1、适用收费项目只能选择公摊类费项，如果费项为空，请联系公司财务人员设置公摊类费项。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>2、不设置分摊范围将不能进行分摊计费。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>3、分摊方式为“按客户/房号数量均摊时，所选客户/房号分摊权重默认为1。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>4、如果要改变不同客户/房号的分摊权重（比如按约定比例分摊），可首先按客户/房号均摊设置，保存后点击编辑重新设置每个客户/房号的分摊权重。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>5、如果总共3个客户/房号分别分摊20%、30%、50%，则分摊权重分别设置为20、30、50。
                    </td>
                </tr>
            </table>
        </div>
        <table class="DialogTable" id="Table1" style="width: 100%">
            <tr>
                <td align="center" colspan="4" style="height: 22px; background-color: #e6e6e6">公区表信息
                    <input id="hiOPType" type="hidden" name="hiOPType" runat="server" size="1" />
                    <input id="ScopIDs" type="hidden" name="ScopIDs" runat="server" size="1" />
                    <input id="CommID" type="hidden" name="CommID" runat="server" size="1" />
                    <input id="MeterID" type="hidden" name="MeterID" runat="server" size="1" />
                    <input id="MeterSign" type="hidden" size="1" name="MeterSign" runat="server" />
                    <input id="PageIndex" type="hidden" size="1" name="PageIndex" runat="server" />
                    <input id="SelReturn" type="hidden" size="1" name="SelReturn" runat="server" />
                    <input type="hidden" id="SelAll" name="SelAll" runat="server" />
                    <input type="hidden" id="CarparkID" name="CarparkID" runat="server" />
                    <input id="BuildSNums" type="hidden"
                        size="1" name="BuildSNums" runat="server" />
                    <input id="RegionSNums" size="1" type="hidden" name="RegionSNums" runat="server" />

                    <input id="ScopeNum" style="width: 24px; height: 22px" type="hidden" size="1" name="ScopeNum" runat="server" />
                    <input class="button" id="btnExcel" type="button" value="Excel输出" name="btnExcel" runat="server">
                    &nbsp;&nbsp;<input class="button" id="btnDel" type="button" value="删除" name="btnDel" runat="server"
                        onclick="javascript: if (btnDel_onclick() == false) return false;"></td>
            </tr>
            <tr>
                <td class="TdTitle">表计序号</td>
                <td class="TdContent">
                    <input id="MeterSNum" maxlength="20"
                        size="10" name="MeterSNum" runat="server" /></td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
            </tr>
            <tr>
                <td class="TdTitle">表计类型</td>
                <td class="TdContent">
                    <select id="MeterType" name="MeterType" runat="server" style="width: 100px" onchange="MeterTypeChange();">
                        <option selected></option>
                    </select></td>
                <input type="hidden" id="hiMeterType" name="hiMeterType" runat="server" />
                <td class="TdTitle">表计名称</td>
                <td class="TdContent">
                    <input id="MeterName" class="easyui-validatebox" data-options="required:true" name="MeterName" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">安装位置</td>
                <td class="TdContent">
                    <input id="Location" class="easyui-validatebox" data-options="required:true" maxlength="50" name="Location" runat="server" />
                </td>
                <td class="TdTitle">初始读数</td>
                <td class="TdContent">
                    <input onkeypress="CheckNumeric();" id="InitAmount" class="easyui-validatebox"
                        data-options="prompt:'请输入数字',required:true,validType:'digital'" name="InitAmount" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">变比</td>
                <td class="TdContent">
                    <input onkeypress="CheckInterger();" id="Ratio" class="easyui-validatebox"
                        data-options="prompt:'请输入数字',required:true,validType:'positiveint'" name="Ratio" runat="server"></td>
                <td class="TdTitle">是否反向</td>
                <td class="TdContent">
                    <select id="IsReverse" name="IsReverse" style="width: 100px" runat="server">
                        <option selected></option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle">适用收费项目</td>
                <td class="TdContentSearch">
                    <input id="CostName" class="easyui-searchbox" searcher="SelCost" name="CostName" runat="server"><input id="hiCostName" type="hidden"
                        size="1" name="hiCostName" runat="server"><input id="CostID" type="hidden"
                            size="1" name="CostID" runat="server" /><input class="button_sel" id="btnSelCost" onclick="javascript: if (btnSelCost_OnClick() == false) return false;"
                                type="button" value=" " style="width: 26px; height: 22px" name="btnSelCost" runat="server" /></td>
                <td class="TdTitle">适用收费标准</td>
                <td class="TdContentSearch">
                    <input id="StanName" class="easyui-searchbox"
                        name="StanName" searcher="SelStan" runat="server"><input class="button_sel" id="btnSelStan" style="width: 26px; height: 21px" onclick="javascript: if (btnSelStan_OnClick() == false) return false;"
                            type="button" value=" " name="btnSelStan" runat="server"><input id="StanID" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="StanID" runat="server"><input id="hiStanName" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="hiStanName" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">分摊方式</td>
                <td class="TdContent">
                    <select id="PoolType" name="PoolType" style="width: 150px" runat="server" onchange="javascript:SelPoolType_OnChange();">
                        <option selected></option>
                    </select>

                    <input runat="server" name="hiPoolType" id="hiPoolType" type="hidden" />
                </td>
                <td class="TdTitle">分摊表计编号</td>
                <td class="TdContentSearch">
                    <input id="CustSignsName" class="easyui-searchbox" searcher="SelCustSigns"
                        name="CustSignsName" runat="server" /><input class="button_sel" id="btnSelCustSigns" style="width: 26px; height: 21px" onclick="javascript: if (btnSelCustSigns_OnClick() == false) return false;"
                            type="button" value=" " name="btnSelCustSigns" runat="server"><input id="CustSigns" style="width: 10px; height: 22px" type="hidden" size="1" name="CustSigns"
                                runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">表计属性</td>
                <td class="TdContent">
                    <select id="MeterProperty" name="MeterProperty" style="width: 100px" runat="server" onchange="MeterPropertyChange(1)">
                        <option selected value=""></option>
                        <option value="1">总表</option>
                        <option value="2">分表</option>
                    </select>
                </td>
                <td class="TdTitle">
                    <label id="ShareDosageModeTital" style="display: none;">分摊用量</label>
                    <label id="CorrespTotalMeterTital" style="display: none;">对应总表</label>
                </td>
                <td class="TdContentSearch">
                    <select id="ShareDosageMode" name="ShareDosageMode" style="width: 100px; display: none;" runat="server" disabled>
                        <option selected value="1">总表用量</option>
                        <option value="2">总表减分表用量</option>
                    </select>
                    <input style="display: none;" class="easyui-searchbox" id="CorrespTotalMeterName" searcher="SearCorrespTotalMeter" data-options="editable:false" name="CorrespTotalMeterName" runat="server" />
                    <input type="hidden" id="CorrespTotalMeterId" name="CorrespTotalMeterId" runat="server" value="" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">是否参与分摊</td>
                <td class="TdContent">
                    <select id="IsParticShare" name="IsParticShare" style="width: 100px" runat="server">
                        <option value="0">否</option>
                        <option selected value="1">是</option>
                    </select>
                </td>
                <td class="TdTitle">表箱</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" id="MeterBoxName" searcher="SearMeterBox" data-options="editable:false" name="MeterBoxName" runat="server" />
                    <input type="hidden" id="MeterBoxID" runat="server" value="" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">分摊范围设置</td>
                <td class="TdContentSearch" colspan="3" id="TdScope">
                    <input id="ScopeNames" searcher="SelScope" class="easyui-searchbox" style="width: 90%"
                        name="ScopeNames" runat="server" /><input class="button_sel" id="btnSelScope" style="width: 26px; height: 21px"
                            type="button" value=" " name="btnSelScope" runat="server">
                    <input id="RoomIDs" style="width: 10px; height: 22px" type="hidden" size="1" name="RoomIDs" runat="server">
                    <input id="CustIDs" style="width: 10px; height: 22px" type="hidden" size="1" name="CustIDs" runat="server">
                    <input id="hiScopeNames" style="width: 10px; height: 22px" type="hidden" size="1" name="hiScopeNames" runat="server">
                    <input id="ParkHands" type="hidden" name="ParkHands" runat="server" /></td>
            </tr>
            <%-- <tr>
                <td style="height: 32px; text-align: left" height="32" colspan="4">备注：1、适用收费项目只能选择公摊类费项，如果费项为空，请联系公司财务人员设置公摊类费项。2、分摊方式为“按客户/房号数量均摊时，所选客户/房号分摊权重默认为1。3、如果要改变不同客户/房号的分摊权重（比如按约定比例分摊），可首先按客户/房号均摊设置，保存后点击编辑重新设置每个客户/房号的分摊权重。4、如果总共3个客户/房号分别分摊20%、30%、50%，则分摊权重分别设置为20、30、50。
                </td>
            </tr>--%>
        </table>
        <table class="DialogTable" id="Table3" style="width: 100%">
            <tr>
                <td class="DialogTdSubmit" align="center" colspan="4">
                    <input id="btnSave" onclick="javascript: if (CheckData() == false) return false;"
                        type="button" value="保存" name="btnSave" runat="server" class="button" />&nbsp;&nbsp; 
					<input id="btnReturn" type="button" value="关闭" name="btnReturn"
                        runat="server" class="button">&nbsp;&nbsp;
                    <a href="javascript:void()" onclick="TiShi()" class="button">提示</a>

                </td>
            </tr>
        </table>

        <div id="Table2" class="easyui-tabs" style="width: 100%; height: 100%;">
            <div title="分摊范围" style="padding: 0px;width: 100%; height: 100%;">
                <div class="SearchContainer" id="TableContainer" style="height: 100%; width: 100%"></div>
            </div>
            <div title="对应分表(房间表)" style="padding: 0px;width: 100%; height: 100%;">
                <div class="SearchContainer" id="TableContainer2" style="height: 100%; width: 100%"></div>
            </div>
            <div title="对应分表(公区表)" style="padding: 0px;width: 100%; height: 100%;">
                <div class="SearchContainer" id="TableContainer3" style="height: 100%; width: 100%"></div>
            </div>
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 500px; height: 120px;">

            <table class="DialogTable">
                <tr>
                    <td class="TdContent">
                        <asp:Label ID="LbRoom" runat="server">房屋编号：</asp:Label><input id="RoomSign" style="width: 100px;"
                            name="RoomSign" runat="server" size="14" class="easyui-validatebox" />
                        <asp:Label ID="LbCust" runat="server">客户名称：</asp:Label>
                        <input id="CustName"
                            size="14" name="CustName" runat="server" style="width: 100px;" class="easyui-validatebox" />
                    </td>
                </tr>
                <tr>
                    <tb style="width: 20px"></tb>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <input class="button" id="btnFilter" type="button" value="查询" name="btnFilter"
                            runat="server" />
                    </td>
                </tr>
            </table>
        </div>

        <div id="SearchDlg2" class="easyui-dialog" title="分摊权重设置" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 150px;">

            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">楼宇、单元、楼层
                    </td>
                    <td class="TdContent">
                        <select id="BuildSNum" name="BuildSNum" runat="server" onchange="BuildSNumChange()"></select>
                        <select id="UnitSNum" name="UnitSNum" runat="server" onchange="UnitSNumChange()"></select>
                        <select id="FloorSNum" name="FloorSNum" runat="server"></select>
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">总分摊权重
                    </td>
                    <td class="TdContent">
                        <input id="RoomShareRate" class="easyui-validatebox" onblur='valuevalidatebox(this.id)' name="RoomShareRate" type="text" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 20px" colspan="2"></td>
                </tr>
                <tr>
                    <td style="text-align: center" colspan="2">
                        <input class="button" id="btnSettingShare" type="button" value="设置" name="btnSettingShare"
                            runat="server" />
                    </td>
                </tr>
            </table>
        </div>

        <script type="text/javascript">
            $(function () {
                MeterPropertyChange(0);
                CorrespSubmeterByCustMeter();
                CorrespSubmeterByPublicMeter();
            });

            function MeterPropertyChange(isChange) {
                if (isChange == 1) {
                    $('#CorrespTotalMeterName').searchbox("setValue", '');
                    $("#CorrespTotalMeterId").val('');
                }
                var meterPropert = $("#MeterProperty").children('option:selected').val();
                if (meterPropert == 0) {
                    $("#ShareDosageModeTital").hide();
                    $("#CorrespTotalMeterTital").hide();
                    $("#ShareDosageMode").hide();
                    $("#CorrespTotalMeterName").next().hide();
                } else if (meterPropert == 1) {
                    $("#ShareDosageModeTital").show();
                    $("#CorrespTotalMeterTital").hide();
                    $("#ShareDosageMode").show();
                    $("#CorrespTotalMeterName").next().hide();
                } else if (meterPropert == 2) {
                    $("#ShareDosageModeTital").hide();
                    $("#CorrespTotalMeterTital").show();
                    $("#ShareDosageMode").hide();
                    $("#CorrespTotalMeterName").next().show();
                }
            }

            function valuevalidatebox(obj) {

                if (isNaN($('#' + obj).val())) {
                    HDialog.Info("请输入数字");
                    $('#' + obj).val('');

                    return false;
                }
            }

            $('#btnSelCost').hide();
            $('#btnSelStan').hide();
            $('#btnSelCustSigns').hide();
            $('#btnSelScope').hide();
            $('#btnExcel').hide();
            $('#btnDel').hide();

            function TiShi() {
                $('#tishi').parent().appendTo($("form:first"))
                $('#tishi').dialog('open');
                $("#tabtishi").show();
            }

            function init() {
                var h = $(window).height();
                var h1 = h - $('#Table1').height() - $('#Table3').height();
                if (h1 < 400) {
                    h1 = 400;
                }
                $("#Table2").css("height", h1 + "px");
                $("#TableContainer").css("height", h1 - 45 + "px");
                $("#TableContainer2").css("height", h1 - 45 + "px");
                $("#TableContainer3").css("height", h1 - 45 + "px");
            }
            init();
            function SelCost() {

                var tmpMeterTypes = "S" + $('#MeterType').val();

                var conent = "../dialogNew/CorpCommCostDlg.aspx?MeterTypes=" + tmpMeterTypes + "&Ram=" + Math.random();
                HDialog.Open('700', '400', conent, '收费项目选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新

                        var data = JSON.parse(_Data);
                        $('#CostName').searchbox("setValue", data.CostName);
                        $('#CostID').val(data.CostID);
                        $('#hiCostName').val(data.CostName);
                    }
                });

            }

            function SearMeterBox() {

                HDialog.Open('700', '400', "../dialogNew/MeterBoxDlg.aspx", '表箱选择', false, function callback(_Data) {

                    if (_Data != "") {
                        //**获得返回 
                        var varObjects = JSON.parse(_Data);
                        $('#MeterBoxID').val(varObjects.MeterBoxID);
                        $('#MeterBoxName').searchbox('setValue', varObjects.MeterBoxName);

                    }
                });
            }

            function SearCorrespTotalMeter() {
                HDialog.Open('700', '400', "../dialogNew/CorrespTotalMeterDlg.aspx", '对应公区表总表选择', false, function callback(_Data) {
                    if (_Data != "") {
                        //**获得返回 
                        var varObjects = JSON.parse(_Data);
                        $('#CorrespTotalMeterId').val(varObjects.MeterID);
                        $('#CorrespTotalMeterName').searchbox('setValue', varObjects.MeterName);
                    }
                });
            }

            function SelStan() {

                var vCommID = $('#CommID').val();
                var tmpCostID = $('#CostID').val();

                if (tmpCostID == "") {
                    HDialog.Info("请选择费用项目,此项不能为空!");
                }
                else {
                    var conent = "../dialogNew/NewStanDlg.aspx?CommID=" + vCommID + "&CostID=" + tmpCostID;

                    HDialog.Open('700', '400', conent, '收费标准选择', false, function callback(_Data) {

                        if (_Data != "") {//**获得返回 刷新

                            var data = JSON.parse(_Data);
                            $('#StanID').val(data.StanID);
                            $('#StanName').searchbox('setValue', data.StanName);
                            $('#hiStanName').val(data.hiStanName);
                        }
                    });

                }
            }

            function SelPoolType_OnChange() {
                LoadList(1, 100);
            }

            function MeterTypeChange() {
                $('#CostName').searchbox("setValue", '');
                $('#CostID').val('');
                $('#hiCostName').val('');
                $('#StanID').val('');
                $('#StanName').searchbox('setValue', '');
                $('#hiStanName').val('');
            }

            function SelCustSigns() {

                var varPoolType = PublicMeterManage.PoolType.value;

                if (varPoolType != 4 && varPoolType != 14) {

                    HDialog.Info("分摊方式需设置为'按表计用量分摊'!");
                    return false;
                }
                else {

                    var conent = "../dialogNew/CustSignsDlg.aspx?Ram=" + Math.random();
                    HDialog.Open('700', '400', conent, '表计选择', false, function callback(_Data) {

                        if (_Data != "") {//**获得返回 刷新
                            var varObjects = _Data.split("|");
                            var CustSigns = "";
                            var CustSignsName = "";

                            $('#CustSigns').val(CustSigns);
                            $('#CustSignsName').searchbox('setValue', CustSignsName);

                            for (var i = 0; i < varObjects.length; i++) {
                                if (varObjects[i].indexOf(",") > 0) {
                                    var d1 = varObjects[i].split(",")[0];
                                    var d2 = varObjects[i].split(",")[1];

                                    CustSigns = CustSigns + "," + varObjects[i].split(',')[0];
                                    CustSignsName = CustSignsName + "," + varObjects[i].split(',')[1];
                                }

                            }
                            $('#CustSigns').val(CustSignsName.substring(1, CustSignsName.length));
                            $('#CustSignsName').searchbox('setValue', CustSigns.substring(1, CustSigns.length));

                        }
                    });

                }
            }

            function SelScope() {

                var varPoolType = PublicMeterManage.PoolType.value;

                var w = $(window).width();
                var h = $(window).height();

                switch (varPoolType) {
                    case "1":
                        var strCustIDs = "," + $('#CustIDs').val();
                        var strScopeNames = "," + $('#hiScopeNames').val();

                        HDialog.Open(w, h, "../dialogNew/MultiCustDlg.aspx", '客户选择', false, function callback(_Data) {

                            if (_Data != "") {//**获得返回 刷新
                                var data = _Data.split('|');
                                if (data.length > 0) {

                                    for (var i = 0; i < data.length; i++) {
                                        if (data[i] != "") {
                                            var obj = JSON.parse(data[i]);
                                            strScopeNames = strScopeNames + "," + obj.CustName;
                                            strCustIDs = strCustIDs + ',' + obj.CustID;
                                        }
                                    }

                                }

                            }
                            if (strCustIDs.substring(0, 1) == ",") {
                                strCustIDs = strCustIDs.substring(1, strCustIDs.length);
                            }
                            if (strScopeNames.substring(0, 1) == ",") {
                                strScopeNames = strScopeNames.substring(1, strScopeNames.length);
                            }
                            $('#CustIDs').val(strCustIDs);
                            $('#ScopeNames').searchbox('setValue', strScopeNames);

                            $('#hiScopeNames').val(strScopeNames);
                        });
                        break;
                    case "3":
                        var strRoomIDs = "," + $('#RoomIDs').val();
                        var strScopeNames = "," + $('#hiScopeNames').val();
                        var strParkHands = "," + $('#ParkHands').val();

                        HDialog.Open(w, h, "../dialogNew/NewMultiRoomParkDlg.aspx?CType=Room", '房屋车位选择', false, function callback(_Data) {

                            if (_Data != "") {//**获得返回 刷新

                                var data = _Data.split('◆');
                                if (data.length > 0) {

                                    strRoomIDs = data[2];
                                    strScopeNames = data[1] + "," + data[3];
                                    strParkHands = data[4];
                                }
                            }

                            if (strRoomIDs.substring(0, 1) == ",") {
                                strRoomIDs = strRoomIDs.substring(1, strRoomIDs.length);
                            }
                            if (strScopeNames.substring(0, 1) == ",") {
                                strScopeNames = strScopeNames.substring(1, strScopeNames.length);
                            }
                            if (strParkHands.substring(0, 1) == ",") {
                                strParkHands = strParkHands.substring(1, strParkHands.length);
                            }
                            $('#RoomIDs').val(strRoomIDs);
                            $('#ScopeNames').searchbox('setValue', strScopeNames);
                            $('#ParkHands').val(strParkHands);
                            $('#hiScopeNames').val(strScopeNames);


                        });
                        break;
                    case "7":
                        var strRoomIDs = "," + $('#RoomIDs').val();
                        var strScopeNames = "," + $('#hiScopeNames').val();
                        var strParkHands = "," + $('#ParkHands').val();

                        HDialog.Open(w, h, "../dialogNew/NewMultiRoomParkDlg.aspx?CType=Car", '房屋车位选择', false, function callback(_Data) {

                            if (_Data != "") {//**获得返回 刷新

                                var data = _Data.split('◆');
                                if (data.length > 0) {

                                    strRoomIDs = data[2];
                                    strScopeNames = data[1] + "," + data[3];
                                    strParkHands = data[4];
                                }
                            }

                            if (strRoomIDs.substring(0, 1) == ",") {
                                strRoomIDs = strRoomIDs.substring(1, strRoomIDs.length);
                            }
                            if (strScopeNames.substring(0, 1) == ",") {
                                strScopeNames = strScopeNames.substring(1, strScopeNames.length);
                            }
                            if (strParkHands.substring(0, 1) == ",") {
                                strParkHands = strParkHands.substring(1, strParkHands.length);
                            }
                            $('#RoomIDs').val(strRoomIDs);
                            $('#ScopeNames').searchbox('setValue', strScopeNames);
                            $('#ParkHands').val(strParkHands);
                            $('#hiScopeNames').val(strScopeNames);


                        });
                        break;
                    case "11":
                    case "12":
                        var strRoomIDs = "," + $('#RoomIDs').val();
                        var strScopeNames = "," + $('#hiScopeNames').val();
                        var strParkHands = "," + $('#ParkHands').val();

                        HDialog.Open(w, h, "../dialogNew/NewMultiRoomParkDlg.aspx?CType=", '房屋车位选择', false, function callback(_Data) {

                            if (_Data != "") {//**获得返回 刷新

                                var data = _Data.split('◆');
                                if (data.length > 0) {

                                    strRoomIDs = data[2];
                                    strScopeNames = data[1] + "," + data[3];
                                    strParkHands = data[4];
                                }
                            }

                            if (strRoomIDs.substring(0, 1) == ",") {
                                strRoomIDs = strRoomIDs.substring(1, strRoomIDs.length);
                            }
                            if (strScopeNames.substring(0, 1) == ",") {
                                strScopeNames = strScopeNames.substring(1, strScopeNames.length);
                            }
                            if (strParkHands.substring(0, 1) == ",") {
                                strParkHands = strParkHands.substring(1, strParkHands.length);
                            }
                            $('#RoomIDs').val(strRoomIDs);
                            $('#ScopeNames').searchbox('setValue', strScopeNames);
                            $('#ParkHands').val(strParkHands);
                            $('#hiScopeNames').val(strScopeNames);
                        });
                        break;
                    case "5":
                        var strCustIDs = "," + $('#CustIDs').val();
                        var strScopeNames = "," + $('#hiScopeNames').val();
                        var strParkHands = "," + $('#ParkHands').val();

                        HDialog.Open(w, h, "../dialogNew/NewMultiParkCustDlg.aspx", '车位选择', false, function callback(_Data) {

                            if (_Data != "") {//**获得返回 刷新

                                var data = _Data.split('◆');
                                if (data.length > 0) {
                                    var SelAll = data[0];
                                    var SelCustIDs = data[1];
                                    var SelCustNames = data[2];
                                    var SelHandIDs = data[3];

                                    if (SelAll == "1") {
                                        $('#ScopeNames').searchbox('setValue', '全部');
                                        $('#ParkHands').val('9999');
                                        $('#CarparkID').val(SelCustIDs);
                                    }
                                    else {
                                        SelCustNames = SelCustNames.substring(1, SelCustNames.length);
                                        $('#ScopeNames').searchbox('setValue', SelCustNames);

                                        SelCustIDs = SelCustIDs.substring(1, SelCustIDs.length);
                                        $('#CustIDs').val(SelCustIDs);

                                        SelHandIDs = SelHandIDs.substring(1, SelHandIDs.length);
                                        $('#ParkHands').val(SelHandIDs);

                                        $('#hiScopeNames').val(SelCustNames);
                                    }

                                    $('#SelAll').val(SelAll);
                                }
                            }
                        });
                        break;
                    default:
                        var strRoomIDs = "," + $('#RoomIDs').val();
                        var strScopeNames = "," + $('#hiScopeNames').val();

                        var chkval = "";

                        HDialog.Open(w, h, "../dialogNew/NewMultiRoomDlg.aspx", '房屋选择', false, function callback(_Data) {


                            if (_Data != "") {//**获得返回 刷新

                                var data = _Data.split('◆');// SelAll + "◆" + SelRoomSigns + "◆" + SelRoomIDs;
                                var SelAll = data[0];
                                var SelRoomSigns = data[1];
                                var SelRoomIDs = data[2];

                                if (SelAll == "1") {
                                    $('#ScopeNames').searchbox('setValue', '全部');
                                    if (SelRoomSigns == '') {
                                        SelRoomSigns = '9999';
                                    }
                                    $('#BuildSNums').val(SelRoomSigns);
                                    if (SelRoomIDs = '') {
                                        SelRoomIDs = '9999'
                                    }
                                    $('#RegionSNums').val(SelRoomIDs);
                                }
                                else {

                                    $('#ScopeNames').searchbox('setValue', SelRoomSigns);
                                    SelRoomSigns = SelRoomSigns.replace(/\|/gm, ',');
                                    SelRoomIDs = SelRoomIDs.replace(/\|/gm, ',');

                                    SelRoomSigns = SelRoomSigns.substring(1, SelRoomSigns.length);
                                    SelRoomIDs = SelRoomIDs.substring(1, SelRoomIDs.length);

                                    $('#RoomIDs').val(SelRoomIDs);
                                }


                                $('#SelAll').val(SelAll);

                                return true;
                            }
                        });
                        break;
                }

            }

            var column = [[

                { field: 'ck', checkbox: true },
                { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'ShareRate', title: '分摊权重', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } }

            ]];

            var toolbar = [
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var value = $('#ScopIDs').val();
                        if (value == "") {
                            HDialog.Info('请选择要删除的分摊范围');
                        }
                        else {

                            $.tool.DataPostChk('PublicMeterManage', 'Meter', 'PublicMerterScopeDelete', $('#PublicMeterManage').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    var r = _Data;

                                    if (r == "true") {
                                        HDialog.Info('删除成功!');
                                    }
                                    else {
                                        HDialog.Info('删除失败!');
                                    }
                                    LoadList(1, 100);
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }
                    }

                }, {
                    text: '修改分摊权重',
                    iconCls: 'icon-save',
                    handler: function () {
                        $('#TableContainer').datagrid('acceptChanges');

                        var rows = $("#TableContainer").datagrid("getData").rows;
                        var strParam = "";
                        for (var i = 0; i < rows.length; i++) {
                            //拼接保存参数
                            strParam += "|" + rows[i].ScopID + "~";
                            strParam += rows[i].ShareRate + "~";

                        }
                        strParam = strParam.substr(1, strParam.length);


                        $.tool.DataPostChk('PublicMeterManage', 'Meter', 'MeterScopeUpdate', $('#PublicMeterManage').serialize() + "&Param=" + strParam,
                            function Init() {
                            },
                            function callback(_Data) {
                                var r = _Data;

                                if (r == "true") {
                                    HDialog.Info('修改成功!');
                                    LoadList(1, 100);
                                }
                                else {
                                    HDialog.Info('修改失败!');
                                }

                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                }, {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, {
                    text: 'Excel输出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        $('#btnExcel').click();
                    }
                }
            ];

            var editIndex = undefined;

            function LoadList(page, pagesize) {

                var iPoolType = $('#PoolType').val();

                $('#hiPoolType').val(iPoolType);

                switch (iPoolType) {
                    case "1":
                        column = [[
                            { field: 'ck', checkbox: true },
                            { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                            { field: 'ShareRate', title: '分摊权重', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } }
                        ]];
                        break;
                    case "2":
                    case "9":
                        column = [[
                            { field: 'ck', checkbox: true },
                            { field: 'BuildName', title: '楼宇名称', width: 100, align: 'left', sortable: true },
                            { field: 'UnitSNum', title: '单元', width: 50, align: 'left', sortable: true },
                            { field: 'FloorSNum', title: '楼层', width: 50, align: 'left', sortable: true },
                            { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                            { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
                            { field: 'ShareRate', title: '分摊权重', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } }
                        ]];
                        break;
                    case "3":
                    case "7":
                    case "10":
                    case "11":
                    case "12":
                        column = [[
                            { field: 'ck', checkbox: true },
                            { field: 'BuildName', title: '楼宇名称', width: 100, align: 'left', sortable: true },
                            { field: 'UnitSNum', title: '单元', width: 50, align: 'left', sortable: true },
                            { field: 'FloorSNum', title: '楼层', width: 50, align: 'left', sortable: true },
                            { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                            { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
                            { field: 'ParkName', title: '车位名称', width: 100, align: 'left', sortable: true },
                            { field: 'ShareRate', title: '分摊权重', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } }
                        ]];
                        break;
                    case "4":
                    case "14":
                        column = [[
                            { field: 'ck', checkbox: true },
                            { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                            { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
                            { field: 'ShareRate', title: '分摊权重', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } }
                        ]];
                        break;
                    case "5":
                        column = [[
                            { field: 'ck', checkbox: true },
                            { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                            { field: 'ParkName', title: '车位名称', width: 100, align: 'left', sortable: true },
                            { field: 'ShareRate', title: '分摊权重', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } }
                        ]];
                        break;
                    //case "7":
                    //    column = [[
                    //        { field: 'ck', checkbox: true },
                    //        { field: 'BuildName', title: '楼宇名称', width: 100, align: 'left', sortable: true },
                    //        { field: 'UnitSNum', title: '单元', width: 50, align: 'left', sortable: true },
                    //        { field: 'FloorSNum', title: '楼层', width: 50, align: 'left', sortable: true },
                    //        { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                    //        { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
                    //        { field: 'ParkName', title: '车位名称', width: 100, align: 'left', sortable: true },
                    //        { field: 'ShareRate', title: '分摊权重', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } }
                    //    ]];
                    //    break;
                    case "8":
                        column = [[
                            { field: 'ck', checkbox: true },
                            { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                            { field: 'SelfUseRate', title: '自用量系数', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } },
                            { field: 'CommonLayerRate', title: '层间分摊系数', width: 100, align: 'left', sortable: true, editor: { type: 'validatebox' } }
                        ]];
                        break;
                }
                if (iPoolType == "1") {
                    toolbar = [
                        {
                            text: '删除',
                            iconCls: 'icon-cancel',
                            handler: function () {
                                var value = $('#ScopIDs').val();
                                if (value == "") {
                                    HDialog.Info('请选择要删除的分摊范围');
                                }
                                else {

                                    $.tool.DataPostChk('PublicMeterManage', 'Meter', 'PublicMerterScopeDelete', $('#PublicMeterManage').serialize(),
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            var r = _Data;

                                            if (r == "true") {
                                                HDialog.Info('删除成功!');
                                            }
                                            else {
                                                HDialog.Info('删除失败!');
                                            }
                                            LoadList(1, 100);
                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                }
                            }

                        }, {
                            text: '修改分摊权重',
                            iconCls: 'icon-save',
                            handler: function () {

                                $('#TableContainer').datagrid('acceptChanges');

                                var rows = $("#TableContainer").datagrid("getData").rows;
                                var strParam = "";
                                for (var i = 0; i < rows.length; i++) {
                                    //拼接保存参数
                                    strParam += "|" + rows[i].ScopID + "~";
                                    strParam += rows[i].ShareRate + "~";
                                    strParam += rows[i].SelfUseRate + "~";
                                    strParam += rows[i].CommonLayerRate + "~";

                                }
                                strParam = strParam.substr(1, strParam.length);

                                $.tool.DataPostChk('PublicMeterManage', 'Meter', 'MeterScopeUpdate', $('#PublicMeterManage').serialize() + "&Param=" + strParam,
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        var r = _Data;

                                        if (r == "true") {
                                            HDialog.Info('修改成功!');
                                            LoadList(1, 100);
                                        }
                                        else {
                                            HDialog.Info('修改失败!');
                                        }

                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                            }
                        }, {
                            text: '筛选',
                            iconCls: 'icon-search',
                            handler: function () {
                                $('#SearchDlg').parent().appendTo($("form:first"));
                                $('#SearchDlg').dialog('open');
                            }
                        }, {
                            text: 'Excel输出',
                            iconCls: 'icon-page_white_excel',
                            handler: function () {
                                $('#btnExcel').click();
                            }
                        }
                    ];
                }
                else if (iPoolType == "2" || iPoolType == "3" || iPoolType == "7" || iPoolType == "9"
                    || iPoolType == "10" || iPoolType == "11" || iPoolType == "12") {
                    toolbar = [
                        {
                            text: '删除',
                            iconCls: 'icon-cancel',
                            handler: function () {
                                var value = $('#ScopIDs').val();
                                if (value == "") {
                                    HDialog.Info('请选择要删除的分摊范围');
                                }
                                else {

                                    $.tool.DataPostChk('PublicMeterManage', 'Meter', 'PublicMerterScopeDelete', $('#PublicMeterManage').serialize(),
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            var r = _Data;

                                            if (r == "true") {
                                                HDialog.Info('删除成功!');
                                            }
                                            else {
                                                HDialog.Info('删除失败!');
                                            }
                                            LoadList(1, 100);
                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                }
                            }

                        }, '-', {
                            text: '修改分摊权重',
                            iconCls: 'icon-save',
                            handler: function () {

                                $('#TableContainer').datagrid('acceptChanges');

                                var rows = $("#TableContainer").datagrid("getData").rows;
                                var strParam = "";
                                for (var i = 0; i < rows.length; i++) {
                                    //拼接保存参数
                                    strParam += "|" + rows[i].ScopID + "~";
                                    strParam += rows[i].ShareRate + "~";
                                    strParam += rows[i].SelfUseRate + "~";
                                    strParam += rows[i].CommonLayerRate + "~";

                                }
                                strParam = strParam.substr(1, strParam.length);

                                $.tool.DataPostChk('PublicMeterManage', 'Meter', 'MeterScopeUpdate', $('#PublicMeterManage').serialize() + "&Param=" + strParam,
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        var r = _Data;

                                        if (r == "true") {
                                            HDialog.Info('修改成功!');
                                            LoadList(1, 100);
                                        }
                                        else {
                                            HDialog.Info('修改失败!');
                                        }

                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                            }
                        }, '-', {
                            text: '按单元楼层批量设置分摊权重',
                            iconCls: 'icon-save',
                            handler: function () {
                                $('#SearchDlg2').parent().appendTo($("form:first"));
                                $('#SearchDlg2').dialog('open');
                            }
                        }, {
                            text: '筛选',
                            iconCls: 'icon-search',
                            handler: function () {
                                $('#SearchDlg').parent().appendTo($("form:first"));
                                $('#SearchDlg').dialog('open');
                            }
                        }, {
                            text: 'Excel输出',
                            iconCls: 'icon-page_white_excel',
                            handler: function () {
                                $('#btnExcel').click();
                            }
                        }
                    ];
                }
                else if (iPoolType == "8") {
                    toolbar = [
                        {
                            text: '删除',
                            iconCls: 'icon-cancel',
                            handler: function () {
                                var value = $('#ScopIDs').val();
                                if (value == "") {
                                    HDialog.Info('请选择要删除的分摊范围');
                                }
                                else {

                                    $.tool.DataPostChk('PublicMeterManage', 'Meter', 'PublicMerterScopeDelete', $('#PublicMeterManage').serialize(),
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            var r = _Data;

                                            if (r == "true") {
                                                HDialog.Info('删除成功!');
                                            }
                                            else {
                                                HDialog.Info('删除失败!');
                                            }
                                            LoadList(1, 100);
                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                }
                            }

                        }, '-', {
                            text: '修改自用量和层间分摊系数',
                            iconCls: 'icon-save',
                            handler: function () {
                                $('#TableContainer').datagrid('acceptChanges');
                                var rows = $("#TableContainer").datagrid("getData").rows;
                                var strParam = "";
                                for (var i = 0; i < rows.length; i++) {
                                    //拼接保存参数
                                    strParam += "|" + rows[i].ScopID + "~";
                                    strParam += rows[i].ShareRate + "~";
                                    strParam += rows[i].SelfUseRate + "~";
                                    strParam += rows[i].CommonLayerRate + "~";

                                }
                                strParam = strParam.substr(1, strParam.length);

                                $.tool.DataPostChk('PublicMeterManage', 'Meter', 'MeterScopeUpdate', $('#PublicMeterManage').serialize() + "&Param=" + strParam,
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        var r = _Data;

                                        if (r == "true") {
                                            HDialog.Info('修改成功!');
                                            LoadList(1, 100);
                                        }
                                        else {
                                            HDialog.Info('修改失败!');
                                        }

                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                            }
                        }, {
                            text: '筛选',
                            iconCls: 'icon-search',
                            handler: function () {
                                $('#SearchDlg').parent().appendTo($("form:first"));
                                $('#SearchDlg').dialog('open');
                            }
                        }, {
                            text: 'Excel输出',
                            iconCls: 'icon-page_white_excel',
                            handler: function () {
                                $('#btnExcel').click();
                            }
                        }
                    ];
                } else {

                    toolbar = [
                        {
                            text: '删除',
                            iconCls: 'icon-cancel',
                            handler: function () {
                                var value = $('#ScopIDs').val();
                                if (value == "") {
                                    HDialog.Info('请选择要删除的分摊范围');
                                }
                                else {

                                    $.tool.DataPostChk('PublicMeterManage', 'Meter', 'PublicMerterScopeDelete', $('#PublicMeterManage').serialize(),
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            var r = _Data;

                                            if (r == "true") {
                                                HDialog.Info('删除成功!');
                                            }
                                            else {
                                                HDialog.Info('删除失败!');
                                            }
                                            LoadList(1, 100);
                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                }
                            }

                        }, {
                            text: '筛选',
                            iconCls: 'icon-search',
                            handler: function () {
                                $('#SearchDlg').parent().appendTo($("form:first"));
                                $('#SearchDlg').dialog('open');
                            }
                        }, {
                            text: 'Excel输出',
                            iconCls: 'icon-page_white_excel',
                            handler: function () {
                                $('#btnExcel').click();
                            }
                        }
                    ];
                }

                $.tool.DataPost2('Meter', 'LoadDataScope', "page=" + page + "&rows=" + pagesize + "&" + $('#PublicMeterManage').serialize(),
                    function Init() {

                    },
                    function callback(_Data) {
                        var Data = eval("(" + _Data + ")"); //转换为json对象
                        binddata(Data);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });

            }

            function binddata(_data) {
                $("#TableContainer").datagrid({
                    method: "post",
                    nowrap: false,
                    pageSize: [100],
                    pageList: [100, 300, 500, 800, 1000],
                    columns: column,
                    data: _data,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: true,
                    sortOrder: "asc",
                    onDblClickRow: function (rowIndex, rowData) {
                        if (editIndex != undefined) {
                            $(this).datagrid('endEdit', editIndex);
                        }
                        $(this).datagrid('beginEdit', rowIndex);
                        var ed = $(this).datagrid('getEditor', { index: rowIndex, field: 'ShareRate' });
                        $(ed.target).focus();
                        editIndex = rowIndex;

                    },
                    onLoadSuccess: function (data) {

                        var pg = $("#TableContainer").datagrid("getPager");

                        var rows = $("#TableContainer").datagrid("getData").rows;

                        if (rows.length < 1) {
                            $('#PoolType').removeAttr("disabled");
                        }

                        if (pg) {
                            $(pg).pagination({
                                onBeforeRefresh: function () {

                                },
                                onRefresh: function (pageNumber, pageSize) {

                                },
                                onChangePageSize: function (pageSize) {
                                },
                                onSelectPage: function (Pn, Ps) {

                                    LoadList(Pn, Ps);

                                    $('#TableContainer').datagrid('options').pageNumber = Pn;
                                    $('#TableContainer').datagrid('options').pageSize = Ps;

                                }
                            });
                        }

                    },
                    onCheck: function (rowIndex, rowData) {


                        var dd = $('#ScopIDs').val() + "," + rowData.ScopID
                        $('#ScopIDs').val(dd);

                    },
                    onUncheck: function (rowIndex, rowData) {
                        var ss = $('#ScopIDs').val().split(',');
                        for (var i = 0; i < ss.length; i++) {

                            if (ss[i].indexOf(rowData.ScopID) >= 0) {
                                ss.splice(i, 1);
                            }
                        }
                        valu = "";
                        for (var i = 0; i < ss.length; i++) {
                            valu += "," + ss[i];
                        }
                        $('#ScopIDs').val(valu.substr(1, valu.length));

                    },
                    onCheckAll: function (rows) {

                        for (var i = 0; i < rows.length; i++) {

                            var data = "," + rows[i].ScopID;

                            var ss = $('#ScopIDs').val();
                            if (ss.indexOf(data) < 0) {
                                var dd = $('#ScopIDs').val() + "," + data;
                                $('#ScopIDs').val(dd);
                            }
                        }

                    },
                    onUncheckAll: function (rows) {

                        for (var i = 0; i < rows.length; i++) {

                            var ss = $('#ScopIDs').val().split(',');
                            for (var i = 0; i < ss.length; i++) {
                                if (ss[i].indexOf(rows[i].ScopID) >= 0) {
                                    ss.splice(i, 1);
                                }
                            }
                            valu = "";
                            for (var i = 0; i < ss.length; i++) {
                                valu += "|" + ss[i];
                            }
                            $('#ScopIDs').val(valu.substr(1, valu.length));

                        }

                    }

                });

                $('#SearchDlg').dialog('close');
            }
            LoadList(1, 100);
            $('#btnSave').click(function () {
                if ($("#CostID").val() == '') {
                    HDialog.Info('请选择适用收费项目,此项不能为空!');
                    return;
                }
                if ($("#StanID").val() == '' || $("#StanID").val() == '0') {
                    HDialog.Info('请选择适用收费标准,此项不能为空!');
                    return;
                }

                var iPoolType = $('#PoolType').val();

                $('#hiPoolType').val(iPoolType);


                var cmd = "PublicMeterInsert";
                if ($('#hiOPType').val() == 'edit') {
                    cmd = "PublicMeterUpdate";
                }

                $.tool.DataPostChk('PublicMeterManage', 'Meter', cmd, $('#PublicMeterManage').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var r = _Data;

                        if (r == "true") {
                            HDialog.Info('保存成功!');

                            if ($('#hiOPType').val() == 'edit') {
                                LoadList(1, 100);
                                CorrespSubmeterByCustMeter();
                                CorrespSubmeterByPublicMeter();
                            }
                            else {
                                HDialog.Close();
                            }
                        }
                        else {
                            HDialog.Info('保存失败!');
                        }

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            });
            $('#btnReturn').click(function () {
                HDialog.Close();
            });

            function BuildSNumChange() {
                var BuildSNum = $('#BuildSNum');
                var UnitSNum = $('#UnitSNum');
                var FloorSNum = $('#FloorSNum');


                UnitSNum.empty();
                FloorSNum.empty();
                if (BuildSNum.val() == '0') {
                    var option = $("<option>").text('全部').val(0);
                    UnitSNum.append(option);

                    var option2 = $("<option>").text('全部').val(0);
                    FloorSNum.append(option2);

                    // FloorSNum.append(option);
                }
                else {

                    $.tool.DataPost2('Meter', 'PublicMeterShareUnit', "MeterID=" + $('#MeterID').val() + "&BuildSNum=" + BuildSNum.val(),
                        function Init() {

                        },
                        function callback(_Data) {
                            var option = $("<option>").text('全部').val(0);
                            UnitSNum.append(option);

                            var option2 = $("<option>").text('全部').val(0);
                            FloorSNum.append(option2);

                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (varObjects.length > 0) {
                                for (var i = 0; i < varObjects.length; i++) {
                                    var option = $("<option>").text(varObjects[i].UnitSNumName).val(varObjects[i].UnitsNum);
                                    UnitSNum.append(option);
                                }
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }

            }
            function UnitSNumChange() {
                var BuildSNum = $('#BuildSNum');
                var UnitSNum = $('#UnitSNum');
                var FloorSNum = $('#FloorSNum');

                FloorSNum.empty();
                if (UnitSNum.val() == '0') {
                    var option = $("<option>").text('全部').val(0);

                    FloorSNum.append(option);
                }
                else {

                    $.tool.DataPost2('Meter', 'PublicMeterShareFloor', "MeterID=" + $('#MeterID').val() + "&BuildSNum=" + BuildSNum.val() + "&UnitSNum=" + UnitSNum.val(),
                        function Init() {

                        },
                        function callback(_Data) {

                            var option = $("<option>").text('全部').val(0);
                            FloorSNum.append(option);

                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (varObjects.length > 0) {

                                for (var i = 0; i < varObjects.length; i++) {

                                    var option = $("<option>").text(varObjects[i].FloorSNumName).val(varObjects[i].FloorSNum);
                                    FloorSNum.append(option);
                                }
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }

            $('#btnSettingShare').click(function () {

                $.tool.DataPostChk('PublicMeterManage', 'Meter', 'PublicMerterScopeShareSetting', $('#PublicMeterManage').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var r = _Data.split('|');
                        $('#SearchDlg').dialog('close');
                        $('#SearchDlg2').dialog('close');
                        if (r[0] == "true") {
                            HDialog.Info('设置分摊权重成功!');
                        }
                        else {
                            HDialog.Info('设置分摊权重失败!');
                        }
                        LoadList(1, 100);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });


            });

            $('#btnFilter').click(function () {
                LoadList(1, 100);
            });

            //加载对应分表(房间表数据)
            function CorrespSubmeterByCustMeter() {
                $("#TableContainer2").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: [[
                        { field: 'MeterSign', title: '表计序号', width: 50, align: 'left', sortable: true },
                        { field: 'MeterName', title: '表计名称', width: 100, align: 'left', sortable: true },
                        { field: 'MeterBoxName', title: '表箱名称', width: 100, align: 'left', sortable: true },
                        { field: 'InstallLocation', title: '安装位置', width: 100, align: 'left', sortable: true },
                        { field: 'BoxNumber', title: '转表基数', width: 100, align: 'left', sortable: true },
                        { field: 'MeterTypeName', title: '表计类型', width: 100, align: 'left', sortable: true },
                        { field: 'InitAmount', title: '初始读数', width: 100, align: 'left', sortable: true },
                        { field: 'Ratio', title: '变比', width: 100, align: 'left', sortable: true },
                        { field: 'StanName', title: '标准名称', width: 100, align: 'left', sortable: true },
                        { field: 'StanAmount', title: '单价', width: 100, align: 'left', sortable: true }
                    ]],
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    sortOrder: "asc",
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Meter", "CorrespSubmeterByCustMeter", "TableContainer2", param);
                    },
                    onLoadSuccess: function (data) { }
                });
            }

            //加载对应分表(公区表数据)
            function CorrespSubmeterByPublicMeter() {
                $("#TableContainer3").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: [[
                        { field: 'MeterSNum', title: '表计序号', width: 100, align: 'left', sortable: true },
                        { field: 'Location', title: '安装位置', width: 100, align: 'left', sortable: true },
                        { field: 'MeterName', title: '表计名称', width: 100, align: 'left', sortable: true },
                        { field: 'MeterTypeName', title: '表计类型', width: 100, align: 'left', sortable: true },
                        { field: 'PoolTypeName', title: '分摊方式', width: 100, align: 'left', sortable: true },
                        { field: 'StanName', title: '标准名称', width: 100, align: 'left', sortable: true },
                        { field: 'StanAmount', title: '单价', width: 100, align: 'left', sortable: true }
                    ]],
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    sortOrder: "asc",
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Meter", "CorrespSubmeterByPublicMeter", "TableContainer3", param);
                    },
                    onLoadSuccess: function (data) { }
                });
            }

        </script>
    </form>
</body>
</html>
