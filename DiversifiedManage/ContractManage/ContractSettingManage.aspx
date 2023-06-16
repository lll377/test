<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractSettingManage.aspx.cs" Inherits="M_Main.DiversifiedManage.ContractManage.ContractSettingManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同计费标准详细信息</title>
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
            width: 25%;
            text-align: center;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            width: 25%;
            text-align: left;
        }

        .datagrid-mask-msg {
            height: 40px;
        }
    </style>
</head>
<body style="overflow: hidden; padding: 0px; margin: 0px;">
    <input type="hidden" id="OpType" name="OpType" />
    <input type="hidden" name="ID" id="ID" />
    <input type="hidden" name="ContractID" id="ContractID" />
    <input type="hidden" name="ContID" id="ContID" />
    <input type="hidden" name="HidAllPointID" id="HidAllPointID" />
    <input type="hidden" name="ContractPointData" id="ContractPointData" />
    <form id="mainForm" runat="server">
        <div style="padding: 20px 5px;">
            <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">
                        <span>项目名称</span>
                    </td>
                    <td class="text">
                        <input id="CommName" name="CommName" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelComm();}" />
                        <input type="hidden" name="CommID" id="CommID" />
                    </td>
                    <td class="title">
                        <span>客户名称</span>
                    </td>
                    <td class="text">
                        <input id="CustName" name="CustName" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelCust();},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                            $(e.data.target).textbox('clear');
                                            $('#CommID').val('');
                                            }}] " />
                        <input type="hidden" name="CustID" id="CustID" />
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <span>可选房号</span>
                    </td>
                    <td class="text">
                        <input id="RoomSigns" name="RoomSigns" class="easyui-combobox" />
                        <input type="hidden" id="RoomID" name="RoomID" runat="server" />
                    </td>
                    <td class="title">
                        <span>房屋编号</span>
                    </td>
                    <td class="text">
                        <input type="text" id="RoomSign" name="RoomSign" class="easyui-textbox" runat="server" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <span>点位编号</span>
                    </td>
                    <td class="text" colspan="3">
                        <input id="PointNumber" name="PointNumber" class="easyui-textbox"
                            data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',width:'94%',height:'50px',multiline:true,
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
                        <input type="text" id="ChargeNumber" name="ChargeNumber" class="easyui-numberbox" data-options="precision:2,required:true" runat="server" />
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
                    <td class="text" colspan="3">应收时间&nbsp;<input type="text" id="ContractDelinBeginDay" name="ContractDelinBeginDay" style="width: 40px;" runat="server" class="easyui-numberbox" data-options="min:0,precision:0,onChange:ContractDelinBeginDayChange" />&nbsp;天之后起计
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
            LayerDialog.OpenWin('680', '500', '../DiversifiedManage/Dialog/SelContractCommByCommRole.aspx', "选择项目", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#CommID").val(data.attributes.CommID);
                    $("#CommName").textbox("setValue", data.text);
                    $("#CustID").val("");
                    $("#CustName").textbox("setValue", "");
                    $("#RoomID").val("");
                    $("#RoomSign").textbox("setValue", "");

                    $('#CostName').textbox("setValue", "");
                    $('#CostID').val("");

                    $('#RoomSigns').combobox('clear'); //清除已选中数据
                    $('#RoomSigns').combobox('loadData', []);//重新本地加载一个空数据

                    $('#PointID').val();
                    $('#PointNumber').textbox("setValue", "");
                }
            });
        }
        //选择客户 当前项目的业主、租户、临时客户和所有的客商
        function SelCust() {
            var param = { "CommID": $('#CommID').val(), "CommName": $('#CommName').textbox("getValue") };
            LayerDialog.OpenWin('1000', '600', '../DiversifiedManage/Dialog/SelContractCustomer.aspx?' + $.param(param), "选择客户", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#CustID").val(data.CustID);
                    $("#CustName").textbox("setValue", data.CustName);

                    $("#RoomID").val("");
                    $("#RoomSign").textbox("setValue", "");

                    $('#RoomSigns').combobox('clear'); //清除已选中数据
                    $('#RoomSigns').combobox('loadData', []);//重新本地加载一个空数据


                    LoadCustomerRoomSigns();
                }
            });
        }
        //选择当前选择的项目的 费用项目
        function SelCost() {
            var param = { "CommID": $("#CommID").val() };
            LayerDialog.OpenWin('700', '400', '../DialogNew/CorpCommCostDlg.aspx?' + $.param(param), "选择费用项目", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#CostID").val(data.CostID);
                    $("#CostName").textbox("setValue", data.CostName);
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
                        let i = 1;
                        data.forEach((itemRow) => {
                            PointIDList = PointIDList + itemRow.ID + ',';
                            if (i <= 2) {
                                PointNumberList = PointNumberList + itemRow.Number + ',';
                            } else {
                                if (!PointNumberList.includes('...')) {
                                    if (PointNumberList.endsWith(",")) {
                                        PointNumberList = PointNumberList.substring(0, PointNumberList.length - 1) + '...';
                                    } else {
                                        PointNumberList = PointNumberList + '...';
                                    }
                                }
                            }
                            i++;
                        });
                        if (PointIDList.endsWith(",")) {
                            $('#PointID').val(PointIDList.substring(0, PointIDList.length - 1));
                        } else {
                            $('#PointID').val(PointIDList);
                        }
                        if (PointNumberList.endsWith(",")) {
                            $('#PointNumber').textbox("setValue", PointNumberList.substring(0, PointNumberList.length - 1));
                        } else {
                            $('#PointNumber').textbox("setValue", PointNumberList);
                        }

                        let MinPointBeginTime = '';//最小开始时间
                        let MinRentFreeEndTime = '';//最小优惠免租时间
                        let MaxPointEndTime = '';//最大结束时间
                        let ChargeNumber = 0.00;

                        //获取合同点位数据
                        let ContractPointData = JSON.parse($('#ContractPointData').val());
                        //过滤选中的点位数据
                        let SelectContractPointData = ContractPointData.filter(function (e) {
                            return $('#PointID').val().includes(e.ContractPointID);
                        });

                        //验证选择的点位计费单位是否相同
                        //按照点位计费单位分组
                        const sorted = groupBy(SelectContractPointData, function (item) {
                            return [item.CalculateCostUnit];//按照name进行分组
                        });
                        //如果分组结果大于1 那么就代表不一致
                        if (sorted.length > 1) {
                            $.messager.alert('温馨提示', "所选点位存在多种计费单位，将不会默认计费数量！");
                            ChargeNumber = '';
                        }
                        SelectContractPointData.forEach((itemRow) => {
                            //最小开始时间
                            if (!!MinPointBeginTime) {
                                if (!!itemRow.PointBeginTime) {
                                    MinPointBeginTime = new Date(itemRow.PointBeginTime) < new Date(MinPointBeginTime) ? itemRow.PointBeginTime : MinPointBeginTime;
                                }
                            } else {
                                MinPointBeginTime = itemRow.PointBeginTime;
                            }
                            //最小优惠免租时间
                            if (!!MinRentFreeEndTime) {
                                if (!!itemRow.RentFreeEndTime) {
                                    MinRentFreeEndTime = new Date(itemRow.RentFreeEndTime) < new Date(MinRentFreeEndTime) ? itemRow.RentFreeEndTime : MinRentFreeEndTime;
                                }
                            } else {
                                MinRentFreeEndTime = itemRow.RentFreeEndTime;
                            }
                            //最大结束时间
                            if (!!MaxPointEndTime) {
                                if (!!itemRow.PointEndTime) {
                                    MaxPointEndTime = new Date(itemRow.PointEndTime) > new Date(MaxPointEndTime) ? itemRow.RentFreeEndTime : MaxPointEndTime;
                                }
                            } else {
                                MaxPointEndTime = itemRow.PointEndTime;
                            }
                            if (ChargeNumber >= 0.00) {
                                ChargeNumber = parseFloat(ChargeNumber) + parseFloat(itemRow.ChargeNumber);
                            }
                        });
                        //判断时间
                        if (!!MinPointBeginTime) {
                            $('#DueDate').datebox("setValue", MinPointBeginTime);
                            $('#BeginDate').datebox("setValue", MinPointBeginTime);
                        }
                        if (!!MaxPointEndTime) {
                            $('#EndDate').datebox("setValue", MaxPointEndTime);
                        }
                        if (!!MinPointBeginTime && !!MinRentFreeEndTime) {
                            let NewRentFreeEndTime = AddDate(new Date(MinRentFreeEndTime), 1)
                            if (NewRentFreeEndTime > new Date(MinPointBeginTime)) {
                                $('#BeginDate').datebox("setValue", $.dateFormat(NewRentFreeEndTime, 'yyyy-MM-dd'));
                            }
                        }
                        if (ChargeNumber != '') {
                            $('#ChargeNumber').numberbox("setValue", ChargeNumber);//计费数量
                        }
                    }
                }
            });
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
            var SettingData = localStorage.getItem("ContractSetting");
            //设置值为空
            localStorage.setItem("ContractSetting", "");
            var ItemData = JSON.parse(SettingData);
            //构建所有点位的ID集合
            let PointIDList = "";
            ItemData.PointData.forEach((itemRow) => {
                PointIDList = PointIDList + itemRow.ContractPointID + ',';
            });
            //多选点位
            if (PointIDList.endsWith(",")) {
                $('#HidAllPointID').val(PointIDList.substring(0, PointIDList.length - 1));
            } else {
                $('#HidAllPointID').val(PointIDList);
            }
            $('#ContractPointData').val(JSON.stringify(ItemData.PointData));
            //加载可选房号
            $('#RoomSigns').combobox({
                editable: false,
                tipPosition: 'bottom',
                panelHeight: '140px',
                valueField: 'RoomID',
                textField: 'RoomText',
                onSelect: function (record) {
                    $('#RoomSign').textbox("setValue", record.RoomText);
                    $('#RoomID').val(record.RoomID);
                },
                onLoadSuccess: function () {
                    var data = $(this).combobox('getData');
                    if (data.length > 0) {
                        if ($('#RoomID').val() != "") {
                            $(this).combobox('select', $('#RoomID').val());
                        } else {
                            for (var i = 0; i < data.length; i++) {
                                $(this).combobox('select', data[i].RoomID);
                                break;
                            }
                        }
                    }
                }
            });
            //循环计费方式 构建计费方式下拉
            var ChargeCalculationData = [];
            for (var i = 0; i < ItemData.ChargeCalculationData.length; i++) {
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
                                $('#ChargeNumber').numberbox("enableValidation");//计费数量 
                                $('#ContPrice').numberbox("enableValidation"); //计费标准 
                                break;
                            case "1":
                                //按缴费周期总额
                                $('.easyui-datebox').datebox("enableValidation");//时间 
                                $('#ContPeriod').numberbox("enableValidation"); //计费周期 
                                $('#ChargeNumber').numberbox("enableValidation");//计费数量 
                                $('#ContPrice').numberbox("enableValidation"); //计费标准 
                                break;
                            case "2":
                                //按合同期间总额
                                $('.easyui-datebox').datebox("enableValidation");//时间 
                                $('#ContPeriod').numberbox("enableValidation"); //计费周期 
                                $('#ChargeNumber').numberbox("enableValidation");//计费数量 
                                $('#ContPrice').numberbox("enableValidation"); //计费标准 
                                break;
                            case "3":
                                //按每天单价
                                $('.easyui-datebox').datebox("enableValidation"); //时间
                                $('#ContPeriod').numberbox("enableValidation"); //计费周期
                                $('#ChargeNumber').numberbox("enableValidation");//计费数量 
                                $('#ContPrice').numberbox("enableValidation"); //计费标准 
                                break;
                            case "4":
                                //按数量*单价
                                $('#ContPeriod').numberbox("enableValidation"); //计费周期 
                                $('#ChargeNumber').numberbox("enableValidation");//计费数量 
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
            //加载页面数据
            if (ItemData.SettingData != null) {
                if ($('#OpType').val() == "edit") {
                    $('#ID').val(ItemData.SettingData.ID);
                } else {
                    $('#ID').val(Math.uuid());
                }
                $('#ContractID').val(ItemData.SettingData.ContractID);
                $('#ContID').val(ItemData.SettingData.ContID);
                $('#CommID').val(ItemData.SettingData.CommID);
                $('#CommName').textbox("setValue", ItemData.SettingData.CommName);

                $('#CustID').val(ItemData.SettingData.CustID);
                $('#CustName').textbox("setValue", ItemData.SettingData.CustName);
                $('#RoomID').val(ItemData.SettingData.RoomID);
                //加载 可选房号 RoomSigns
                LoadCustomerRoomSigns();
                $('#PointID').val(ItemData.SettingData.PointID);
                $('#PointNumber').textbox("setValue", ItemData.SettingData.PointNumber);

                $('#BeginDate').datebox("setValue", ItemData.SettingData.BeginDate);
                $('#EndDate').datebox("setValue", ItemData.SettingData.EndDate);
                $('#DueDate').datebox("setValue", ItemData.SettingData.DueDate);

                $('#CostName').textbox("setValue", ItemData.SettingData.CostName);
                $('#CostID').val(ItemData.SettingData.CostID);
                if (ItemData.SettingData.ChargeCalculation != "") {
                    $('#ChargeCalculation').combobox("setValue", ItemData.SettingData.ChargeCalculation);
                }
                $('#ContPeriod').numberbox("setValue", ItemData.SettingData.ContPeriod);
                $('#ContPrice').numberbox("setValue", ItemData.SettingData.ContPrice);//计费标准（元）
                $('#ChargeNumber').numberbox("setValue", ItemData.SettingData.ChargeNumber);//计费数量
                $('#GuaranteeAmount').numberbox("setValue", ItemData.SettingData.GuaranteeAmount);//保底金额（元/计费周期）
                $('#BusinessRoyaltyRatio').numberbox("setValue", ItemData.SettingData.BusinessRoyaltyRatio);//提成比例（%）
                $('#ContractDelinAmountStandard').numberbox("setValue", ItemData.SettingData.ContractDelinAmountStandard);//合同违约金标准(小数/天)
                if (isValueNull(ItemData.SettingData.ContractDelinBeginMonth)) {
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

        //加载当前选中用户的房号数据 如果只有一个房号就默认选中 
        function LoadCustomerRoomSigns() {
            $.tool.DataGet('DiversifiedManage', 'ContractGetCustomerRoomSigns', "CustID=" + $('#CustID').val(),
                function Init() {
                },
                function callback(_Data) {
                    var RoomSignsData = [];
                    if (isValueNull(_Data)) {
                        var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        if (varObjects.length > 0) {
                            for (var i = 0; i < varObjects.length; i++) {
                                var RoomID = varObjects[i].RoomID;
                                var RoomSign = varObjects[i].RoomSign;
                                RoomSignsData.push({ "RoomText": RoomSign, "RoomID": RoomID });
                            }
                        }
                    }
                    $('#RoomSigns').combobox("loadData", RoomSignsData);
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        //保存
        function Save() {
            if ($('#mainForm').form("validate")) {
                //判断是否是满足条件
                //var CalculationMethodVal = $('#CalculationMethod').val();
                //if ((CalculationMethodVal == "3" || CalculationMethodVal == "0") && $('#ChargeNumber').numberbox("getValue") == "") {
                //    $.messager.alert('温馨提示', "计费数量必填！");
                //    return;
                //}
                //if ((CalculationMethodVal == "0" || CalculationMethodVal == "1" || CalculationMethodVal == "2"
                //    || CalculationMethodVal == "3" || CalculationMethodVal == "4") && $('#ContPrice').numberbox("getValue") == "") {
                //    $.messager.alert('温馨提示', "计费标准必填！");
                //    return;
                //}

                //if ((CalculationMethodVal == "6" || CalculationMethodVal == "7") && $('#BusinessRoyaltyRatio').numberbox("getValue") == "") {
                //    $.messager.alert('温馨提示', "提成比例必填！");
                //    return;
                //}

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
                    CommName: $('#CommName').textbox("getValue"),
                    CustID: $("#CustID").val(),
                    CustName: $("#CustName").textbox("getValue"),
                    RoomID: $("#RoomID").val(),
                    RoomSign: $("#RoomSign").textbox("getValue"),
                    PointID: $('#PointID').val(),
                    PointNumber: $('#PointNumber').textbox("getValue"),
                    BeginDate: $("#BeginDate").datebox("getValue"),
                    EndDate: $("#EndDate").datebox("getValue"),
                    DueDate: $("#DueDate").datebox("getValue"),
                    CostID: $("#CostID").val(),
                    CostName: $("#CostName").textbox("getValue"),
                    ChargeCalculation: $("#ChargeCalculation").combobox("getValue"),
                    CalculationMethod: $('#CalculationMethod').val(),
                    ContPeriod: $('#ContPeriod').numberbox("getValue"),
                    ContPrice: $('#ContPrice').numberbox("getValue"),
                    ChargeNumber: $('#ChargeNumber').numberbox("getValue"),
                    GuaranteeAmount: $('#GuaranteeAmount').numberbox("getValue"),
                    BusinessRoyaltyRatio: $('#BusinessRoyaltyRatio').numberbox("getValue"),
                    ContractDelinAmountStandard: $('#ContractDelinAmountStandard').numberbox("getValue"),
                    ContractDelinBeginDay: DayValue,
                    ContractDelinBeginMonth: MonthValue
                };
                HDialog.Close(JSON.stringify(SettingData));
            }
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



            var OpType = $.getUrlParam("OpType");
            if (OpType != null) {
                $("#OpType").val(OpType);
            }

            InitData();
        });
    </script>
</body>
</html>
