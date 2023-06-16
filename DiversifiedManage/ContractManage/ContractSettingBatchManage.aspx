<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractSettingBatchManage.aspx.cs" Inherits="M_Main.DiversifiedManage.ContractManage.ContractSettingBatchManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同计费标准批量新增</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link href="../../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/basebootstrap.css" rel="stylesheet" />
    <script src="../../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.tool.new.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../../jscript/uuid.js"></script>
    <script type="text/javascript" src="../../jscript/Dialog.js"></script>

    <style type="text/css">
        .bootstrap_table tr td.title {
            width: 23%;
            text-align: center;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            width: 27%;
            text-align: left;
        }

        .datagrid-mask-msg {
            height: 40px;
        }
    </style>
</head>
<body style="overflow: hidden; padding: 0px; margin: 0px;">
    <input type="hidden" name="HidAllPointID" id="HidAllPointID" />
    <input type="hidden" name="ContractPointData" id="ContractPointData" />
    <input type="hidden" name="ContractCommID" id="ContractCommID" />
    <form id="mainForm" runat="server">
        <div style="padding: 10px 5px;">
            <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">
                        <span>项目名称</span>
                    </td>
                    <td class="text" colspan="3">
                        <input id="CommName" name="CommName" class="easyui-textbox"
                            data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,width:'92%',height:'50px',multiline:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelComm();},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                            $(e.data.target).textbox('clear');
                                            $('#CommID').val('');
                                            $('#PointIDName').textbox('clear');
                                            $('#PointID').val('');
                                            }}] " />
                        <input type="hidden" name="CommID" id="CommID" />
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <span>客户名称</span>
                    </td>
                    <td class="text" colspan="3">
                        <input id="CustName" name="CustName" class="easyui-textbox" data-options="required:true,width:'92%'" disabled="disabled" />
                        <input type="hidden" name="CustID" id="CustID" />
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <span>点位编号</span>
                    </td>
                    <td class="text" colspan="3">
                        <input id="PointIDName" name="PointIDName" class="easyui-textbox"
                            data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',width:'92%',height:'50px',multiline:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelPoint();},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                            $(e.data.target).textbox('clear');
                                            $('#PointID').val('');
                                            }}] " />
                        <input type="hidden" name="PointID" id="PointID" />
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <span>开始时间</span>
                    </td>
                    <td class="text">
                        <input type="text" id="BeginDate" name="BeginDate" class="easyui-datebox" runat="server" data-options="editable:false,required:true" />
                    </td>
                    <td class="title">
                        <span>结束时间</span>
                    </td>
                    <td class="text">
                        <input type="text" id="EndDate" name="EndDate" class="easyui-datebox" runat="server" data-options="editable:false,required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <span>应收时间</span>
                    </td>
                    <td class="text">
                        <input type="text" id="DueDate" name="DueDate" class="easyui-datebox" runat="server" data-options="editable:false,required:true" />
                    </td>
                    <td class="title">
                        <span>费用项目</span>
                    </td>
                    <td class="text">
                        <input id="CostName" name="CostName" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelCost();},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                            $(e.data.target).textbox('clear');
                                            $('#CostID').val('');
                                            }}] " />
                        <input type="hidden" name="CostID" id="CostID" />
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <span>计费方式</span>
                    </td>
                    <td class="text">
                        <input id="ChargeCalculation" name="ChargeCalculation" class="easyui-combobox" />
                    </td>
                    <td class="title">
                        <span>计算方式</span>
                    </td>
                    <td class="text">
                        <input type="text" id="CalculationMethodName" name="CalculationMethodName" class="easyui-textbox" runat="server" disabled="disabled" />
                        <input type="hidden" id="CalculationMethod" name="CalculationMethod" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title">计费周期(月)</td>
                    <td class="text">
                        <input type="text" id="ContPeriod" name="ContPeriod" class="easyui-numberbox" data-options="min:1,max:100,precision:0,required:true" runat="server" />
                    </td>
                    <td class="title">计费标准(元)</td>
                    <td class="text">
                        <input type="text" id="ContPrice" name="ContPrice" class="easyui-numberbox" data-options="precision:4,required:true" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title">计费数量</td>
                    <td class="text">
                        <input type="text" id="ChargeNumber" name="ChargeNumber" class="easyui-numberbox" disabled="disabled" data-options="precision:2" runat="server" />
                    </td>
                    <td class="title">保底金额(元/计费周期)</td>
                    <td class="text">
                        <input type="text" id="GuaranteeAmount" name="GuaranteeAmount" class="easyui-numberbox" data-options="min:0,precision:2,required:true" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title">提成比例(%)</td>
                    <td class="text">
                        <input type="text" id="BusinessRoyaltyRatio" name="BusinessRoyaltyRatio" class="easyui-numberbox" data-options="max:100,precision:2,required:true" runat="server" />
                    </td>
                    <td class="title">合同违约金标准(小数/天)</td>
                    <td class="text">
                        <input type="text" id="ContractDelinAmountStandard" name="ContractDelinAmountStandard" class="easyui-numberbox" data-options="min:0,precision:4" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title">合同违约金起计时间</td>
                    <td class="text" colspan="3">应收时间&nbsp;
                        <input type="text" id="ContractDelinBeginDay" name="ContractDelinBeginDay" style="width: 40px;" runat="server" class="easyui-numberbox" data-options="min:0,precision:0,onChange:ContractDelinBeginDayChange" />&nbsp;天之后起计
                       <div style="height: 5px;"></div>
                        应收时间延后&nbsp;<input type="text" id="ContractDelinBeginMonth" name="ContractDelinBeginMonth" style="width: 40px;" runat="server"
                            class="easyui-numberbox" data-options="min:0,precision:0,onChange:ContractDelinBeginMonthChange" />&nbsp;月&nbsp;
                        <input type="text" id="ContractDelinBeginMonth1" name="ContractDelinBeginMonth1" style="width: 40px;" runat="server" class="easyui-numberbox"
                            data-options="min:0,precision:0,onChange:ContractDelinBeginMonthChange" />&nbsp;日起计
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>
    </form>
    <script type="text/javascript">
        //选择项目
        function SelComm() {
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/Dialog/Comm.aspx?' + $.param({ "IsPowerPost": "是", "IsPowerLevel": "否" }), '选择项目', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    var id = "", text = "";
                    $.each(data, function (i, item) {
                        id += "," + item.CommID;
                        text += "," + item.CommName;
                    });
                    id = id.substr(1);
                    text = text.substr(1);
                    $("#CommID").val(id);
                    $("#CommName").textbox('setValue', text);
                }
            });
        }

        //选择点位
        function SelPoint() {
            let CommIDList = $("#CommID").val();
            if (!CommIDList) {
                $.messager.alert('温馨提示', "请先选择项目！");
                return;
            }
            let SendData = {
                CommID: CommIDList, // 项目id集合
                PointIDs: $('#PointID').val(), //已选点位id集合
                AllPointIDs: $('#HidAllPointID').val() //所有合同点位id集合
            };
            localStorage.setItem("ContractBatchSetting_SelPoint", JSON.stringify(SendData));
            LayerDialog.OpenWin('1000', '650', '../DiversifiedManage/Dialog/SelContractSelectedPoint_ForContractSetting.aspx', "选择合同点位", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    if (data.length > 0) {
                        let PointIDList = "";
                        let PointNumberList = "";
                        data.forEach((itemRow) => {
                            PointIDList = PointIDList + itemRow.ID + ',';
                            PointNumberList = PointNumberList + itemRow.Number + ',';
                        });
                        if (PointIDList.endsWith(",")) {
                            $('#PointID').val(PointIDList.substring(0, PointIDList.length - 1));
                        } else {
                            $('#PointID').val(PointIDList);
                        }
                        if (PointNumberList.endsWith(",")) {
                            $('#PointIDName').textbox("setValue", PointNumberList.substring(0, PointNumberList.length - 1));
                        } else {
                            $('#PointIDName').textbox("setValue", PointNumberList);
                        }
                    }
                }
            });
        }

        //选择总部的费用项目 保存时先去验证一下在对应项目是否存在已分发的费用项目
        function SelCost() {
            LayerDialog.OpenWin('700', '400', '../DiversifiedManage/Dialog/SelCorpCostItem.aspx', "选择费用项目", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#CostID").val(data.attributes.CorpCostID);
                    $("#CostName").textbox("setValue", data.attributes.CostName);
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

        //初始化页面数据
        function InitData() {
            //获取值
            var SettingData = localStorage.getItem("ContractBatchSetting");
            //设置值为空
            localStorage.setItem("ContractBatchSetting", "");
            var ItemData = JSON.parse(SettingData);

            //循环构建点位中的所有项目
            //循环构建所有点位
            let PointIDList = "";
            let CommNameList = '';
            let CommIDList = '';
            ItemData.PointData.forEach((itemRow) => {
                if (!CommIDList.includes(itemRow.CommID)) {
                    CommNameList = CommNameList + itemRow.CommName + ',';
                    CommIDList = CommIDList + itemRow.CommID + ',';
                }
                PointIDList = PointIDList + itemRow.ContractPointID + ',';
            });
            //将合同点位数据存放
            $('#ContractPointData').val(JSON.stringify(ItemData.PointData));
            if (CommIDList.endsWith(",")) {
                $('#CommID').val(CommIDList.substring(0, CommIDList.length - 1));
                $('#CommName').textbox("setValue", CommNameList.substring(0, CommNameList.length - 1));
            } else {
                $('#CommID').val(CommIDList);
                $('#CommName').textbox("setValue", CommNameList);
            }

            if (PointIDList.endsWith(",")) {
                $('#HidAllPointID').val(PointIDList.substring(0, PointIDList.length - 1));
            } else {
                $('#HidAllPointID').val(PointIDList);
            }

            //循环计费方式 构建计费方式下拉
            var ChargeCalculationData = [];
            for (let i = 0; i < ItemData.ChargeCalculationData.length; i++) {
                ChargeCalculationData.push({ "id": ItemData.ChargeCalculationData[i].id, "text": ItemData.ChargeCalculationData[i].Name });
            }
            //加载计费方式
            $('#ChargeCalculation').combobox({
                editable: false,
                tipPosition: 'bottom',
                panelHeight: 'auto',
                valueField: 'id',
                textField: 'text',
                required: true,
                data: ChargeCalculationData,
                onSelect: function (record) {
                    //加载计算方式
                    var CurrentChargeCalculation = record.id;
                    //获取选中的点位信息
                    var Node = ItemData.ChargeCalculationData.filter(function (e) {
                        return e.id == CurrentChargeCalculation;
                    });
                    if (Node != null) {
                        $('#CalculationMethodName').textbox("setValue", Node[0].SubName);
                        $('#CalculationMethod').val(Node[0].SubID);

                        $('.easyui-numberbox').numberbox("disableValidation");
                        $('.easyui-datebox').datebox("disableValidation");

                        //判断哪些值必填非必填    
                        switch (Node[0].SubID) {
                            case "0":
                                //按每月单价
                                $('.easyui-datebox').datebox("enableValidation");//时间 
                                $('#ContPeriod').numberbox("enableValidation"); //计费周期 
                                $('#ContPrice').numberbox("enableValidation"); //计费标准 
                                break;
                            case "1":
                                //按缴费周期总额
                                $('.easyui-datebox').datebox("enableValidation");//时间 
                                $('#ContPeriod').numberbox("enableValidation"); //计费周期 
                                $('#ContPrice').numberbox("enableValidation"); //计费标准 
                                break;
                            case "2":
                                //按合同期间总额
                                $('.easyui-datebox').datebox("enableValidation");//时间 
                                $('#ContPeriod').numberbox("enableValidation"); //计费周期 
                                $('#ContPrice').numberbox("enableValidation"); //计费标准 
                                break;
                            case "3":
                                //按每天单价
                                $('.easyui-datebox').datebox("enableValidation"); //时间
                                $('#ContPeriod').numberbox("enableValidation"); //计费周期
                                $('#ContPrice').numberbox("enableValidation"); //计费标准 
                                break;
                            case "4":
                                //按数量*单价
                                $('#ContPeriod').numberbox("enableValidation"); //计费周期 
                                $('#ContPrice').numberbox("enableValidation"); //计费标准 
                                break;
                            case "5":
                                //按实际发生额
                                $('#ContPeriod').numberbox("enableValidation"); //计费周期 
                                break;
                            case "6":
                                //按提成
                                $('#ContPeriod').numberbox("enableValidation"); //计费周期 
                                $('#BusinessRoyaltyRatio').numberbox("enableValidation"); //提成比例 
                                break;
                            case "7":
                                //按保底+提成
                                $('#ContPeriod').numberbox("enableValidation"); //计费周期 
                                $('#GuaranteeAmount').numberbox("enableValidation"); //保底金额 
                                $('#BusinessRoyaltyRatio').numberbox("enableValidation"); //提成比例 
                                break;
                            case "8":
                                //保底、提成就高
                                $('#ContPeriod').numberbox("enableValidation"); //计费周期 
                                $('#GuaranteeAmount').numberbox("enableValidation"); //保底金额 
                                $('#BusinessRoyaltyRatio').numberbox("enableValidation"); //提成比例 
                                break;
                        }
                    }
                },
                onLoadSuccess: function () {
                    var data = $(this).combobox('getData');
                    if (data.length == 1) {
                        for (var i = 0; i < data.length; i++) {
                            $("#ChargeCalculation").combobox('setValue', data[i].id);
                            break;
                        }
                    }
                }
            });
        }

        function AddDate(dateTime, days) {
            dateTime = dateTime.setDate(dateTime.getDate() + days);
            dateTime = new Date(dateTime);
            return dateTime;
        }

        //保存
        function Save() {
            if ($('#mainForm').form("validate")) {
                var MonthValue = "";
                var DayValue = "";
                //判断合同违约金起计时间
                if ($('#ContractDelinBeginMonth').numberbox("getValue") != "") {
                    MonthValue = $('#ContractDelinBeginMonth').numberbox("getValue");
                    DayValue = $('#ContractDelinBeginMonth1').numberbox("getValue");
                } else {
                    DayValue = $('#ContractDelinBeginDay').numberbox("getValue");
                }

                //验证项目下点位计费单位是否相同
                //验证项目下是否已发放当前的总部费项
                $.tool.DataPostJsonAsync('DiversifiedManage', 'ValidateContractBatchSettingCorpCostItem',
                    "CommID=" + $('#CommID').val() + "&CorpCostID=" + $('#CostID').val() + "&CorpCostName=" + $('#CostName').textbox("getValue") +
                    "&CustID=" + $('#CustID').val() + "&ContractCommID=" + $('#ContractCommID').val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (!_Data.result) {
                            //存在未发放费项情况提示
                            $.messager.alert('温馨提示', replace(_Data.msg));
                        } else {
                            //获取合同点位数据
                            let ContractPointData = JSON.parse($('#ContractPointData').val());
                            //过滤选中的点位数据
                            let SelectContractPointData = ContractPointData.filter(function (e) {
                                return $('#PointID').val().includes(e.ContractPointID);
                            });
                            let CalculationMethodValue = $('#CalculationMethod').val();
                            //构建每个项目所对应的点位等信息
                            let CostItemData = JSON.parse(_Data.data);
                            CostItemData.forEach((itemRow) => {
                                //ErrMsg 错误信息
                                //获取当前项目的所有点位
                                //let CommNode = ContractPointData.
                                //循环选中的点位构建每个项目所对应的的点位信息
                                var ItemSelectPointData = SelectContractPointData.filter((e) => {
                                    return e.CommID == itemRow.CommID
                                });
                                let i = 1;
                                let PointIDList = "";
                                let PointNumberList = "";
                                //按照点位计费单位分组
                                const sorted = groupBy(ItemSelectPointData, function (item) {
                                    return [item.CalculateCostUnit];//按照name进行分组
                                });
                                //如果分组结果大于1 那么就代表不一致
                                if (sorted.length > 1) {
                                    itemRow.ErrMsg = '项目【' + itemRow.CommName + '】';
                                }
                                ItemSelectPointData.forEach((itemSelectRow) => {
                                    //判断点位个数是否大于4如果大于4个那么就显示。。。
                                    PointIDList = PointIDList + itemSelectRow.ContractPointID + ',';
                                    if (i <= 2) {
                                        PointNumberList = PointNumberList + itemSelectRow.ContractPointNumber + ',';
                                    } else {
                                        if (!PointNumberList.includes('...')) {
                                            if (PointNumberList.endsWith(",")) {
                                                PointNumberList = PointNumberList.substring(0, PointNumberList.length - 1) + '...';
                                            } else {
                                                PointNumberList = PointNumberList + '...';
                                            }
                                        }
                                    }
                                    //判断标准计算方式
                                    switch (CalculationMethodValue) {
                                        case "3": case "0":
                                            //计算方式为“按每日单价3”、“按每月单价0”时
                                            if (!isValueNull(itemRow.ErrMsg)) {
                                                itemRow.ChargeNumber = parseFloat(itemRow.ChargeNumber) + parseFloat(itemSelectRow.ChargeNumber);
                                            }
                                            break;
                                        case "1": case "2":
                                            itemRow.ErrMsg = '';
                                            //计算方式为“按缴费周期总额1”、“按合同期间总额2”时：
                                            //不判断是否计费单位不一样，默认都是添加点位数量【及点位+1】
                                            itemRow.ChargeNumber = parseFloat(itemRow.ChargeNumber) + 1.00;
                                            //if (sorted.length > 1) {
                                            //    itemRow.ChargeNumber = parseFloat(itemRow.ChargeNumber) + 1.00;
                                            //}
                                            //else {
                                            //    itemRow.ChargeNumber = parseFloat(itemRow.ChargeNumber) + parseFloat(itemSelectRow.ChargeNumber);
                                            //}
                                            break;
                                        default:
                                            //计算方式是其他方式
                                            itemRow.ErrMsg = '';
                                            break;
                                    }
                                    i++;
                                });
                                if (PointIDList.endsWith(",")) {
                                    itemRow.PointID = PointIDList.substring(0, PointIDList.length - 1);
                                } else {
                                    itemRow.PointID = PointIDList;
                                }
                                if (PointNumberList.endsWith(",")) {
                                    itemRow.PointNumber = PointNumberList.substring(0, PointNumberList.length - 1);
                                } else {
                                    itemRow.PointNumber = PointNumberList;
                                }
                            });
                            //循环拼接有问题的数据
                            let HDialogErrorMessage = '';
                            CostItemData.forEach((item) => {
                                if (item.ErrMsg != "") {
                                    HDialogErrorMessage = HDialogErrorMessage + item.ErrMsg + "<br/>";
                                }
                            });
                            let ReturnSettingData = [];
                            if (HDialogErrorMessage != "") {
                                HDialogErrorMessage = HDialogErrorMessage + '中的已选点位存在计算方式不一致的数据';
                                $.messager.confirm('确定', HDialogErrorMessage + ',是否确定继续保存标准【继续保存将排除该数据】?', function (r) {
                                    if (r) {
                                        //费用项目都正常发放 构建返回数据
                                        CostItemData.forEach((itemRow) => {
                                            if (itemRow.ErrMsg == "") {
                                                var ItemSettingData = {
                                                    ID: '',
                                                    ContractID: '',
                                                    ContID: '',
                                                    CommID: itemRow.CommID,
                                                    CommName: itemRow.CommName,
                                                    CustID: itemRow.CustID,
                                                    CustName: itemRow.CustName,
                                                    RoomID: '',
                                                    RoomSign: '',
                                                    PointID: itemRow.PointID,//多点位自动构建
                                                    PointNumber: itemRow.PointNumber,//多点位自动构建
                                                    BeginDate: $("#BeginDate").datebox("getValue"),
                                                    EndDate: $("#EndDate").datebox("getValue"),
                                                    DueDate: $("#DueDate").datebox("getValue"),
                                                    CostID: itemRow.CostID,
                                                    CostName: $("#CostName").textbox("getValue"),
                                                    ChargeCalculation: $("#ChargeCalculation").combobox("getValue"),
                                                    CalculationMethod: $('#CalculationMethod').val(),
                                                    ContPeriod: $('#ContPeriod').numberbox("getValue"),
                                                    ContPrice: $('#ContPrice').numberbox("getValue"),
                                                    ChargeNumber: itemRow.ChargeNumber,//多点位自动构建
                                                    GuaranteeAmount: $('#GuaranteeAmount').numberbox("getValue"),
                                                    BusinessRoyaltyRatio: $('#BusinessRoyaltyRatio').numberbox("getValue"),
                                                    ContractDelinAmountStandard: $('#ContractDelinAmountStandard').numberbox("getValue"),
                                                    ContractDelinBeginDay: DayValue,
                                                    ContractDelinBeginMonth: MonthValue
                                                };
                                                ReturnSettingData.push(ItemSettingData);
                                            }
                                        });
                                        HDialog.Close(JSON.stringify(ReturnSettingData));
                                    } else {
                                        return;
                                    }
                                });
                            } else {
                                //费用项目都正常发放 构建返回数据
                                CostItemData.forEach((itemRow) => {
                                    var ItemSettingData = {
                                        ID: '',
                                        ContractID: '',
                                        ContID: '',
                                        CommID: itemRow.CommID,
                                        CommName: itemRow.CommName,
                                        CustID: itemRow.CustID,
                                        CustName: itemRow.CustName,
                                        RoomID: '',
                                        RoomSign: '',
                                        PointID: itemRow.PointID,//多点位自动构建
                                        PointNumber: itemRow.PointNumber,//多点位自动构建
                                        BeginDate: $("#BeginDate").datebox("getValue"),
                                        EndDate: $("#EndDate").datebox("getValue"),
                                        DueDate: $("#DueDate").datebox("getValue"),
                                        CostID: itemRow.CostID,
                                        CostName: $("#CostName").textbox("getValue"),
                                        ChargeCalculation: $("#ChargeCalculation").combobox("getValue"),
                                        CalculationMethod: $('#CalculationMethod').val(),
                                        ContPeriod: $('#ContPeriod').numberbox("getValue"),
                                        ContPrice: $('#ContPrice').numberbox("getValue"),
                                        ChargeNumber: itemRow.ChargeNumber,//多点位自动构建
                                        GuaranteeAmount: $('#GuaranteeAmount').numberbox("getValue"),
                                        BusinessRoyaltyRatio: $('#BusinessRoyaltyRatio').numberbox("getValue"),
                                        ContractDelinAmountStandard: $('#ContractDelinAmountStandard').numberbox("getValue"),
                                        ContractDelinBeginDay: DayValue,
                                        ContractDelinBeginMonth: MonthValue
                                    };
                                    ReturnSettingData.push(ItemSettingData);
                                });
                                HDialog.Close(JSON.stringify(ReturnSettingData));
                            }
                        }
                    },
                    function _completeCallBack() {
                    },
                    function errorCallback() {
                    });
            }
        }
        function groupBy(array, f) {
            const groups = {};
            array.forEach(function (o) {
                const group = JSON.stringify(f(o));
                groups[group] = groups[group] || [];
                groups[group].push(o);
            });
            return Object.keys(groups).map(function (group) {
                return groups[group];
            });
        }
        //替换换行
        function replace(strings) {
            var parter = /(\\n+)/g;
            return strings.replace(parter, "<br/>");
        }
        //关闭
        function Close() {
            LayerDialog.Close("");
        }
        //页面初始化
        $(function () {
            //datebox 添加清空
            var buttons = $.extend([], $.fn.datebox.defaults.buttons);
            buttons.splice(1, 0, {
                text: '清空',
                handler: function (target) {
                    $(target).datebox("setValue", "");
                }
            });
            $('.easyui-datebox').datebox({
                buttons: buttons
            });

            //初始化禁用页面控件验证
            $('.easyui-numberbox').numberbox("disableValidation");
            $('.easyui-datebox').datebox("disableValidation");

            let CustID = $.getUrlParam("CustID");
            if (CustID != null) {
                $("#CustID").val(CustID);
            }

            let CustName = $.getUrlParam("CustName");
            if (CustName != null) {
                $("#CustName").textbox("setValue", CustName);
            }
            let ContractBeginTime = $.getUrlParam("ContractBeginTime");
            let ContractEndTime = $.getUrlParam("ContractEndTime");
            let ContractCommID = $.getUrlParam("ContractCommID");
            $('#BeginDate').datebox("setValue", ContractBeginTime);
            $('#EndDate').datebox("setValue", ContractEndTime);
            $('#DueDate').datebox("setValue", ContractBeginTime);
            //合同项目ID
            $('#ContractCommID').val(ContractCommID);

            InitData();
        });
    </script>
</body>
</html>
