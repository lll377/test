<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WaiversFeeModifyAuditManage.aspx.cs" Inherits="M_Main.ChargesNew.WaiversFeeModifyAuditManage" %>

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
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script language="javascript">
		<!--

    function CheckData() {
        var varWaivType = WaiversFeeModifyAuditManage.hiWaivType.value;

        if ((varWaivType == "1") || (varWaivType == "3")) {
            alert("减免方式需是按总额减免!");
            WaiversFeeModifyAuditManage.ModifyAuditAmount.focus();
            return false;
        }

        var varWaivModifyAmount = parseFloat(WaiversFeeModifyAuditManage.ModifyAuditAmount.value);
        var varhiWaivModifyMaxAmount = parseFloat(WaiversFeeModifyAuditManage.hiWaivModifyMaxAmount.value);

        if (varModifyAuditAmount > varhiWaivModifyMaxAmount) {
            alert("提交取消减免总额不能大于尚未减免总额!");
            WaiversFeeModifyAuditManage.ModifyAuditAmount.focus();
            return false;
        }

        if (varModifyAuditAmount <= 0) {
            alert("提交取消减免总额需大于零!");
            WaiversFeeModifyAuditManage.ModifyAuditAmount.focus();
            return false;
        }

        if (WaiversFeeModifyAuditManage.ModifyReason.value == "") {
            alert("请输入取消减免原因,此项不能为空!");
            WaiversFeeModifyAuditManage.ModifyReason.focus();
            return false;
        }

        return true;
    }

    function btnSelRoom_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/RoomDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);

        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            WaiversFeeModifyAuditManage.RoomID.value = varObjects[0];
            WaiversFeeModifyAuditManage.RoomSign.value = varObjects[2];
            WaiversFeeModifyAuditManage.hiRoomSign.value = varObjects[2];

            WaiversFeeModifyAuditManage.CustID.value = varObjects[1];
            WaiversFeeModifyAuditManage.CustName.value = varObjects[3];
            WaiversFeeModifyAuditManage.hiCustName.value = WaiversFeeModifyAuditManage.CustName.value;


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

            WaiversFeeModifyAuditManage.CustID.value = varObjects[0];
            WaiversFeeModifyAuditManage.CustName.value = varObjects[1];
            WaiversFeeModifyAuditManage.hiCustName.value = varObjects[1];

            WaiversFeeModifyAuditManage.RoomSign.value = "";
            WaiversFeeModifyAuditManage.RoomID.value = "";
            WaiversFeeModifyAuditManage.hiRoomSign.value = "";

            return true;
        }

        return false;
    }

    function btnSelCost_OnClick() {

        var varReturn;
        varReturn = showModalDlg("../dialog/CorpCommCostDlg.aspx" + "?Ram=" + Math.random(), "", 500, 400);
        //alert("["+varReturn+"]");
        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            WaiversFeeModifyAuditManage.CostID.value = varObjects[0];
            WaiversFeeModifyAuditManage.CostName.value = varObjects[2];
            WaiversFeeModifyAuditManage.hiCostName.value = varObjects[2];

            WaiversFeeModifyAuditManage.WaivCostID.value = "";
            WaiversFeeModifyAuditManage.WaivCostName.value = "";
            WaiversFeeModifyAuditManage.hiWaivCostName.value = "";

            return true;
        }

        return false;
    }
    function SelRoomID_OnChange() {
        WaiversFeeModifyAuditManage.RoomID.value = WaiversFeeModifyAuditManage.SelRoomID.options[WaiversFeeModifyAuditManage.SelRoomID.selectedIndex].value;
        WaiversFeeModifyAuditManage.RoomSign.value = WaiversFeeModifyAuditManage.SelRoomID.options[WaiversFeeModifyAuditManage.SelRoomID.selectedIndex].text;
        WaiversFeeModifyAuditManage.hiRoomSign.value = WaiversFeeModifyAuditManage.RoomSign.value;

    }

    function btnSelWaivCost_OnClick() {

        if (WaiversFeeModifyAuditManage.CostID.value == "0") {
            WaiversFeeModifyAuditManage.CostID.value = "";
        }
        if (WaiversFeeModifyAuditManage.CostID.value == "") {
            alert("请选择费用项目,此项不能为空!");
            WaiversFeeModifyAuditManage.btnSelCost.focus();
            return false;
        }
        var varCostID = WaiversFeeModifyAuditManage.CostID.value;

        var varReturn;
        varReturn = showModalDlg("../dialog/CostWaivDlg.aspx?CostID=" + varCostID + "&Ram=" + Math.random(), "", 650, 400);
        //alert("["+varReturn+"]");
        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            WaiversFeeModifyAuditManage.WaivCostID.value = varObjects[0];
            WaiversFeeModifyAuditManage.WaivCostName.value = varObjects[2];
            WaiversFeeModifyAuditManage.hiWaivCostName.value = varObjects[2];

            return true;
        }

        return false;
    }

    function onchangeSelWaivReason() {
        getObject("WaivReason").value = getObject("SelWaivReason").value;
    }


    function CheckNoData() {
        if (WaiversFeeModifyAuditManage.ModifyAuditMemo.value == "") {
            alert("请输入审核意见,此项不能为空!");
            WaiversFeeModifyAuditManage.ModifyAuditMemo.focus();
            return false;
        }
        return true;
    }
    //-->
    </script>
    <script language="javascript">
		<!--

    function Win_OnLoad() {
        var strPrintParms = getObject("PrintParms").value;
        if (strPrintParms != "") {
            showOperatWin(strPrintParms);

            getObject("PrintParms").value = "";
        }
    }
    //-->
    </script>
