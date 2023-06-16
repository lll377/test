<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractSettingCopy.aspx.cs" Inherits="M_Main.DiversifiedManage.ContractManage.ContractSettingCopy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同计费信息复制</title>
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
    <input type="hidden" name="ID" id="ID" />
    <input type="hidden" name="ContractID" id="ContractID" />
    <input type="hidden" name="ContID" id="ContID" />
    <input type="hidden" name="OldCommID" id="OldCommID" />
    <form id="mainForm" runat="server">
        <div style="padding: 20px 5px;">
            <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">
                        <span>项目名称</span>
                    </td>
                    <td class="text" colspan="3">
                        <input id="CommName" name="CommName" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',multiline:false,required:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelComm();},width:'510px',height:'60px',
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                            $(e.data.target).textbox('clear');
                                            $('#CommID').val('');
                                            }}] " />
                        <input type="hidden" name="CommID" id="CommID" />
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <span>客户名称</span>
                    </td>
                    <td class="text">
                        <input id="CustName" name="CustName" class="easyui-textbox" disabled="disabled" />
                        <input type="hidden" name="CustID" id="CustID" />
                    </td>
                    <td class="title">
                        <span>房屋编号</span>
                    </td>
                    <td class="text">
                        <input type="hidden" id="RoomID" name="RoomID" runat="server" />
                        <input type="text" id="RoomSign" name="RoomSign" class="easyui-textbox" runat="server" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <span>点位编号</span>
                    </td>
                    <td class="text">
                        <input type="text" id="PointNumber" name="PointNumber" class="easyui-textbox" runat="server" disabled="disabled" />
                        <input type="hidden" name="PointID" id="PointID" />
                    </td>
                    <td class="title">
                        <span></span>
                    </td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="title">
                        <span>开始时间</span>
                    </td>
                    <td class="text">
                        <input type="text" id="BeginDate" name="BeginDate" class="easyui-datebox" runat="server" data-options="editable:false" disabled="disabled" />
                    </td>
                    <td class="title">
                        <span>结束时间</span>
                    </td>
                    <td class="text">
                        <input type="text" id="EndDate" name="EndDate" class="easyui-datebox" runat="server" data-options="editable:false" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <span>应收时间</span>
                    </td>
                    <td class="text">
                        <input type="text" id="DueDate" name="DueDate" class="easyui-datebox" runat="server" data-options="editable:false" disabled="disabled" />
                    </td>
                    <td class="title">
                        <span>费用项目</span>
                    </td>
                    <td class="text">
                        <input id="CostName" name="CostName" class="easyui-textbox" disabled="disabled" />
                        <input type="hidden" name="CostID" id="CostID" />
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <span>计费方式</span>
                    </td>
                    <td class="text">
                        <input id="ChargeCalculationName" name="ChargeCalculationName" class="easyui-textbox" disabled="disabled" />
                        <input type="hidden" id="Calculation" name="Calculation" runat="server" />
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
                        <input type="text" id="ContPeriod" name="ContPeriod" class="easyui-numberbox" data-options="min:1,max:100,precision:0" runat="server" disabled="disabled" />
                    </td>
                    <td class="title">计费标准(元)</td>
                    <td class="text">
                        <input type="text" id="ContPrice" name="ContPrice" class="easyui-numberbox" data-options="precision:2" runat="server" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <td class="title">计费数量</td>
                    <td class="text">
                        <input type="text" id="ChargeNumber" name="ChargeNumber" class="easyui-numberbox" data-options="precision:2" runat="server" disabled="disabled" />
                    </td>
                    <td class="title">保底金额(元/计费周期)</td>
                    <td class="text">
                        <input type="text" id="GuaranteeAmount" name="GuaranteeAmount" class="easyui-numberbox" data-options="min:0,precision:2" runat="server" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <td class="title">提成比例(%)</td>
                    <td class="text">
                        <input type="text" id="BusinessRoyaltyRatio" name="BusinessRoyaltyRatio" class="easyui-numberbox" data-options="max:100,precision:2" runat="server" disabled="disabled" />
                    </td>
                    <td class="title">合同违约金标准(小数/天)</td>
                    <td class="text">
                        <input type="text" id="ContractDelinAmountStandard" name="ContractDelinAmountStandard" class="easyui-numberbox"
                            data-options="min:0,precision:2" runat="server" disabled="disabled" />
                    </td>
                </tr>
                <tr>
                    <td class="title">合同违约金起计时间</td>
                    <td class="text" colspan="3">应收时间&nbsp;<input type="text" id="ContractDelinBeginDay" name="ContractDelinBeginDay" style="width: 40px;" runat="server" class="easyui-numberbox" data-options="min:0,precision:0" disabled="disabled" />&nbsp;天之后起计
                        <br />
                        应收时间延后&nbsp;<input type="text" id="ContractDelinBeginMonth" name="ContractDelinBeginMonth" style="width: 40px;" runat="server"
                            class="easyui-numberbox" data-options="min:0,precision:0" disabled="disabled" />&nbsp;月&nbsp;
                        <input type="text" id="ContractDelinBeginMonth1" name="ContractDelinBeginMonth1" style="width: 40px;" runat="server" class="easyui-numberbox"
                            data-options="min:0,precision:0" disabled="disabled" />&nbsp;日起计
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
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/Dialog/Comm.aspx?' + $.param({ "IsPowerPost": "否", "IsPowerLevel": "是" }), '选择项目', true, function callback(data) {
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
        //初始化页面数据
        function InitData() {
            //获取值
            var ContractSettingCopyData = localStorage.getItem("ContractSettingCopy");
            //设置值为空
            localStorage.setItem("ContractSettingCopy", "");
            var ItemData = JSON.parse(ContractSettingCopyData);
            //加载页面数据
            if (ItemData != null) {
                $('#ID').val(ItemData.ID);
                $('#ContractID').val(ItemData.ContractID);
                $('#ContID').val(ItemData.ContID);
                $('#OldCommID').val(ItemData.CommID);
                //$('#CommName').textbox("setValue", ItemData.CommName);

                $('#CustID').val(ItemData.CustID);
                $('#CustName').textbox("setValue", ItemData.CustName);
                $('#RoomID').val(ItemData.RoomID);
                $('#RoomSign').textbox("setValue", ItemData.RoomSign);

                $('#PointID').val(ItemData.PointID);
                $('#PointNumber').textbox("setValue", ItemData.PointNumber);

                $('#BeginDate').datebox("setValue", ItemData.BeginDate);
                $('#EndDate').datebox("setValue", ItemData.EndDate);
                $('#DueDate').datebox("setValue", ItemData.DueDate);

                $('#CostName').textbox("setValue", ItemData.CostName);
                $('#CostID').val(ItemData.CostID);

                //计费方式
                $('#ChargeCalculation').val(ItemData.ChargeCalculation);
                if (ItemData.ChargeCalculation == "1") {
                    $('#ChargeCalculationName').textbox("setValue", "总额固定方式");
                } else if (ItemData.ChargeCalculation == "2") {
                    $('#ChargeCalculationName').textbox("setValue", "据实结算方式");
                } else if (ItemData.ChargeCalculation == "3") {
                    $('#ChargeCalculationName').textbox("setValue", "营业提成方式");
                }
                //计算方式
                $('#CalculationMethod').val(ItemData.CalculationMethod);
                if (ItemData.CalculationMethod == "0") {
                    $('#CalculationMethodName').textbox("setValue", "按每月单价");
                } else if (ItemData.CalculationMethod == "1") {
                    $('#CalculationMethodName').textbox("setValue", "按缴费周期总额");
                } else if (ItemData.CalculationMethod == "2") {
                    $('#CalculationMethodName').textbox("setValue", "按合同期间总额");
                } else if (ItemData.CalculationMethod == "3") {
                    $('#CalculationMethodName').textbox("setValue", "按每天单价");
                } else if (ItemData.CalculationMethod == "4") {
                    $('#CalculationMethodName').textbox("setValue", "按数量*单价");
                } else if (ItemData.CalculationMethod == "5") {
                    $('#CalculationMethodName').textbox("setValue", "按实际发生额");
                } else if (ItemData.CalculationMethod == "6") {
                    $('#CalculationMethodName').textbox("setValue", "按提成");
                } else if (ItemData.CalculationMethod == "7") {
                    $('#CalculationMethodName').textbox("setValue", "按保底+提成");
                } else if (ItemData.CalculationMethod == "8") {
                    $('#CalculationMethodName').textbox("setValue", "保底、提成就高");
                }

                $('#ContPeriod').numberbox("setValue", ItemData.ContPeriod);
                $('#ContPrice').numberbox("setValue", ItemData.ContPrice);//计费标准（元）
                $('#ChargeNumber').numberbox("setValue", ItemData.ChargeNumber);//计费数量
                $('#GuaranteeAmount').numberbox("setValue", ItemData.GuaranteeAmount);//保底金额（元/计费周期）
                $('#BusinessRoyaltyRatio').numberbox("setValue", ItemData.BusinessRoyaltyRatio);//提成比例（%）
                $('#ContractDelinAmountStandard').numberbox("setValue", ItemData.ContractDelinAmountStandard);//合同违约金标准(小数/天)
                if (isValueNull(ItemData.ContractDelinBeginMonth)) {
                    $('#ContractDelinBeginMonth').numberbox("setValue", ItemData.ContractDelinBeginMonth);
                    $('#ContractDelinBeginMonth1').numberbox("setValue", ItemData.ContractDelinBeginDay);
                } else {

                    $('#ContractDelinBeginDay').numberbox("setValue", ItemData.ContractDelinBeginDay);
                }
            }
        }

        //保存
        function Save() {
            if ($('#mainForm').form("validate")) {
                $.tool.DataPostJsonAsync('DiversifiedManage', 'ContractSettingCopy', "ContractID=" + $('#ContractID').val() + "&CommID=" + $('#OldCommID').val() +
                    "&CommIDs=" + $("#CommID").val() + "&CustID=" + $('#CustID').val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data.result) {
                            HDialog.Close(_Data.data);
                        } else {
                            $.messager.alert('温馨提示', _Data.msg);
                        }
                    },
                    function _completeCallBack() {
                    },
                    function errorCallback() {
                    });
            }
        }
        //关闭
        function Close() {
            LayerDialog.Close("");
        }
        //页面初始化
        $(function () {
            InitData();
        });
    </script>
</body>
</html>
