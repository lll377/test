<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.Renting.BaseSet.SignUnit.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁合同-签约单位设置编辑页面</title>
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
    <form id="mainForm" class="form-horizontal" role="form">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">签约单位信息</legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">单位类型</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="UnitType" name="UnitType" class="easyui-combobox" data-options="required:true,editable:false,tipPosition:'bottom',panelHeight:'auto',
                         valueField:'id',textField:'text',value:'',
                            data: [{id: '',text: ''},{id: '出租方',text: '出租方'},{id: '管理方',text: '管理方'}]" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">单位名称</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="UnitName" name="UnitName" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:true" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">证件名称</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="UnitPaperName" name="UnitPaperName" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">证件号码</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="UnitPaperCode" name="UnitPaperCode" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:true" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">（注册）地址</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="UnitRegAddr" name="UnitRegAddr" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">邮政编码</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="UnitPostCode" name="UnitPostCode" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:false" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">法定代表人</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="UnitLegalPeople" name="UnitLegalPeople" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:false" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">联系人</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="UnitConnectpeople" name="UnitConnectpeople" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:false" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">联系电话</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="UnitConnectTel" name="UnitConnectTel" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:false" />
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
            let OpType = $("#OpType").val();
            if (OpType == "edit") {
                InitData();
            }
        }

        function InitData() {
            $.dataPostJson("Renting_SignUnitSet", 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    if (data) {
                        $('#mainForm').form('load', data);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function Save() {
            if ($('#mainForm').form("validate")) {
                $.dataPostJson("Renting_SignUnitSet", 'Save', $.getParam(), true, false,
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
