<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaseContractSettingManage.aspx.cs" Inherits="M_Main.LeaseManage.LeaseContractSettingManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁合同计费标准编辑页面</title>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <style type="text/css">
        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            line-height: 20px;
        }

        .TdContentSearch textarea {
            width: 88%;
            height: 44px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            height: 45px;
            width: 96.2%;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            width: 142px;
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 19%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }

        .TdContentSearchDisable {
            background-color: #E3E3E3;
        }

        .TdContentSearch .InputRadio {
            cursor: pointer;
            font-weight: normal;
        }
    </style>
</head>
<body style="overflow: auto; margin: 0px; padding: 0px;">
    <form id="frmFrom" runat="server">
        <div style="padding: 5px;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">费用承担对象:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="CustName" name="CustName" runat="server" searcher="SelCust" class="easyui-searchbox" data-options="editable:false,required:true" />
                        <input type="hidden" id="CustID" name="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">房屋编号:</td>
                    <td class="TdContentSearch">
                        <select id="RoomSign" name="RoomSign" class="easyui-combobox" data-options="editable:false,panelHeight:'auto',required:true">
                        </select>
                        <input type="hidden" id="RoomName" name="RoomName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">开始日期:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="BeginDate" name="BeginDate" class="easyui-datebox" runat="server" data-options="editable:false,required:true" />
                    </td>
                    <td class="TdTitle">结束日期:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="EndDate" name="EndDate" class="easyui-datebox" runat="server" data-options="editable:false,required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">应收日期:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="DueDate" name="DueDate" class="easyui-datebox" runat="server" data-options="editable:false,required:true" />
                    </td>
                    <td class="TdTitle">费用项目:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="CostName" name="CostName" runat="server" searcher="SelCost" class="easyui-searchbox" data-options="editable:false,required:true" />
                        <input type="hidden" id="CostID" name="CostID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">计算方式:</td>
                    <td class="TdContentSearch" colspan="3">
                        <label class="InputRadio">
                            <input type="radio" id="CalcType2" name="CalcType" value="3" runat="server" checked /><span>按每天单价</span></label>
                        <label class="InputRadio">
                            <input type="radio" id="CalcType1" name="CalcType" value="0" runat="server" /><span>按每月单价</span></label>
                        <label class="InputRadio">
                            <input type="radio" id="CalcType3" name="CalcType" value="1" runat="server" /><span>按缴费周期总额</span></label>
                        <label class="InputRadio">
                            <input type="radio" id="CalcType4" name="CalcType" value="2" runat="server" /><span>按租赁期间总额</span></label>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">计费周期(月):</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ContPeriod" name="ContPeriod" class="easyui-numberbox" data-options="min:1,max:100,precision:0,required:true" runat="server" />
                    </td>
                    <td class="TdTitle">租金标准(<lable id="RentStandardUnit">元/月.平米</lable>):</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ContPrice" name="ContPrice" class="easyui-numberbox" data-options="min:0,precision:2,required:true" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">面积(平米):</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ContNum" name="ContNum" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
                        <input type="hidden" id="HideContNum" name="HideContNum" runat="server" />
                    </td>
                    <td class="TdTitle">合同违约金标准(小数/天):</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ContractDelinAmountStandard" name="ContractDelinAmountStandard" class="easyui-numberbox" data-options="min:0,precision:4" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">合同违约金起计时间:</td>
                    <td class="TdContentSearch" colspan="3">应收时间&nbsp;<input type="text" id="ContractDelinBeginDay" name="ContractDelinBeginDay"
                        style="width: 40px;" runat="server" class="easyui-numberbox" data-options="min:0,precision:0,onChange:ContractDelinBeginDayChange" />&nbsp;天之后起计<br />
                        <br />
                        应收时间延后&nbsp;<input type="text" id="ContractDelinBeginMonth" name="ContractDelinBeginMonth" style="width: 40px;" runat="server"
                            class="easyui-numberbox" data-options="min:0,precision:0,onChange:ContractDelinBeginMonthChange" />&nbsp;月&nbsp;
                        <input type="text" id="ContractDelinBeginMonth1" name="ContractDelinBeginMonth1" style="width: 40px;" runat="server" class="easyui-numberbox"
                            data-options="min:0,precision:0,onChange:ContractDelinBeginMonthChange" />&nbsp;日起计
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <div style="text-align: center; width: 100%; padding: 5px 0;">
        <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" runat="server" />
        <input type="button" class="button" value="放弃返回" id="BtnReturn" onclick="btnClose();" />
    </div>

    <input type="hidden" id="ID" name="ID" runat="server" />
    <input type="hidden" id="OpType" name="OpType" runat="server" />
    <input type="hidden" id="CommID" name="CommID" runat="server" />
    <input type="hidden" id="ContractID" name="ContractID" runat="server" />
    <input type="hidden" id="ContID" name="ContID" runat="server" />
    <script language="javascript" type="text/javascript">
        function btnClose() {
            HDialog.Close("");
        }
        //选择客户
        function SelCust() {
            HDialog.Open('960', '500', "../DialogNew/CustDlg.aspx", '费用承担对象选择', false, function callback(_Data) {
                if (_Data != "") {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                }
            });
        }
        //选择费用项目
        function SelCost() {
            HDialog.Open('700', '400', "../dialogNew/CorpCommCostDlg.aspx", '费用项目选择', false, function callback(_Data) {
                if (_Data != "") {//**获得返回 刷新
                    var data = JSON.parse(_Data);
                    $('#CostName').searchbox("setValue", data.CostName);
                    $('#CostID').val(data.CostID);
                }
            });
        }
        //合同违约金起计时间 天
        function ContractDelinBeginDayChange(newValue, oldValue) {
            if (newValue != "") {
                $('#ContractDelinBeginMonth').numberbox("setValue", "");
                $('#ContractDelinBeginMonth1').numberbox("setValue", "");
            }
        }
        //合同违约金起计时间 月 天
        function ContractDelinBeginMonthChange(newValue, oldValue) {
            if (newValue != "") {
                $('#ContractDelinBeginDay').numberbox("setValue", "");
            }
        }
        //加载页面数据
        function LoadBaseData() {
            //获取值
            var SettingData = localStorage.getItem("LeaseContractSetting");
            //设置值为空
            localStorage.setItem("LeaseContractSetting", "");
            var ItemData = JSON.parse(SettingData);
            //alert(ItemData.RoomData);
            //循环租赁房屋 构建房屋下拉
            var RoomData = [];
            for (var i = 0; i < ItemData.RoomData.length; i++) {
                RoomData.push({ "RoomSign": ItemData.RoomData[i].RoomSign, "RoomID": ItemData.RoomData[i].RoomID });
            }
            //加载房屋下拉
            $('#RoomSign').combobox({
                data: RoomData,
                valueField: 'RoomID',
                textField: 'RoomSign',
                onLoadSuccess: function () {
                },
                onSelect: function (record) {
                    var CurrentRoomID = record.RoomID;
                    //获取选中的房屋信息
                    var Node = ItemData.RoomData.filter(function (e) {
                        return e.RoomID == CurrentRoomID;
                    });
                    if (Node != null) {
                        //默认开始日期
                        $('#BeginDate').datebox("setValue", Node[0].LeaseBeginTime);
                        //判断优惠免租时间
                        if (Node[0].RentFreeEndTime != "") {
                            //优惠免租时间不为空 
                            if (Node[0].LeaseBeginTime != "") {
                                //比较优惠免租时间+1和租赁开始时间
                                var NewRentFreeEndTime = AddDate(new Date(Node[0].RentFreeEndTime), 1);
                                if (NewRentFreeEndTime > new Date(Node[0].LeaseBeginTime)) {
                                    $('#BeginDate').datebox("setValue", $.dateFormat(NewRentFreeEndTime, 'yyyy-MM-dd'));
                                }
                            } else {
                                $('#BeginDate').datebox("setValue", Node[0].RentFreeEndTime);
                            }
                        }
                        //判断 顺延起租开始时间
                        if (Node[0].PostPoneBeginTime != "") {
                            if (Node[0].RentFreeEndTime == "" && Node[0].LeaseBeginTime == "") {
                                $('#BeginDate').datebox("setValue", Node[0].PostPoneBeginTime);
                            } else {
                                var CurrentTime = $('#BeginDate').datebox("getValue");
                                if (new Date(Node[0].PostPoneBeginTime) > new Date(CurrentTime)) {
                                    $('#BeginDate').datebox("setValue", Node[0].PostPoneBeginTime);
                                }
                            }
                        }
                        //默认结束时间
                        $('#EndDate').datebox("setValue", Node[0].LeaseEndTime);

                        //默认面积
                        $('#HideContNum').val(Node[0].RoomRentalArea);
                        $('#ContNum').val(Node[0].RoomRentalArea);
                        //房屋名称
                        $('#RoomName').val(Node[0].RoomName);
                    }
                    if (ItemData.SettingData != null) {
                        $('.InputRadio [type=radio][name=CalcType]').each(function () {
                            if ($(this).val() == ItemData.SettingData.CalcType) {
                                $(this).prop("checked", true);
                            }
                        });
                        CalcTypeSelect(ItemData.SettingData.CalcType);
                    }
                }
            });
            //加载页面数据
            if (ItemData.SettingData != null) {
                if ($('#OpType').val() == "edit") {
                    $('#ID').val(ItemData.SettingData.ID);
                }
                $('#ContractID').val(ItemData.SettingData.ContractID);
                $('#ContID').val(ItemData.SettingData.ContID);
                $('#CommID').val(ItemData.SettingData.CommID);
                $('#CustName').searchbox("setValue", ItemData.SettingData.CustName);
                $('#CustID').val(ItemData.SettingData.CustID);
                $('#RoomSign').combobox("setValue", ItemData.SettingData.RoomID);
                $('#RoomName').val(ItemData.SettingData.RoomName);
                $('#BeginDate').datebox("setValue", ItemData.SettingData.BeginDate);
                $('#EndDate').datebox("setValue", ItemData.SettingData.EndDate);
                $('#DueDate').datebox("setValue", ItemData.SettingData.DueDate);
                $('#CostName').searchbox("setValue", ItemData.SettingData.CostName);
                $('#CostID').val(ItemData.SettingData.CostID);
                $('#ContPeriod').numberbox("setValue", ItemData.SettingData.ContPeriod);
                $('#ContPrice').numberbox("setValue", ItemData.SettingData.ContPrice);
                $('#HideContNum').val(ItemData.SettingData.ContNum);
                $('#ContNum').val(ItemData.SettingData.ContNum);
                $('.InputRadio [type=radio][name=CalcType]').each(function () {
                    if ($(this).val() == ItemData.SettingData.CalcType) {
                        $(this).prop("checked", true);
                    }
                });
                CalcTypeSelect(ItemData.SettingData.CalcType);
                $('#ContractDelinAmountStandard').numberbox("setValue", ItemData.SettingData.ContractDelinAmountStandard);
                if (ItemData.SettingData.ContractDelinBeginMonth != "") {
                    $('#ContractDelinBeginMonth').numberbox("setValue", ItemData.SettingData.ContractDelinBeginMonth);
                    $('#ContractDelinBeginMonth1').numberbox("setValue", ItemData.SettingData.ContractDelinBeginDay);
                } else {

                    $('#ContractDelinBeginDay').numberbox("setValue", ItemData.SettingData.ContractDelinBeginDay);
                }
            }
        }

        function AddDate(dateTime, days) {
            dateTime = dateTime.setDate(dateTime.getDate() + days);
            dateTime = new Date(dateTime);
            return dateTime;
        }

        //保存
        function Save() {
            if ($('#frmFrom').form("validate")) {

                var MonthValue = "";
                var DayValue = "";
                //判断合同违约金起计时间
                if ($('#ContractDelinBeginMonth').numberbox("getValue") != "") {
                    MonthValue = $('#ContractDelinBeginMonth').numberbox("getValue");
                    DayValue = $('#ContractDelinBeginMonth1').numberbox("getValue");
                } else {
                    DayValue = $('#ContractDelinBeginDay').numberbox("getValue");
                }

                var SettingData = {
                    ID: $('#ID').val(),
                    ContractID: $('#ContractID').val(),
                    ContID: $('#ContID').val(),
                    CommID: $('#CommID').val(),
                    CustID: $("#CustID").val(),
                    CustName: $("#CustName").searchbox("getValue"),
                    RoomID: $("#RoomSign").combobox("getValue"),
                    RoomSign: $("#RoomSign").combobox("getText"),
                    RoomName: $('#RoomName').val(),
                    BeginDate: $("#BeginDate").datebox("getValue"),
                    EndDate: $("#EndDate").datebox("getValue"),
                    DueDate: $("#DueDate").datebox("getValue"),
                    CostID: $("#CostID").val(),
                    CostName: $("#CostName").searchbox("getValue"),
                    CalcType: $("input[name='CalcType']:checked").val(),
                    ContPeriod: $('#ContPeriod').numberbox("getValue"),
                    ContPrice: $('#ContPrice').numberbox("getValue"),
                    ContNum: $('#HideContNum').val(),
                    ContractDelinAmountStandard: $('#ContractDelinAmountStandard').numberbox("getValue"),
                    ContractDelinBeginDay: DayValue,
                    ContractDelinBeginMonth: MonthValue
                };
                HDialog.Close(JSON.stringify(SettingData));
            }
        }
        function CalcTypeSelect(val) {
            switch (val.toString()) {
                case "0":
                    $('#RentStandardUnit').html("元/月.平米");
                    $('#ContNum').val($('#HideContNum').val());
                    break;
                case "3":
                    $('#RentStandardUnit').html("元/日.平米");
                    $('#ContNum').val($('#HideContNum').val());
                    break;
                case "1":
                    $('#RentStandardUnit').html("元/周期总额");
                    $('#ContNum').val("");
                    break;
                case "2":
                    $('#RentStandardUnit').html("元/租赁总额");
                    $('#ContNum').val("");
                    break;
                default:
                    $('#RentStandardUnit').html("元/日.平米");
                    $('#ContNum').val($('#HideContNum').val());
                    break;
            }
        }
        $(function () {
            LoadBaseData();
            // 计算方式 点击事件
            $('input[type=radio][name=CalcType]').change(function () {
                CalcTypeSelect($(this).val());
            });

        });
    </script>

</body>
</html>
