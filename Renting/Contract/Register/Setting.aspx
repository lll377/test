<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="M_Main.Renting.Contract.Register.Setting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-合同登记-计费标准设置</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <form id="mainForm" class="form-horizontal" role="form" style="overflow-y: auto;">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">计费标准信息</legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">客户名称</label>
                <div class="col-sm-10 col-xs-10">
                    <input type="text" id="CustName" name="CustName" class="easyui-textbox" runat="server" data-options="disabled:true,width:'100%'" />
                    <input type="hidden" id="CustID" name="CustID" runat="server" />
                </div>

            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">房屋编号</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="RoomSigns" name="RoomSigns" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:true,width:'100%',height:'50px',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelRooms();}" />
                    <input type="hidden" id="RoomIDs" name="RoomIDs" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">开始时间</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="BeginDate" name="BeginDate" class="easyui-datebox" runat="server"
                        data-options="editable:false,required:true,width:'100%'" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">结束时间</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="EndDate" name="EndDate" class="easyui-datebox" runat="server"
                        data-options="editable:false,required:true,width:'100%'" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">应收时间</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="DueDate" name="DueDate" class="easyui-datebox" runat="server"
                        data-options="editable:false,required:true,width:'100%'" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">费用项目</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="CostName" name="CostName" class="easyui-textbox"
                        data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'100%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelCost();}" />
                    <input type="hidden" name="CostID" id="CostID" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">计费方式</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ChargeCalculationName" name="ChargeCalculationName" class="easyui-textbox" runat="server" data-options="disabled:true,width:'100%'" />
                    <input type="hidden" id="ChargeCalculation" name="ChargeCalculation" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">计算方式</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="CalculationMethodName" name="CalculationMethodName" class="easyui-textbox" runat="server" data-options="disabled:true,width:'100%'" />
                    <input type="hidden" id="CalculationMethod" name="CalculationMethod" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">计费周期(月)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ContPeriod" name="ContPeriod" class="easyui-textbox" data-options="disabled:true,width:'100%'" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">计费标准(元)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ContPrice" name="ContPrice" class="easyui-numberbox"
                        data-options="disabled:true,precision:4,width:'100%',prompt:'多选房屋时，默认为每套房屋的计费标准'" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">计费数量</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ChargeNumber" name="ChargeNumber" class="easyui-textbox" data-options="disabled:true,width:'100%',prompt:'多选房屋为合计显示'" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">保底金额(元/计费周期)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="GuaranteeAmount" name="GuaranteeAmount" class="easyui-textbox" data-options="disabled:true,width:'100%'" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">提成比例(%)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="BusinessRoyaltyRatio" name="BusinessRoyaltyRatio" class="easyui-textbox" data-options="disabled:true,width:'100%'" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">合同违约金标准(小数/天)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ContractDelinAmountStandard" name="ContractDelinAmountStandard" class="easyui-textbox"
                        data-options="disabled:true,width:'100%'" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">合同违约金起计时间</label>
                <div class="col-sm-10 col-xs-10">
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">应收时间</label>
                        <div class="col-sm-10 col-xs-10">
                            <input type="text" id="ContractDelinBeginDay" name="ContractDelinBeginDay" runat="server" class="easyui-textbox"
                                data-options="width:'50px',disabled:true" />
                            <label class="control-label">&nbsp;&nbsp;天之后起计</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">应收时间延后</label>
                        <div class="col-sm-10 col-xs-10">
                            <input type="text" id="ContractDelinBeginMonth" name="ContractDelinBeginMonth" runat="server" class="easyui-textbox"
                                data-options="width:'50px',disabled:true" />
                            <label class="control-label">&nbsp;&nbsp;月&nbsp;&nbsp;</label>
                            <input type="text" id="ContractDelinBeginMonth1" name="ContractDelinBeginMonth1" runat="server" class="easyui-textbox"
                                data-options="width:'50px',disabled:true" />
                            <label class="control-label">&nbsp;&nbsp;日起计</label>
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>
    </form>
    <div class="form-group">
        <div class="col-sm-12 col-xs-12 fixed-tool-search" style="width: 100%;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
            <a href="javascript:void(0)" id="PageCloseBtn" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:100" onclick="PageClose();">关闭返回</a>
        </div>
    </div>
    <input type="hidden" id="OpType" name="OpType" />
    <input type="hidden" name="ID" id="ID" />
    <input type="hidden" name="ContractID" id="ContractID" />
    <input type="hidden" name="ContID" id="ContID" />
    <input type="hidden" name="CommID" id="CommID" />
    <input type="hidden" name="CommName" id="CommName" />
    <input type="hidden" id="RoomResult" name="RoomResult" runat="server" />
    <script type="text/javascript">
        //构建计费方式、计算方式数据
        let TempChargeCalculationData = [
            { ChargeCalculation: "1", ChargeCalculationName: '总额固定方式' },
            { ChargeCalculation: '2', ChargeCalculationName: '营业提成方式' }
        ];
        let TempCalculationMethodData = [
            { CalculationMethod: '0', CalculationMethodName: '按每月单价' },
            { CalculationMethod: '1', CalculationMethodName: '按缴费周期总额' },
            { CalculationMethod: '2', CalculationMethodName: '按合同期间总额' },
            { CalculationMethod: '3', CalculationMethodName: '按每天单价' },
            { CalculationMethod: '5', CalculationMethodName: '按提成' },
            { CalculationMethod: '6', CalculationMethodName: '按保底+提成' }];
        $(function () {
            let param = $.getUrlParam();
            if (!!param.OpType) {
                $("#OpType").val(param.OpType);
            }
            //if (!!param.TempContPrice) {
            //    $("#TempContPrice").val(param.TempContPrice);
            //}
            InitPageData();
        });

        //加载页面数据
        function InitPageData() {
            //获取值
            var SettingData = localStorage.getItem("ContractSetting");
            //设置值为空
            localStorage.setItem("ContractSetting", "");
            var ItemData = JSON.parse(SettingData);
            $('#RoomResult').val(JSON.stringify(ItemData.RoomData));//房屋数据

            //加载其他数据
            if (ItemData.SettingData != null) {
                if ($('#OpType').val() == "edit") {
                    $('#ID').val(ItemData.SettingData.ID);
                }
                $('#ContractID').val(ItemData.SettingData.ContractID);
                $('#ContID').val(ItemData.SettingData.ContID);
                $('#CommID').val(ItemData.SettingData.CommID);
                $('#CommName').val(ItemData.SettingData.CommName);

                $('#CustID').val(ItemData.SettingData.CustID);
                $('#CustName').textbox("setValue", ItemData.SettingData.CustName);
                $('#RoomIDs').val(ItemData.SettingData.RoomID);
                $('#RoomSigns').textbox("setValue", ItemData.SettingData.RoomSign);



                $('#BeginDate').datebox("setValue", ItemData.SettingData.BeginDate);
                $('#EndDate').datebox("setValue", ItemData.SettingData.EndDate);
                $('#DueDate').datebox("setValue", ItemData.SettingData.DueDate);

                $('#CostName').textbox("setValue", ItemData.SettingData.CostName);
                $('#CostID').val(ItemData.SettingData.CostID);

                //计费方式
                $('#ChargeCalculation').val(ItemData.SettingData.ChargeCalculation);
                TempChargeCalculationData.forEach((itemRow) => {
                    if (itemRow.ChargeCalculation == ItemData.SettingData.ChargeCalculation) {
                        $('#ChargeCalculationName').textbox("setValue", itemRow.ChargeCalculationName);
                    }
                })

                //计算方式
                $('#CalculationMethod').val(ItemData.SettingData.CalculationMethod);
                TempCalculationMethodData.forEach((itemRow) => {
                    if (itemRow.CalculationMethod == ItemData.SettingData.CalculationMethod) {
                        $('#CalculationMethodName').textbox("setValue", itemRow.CalculationMethodName);
                    }
                })

                $('#ContPeriod').textbox("setValue", ItemData.SettingData.ContPeriod);

                if ($('#OpType').val() == "edit") {
                    var ItemNode = ItemData.RoomData.filter(function (e) {
                        return e.RoomID == ItemData.SettingData.RoomID;
                    });
                    if (ItemNode != null && ItemNode.length > 0) {
                        $('#ContPrice').numberbox({
                            required: true,
                            disabled: false,
                            value: ItemData.SettingData.ContPrice,
                            min: ItemNode[0].ChargeStandard
                        });//计费标准（元）
                    } else {
                        $('#ContPrice').numberbox({
                            required: true,
                            disabled: false,
                            value: ItemData.SettingData.ContPrice
                        });//计费标准（元）
                    }
                } else {
                    $('#ContPrice').numberbox("setValue", "");//计费标准（元）
                }
                $('#ChargeNumber').textbox("setValue", ItemData.SettingData.ChargeNumber);//计费数量
                $('#GuaranteeAmount').textbox("setValue", ItemData.SettingData.GuaranteeAmount);//保底金额（元/计费周期）
                $('#BusinessRoyaltyRatio').textbox("setValue", ItemData.SettingData.BusinessRoyaltyRatio);//提成比例（%）
                $('#ContractDelinAmountStandard').textbox("setValue", ItemData.SettingData.ContractDelinAmountStandard);//合同违约金标准(小数/天)
                if (isValueNull(ItemData.SettingData.ContractDelinBeginMonth)) {
                    $('#ContractDelinBeginMonth').textbox("setValue", ItemData.SettingData.ContractDelinBeginMonth);
                    $('#ContractDelinBeginMonth1').textbox("setValue", ItemData.SettingData.ContractDelinBeginDay);
                } else {
                    $('#ContractDelinBeginDay').textbox("setValue", ItemData.SettingData.ContractDelinBeginDay);
                }
            }

            //判断哪些值是必填的情况  判断计算方式
            switch ($('#CalculationMethod').val()) {
                case "0":
                    //按每月单价
                    break;
                case "1":
                    //按缴费周期总额
                    break;
                case "2":
                    //按合同期间总额
                    break;
                case "3":
                    //按每天单价
                    break;
                case "5":
                    //按提成
                    $('#ContPrice').numberbox("disableValidation");
                    break;
                case "6":
                    $('#ContPrice').numberbox("disableValidation");
                    //按保底+提成
                    break;
            }
        }

        //选择房屋数据 合同已选房屋数据
        function SelRooms() {
            //判断如果是修改允许单选 如果是新增可以多选
            let param = { "IsMultiple": "是" };
            if ($('#OpType').val() == "edit") {
                param.IsMultiple = "否";
            }
            localStorage.setItem("ContractSettingItemRoom", $('#RoomResult').val());
            LayerDialog.OpenWin('860', '400', '/HM/M_Main/Renting/Contract/Register/ContractRoomSelect.aspx?' + $.param(param), "选择房屋", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    let RoomSigns = "";
                    let RoomIDs = "";

                    let MaxRentBeginTime = '';//最大开始时间
                    let MaxRentEndTime = '';//最大结束时间
                    let ChargeNumber = 0.00;//计费数量

                    data.forEach((itemRow) => {
                        //循环构建 ID和编号集合
                        RoomIDs = RoomIDs + itemRow.RoomID + ',';
                        RoomSigns = RoomSigns + itemRow.RoomSign + ',';
                        //循环获取 租赁开始时间、优惠免租结束时间+1、顺延起租开始时间三者中最晚的一个时间
                        //租赁结束时间最大的一个时间
                        let ItemMaxTime = null;
                        if (!!itemRow.RentBeginTime) {
                            ItemMaxTime = itemRow.RentBeginTime;
                        }
                        if (!!ItemMaxTime) {
                            if (!!itemRow.RentFreeEndTime) {
                                ItemMaxTime = new Date(itemRow.RentFreeEndTime) > new Date(ItemMaxTime) ? itemRow.RentFreeEndTime : ItemMaxTime;
                            }
                        } else {
                            ItemMaxTime = itemRow.RentFreeEndTime
                        }

                        if (!!ItemMaxTime) {
                            if (!!itemRow.PostPoneBeginTime) {
                                ItemMaxTime = new Date(itemRow.PostPoneBeginTime) > new Date(ItemMaxTime) ? itemRow.PostPoneBeginTime : ItemMaxTime;
                            }
                        } else {
                            ItemMaxTime = itemRow.PostPoneBeginTime
                        }
                        if (!!MaxRentBeginTime) {
                            if (!!ItemMaxTime) {
                                MaxRentBeginTime = new Date(ItemMaxTime) > new Date(MaxRentBeginTime) ? ItemMaxTime : MaxRentBeginTime;
                            }
                        } else {
                            MaxRentBeginTime = ItemMaxTime;
                        }
                        if (!!MaxRentEndTime) {
                            if (!!itemRow.RentEndTime) {
                                MaxRentEndTime = new Date(itemRow.RentEndTime) > new Date(MaxRentEndTime) ? itemRow.RentEndTime : MaxRentEndTime;
                            }
                        } else {
                            MaxRentEndTime = itemRow.RentEndTime;
                        }
                        ChargeNumber = parseFloat(ChargeNumber) + parseFloat(itemRow.RoomChargeArea);
                    });

                    if (RoomIDs.endsWith(",")) {
                        RoomIDs = RoomIDs.substring(0, RoomIDs.length - 1);
                        RoomSigns = RoomSigns.substring(0, RoomSigns.length - 1);
                    }
                    //只有一行的情况 就可以编辑计费标准
                    if (data.length == 1) {
                        $('#ContPrice').numberbox({
                            required: true,
                            value: data[0].ChargeStandard,
                            min: data[0].ChargeStandard,
                            disabled: false
                        });//计费标准（元）
                    } else {
                        $('#ContPrice').numberbox({
                            required: false,
                            value: "",
                            min: null,
                            disabled: true
                        });//计费标准（元）
                    }
                    $('#RoomSigns').textbox("setValue", RoomSigns);
                    $('#RoomIDs').val(RoomIDs);
                    $('#DueDate').datebox("setValue", MaxRentBeginTime);
                    $('#BeginDate').datebox("setValue", MaxRentBeginTime);
                    $('#EndDate').datebox("setValue", MaxRentEndTime);
                    $('#ChargeNumber').textbox("setValue", parseFloat(ChargeNumber).toFixed(4));//计费数量
                }
            });
        }

        //选择费用项目
        function SelCost() {
            var param = { "CommID": $("#CommID").val() };
            LayerDialog.OpenWin('700', '400', '/HM/M_Main/DialogNew/CorpCommCostDlg.aspx?' + $.param(param), "选择费用项目", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#CostID").val(data.CostID);
                    $("#CostName").textbox("setValue", data.CostName);
                }
            });
        }

        //保存页面数据
        function Save() {
            if ($('#mainForm').form("validate")) {
                //验证计费标准是否低于设置
                //let TempContPrice = $('#TempContPrice').val();
                //let ContPrice = $('#ContPrice').numberbox("getValue");
                //if (!!ContPrice && $("#ChargeCalculation").val() == "1") {
                //    if (parseFloat(ContPrice) < parseFloat(TempContPrice)) {
                //        $.messager.alert('温馨提示', "计费标准不允许小于合约规划设置");
                //        return;
                //    }
                //}
                //判断合同违约金起计时间
                let MonthValue = "";
                let DayValue = "";
                if ($('#ContractDelinBeginMonth').textbox("getValue") != "") {
                    MonthValue = $('#ContractDelinBeginMonth').textbox("getValue");
                    DayValue = $('#ContractDelinBeginMonth1').textbox("getValue");
                } else {
                    DayValue = $('#ContractDelinBeginDay').textbox("getValue");
                }
                //循环构建数据 多选单选房屋都需要循环构建(每个房屋需要有一条数据，针对每个房屋需要获取原始数据的计租面积来当计费数量)
                let RoomData = JSON.parse($('#RoomResult').val());
                let ReturnData = [];

                var guid = new GUID();
                $('#RoomIDs').val().split(',').forEach((ItemValue) => {
                    let ItemRenturnData = {
                        ID: $('#ID').val(),
                        ContractID: $('#ContractID').val(),
                        ContID: $('#ContID').val(),
                        CommID: $('#CommID').val(),
                        CommName: $('#CommName').val(),
                        CustID: $("#CustID").val(),
                        CustName: $("#CustName").textbox("getValue"),
                        RoomID: "",//循环获取
                        RoomSign: "",//循环获取
                        BeginDate: $("#BeginDate").datebox("getValue"),
                        EndDate: $("#EndDate").datebox("getValue"),
                        DueDate: $("#DueDate").datebox("getValue"),
                        CostID: $("#CostID").val(),
                        CostName: $("#CostName").textbox("getValue"),
                        ChargeCalculation: $("#ChargeCalculation").val(),
                        CalculationMethod: $('#CalculationMethod').val(),
                        ContPeriod: $('#ContPeriod').textbox("getValue"),
                        ContPrice: $('#ContPrice').numberbox("getValue"),
                        ChargeNumber: 0.00,//循环获取
                        GuaranteeAmount: $('#GuaranteeAmount').textbox("getValue"),
                        BusinessRoyaltyRatio: $('#BusinessRoyaltyRatio').textbox("getValue"),
                        ContractDelinAmountStandard: $('#ContractDelinAmountStandard').textbox("getValue"),
                        ContractDelinBeginDay: DayValue,
                        ContractDelinBeginMonth: MonthValue
                    };
                    if ($('#OpType').val() == "add") {
                        ItemRenturnData.ID = guid.newGUID();
                    }
                    var Node = RoomData.filter(function (e) {
                        return e.RoomID == ItemValue;
                    });
                    if (Node != null) {
                        ItemRenturnData.RoomID = Node[0].RoomID;
                        ItemRenturnData.RoomSign = Node[0].RoomSign;
                        ItemRenturnData.ChargeNumber = Node[0].RoomChargeArea;
                    }
                    if ($('#RoomIDs').val().includes(',')) {
                        if (Node != null) {
                            ItemRenturnData.ContPrice = Node[0].ChargeStandard;
                        }
                    }
                    //放入返回集合
                    ReturnData.push(ItemRenturnData);
                });
                LayerDialog.ReturnIsJson = true;
                LayerDialog.Close(ReturnData);
            }
        }

        function PageClose() {
            LayerDialog.Close("");
        }
    </script>
</body>
</html>