</head>
<body style="overflow-y: auto">
    <form id="WaiversFeeModifyAuditManage" method="post" runat="server">

        <input style="height: 22px; width: 32px" id="hiOPType" size="1" type="hidden" name="hiOPType"
            runat="server"><input style="height: 22px; width: 24px" id="WaivID" size="1" type="hidden" name="WaivID"
                runat="server"><input style="height: 22px; width: 24px" id="IsAudit" size="1" type="hidden" name="IsAudit"
                    runat="server"><input style="height: 22px; width: 32px" id="PageIndex" size="1" type="hidden" name="PageIndex"
                        runat="server"><input style="height: 22px; width: 24px" id="hiWaivType" size="1" type="hidden" name="hiWaivType"
                            runat="server"><input style="height: 22px; width: 24px" id="SysCostSign" size="1" type="hidden" name="SysCostSign"
                                runat="server">
        
        <input style="height: 22px; width: 24px" id="WaivRoleCodes" size="1" type="hidden" name="WaivRoleCodes"
                                runat="server">

        <table id="Table1" class="DialogTable">

            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">减免费用信息</span> </td>
            </tr>
            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContent">
                    <input id="CustName" class="Control_ItemInput" readonly
                        name="CustName" runat="server" disabled><input style="height: 22px" id="btnSelCust" class="button_sel" onclick="javascript: if (btnSelCust_OnClick() == false) return false;"
                            value=" " type="button" name="btnSelCust" runat="server"><input style="height: 19px; width: 8px" id="CustID" class="Control_ItemInput" size="1"
                                type="hidden" name="CustID" runat="server"><input style="height: 19px; width: 12px" id="hiCustName" class="Control_ItemInput" size="1"
                                    type="hidden" name="hiCustName" runat="server"><font face="宋体" color="#ff0000">*</td>
                <td class="TdTitle">可选房号</td>
                <td class="TdContent">
                    <asp:DropDownList ID="SelRoomID" runat="server" AutoPostBack="True" Enabled="False"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContent">
                    <input id="RoomSign" class="Control_ItemInput" readonly
                        name="RoomSign" runat="server" disabled><input style="height: 22px" id="btnSelRoom" class="button_sel" onclick="javascript: if (btnSelRoom_OnClick() == false) return false;"
                            value=" " type="button" name="btnSelRoom" runat="server"><input style="height: 22px; width: 8px" id="RoomID" class="Control_ItemInput" size="1"
                                type="hidden" name="RoomID" runat="server"><input style="height: 22px; width: 8px" id="hiRoomSign" class="Control_ItemInput" size="1"
                                    type="hidden" name="hiRoomSign" runat="server"></td>
                <td class="TdTitle">车&nbsp;&nbsp;&nbsp; 
														位</td>
                <td class="TdContent">
                    <asp:DropDownList ID="HandID" runat="server" AutoPostBack="True" Enabled="False"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="TdTitle">减免费用项目</td>
                <td class="TdContent">
                    <input id="CostName" class="Control_ItemInput" readonly
                        size="14" name="CostName" runat="server" disabled><input style="height: 22px" id="btnSelCost" class="button_sel" onclick="javascript: if (btnSelCost_OnClick() == false) return false;"
                            value=" " type="button" name="btnSelCost" runat="server"><input style="height: 22px; width: 8px" id="CostID" class="Control_ItemInput" size="1"
                                type="hidden" name="CostID" runat="server"><input style="height: 22px; width: 8px" id="hiCostName" class="Control_ItemInput" size="1"
                                    type="hidden" name="hiCostName" runat="server">*</td>
                <td class="TdTitle">减免本金/佣金</td>
                <td class="TdContent">
                    <input id="WaivCostName" class="Control_ItemInput" readonly
                        size="14" name="WaivCostName" runat="server" disabled><input style="height: 22px" id="btnSelWaivCost" class="button_sel" onclick="javascript: if (btnSelWaivCost_OnClick() == false) return false;"
                            value=" " type="button" name="btnSelWaivCost" runat="server"><input style="height: 22px" id="btnClear" class="button" onclick="javascript: btnClear_OnClick();"
                                value="清空" type="button" name="btnClear" runat="server"><input style="height: 22px; width: 8px" id="hiWaivCostName" class="Control_ItemInput" size="1"
                                    type="hidden" name="hiWaivCostName" runat="server"><input style="height: 22px; width: 8px" id="WaivCostID" class="Control_ItemInput" size="1"
                                        type="hidden" name="WaivCostID" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">
                    <asp:Label ID="lbMeterSign" runat="server">表　　计</asp:Label></td>
                <td class="TdContent">
                    <asp:DropDownList ID="MeterSign" runat="server"></asp:DropDownList><input style="height: 22px; width: 24px" id="hiMeterSign" size="1" type="hidden" name="hiMeterSign"
                        runat="server"></td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
            </tr>
            <tr>
                <td class="TdTitle">减免方式</td>
                <td class="TdContent">
                    <asp:DropDownList ID="WaivType" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="1">按每月减免</asp:ListItem>
                        <asp:ListItem Value="2">按总额减免</asp:ListItem>
                        <asp:ListItem Value="3">按比例减免</asp:ListItem>
                    </asp:DropDownList></td>
                <td class="TdTitle">
                    <asp:Label ID="lbWaivMonthAmount" runat="server">单月减免金额</asp:Label></td>
                <td class="TdContent">
                    <input id="WaivMonthAmount" class="Control_ItemInput"
                        size="50" name="WaivMonthAmount" runat="server" disabled><asp:Label ID="lbXin1" runat="server" ForeColor="Red">*</asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">
                    <asp:Label ID="lbWaivRates" runat="server">减免比例</asp:Label></td>
                <td class="TdContent">
                    <input id="WaivRates" class="Control_ItemInput" onkeypress="CheckNumeric();"
                        name="WaivRates" runat="server" disabled>%<asp:Label ID="lbXin3" runat="server" ForeColor="Red">*</asp:Label></td>
                <td class="TdTitle">
                    <asp:Label ID="lbWaivAmount" runat="server">减免总金额</asp:Label></td>
                <td class="TdContent">
                    <input id="WaivAmount" class="Control_ItemInput"
                        name="WaivAmount" runat="server" disabled><asp:Label ID="lbXin2" runat="server" ForeColor="Red">*</asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">开始日期</td>
                <td class="TdContent">
                    <select id="CreYear1" name="CreYear1" runat="server" disabled>
                        <option selected></option>
                    </select>年<select id="CreMonth1" name="CreMonth1" runat="server" disabled>
                        <option selected></option>
                    </select>月</td>
                <td class="TdTitle">结束日期</td>
                <td class="TdContent">
                    <select id="CreYear2" name="CreYear2" runat="server">
                        <option selected></option>
                    </select>年<select id="CreMonth2" name="CreMonth2" runat="server">
                        <option selected></option>
                    </select>月</td>
            </tr>
            <tr>
                <td class="TdTitle">减免原因</td>
                <td class="TdContent" colspan="3">
                    <select id="SelWaivReason" name="SelWaivReason" runat="server" style="z-index: 0" disabled>
                        <option selected></option>
                    </select><input id="WaivReason" class="Control_ItemInput"
                        name="WaivReason" runat="server" disabled></td>
            </tr>
            <tr>
                <td class="TdTitle">备 
													注</td>
                <td class="TdContent" colspan="3">
                    <input id="WaivMemo" class="Control_ItemInput"
                        name="WaivMemo" runat="server" disabled></td>
            </tr>
            <tr>
                <td class="TdTitle">
                    <asp:Label ID="lbAuditReason" runat="server">未通过原因</asp:Label></td>
                <td class="TdContent" colspan="3">
                    <input id="AuditReason" class="Control_ItemInput" readonly
                        maxlength="100" name="AuditReason" runat="server" disabled></td>
            </tr>
            <tr>
                <td colspan="4"></td>
            </tr>


            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">减免取消信息</span> </td>
            </tr>
            <tr>
                <td class="TdTitle">尚未减免总额</td>
                <td class="TdContent">
                    <asp:Label ID="lbWaivModifyMaxAmount" Style="z-index: 0" runat="server"></asp:Label></td>
                <td class="TdTitle">取消减免总额</td>
                <td class="TdContent">
                    <asp:Label ID="lbWaivModifyAmount" Style="z-index: 0" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">提交取消减免总额</td>
                <td class="TdContent">
                    <input style="height: 22px; z-index: 0; width: 60%" id="ModifyAuditAmount" class="Control_ItemInput"
                        name="ModifyAuditAmount" runat="server" disabled><input id="hiWaivModifyMaxAmount" style="height: 22px; z-index: 0; width: 24px" size="1"
                            type="hidden" name="hiWaivModifyMaxAmount" runat="server"></td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
            </tr>
            <tr>
                <td class="TdTitle">取消减免原因</td>
                <td class="TdContent" colspan="3">
                    <input id="ModifyReason" class="Control_ItemInput"
                        maxlength="100" name="ModifyReason" runat="server" disabled></td>
            </tr>
            <tr>
                <td class="TdTitle">提交取消减免人</td>
                <td class="TdContent">
                    <asp:Label ID="lbModifyUserName" Style="z-index: 0" runat="server"></asp:Label></td>
                <td class="TdTitle">取消减免时间</td>
                <td class="TdContent">
                    <asp:Label ID="lbModifyDate" Style="z-index: 0" runat="server"></asp:Label></td>
            </tr>


            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">减免取消审核信息</span> </td>
            </tr>
            <tr>
                <td class="TdTitle">审核人</td>
                <td class="TdContent">
                    <asp:Label ID="lbModifyAuditUserName" Style="z-index: 0" runat="server"></asp:Label></td>
                <td class="TdTitle">审核时间</td>
                <td class="TdContent">
                    <asp:Label ID="lbModifyAuditDate" Style="z-index: 0" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">审核意见</td>
                <td class="formTable_ItemInput" colspan="3">
                    <input id="ModifyAuditMemo" class="Control_ItemInput"
                        maxlength="100" name="ModifyAuditMemo" runat="server"></td>
            </tr>
            <tr>
                <td colspan="4"></td>
            </tr>
            <tr>
                <td class="formTable_Footer" colspan="4" align="center">
                    <input id="btnOk" class="button"   type="button" value="审核通过"
                        name="btnOk" runat="server">&nbsp;<input onclick="javascript: if (CheckNoData() == false) return false;" id="btnNo" class="button"
                              type="button" value="审核不通过" name="btnNo" runat="server">&nbsp;<input id="btnReturn" class="button" value="关闭" type="button"
                                name="btnFilter" runat="server"></td>
            </tr>
            <tr>
                <td class="SchTable" colspan="4" align="left">备注：1、当一个费项包含佣金时（比如车位租金350元/月，其中包含车位租金300元/月和车位物管50元/月），可具体指定减免本金还是佣金。2、当减免的费用属于已经生成的费用时，审核通过后立即生效；当减免的费用属于尚未生成的费用时，今后费用生成时生效。</td>
            </tr>

            <tr>
                <td colspan="4"></td>
            </tr>

            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">每月减免费用详细</span> </td>
            </tr>
            <tr>
                <td colspan="4" style="height:300px">
                    <div style="width: 100%; height: 300px; background-color: #cccccc;" id="TableContainer">
                    </div>
                </td>
            </tr>

        </table>


        <script type="text/javascript">
            $(function () {

                LoadList();
            });



            var column = [[
                       { field: 'CustName', title: '客户名称', width: 160, align: 'left', sortable: true },
                       { field: 'RoomSign', title: '房屋编号', width: 160, align: 'left', sortable: true },
                       { field: 'CostSNum', title: '费用序号', width: 100, align: 'left', sortable: true },
                       { field: 'CostName', title: '费用名称', width: 150, align: 'left', sortable: true },
                       { field: 'CreYear', title: '减免费用年份', width: 140, align: 'left', sortable: true },
                       { field: 'CreMonth', title: '减免费用月份', width: 140, align: 'left', sortable: true },
                       { field: 'WaivTypeName', title: '减免方式', width: 100, align: 'left', sortable: true },
                       { field: 'WaivRates', title: '减免比例', width: 100, align: 'left', sortable: true },
                       { field: 'OldWaivAmount', title: '未减免金额', width: 100, align: 'left', sortable: true },
                       { field: 'OffsetAmount', title: '已减免金额', width: 100, align: 'left', sortable: true }

            ]];

            //获取减免冲抵记录
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=WaiversFees&Command=getoffsetwaivlist&WaivID=' + $("#WaivID").val(),
                    method: "get",
                    title: '',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    remoteSort: false,
                    fitColumns: true,
                    rownumbers: true,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    height: "98%",
                    border: false,
                    sortOrder: "asc"
                });
            }
        </script>

    </form>
</body>
</html>
