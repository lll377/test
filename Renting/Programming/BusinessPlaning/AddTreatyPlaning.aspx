<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTreatyPlaning.aspx.cs" Inherits="M_Main.Renting.Programming.BusinessPlaning.AddTreatyPlaning" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-规划管理-经营规划添加合约明细页面</title>
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
    <input type="hidden" name="ID" id="ID" />
    <form id="mainForm" class="form-horizontal" role="form" style="overflow-y: auto;">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">合约规划</legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">合约类型</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="TreatyPlaningType" name="TreatyPlaningType" class="easyui-textbox"
                        data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'100%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelTreatyPlaningType();}"
                        runat="server" />
                    <input type="hidden" id="TreatyPlaningID" name="TreatyPlaningID" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">房屋数量(套)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="RoomCount" name="RoomCount" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">建筑面积(平米)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="BuildAreaCount" name="BuildAreaCount" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:false,disabled:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">计费标准</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ChargeStandard" name="ChargeStandard" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">计费标准单位</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ChargeUnit" name="ChargeUnit" class="easyui-textbox"
                        data-options="tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">保底收入(元)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="GuaranteedIncome" name="GuaranteedIncome" class="easyui-numberbox"
                        data-options="required:false,min:0,precision:2,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">目标收入(元)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="TargetIncome" name="TargetIncome" class="easyui-numberbox"
                        data-options="required:true,min:0,precision:2,tipPosition:'bottom',width:'100%'" runat="server" />
                </div>
            </div>
        </fieldset>
    </form>
    <div class="form-group">
        <div class="col-sm-12 col-xs-12 fixed-tool-search" style="width: 100%;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:100" onclick="PageClose();">关闭返回</a>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            InitPage();
        });
        //初始化页面数据
        function InitPage() {
            let param = $.getUrlParam();
            if (!!param.ID) {
                $("#ID").val(param.ID);
            }
            if (!!param.TreatyPlaningType) {
                $("#TreatyPlaningType").textbox("setValue", param.TreatyPlaningType);
            }
            if (!!param.TreatyPlaningID) {
                $("#TreatyPlaningID").val(param.TreatyPlaningID);
            }
            if (!!param.RoomCount) {
                $("#RoomCount").textbox("setValue", param.RoomCount);
            }
            if (!!param.BuildAreaCount) {
                $("#BuildAreaCount").textbox("setValue", param.BuildAreaCount);
            }
            if (!!param.ChargeStandard) {
                $("#ChargeStandard").textbox("setValue", param.ChargeStandard);
            }
            if (!!param.ChargeUnit) {
                $("#ChargeUnit").textbox("setValue", param.ChargeUnit);
            }
            if (!!param.GuaranteedIncome) {
                $("#GuaranteedIncome").numberbox("setValue", param.GuaranteedIncome);
            }
            if (!!param.TargetIncome) {
                $("#TargetIncome").numberbox("setValue", param.TargetIncome);
            }
        }

        //选择合约类型
        function SelTreatyPlaningType() {
            LayerDialog.OpenWin('800', '500', '/HM/M_Main/Renting/Dialog/TreatyPlaningSelect.aspx', "选择合约类型", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    let data = $.parseJSON(_Data);
                    $("#TreatyPlaningID").val(data.ID);
                    $("#TreatyPlaningType").textbox("setValue", data.TreatyPlaningType);
                    $('#RoomCount').textbox("setValue", data.RoomCount);
                    $('#BuildAreaCount').textbox("setValue", data.BuildAreaCount);
                    $('#ChargeStandard').textbox("setValue", data.ChargeStandard);
                    $('#ChargeUnit').textbox("setValue", data.ChargeUnit);
                }
            });
        }

        //保存页面数据
        function Save() {
            if ($('#mainForm').form("validate")) {
                var ReturnValue = {
                    ID: $('#ID').val(),
                    TreatyPlaningType: $('#TreatyPlaningType').textbox("getValue"),
                    TreatyPlaningID: $('#TreatyPlaningID').val(),
                    RoomCount: $('#RoomCount').textbox("getValue"),
                    BuildAreaCount: $("#BuildAreaCount").textbox("getValue"),
                    ChargeStandard: $("#ChargeStandard").textbox("getValue"),
                    ChargeUnit: $('#ChargeUnit').textbox("getValue"),
                    GuaranteedIncome: $('#GuaranteedIncome').numberbox("getValue"),
                    TargetIncome: $('#TargetIncome').numberbox("getValue")
                };
                LayerDialog.ReturnIsJson = true;
                LayerDialog.Close(ReturnValue);
            }
        }

        function PageClose() {
            LayerDialog.Close("");
        }
    </script>
</body>
</html>
