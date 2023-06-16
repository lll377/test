<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateChargeStandard.aspx.cs" Inherits="M_Main.Renting.Programming.TreatyPlaning.UpdateChargeStandard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>规划管理-合约规划-更新计费标准/租金费项</title>
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
            <legend class="frame-legend">合约规划房屋计费标准设置</legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">计费标准</label>
                <div class="col-sm-10 col-xs-10">
                    <input type="text" id="ChargeStandard" name="ChargeStandard" class="easyui-numberbox"
                        data-options="required:true,min:0,precision:4,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">租金费项</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="RentCostItemName" name="RentCostItemName" class="easyui-textbox"
                        data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelRentCostItem();}"
                        runat="server" />
                    <input type="hidden" id="RentCostItemID" name="RentCostItemID" runat="server" />
                </div>
            </div>
        </fieldset>
    </form>
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
        });

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

        function Save() {
            if ($('#mainForm').form("validate")) {
                var ReturnValue = {
                    ChargeStandard: $('#ChargeStandard').numberbox("getValue"),
                    RentCostItemID: $('#RentCostItemID').val(),
                    RentCostItemName: $('#RentCostItemName').textbox("getValue")
                }
                LayerDialog.Close(JSON.stringify(ReturnValue));
            }
        }

        function PageClose() {
            LayerDialog.Close("");
        }
    </script>
</body>
</html>
