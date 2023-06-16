<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.Renting.BaseSet.ParameterSet.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-参数设置</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <style type="text/css">
        .textbox-label {
            cursor: pointer;
        }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow-y: auto; overflow-x: hidden;">
    <form id="formMain" class="form-horizontal" role="form">
        <input type="hidden" id="ID" name="ID" />
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">租赁合同编号设置</legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label" style="line-height: normal;">租赁合同编号生成模式:</label>
                <div class="col-sm-10 col-xs-10">
                    <input class="easyui-radiobutton" id="BillFlagNo" name="BillFlag"
                        data-options="value:'0',label:'手动输入合同编号',labelWidth:120,labelPosition:'after',labelAlign:'left',checked:true" />
                    <input class="easyui-radiobutton" id="BillFlagYes" name="BillFlag"
                        data-options="value:'1',label:'系统默认合同编号',labelWidth:120,labelPosition:'after',labelAlign:'left'" />
                </div>
            </div>
        </fieldset>
    </form>
    <div class="form-group">
        <div class="col-sm-12 col-xs-12 fixed-tool-search" style="width: 100%;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
        </div>
    </div>
    <script language="javascript" type="text/javascript">

        //页面初始化
        $(function () {
            InitData();
        });

        function InitData() {
            $.dataPostJson("Renting_ParameterSet", 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    if (data) {
                        $('#formMain').form('load', data);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        //保存数据
        function Save() {
            if ($('#formMain').form("validate")) {
                $.dataPostJson("Renting_ParameterSet", 'Save', $.getParam(), true, false,
                    function Init() {
                    }, function callback(data) {
                        if (data.result) {
                            $.messager.alert("温馨提示", '保存成功!');
                            InitData();
                        } else {
                            $.messager.alert("温馨提示", data.msg);
                        }
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
            }
        }

    </script>
</body>
</html>
