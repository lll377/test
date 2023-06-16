﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractAuditSetDetail.aspx.cs" Inherits="M_Main.DiversifiedManage.ContractManage.ContractAuditSetDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>多经管理-合同流程设置编辑页面</title>
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

    <style type="text/css">
        .bootstrap_table tr td.title {
            width: 20%;
            text-align: center;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            width: 30%;
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
    <input type="hidden" name="AuditType" id="AuditType" />
    <form id="mainForm" runat="server">
        <div style="padding: 20px 5px;">
            <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">
                        <span>合同类别</span>
                    </td>
                    <td class="text">
                        <input id="ContractTypeName" name="ContractTypeName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'300px',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelContractType();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#ContractType').val('')
                            }}] " />
                        <input type="hidden" id="ContractType" name="ContractType" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>流程名称</span></td>
                    <td class="text">
                        <input id="WorkFlowName" name="WorkFlowName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'300px',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelWorkFlow();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#WorkFlowID').val('')
                            }}] " />
                        <input type="hidden" id="WorkFlowID" name="WorkFlowID" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>备注</span></td>
                    <td class="text">
                        <input id="Remark" name="Remark" class="easyui-textbox" data-options="width:'300px',height:'60px'" />
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
        //页面初始化
        $(function () {
            InitPage();
        });
        function InitPage() {
            var OpType = $.getUrlParam("OpType");
            var ID = $.getUrlParam("ID");
            var AuditType = $.getUrlParam("AuditType");
            $("#OpType").val(OpType);
            $("#AuditType").val(AuditType);
            if (OpType == "edit") {
                $("#ID").val(ID);
                InitData();
            }

        }
        //选择合同类别
        function SelContractType() {
            var param = { "Ismultiple": "1" };
            LayerDialog.OpenWin('580', '400', '../DiversifiedManage/Dialog/CotractTypeSelect.aspx?' + $.param(param), "选择合同类别", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#ContractType").val(data.id);
                    $("#ContractTypeName").textbox("setValue", data.text);
                }
            });
        }
        //选择合同类别
        function SelWorkFlow() {
            var Filter = "";
            if ($('#AuditType').val() == "1") {
                //合同签订
                Filter = "1201";
            } else if ($('#AuditType').val() == "3") {
                //合同执行
                Filter = "1203";
            } else if ($('#AuditType').val() == "4") {
                //合同提成
                Filter = "1206";
            }
            var param = { "DirectionaryCode": "0015", "biaoshi": "1", "Filter": Filter, "random": Math.random() };
            LayerDialog.OpenWin('300', '500', '../OAWorkFlowNew/FlowSortManageSel.aspx?' + $.param(param), "选择流程类别", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#WorkFlowID").val(data[0]);
                    $("#WorkFlowName").textbox("setValue", data[1]);
                }
            });

        }
        //初始化页面数据
        function InitData() {
            $.tool.DataGet('DiversifiedManage', 'GetModelContractAdutiSet', "ID=" + $('#ID').val(),
                function Init() {
                },
                function callback(_Data) {
                    var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    if (varObjects.length > 0) {
                        $('#ContractTypeName').textbox("setValue", varObjects[0].ContractTypeName);
                        $('#ContractType').val(varObjects[0].ContractType);
                        $('#WorkFlowName').textbox("setValue", varObjects[0].WorkFlowName);
                        $('#WorkFlowID').val(varObjects[0].WorkFlowID);
                        $('#Remark').textbox("setValue", varObjects[0].Remark);
                        $('#ID').val(varObjects[0].ID);
                        $("#AuditType").val(varObjects[0].AuditType);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        //保存
        function Save() {
            if ($('#mainForm').form("validate")) {
                $.tool.DataPostJson('DiversifiedManage', 'SaveContractAdutiSet', $.JQForm.GetStrParam(),
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            LayerDialog.Close("true");
                        } else {
                            $.messager.alert('温馨提示', data.msg);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        }
        //关闭
        function Close() {
            LayerDialog.Close("");
        }
    </script>
</body>
</html>

