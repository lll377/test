<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.Renting.Programming.TreatyPlaning.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>规划管理-合约规划-编辑页面</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
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
    <style type="text/css">
        .textbox-label {
            width: 30px;
            cursor: pointer;
            font-size: 12px;
            font-weight: normal;
        }

        #ChargeCalculationDiv .textbox-label {
            color: #0070A9;
        }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <input type="hidden" id="OpType" name="OpType" />
    <input type="hidden" name="ID" id="ID" />
    <form id="mainForm" class="form-horizontal" role="form" style="overflow-y: auto;">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">合约规划</legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">合约类型</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="TreatyPlaningType" name="TreatyPlaningType" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:true" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">合同期限(月)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ContractPeriod" name="ContractPeriod" class="easyui-numberbox"
                        data-options="required:true,min:0,precision:0,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">计费方式/计算方式</label>
                <div class="col-sm-10 col-xs-10">
                    <div id="ChargeCalculationDiv" style="display: inline-block;">
                        <div style="margin-bottom: 10px">
                            <input class="easyui-radiobutton" id="ChargeCalculation1" name="ChargeCalculation"
                                data-options="value:'1',label:'总额固定方式',labelWidth:100,labelPosition:'after',labelAlign:'left',checked:true" />
                        </div>
                        <div style="margin-bottom: 10px">
                            <input class="easyui-radiobutton" id="ChargeCalculation2" name="ChargeCalculation"
                                data-options="value:'2',label:'营业提成方式',labelWidth:100,labelPosition:'after',labelAlign:'left'" />
                        </div>
                    </div>
                    <div style="display: inline-block;">
                        <div style="margin-bottom: 10px">
                            <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod1" name="CalculationMethod"
                                data-options="value:'3',label:'按每天单价',labelPosition:'after',labelAlign:'left',labelWidth:90" />
                            <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod2" name="CalculationMethod"
                                data-options="value:'0',label:'按每月单价',labelPosition:'after',labelAlign:'left',labelWidth:90,checked:true" />
                            <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod3" name="CalculationMethod"
                                data-options="value:'1',label:'按缴费周期总额',labelPosition:'after',labelAlign:'left',labelWidth:90" />
                            <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod4" name="CalculationMethod"
                                data-options="value:'2',label:'按合同期间总额',labelPosition:'after',labelAlign:'left',labelWidth:90" />
                        </div>
                        <div style="margin-bottom: 10px">
                            <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod5" name="CalculationMethod"
                                data-options="value:'5',label:'按提成',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                            <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod6" name="CalculationMethod"
                                data-options="value:'6',label:'按保底+提成',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">计费标准</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ChargeStandard" name="ChargeStandard" class="easyui-numberbox"
                        data-options="required:true,min:0,precision:4,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">计费标准单位</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ChargeUnit" name="ChargeUnit" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:false,disabled:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">保底金额(元)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="GuaranteeAmount" name="GuaranteeAmount" class="easyui-numberbox"
                        data-options="required:false,min:0,precision:2,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">保底金额收取方式</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="GuaranteeAmountCollectionWay" name="GuaranteeAmountCollectionWay" class="easyui-combobox"
                        data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'160px',
                                    valueField:'id',textField:'text',
                                    data: [{id: '按计费周期收取',text: '按计费周期收取'},{id: '按合同期间收取',text: '按合同期间收取'}],
                                     icons:[{
                                        iconCls:'icon-clear',
                                        handler: function(e){
                                        $(e.data.target).textbox('clear');
                                        }}]"
                        runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">营业提成比例(%)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="BusinessRoyaltyRatio" name="BusinessRoyaltyRatio" class="easyui-numberbox"
                        data-options="required:false,min:0,precision:2,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">营业提成起提金额(元)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="BusinessRoyaltyRaiseAmount" name="BusinessRoyaltyRaiseAmount" class="easyui-numberbox"
                        data-options="required:false,min:0,precision:2,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">计费期间</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="ChargingMode" name="ChargingMode" class="easyui-combobox"
                        data-options="required:true,editable:false,tipPosition:'bottom',panelHeight:'auto',width:'80px',
                                    valueField:'id',textField:'text',data: [{id: '按对时',text: '按对时'},{id: '按整月',text: '按整月'}]"
                        runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">计费周期(月)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ContPeriod" name="ContPeriod" class="easyui-numberbox"
                        data-options="required:true,min:0,precision:0,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">租金费项</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="RentCostItemName" name="RentCostItemName" class="easyui-textbox"
                        data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelRentCostItem();}"
                        runat="server" />
                    <input type="hidden" id="RentCostItemID" name="RentCostItemID" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">合同保证金费项</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="DepositCostItemName" name="DepositCostItemName" class="easyui-textbox" data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDepositCostItem();},
                                icons:[{
                                        iconCls:'icon-clear',
                                        handler: function(e){
                                        $(e.data.target).textbox('clear');
                                        $('#DepositCostItemID').val('');
                                        $('#ContractDepositPrice').numberbox({required:false,value:''});
                                       }}]"
                        runat="server" />
                    <input type="hidden" id="DepositCostItemID" name="DepositCostItemID" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">合同保证金标准(元)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ContractDepositPrice" name="ContractDepositPrice" class="easyui-numberbox"
                        data-options="required:false,min:0,precision:2,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">合同违约金标准(小数/天)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ContractDelinAmountStandard" name="ContractDelinAmountStandard" class="easyui-numberbox"
                        data-options="required:false,min:0,precision:4,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">合同违约金起计时间</label>
                <div class="col-sm-10 col-xs-10">
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">应收时间</label>
                        <div class="col-sm-10 col-xs-10">
                            <input type="text" id="ContractDelinBeginDay" name="ContractDelinBeginDay" runat="server" class="easyui-numberbox"
                                data-options="required:false,min:0,precision:0,width:'50px',onChange:ContractDelinBeginDayChange" />
                            <label class="control-label">&nbsp;&nbsp;天之后起计</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 col-xs-2 control-label">应收时间延后</label>
                        <div class="col-sm-10 col-xs-10">
                            <input type="text" id="ContractDelinBeginMonth" name="ContractDelinBeginMonth" runat="server" class="easyui-numberbox"
                                data-options="required:false,min:0,precision:0,width:'50px',onChange:ContractDelinBeginMonthChange" />
                            <label class="control-label">&nbsp;&nbsp;月&nbsp;&nbsp;</label>
                            <input type="text" id="ContractDelinBeginMonth1" name="ContractDelinBeginMonth1" runat="server" class="easyui-numberbox"
                                data-options="required:false,min:0,precision:0,width:'50px',onChange:ContractDelinBeginMonthChange" />
                            <label class="control-label">&nbsp;&nbsp;日起计</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">备注</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="Remark" name="Remark" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'100%',height:'50px',multiline:true" />
                </div>
            </div>
        </fieldset>
        <div style="height: 400px;">
            <div id="TableContainer" style="background-color: #cccccc; height: 100%; width: 100%;"></div>
            <input type="hidden" id="HidRoomResult" name="HidRoomResult" runat="server" />
        </div>
    </form>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 600px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formSearch" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 control-label">房屋编号</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="RoomSign" name="RoomSign" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-2 col-xs-2 control-label">房屋名称</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="RoomName" name="RoomName" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#formSearch').form('clear')">清空</a>
                </div>
            </div>
        </form>
    </div>
    <div class="form-group" id="BtnDiv">
        <div class="col-sm-12 col-xs-12 fixed-tool-search" style="width: 100%;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:100" onclick="PageClose();">关闭返回</a>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            //设置高度
            let h = $(window).height();
            $('#mainForm').css("height", h - 60 + "px");
            //计费方式切换
            $('#ChargeCalculation1,#ChargeCalculation2').radiobutton({
                onChange: function (checked) {
                    if (checked) {
                        if ($(this).val() == "2") {
                            $('#ChargeStandard').numberbox({ required: false });
                            $('#BusinessRoyaltyRatio').numberbox({ required: true });
                            $('#BusinessRoyaltyRaiseAmount').numberbox({ required: true, value: "0.00" });
                            $('#CalculationMethod1,#CalculationMethod2,#CalculationMethod3,#CalculationMethod4').radiobutton({
                                checked: false,
                                disabled: true
                            });
                            $('#CalculationMethod5,#CalculationMethod6').radiobutton({
                                disabled: false
                            });
                            $('#CalculationMethod5').radiobutton("check");
                        } else {
                            $('#CalculationMethod1,#CalculationMethod2,#CalculationMethod3,#CalculationMethod4').radiobutton({
                                disabled: false
                            });
                            $('#CalculationMethod5,#CalculationMethod6').radiobutton({
                                checked: false,
                                disabled: true
                            });
                            $('#ChargeStandard').numberbox({ required: true });
                            $('#CalculationMethod1').radiobutton("check");
                            $('#BusinessRoyaltyRatio').numberbox({ required: false });
                            $('#BusinessRoyaltyRaiseAmount').numberbox({ required: false, value: "" });
                        }
                    }
                }
            });
            //计算方式切换
            $('#CalculationMethod1,#CalculationMethod2,#CalculationMethod3,#CalculationMethod4,#CalculationMethod5,#CalculationMethod6').radiobutton({
                onChange: function (checked) {
                    if (checked) {
                        let ItemValue = $(this).val();
                        switch (ItemValue) {
                            case "3":
                                $('#ChargeUnit').textbox("setValue", "元/日");
                                break;
                            case "0":
                                $('#ChargeUnit').textbox("setValue", "元/月");
                                break;
                            case "1":
                                $('#ChargeUnit').textbox("setValue", "元/周期总额");
                                break;
                            case "2":
                                $('#ChargeUnit').textbox("setValue", "元/租期总额");
                                break;
                            default:
                                $('#ChargeUnit').textbox("setValue", "");
                                break;
                        }
                        if ($(this).val() == "6") {
                            $('#GuaranteeAmountCollectionWay').combobox({ required: true });
                            $('#GuaranteeAmount').numberbox({ required: true });
                        } else {
                            $('#GuaranteeAmountCollectionWay').combobox({ required: false });
                            $('#GuaranteeAmount').numberbox({ required: false });
                        }
                    }
                }
            });
            InitPage();
        });

        function InitPage() {
            let param = $.getUrlParam();
            if (!!param.ID) {
                $("#ID").val(param.ID);
            }
            if (!!param.OpType) {
                $("#OpType").val(param.OpType);
            }
            let OpType = $("#OpType").val();
            if (OpType == "edit") {
                InitData();
            } else {
                $('#ChargeUnit').textbox("setValue", "元/月");//初始计费标准单位
                $('#ChargingMode').combobox("setValue", "按整月");
            }
            InitDataGrid();//加载列表
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

        //选择租金费项
        function SelRentCostItem() {
            LayerDialog.OpenWin('700', '400', '/HM/M_Main/DialogNew/CorpCommCostDlg.aspx', "选择租金费用项目", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#RentCostItemID").val(data.CostID);
                    $("#RentCostItemName").textbox("setValue", data.CostName);
                }
            });
        }

        //选择保证金费项
        function SelDepositCostItem() {
            LayerDialog.OpenWin('700', '400', '/HM/M_Main/DialogNew/CorpCommCostDlg.aspx', "选择保证金费用项目", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#DepositCostItemID").val(data.CostID);
                    $("#DepositCostItemName").textbox("setValue", data.CostName);
                    $('#ContractDepositPrice').numberbox({ required: true });
                }
            });
        }

        let column = [[
            { field: 'ck', checkbox: true },
            { field: 'BuildName', title: '楼宇名称', width: 100, align: 'center' },
            { field: 'RoomSign', title: '房屋编号', width: 180, align: 'center' },
            { field: 'RentRoomState', title: '房屋状态', width: 80, align: 'center' },
            { field: 'RoomName', title: '房屋名称', width: 180, align: 'center' },
            { field: 'BuildArea', title: '建筑面积', width: 80, align: 'center' },
            { field: 'ChargeStandard', title: '计费标准', width: 80, align: 'center' },
            { field: 'RentCostItemName', title: '租金费项', width: 100, align: 'center' }
        ]];

        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    SelectRoom();
                }
            }, '-',
            {
                text: '更新计费标准/租金费项',
                iconCls: 'icon-edit',
                handler: function () {
                    var rows = $("#TableContainer").datagrid("getChecked");
                    if (rows.length > 0) {
                        LayerDialog.OpenWin('360', '240', '/HM/M_Main/Renting/Programming/TreatyPlaning/UpdateChargeStandard.aspx', "更新计费标准/租金费项", false, function callback(data) {
                            if (isValueNull(data)) {
                                data = $.parseJSON(data);
                                //更新隐藏数据 HidRoomResult
                                var HidRoomResultData = [];
                                if ($('#HidRoomResult').val() != "") {
                                    HidRoomResultData = $.parseJSON($('#HidRoomResult').val());
                                }

                                rows.forEach((ItemRow) => {
                                    let RowIndex = $("#TableContainer").datagrid("getRowIndex", ItemRow);
                                    $('#TableContainer').datagrid('updateRow', {
                                        index: RowIndex,
                                        row: {
                                            ChargeStandard: data.ChargeStandard,
                                            RentCostItemName: data.RentCostItemName,
                                            RentCostItemID: data.RentCostItemID,
                                        }
                                    });
                                    if (HidRoomResultData) {
                                        var Node = HidRoomResultData.filter(function (e) {
                                            return e.RoomID == ItemRow.RoomID;
                                        });
                                        if (Node != null && Node.length > 0) {
                                            Node[0].ChargeStandard = data.ChargeStandard;
                                            Node[0].RentCostItemName = data.RentCostItemName;
                                            Node[0].RentCostItemID = data.RentCostItemID;
                                        }
                                    }
                                });
                                $('#HidRoomResult').val(JSON.stringify(HidRoomResultData));
                            }
                        });
                    } else {
                        $.messager.alert("温馨提示", '请勾选需要更新计费标准的数据!');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var rows = $("#TableContainer").datagrid("getChecked");
                    if (rows.length > 0) {
                        //更新隐藏数据 HidRoomResult
                        var HidRoomResultData = [];
                        if ($('#HidRoomResult').val() != "") {
                            HidRoomResultData = $.parseJSON($('#HidRoomResult').val());
                        }
                        rows.forEach((ItemRow) => {
                            let RowIndex = $("#TableContainer").datagrid("getRowIndex", ItemRow);
                            $("#TableContainer").datagrid("deleteRow", RowIndex);
                            if (HidRoomResultData) {
                                HidRoomResultData = removeArr(HidRoomResultData, "RoomID", ItemRow.RoomID);
                            }
                        });
                        if (HidRoomResultData.length == 0) {
                            $('#HidRoomResult').val("");

                        } else {
                            $('#HidRoomResult').val(JSON.stringify(HidRoomResultData));
                        }
                    }
                    else {
                        $.messager.alert("温馨提示", '请勾选需要删除的数据!');
                    }
                }
            }, '-', {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search').dialog('open');
                }
            }
        ];

        /**
      * 从对象数组中删除属性为objPropery，值为objValue元素的对象
      * @param Array arrPerson  数组对象
      * @param String objPropery  对象的属性
      * @param String objPropery  对象的值
      * @return Array 过滤后数组
      */
        function removeArr(arrPerson, objPropery, objValue) {
            return $.grep(arrPerson, function (cur, i) {
                return cur[objPropery] != objValue;
            });
        }

        function SelectRoom() {
            if ($('#ChargeStandard').numberbox("getValue") == "") {
                $.messager.alert('温馨提示', "请先填写计费标准！");
                return;
            }
            if ($('#RentCostItemID').val() == "") {
                $.messager.alert('温馨提示', "请先选择租金费项！");
                return;
            }
            //选择房屋
            var param = {
                TreatyPlaningID: ""//合约规划ID
            }
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/Renting/Dialog/RoomSelect.aspx?' + $.param(param), "选择房屋", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    let data = $.parseJSON(_Data);
                    let DataGridRows = [];
                    if ($('#HidRoomResult').val() != "") {
                        DataGridRows = $.parseJSON($('#HidRoomResult').val());
                    }
                    data.forEach((itemRow) => {
                        if (DataGridRows) {
                            let Node = DataGridRows.filter(function (e) {
                                return e.RoomID == itemRow.RoomID;
                            });
                            if (Node == null || Node.length == 0) {
                                let InsertRow = {
                                    ID: "",
                                    CommID: "",
                                    RoomID: itemRow.RoomID,
                                    RoomName: itemRow.RoomName,
                                    RoomSign: itemRow.RoomSign,
                                    BuildArea: itemRow.BuildArea,
                                    BuildName: itemRow.BuildName,
                                    ChargeStandard: $('#ChargeStandard').numberbox("getValue"),
                                    RentRoomState: '待租',
                                    RentCostItemID: $('#RentCostItemID').val(),
                                    RentCostItemName: $('#RentCostItemName').textbox("getValue")
                                }
                                $('#TableContainer').datagrid('insertRow', {
                                    index: 0,
                                    row: InsertRow
                                });
                                DataGridRows.push(InsertRow);
                            }
                        } else {
                            let InsertRow2 = {
                                ID: "",
                                CommID: "",
                                RoomID: itemRow.RoomID,
                                RoomName: itemRow.RoomName,
                                RoomSign: itemRow.RoomSign,
                                BuildArea: itemRow.BuildArea,
                                BuildName: itemRow.BuildName,
                                ChargeStandard: $('#ChargeStandard').numberbox("getValue"),
                                RentRoomState: '待租',
                                RentCostItemID: $('#RentCostItemID').val(),
                                RentCostItemName: $('#RentCostItemName').textbox("getValue")
                            };
                            $('#TableContainer').datagrid('insertRow', {
                                index: 0,
                                row: InsertRow2
                            });
                            DataGridRows.push(InsertRow2);
                        }
                    });
                    $('#HidRoomResult').val(JSON.stringify(DataGridRows));
                }
            });
        }
        var LoadFlag = true;
        //加载列表
        function InitDataGrid() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
                fit: true,
                columns: column,
                rownumbers: true,
                checkOnSelect: true,
                selectOnCheck: false,
                singleSelect: true,
                border: true,
                pagination: false,
                width: "100%",
                toolbar: toolbar,
                rowStyler: function (index, row) {
                    if (row.RentRoomState == '已租') {
                        return 'color:#44B5FE;';
                    } else if (row.RentRoomState == '认租') {
                        return 'color:#8978F0;';
                    } else if (row.RentRoomState == '待租') {
                        return 'color:#DC8DDA;';
                    }
                },
                onBeforeLoad: function (param) {
                    param.TreatyPlaningID = $('#ID').val();
                    param.RoomName = $('#RoomName').val();
                    param.RoomSign = $('#RoomSign').val();
                    param = $.getDataGridParam("Renting_TreatyPlaning", "GetTreatyPlaningRoomList", param);
                },
                onLoadSuccess: function (data) {
                    if (data.rows.length > 0) {
                        if (LoadFlag) {
                            $('#HidRoomResult').val(JSON.stringify(data.rows));
                            LoadFlag = false;
                        }
                    }
                }
            });
            $('#dlg_search').dialog('close');
        }
        //初始化页面数据
        function InitData() {
            $.dataPostJson("Renting_TreatyPlaning", 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    if (data) {
                        $('#mainForm').form('load', data);
                        if (isValueNull(data.ContractDelinBeginMonth)) {
                            $('#ContractDelinBeginMonth').numberbox("setValue", data.ContractDelinBeginMonth);
                            $('#ContractDelinBeginMonth1').numberbox("setValue", data.ContractDelinBeginDay);
                        } else {
                            $('#ContractDelinBeginDay').numberbox("setValue", data.ContractDelinBeginDay);
                        }
                        //判断是否已选择 合同保证金费项 如果已选择 合同保证金将必填
                        if (isValueNull(data.DepositCostItemID)) {
                            $('#ContractDepositPrice').numberbox({ required: true });
                        }
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        //保存页面数据
        function Save() {
            if ($('#mainForm').form("validate")) {
                //判断 合同保证金 如果存在 那么 合同保证金费项 将必填
                if (isValueNull($('#ContractDepositPrice').numberbox("getValue")) && !isValueNull($('#DepositCostItemID').val())) {
                    $.messager.alert('温馨提示', "填写合同保证金后，合同保证金费项必填，请确认！");
                    return;
                }
                if ($('#DepositCostItemID').val() == $('#RentCostItemID').val()) {
                    $.messager.alert('温馨提示', "租金费项不允许和保证金费项相同，请确认！");
                    return;
                }
                //构建 合同违约金起计时间
                let MonthValue = "";
                let DayValue = "";
                if ($('#ContractDelinBeginMonth').numberbox("getValue") != "") {
                    MonthValue = $('#ContractDelinBeginMonth').numberbox("getValue");
                    DayValue = $('#ContractDelinBeginMonth1').numberbox("getValue");
                } else {
                    DayValue = $('#ContractDelinBeginDay').numberbox("getValue");
                }
                //let Rows = $("#TableContainer").datagrid("getRows");
                let param = $.getParam();
                if ($('#HidRoomResult').val() == "") {
                    param.RoomResult = "";
                } else {
                    param.RoomResult = $('#HidRoomResult').val();
                }
                param.ContractDelinBeginDay = DayValue;
                param.ContractDelinBeginMonth = MonthValue;
                $.dataPostJson("Renting_TreatyPlaning", 'Save', param, true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            LayerDialog.Close("true");
                        } else { $.messager.alert('温馨提示', data.msg); }
                    },
                    function completeCallback() {

                    }, function errorCallback() {
                    });
            }
        }

        function PageClose() {
            LayerDialog.Close("");
        }
    </script>
</body>
</html>
