<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="M_Main.Renting.Programming.RentControlTable.Detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-规划管理-租控表查看房屋详情</title>
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
    <input type="hidden" name="RoomID" id="RoomID" />
    <input type="hidden" name="CommID" id="CommID" />
    <form id="mainForm" class="form-horizontal" role="form" style="overflow-y: auto;">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">
                <label id="RoomSign">01-01-0101</label></legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">建筑面积(平米)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="BuildArea" name="BuildArea" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:false,disabled:true" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">房屋状态</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="RentRoomState" name="RentRoomState" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:false,disabled:true" />
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">合约规划</legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">合约类型</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="TreatyPlaningType" name="TreatyPlaningType" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                    <input type="hidden" id="TreatyPlaningTypeID" name="TreatyPlaningTypeID" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">合同期限(月)</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="ContractPeriod" name="ContractPeriod" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">计费方式</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="ChargeCalculationName" name="ChargeCalculationName" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">计算方式</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="CalculationMethodName" name="CalculationMethodName" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">计费标准</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="ChargeStandard" name="ChargeStandard" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">保底金额(元)</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="GuaranteeAmount" name="GuaranteeAmount" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">保底金额收取方式</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="GuaranteeAmountCollectionWay" name="GuaranteeAmountCollectionWay" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">营业提成比例(%)</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="BusinessRoyaltyRatio" name="BusinessRoyaltyRatio" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">营业提成起提金额(元)</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="BusinessRoyaltyRaiseAmount" name="BusinessRoyaltyRaiseAmount" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">计费期间</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="ChargingMode" name="ChargingMode" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">计费周期(月)</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="ContPeriod" name="ContPeriod" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">备注</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="Remark" name="Remark" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'100%',height:'40px',multiline:true,disabled:true" />
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset" id="ContractInfo">
            <legend class="frame-legend">认租/租赁信息</legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">承租方名称</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="TenantryCustName" name="TenantryCustName" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">签约类型</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="SigningType" name="SigningType" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">合同编号</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="ContractSign" name="ContractSign" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">联系人</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="TenantryConnectpeople" name="TenantryConnectpeople" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">联系电话</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="TenantryConnectTel" name="TenantryConnectTel" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">开始时间</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="ContractBeginTime" name="ContractBeginTime" class="easyui-datebox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">结束时间</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="ContractEndTime" name="ContractEndTime" class="easyui-datebox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">合同总额</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="ContractTotalPrice" name="ContractTotalPrice" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">合同保证金</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="ContractDepositPrice" name="ContractDepositPrice" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">已收金额</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="PaidAmount" name="PaidAmount" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">欠收金额</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="DebtsAmount" name="DebtsAmount" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
            </div>
        </fieldset>
    </form>
    <div class="form-group">
        <div class="col-sm-12 col-xs-12 fixed-tool-search" style="width: 100%;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:100" onclick="SignRentalContract();">认租签约</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:100" onclick="SignContract();">正式签约</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:100" onclick="PageClose();">关闭返回</a>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            //设置高度
            let h = $(window).height();
            $('#mainForm').css("height", h - 60 + "px");
            let param = $.getUrlParam();
            if (!!param.RoomID) {
                $("#RoomID").val(param.RoomID);
            }
            if (!!param.CommID) {
                $("#CommID").val(param.CommID);
            }
            InitData();
        });

        //初始化页面数据
        function InitData() {
            $.dataPostJson("Renting_RentControlTable", 'GetRoomDetail', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    if (data) {
                        let Resultdata = $.parseJSON(data.data);
                        $('#mainForm').form('load', Resultdata.TreatyPlaningData[0]);
                        $('#RoomSign').text(Resultdata.TreatyPlaningData[0].RoomSign);
                        if (Resultdata.TreatyPlaningData[0].RentRoomState != "待租") {
                            $('#ContractInfo').show();
                            $('#ContractInfo').form('load', Resultdata.ContractData[0]);
                        } else {
                            $('#ContractInfo').hide();
                        }
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        //认租签约
        function SignRentalContract() {
            var param = { "OpType": 'add', "ID": "", "RoomID": $('#RoomID').val(), "TreatyPlaningType": $('#TreatyPlaningTypeID').val() };
            var w = '1200';
            var h = $(window).height() + 100;
            LayerDialog.OpenWin(w, h, '/HM/M_Main/Renting/Merchants/RentSubscription/Edit.aspx?' + $.param(param), "认租合同登记", true, function callback(_Data) {

            });
        }

        //正式签约
        function SignContract() {
            var param = { "OpType": 'add', "ID": "", "SignType": "新签", "RoomID": $('#RoomID').val(), "TreatyPlaningType": $('#TreatyPlaningTypeID').val() };
            var w = '1200';
            var h = $(window).height() + 100;
            LayerDialog.OpenWin(w, h, '/HM/M_Main/Renting/Contract/Register/Edit.aspx?' + $.param(param), "合同登记信息", true, function callback(_Data) {

            });
        }

        function PageClose() {
            LayerDialog.Close("");
        }
    </script>
</body>
</html>
