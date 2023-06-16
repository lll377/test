<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.Renting.BaseSet.AuditSet.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁合同流程设置编辑页面</title>
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
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <input type="hidden" id="OpType" name="OpType" />
    <input type="hidden" name="ID" id="ID" />
    <input type="hidden" name="AuditType" id="AuditType" />
    <form id="mainForm" class="form-horizontal" role="form">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">基础信息</legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">合同类别</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="ContractTypeName" name="ContractTypeName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'100%',height:'50px',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelContractTypes();},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                            $(e.data.target).textbox('clear');
                                            $('#ContractType').val('');
                                            }}] " />
                    <input type="hidden" id="ContractType" name="ContractType" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">流程名称</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="WorkFlowName" name="WorkFlowName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelWorkFlow();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#WorkFlowID').val('')
                            }}] " />
                    <input type="hidden" id="WorkFlowID" name="WorkFlowID" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">备注</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="Remark" name="Remark" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%',height:'50px',multiline:true" />
                </div>
            </div>
        </fieldset>
    </form>
    <div class="form-group">
        <div class="col-sm-12 col-xs-12 fixed-tool-search" style="width: 100%;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:100" onclick="Close();">关闭返回</a>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
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
            if (!!param.AuditType) {
                $("#AuditType").val(param.AuditType);
            }
            let OpType = $("#OpType").val();
            if (OpType == "edit") {
                InitData();
            }
        }

        //选择合同类别 多选
        function SelContractTypes() {
            let param = { "Ismultiple": "1" };
            LayerDialog.OpenWin('580', '400', '/HM/M_Main/Renting/Dialog/CotractTypeSelect.aspx?' + $.param(param), "选择合同类别", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#ContractType").val(data.id);
                    $("#ContractTypeName").textbox("setValue", data.text);
                }
            });
        }

        //选择合同类别
        function SelWorkFlow() {
            let Filter = "";
            if ($('#AuditType').val() == "认租签约") {
                //认租签约
                Filter = "1260";
            } else if ($('#AuditType').val() == "租赁合同新签") {
                //租赁合同新签
                Filter = "1261";
            } else if ($('#AuditType').val() == "租赁合同续签") {
                //租赁合同续签
                Filter = "1262";
            } else if ($('#AuditType').val() == "租赁合同提成") {
                //租赁合同提成
                Filter = "1264";
            }
            let param = { "DirectionaryCode": "0015", "biaoshi": "1", "Filter": Filter, "random": Math.random() };
            LayerDialog.OpenWin('300', '500', '/HM/M_Main/OAWorkFlowNew/FlowSortManageSel.aspx?' + $.param(param), "选择流程类别", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#WorkFlowID").val(data[0]);
                    $("#WorkFlowName").textbox("setValue", data[1]);
                }
            });
        }

        function InitData() {
            $.dataPostJson("Renting_AuditSet", 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    if (data) {
                        $('#ContractTypeName').textbox("setValue", data.ContractTypeName);
                        $('#ContractType').val(data.ContractType);
                        $('#WorkFlowName').textbox("setValue", data.WorkFlowName);
                        $('#WorkFlowID').val(data.WorkFlowID);
                        $('#Remark').textbox("setValue", data.Remark);
                        $('#ID').val(data.ID);
                        $("#AuditType").val(data.AuditType);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function Save() {
            if ($('#mainForm').form("validate")) {
                $.dataPostJson("Renting_AuditSet", 'Save', $.getParam(), true, false,
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
        function Close() {
            LayerDialog.Close("");
        }
    </script>
</body>
</html>
