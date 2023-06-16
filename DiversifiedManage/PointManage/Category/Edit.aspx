﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.DiversifiedManage.PointManage.Category.Edit" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>点位类别设置</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <style type="text/css">
        
    </style>
</head>
<body>
    <input type="hidden" id="OpType" name="OpType" />
    <form id="mainForm" class="form-horizontal" role="form">
        <div class="form-group">
            <label class="col-sm-2 col-xs-2 control-label">序号</label>
            <div class="col-sm-10 col-xs-10">
                <input id="Sort" name="Sort" class="easyui-numberbox" data-options="required:true,tipPosition:'bottom',value:'0',width:'100%'" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-xs-2 control-label">点位类型</label>
            <div class="col-sm-10 col-xs-10">
                <input id="Type" name="Type" class="easyui-combobox" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-xs-2 control-label">点位类别</label>
            <div class="col-sm-10 col-xs-10">
                <input id="Name" name="Name" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'100%'" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-xs-2 control-label">类别代码</label>
            <div class="col-sm-10 col-xs-10">
                <input id="Code" name="Code" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'100%'" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-xs-2 control-label">备注</label>
            <div class="col-sm-10 col-xs-10">
                 <input id="Remark" name="Remark" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:true,width:'100%',height:'70px'" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-12 col-xs-12 control-btn">
                <input type="hidden" name="ID" id="ID" runat="server" />
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:80" onclick="Close();">取&nbsp;消</a>
            </div>
        </div>
    </form>
    <%--<div style="height: 30px"></div>
    <div class="btn_fixed">
        <input type="hidden" name="ID" id="ID" runat="server" />
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:80" onclick="Close();">取&nbsp;消</a>
        <button type="button" class="btn btn-sm btn-success" id="btnSave" style="width: 100px" onclick="Save();">
            <span class="glyphicon glyphicon-ok"></span>&emsp;保&nbsp;存
        </button>
        <button type="button" class="btn btn-sm btn-danger" id="btnClose" style="width: 100px" onclick="Close();">
            <span class="glyphicon glyphicon-off"></span>&emsp;关&nbsp;闭
        </button>
    </div>--%>
    <script type="text/javascript">
        $(function () {
            InitPage();
        });

        function InitPage() {
            var OpType = $.getUrlParam("OpType");
            var ID = $.getUrlParam("ID");
            $("#OpType").val(OpType);
            InitControl();
            if (OpType == "Edit") {
                $("#ID").val(ID);
                InitData();
            } else {
            }
        }

        function InitControl() {
            var data = [{ id: '房屋', text: '房屋' },{ id: '车位', text: '车位' },{ id: '广告', text: '广告' },{ id: '场地', text: '场地' }];
            $('#Type').combobox({
                editable: false,
                required: true,
                width: '100%',
                tipPosition: 'bottom',
                panelHeight: 'auto',
                valueField: 'id',
                textField: 'text',
                data: data,
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                    }
                }]
            });
        }
        function InitData() {
            $.dataPostJson('DivfManage_Category', 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    $('#mainForm').form('load', data);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function Save() {
            if ($('#mainForm').form("validate")) {
                $.dataPostJson('DivfManage_Category', 'Save', $.getParam(), true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            $('#mainForm').form('clear');
                            Close();
                        } else { $.messager.alert('温馨提示', data.msg); }
                    },
                    function completeCallback() {

                    }, function errorCallback() {
                    });
            }
        }
        function Close() {
            LayerDialog.Close();
        }
    </script>
</body>
</html>
