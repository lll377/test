<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckItemEdit.aspx.cs" Inherits="M_Main.Supervision.CheckItemEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>检查项目编辑</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/uuid.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            background-color: #ffffff;
            overflow-y: scroll;
        }

        .dlg_table {
            margin-bottom: 53px;
        }

        .datagrid-toolbar tr td {
            padding: 0px;
        }

        .easyui-textbox {
            width: 30%;
        }

        .easyui-numberbox {
            width: 30%;
        }

        .easyui-combobox {
            width: 30%;
        }

        .colspan {
            width: 79.5%;
        }

        td {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="padding: 5px;">
            <table class="dlg_table" id="tabId">
                <tr>
                    <td class="title">项目序号:</td>
                    <td class="text" colspan="3">
                        <input type="text" id="Sort" name="Sort" class="easyui-numberbox colspan" data-options="required: true, precision: 0, min: 1" />
                    </td>
                </tr>
                <tr>
                    <td class="title">项目名称:</td>
                    <td class="text" colspan="3">
                        <input type="text" id="ItemName" name="ItemName" class="easyui-textbox colspan" data-options="required: true" />
                    </td>
                </tr>
                <tr>
                    <td class="title">项目代码:</td>
                    <td class="text" colspan="3">
                        <input type="text" id="ItemCode" name="ItemCode" class="easyui-textbox colspan" data-options="required: true" />
                    </td>
                </tr>
                <tr>
                    <td class="title">是否设置分值:</td>
                    <td class="text">
                        <input id="IsSetScore" name="IsSetScore" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:true,
                            panelHeight:'auto',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '1',text: '是'},
                                {id: '0',text: '否'}
                            ],
                            value:'0',
                            onChange: function() { IsSetScoreChange(); }" />
                    </td>
                    <td class="title">项目分值:</td>
                    <td class="text">
                        <input type="text" id="ItemScore" name="ItemScore" class="easyui-numberbox" data-options="required: false, precision: 2, min: 0" />
                    </td>
                </tr>
<%--                <tr>
                    <td class='title'>加扣性质:</td>
                    <td class='text'>
                        <input id='DeductionNature' name='DeductionNature' class='easyui-combobox' data-options='
                            editable:false,
                            tipPosition:'bottom',
                            required:true,
                            panelHeight:'auto',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '1',text: '扣分'},
                                {id: '2',text: '加分'}
                            ]' />
                    </td>
                    <td class='title'>所属专业条线:</td>
                    <td class='text'>
                        <input id='ProfessionalLine' name='ProfessionalLine' class='easyui-combobox' />
                    </td>
                </tr>
                <tr>
                    <td class='title'>所属类别维度:</td>
                    <td class='text'>
                        <input id='CategoryDimension' name='CategoryDimension' class='easyui-combobox' />
                    </td>
                    <td class='title'>所属机构部门:</td>
                    <td class='text'>
                        <input id='Department' name='Department' class='easyui-combobox' />
                    </td>
                </tr>
                <tr>
                    <td class='title'>备注:</td>
                    <td class='text' colspan='3'>
                        <input type='text' id='Remark' name='Remark' class='easyui-textbox colspan' />
                    </td>
                </tr>--%>
            </table>
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();" style="display: none" id="btnSave">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-back',width:80" onclick="Close();">返回</a>
        </div>
        <input type="hidden" id="Id" name="Id" />
        <input type="hidden" id="ParentId" name="ParentId" />
        <input type="hidden" id="OpType" name="OpType" />
        <input type="hidden" id="CheckTypeId" name="CheckTypeId" />
        <input type="hidden" id="IsScore" name="IsScore" />
        <input type="hidden" id="ScoreType" name="ScoreType" />
        <input type="hidden" id="ScoreItem" name="ScoreItem" />
        <input type="hidden" id="HiProfessionalLine" name="HiProfessionalLine" />
        <input type="hidden" id="HiCategoryDimension" name="HiCategoryDimension" />
        <input type="hidden" id="HiDepartment" name="HiDepartment" />
        <script type="text/javascript">
            //项目分值  检查类型“检查是否评分”为“是”、“评分方式”为“按样本加扣分”、检查项目 “是否设置分值”为“是”时必填；其他情况不设置
            //加扣性质  检查类型 “评分方式”为“按样本加扣分”、检查项目 “是否设置分值”为“是”时必填，默认“扣分”，可改为“加分”；其他情况只能为扣分
            function IsSetScoreChange() {
                var ItemScore = $("#ItemScore").numberbox('getValue');
                if ($("#IsScore").val() == "1" && $("#ScoreType").val() == "2" && $("#IsSetScore").combobox('getValue') == '1') {
                    $("#ItemScore").numberbox({
                        required: true,
                        editable: true
                    });
                } else {
                    $("#ItemScore").numberbox({
                        required: false,
                        editable: false
                    });
                }
                if ($("#ScoreType").val() == "2" && $("#IsSetScore").combobox('getValue') == '1') {
                    $("#DeductionNature").combobox({
                        editable: true,
                        data: [
                            { id: '1', text: '扣分' },
                            { id: '2', text: '加分' }
                        ]
                    });
                } else {
                    $("#DeductionNature").combobox({
                        editable: false,
                        data: [
                            { id: '1', text: '扣分' }
                        ]
                    });
                }
                if ($("#IsSetScore").combobox('getValue') == '0')
                    $("#ItemScore").numberbox('setValue', '');
                else
                    $("#ItemScore").numberbox('setValue', ItemScore);
                $("#DeductionNature").combobox('setValue', 1);
                $("#tr_1").remove();
                $("#tr_2").remove();
                $("#tr_3").remove();
                //所属专业条线 所属类别维度 所属机构部门	检查类型“评分方式”为“按样本加扣分” “是否设置分值” 为 “是” 时必填
                if ($("#IsSetScore").combobox('getValue') == '1') {
                    $.tool.DataGet('CSSupervision', 'CheckStandard_LoadCombobox', 'Id=' + $("#CheckTypeId").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            $("#ScoreItem").val(_Data);
                            var html = "";
                            if (_Data.length == 0) {  //没有下拉框
                                $("#tabId").append("<tr id='tr_1'><td class='title'>加扣性质:</td><td class='text'><input id='DeductionNature' name='DeductionNature' class='easyui-combobox' /></td><td class='title'>备注:</td><td class='text'><input type='text' id='Remark' name='Remark' class='easyui-textbox' /></td><td style='display:none'><input id='ProfessionalLine' name='ProfessionalLine' class='easyui-combobox' /><input id='CategoryDimension' name='CategoryDimension' class='easyui-combobox' /><input id='Department' name='Department' class='easyui-combobox' /></td></tr>");
                            }
                            if (_Data.length == 1) {  //有一个下拉框
                                if (_Data.indexOf('1') >= 0) {
                                    $("#tabId").append("<tr id='tr_1'><td class='title'>加扣性质:</td><td class='text'><input id='DeductionNature' name='DeductionNature' class='easyui-combobox' /></td><td class='title'>所属专业条线:</td><td class='text'><input id='ProfessionalLine' name='ProfessionalLine' class='easyui-combobox' /></td></tr><tr id='tr_2'><td class='title'>备注:</td><td class='text' colspan='3'><input type='text' id='Remark' name='Remark' class='easyui-textbox colspan' /></td><td style='display:none'><input id='CategoryDimension' name='CategoryDimension' class='easyui-combobox' /><input id='Department' name='Department' class='easyui-combobox' /></td></tr>");
                                }
                                if (_Data.indexOf('2') >= 0) {
                                    $("#tabId").append("<tr id='tr_1'><td class='title'>加扣性质:</td><td class='text'><input id='DeductionNature' name='DeductionNature' class='easyui-combobox' /></td><td class='title'>所属类别维度:</td><td class='text'><input id='CategoryDimension' name='CategoryDimension' class='easyui-combobox' /></td></tr><tr id='tr_2'><td class='title'>备注:</td><td class='text' colspan='3'><input type='text' id='Remark' name='Remark' class='easyui-textbox colspan' /></td><td style='display:none'><input id='ProfessionalLine' name='ProfessionalLine' class='easyui-combobox' /><input id='Department' name='Department' class='easyui-combobox' /></td></tr>");
                                }
                                if (_Data.indexOf('3') >= 0) {
                                    $("#tabId").append("<tr id='tr_1'><td class='title'>加扣性质:</td><td class='text'><input id='DeductionNature' name='DeductionNature' class='easyui-combobox' /></td><td class='title'>所属机构部门:</td><td class='text'><input id='Department' name='Department' class='easyui-combobox' /></td></tr><tr id='tr_2'><td class='title'>备注:</td><td class='text' colspan='3'><input type='text' id='Remark' name='Remark' class='easyui-textbox colspan' /></td><td style='display:none'><input id='CategoryDimension' name='CategoryDimension' class='easyui-combobox' /><input id='ProfessionalLine' name='ProfessionalLine' class='easyui-combobox' /></td></tr>");
                                }
                            }
                            if (_Data.length == 3) {  //有两个下拉框
                                if (_Data.indexOf('1') >= 0) {
                                    html += "<tr id='tr_1'><td class='title'>加扣性质:</td><td class='text'><input id='DeductionNature' name='DeductionNature' class='easyui-combobox' /></td><td class='title'>所属专业条线:</td><td class='text'><input id='ProfessionalLine' name='ProfessionalLine' class='easyui-combobox' /></td></tr>";
                                    if (_Data.indexOf('2') >= 0) {
                                        html += "<tr id='tr_2'><td class='title'>所属类别维度:</td><td class='text'><input id='CategoryDimension' name='CategoryDimension' class='easyui-combobox' /></td><td class='title'>备注:</td><td class='text'><input type='text' id='Remark' name='Remark' class='easyui-textbox' /></td><td style='display:none'><input id='Department' name='Department' class='easyui-combobox' /></td></tr>";
                                    } else {
                                        html += "<tr id='tr_2'><td class='title'>所属机构部门:</td><td class='text'><input id='Department' name='Department' class='easyui-combobox' /></td><td class='title'>备注:</td><td class='text'><input type='text' id='Remark' name='Remark' class='easyui-textbox' /></td><td style='display:none'><input id='CategoryDimension' name='CategoryDimension' class='easyui-combobox' /></td></tr>";
                                    }
                                } else {
                                    html += "<tr id='tr_1'><td class='title'>加扣性质:</td><td class='text'><input id='DeductionNature' name='DeductionNature' class='easyui-combobox' /></td><td class='title'>所属类别维度:</td><td class='text'><input id='CategoryDimension' name='CategoryDimension' class='easyui-combobox' /></td></tr><tr id='tr_2'><td class='title'>所属机构部门:</td><td class='text'><input id='Department' name='Department' class='easyui-combobox' /></td><td class='title'>备注:</td><td class='text'><input type='text' id='Remark' name='Remark' class='easyui-textbox' /></td><td style='display:none'><input id='ProfessionalLine' name='ProfessionalLine' class='easyui-combobox' /></td></tr>";
                                }
                                $("#tabId").append(html);
                            }
                            if (_Data.length == 5) {  //有三个下拉框
                                $("#tabId").append("<tr id='tr_1'><td class='title'>加扣性质:</td><td class='text'><input id='DeductionNature' name='DeductionNature' class='easyui-combobox' /></td><td class='title'>所属专业条线:</td><td class='text'><input id='ProfessionalLine' name='ProfessionalLine' class='easyui-combobox' /></td></tr><tr id='tr_2'><td class='title'>所属类别维度:</td><td class='text'><input id='CategoryDimension' name='CategoryDimension' class='easyui-combobox' /></td><td class='title'>所属机构部门:</td><td class='text'><input id='Department' name='Department' class='easyui-combobox' /></td></tr><tr id='tr_3'><td class='title'>备注:</td><td class='text' colspan='3'><input type='text' id='Remark' name='Remark' class='easyui-textbox colspan' /></td></tr>");
                            }
                            $('#DeductionNature').combobox({
                                editable: false,
                                tipPosition: 'bottom',
                                required: true,
                                panelHeight: 'auto',
                                icons: [{
                                    iconCls: 'icon-clear',
                                    handler: function (e) {
                                        $(e.data.target).combobox('clear');
                                    }
                                }],
                                valueField: 'id',
                                textField: 'text',
                                data: [
                                    { id: '1', text: '扣分' },
                                    { id: '2', text: '加分' }
                                ]
                            });
                            $("#DeductionNature").combobox('setValue', '1');
                            $('#ProfessionalLine').combobox();
                            $('#CategoryDimension').combobox();
                            $('#Department').combobox();
                            $('#Remark').textbox();
                            LoadProfessionalLine();
                            LoadCategoryDimension();
                            LoadDepartment();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                } else {
                    $("#tabId").append("<tr id='tr_1'><td class='title'>加扣性质:</td><td class='text'><input id='DeductionNature' name='DeductionNature' class='easyui-combobox' /></td><td class='title'>备注:</td><td class='text'><input type='text' id='Remark' name='Remark' class='easyui-textbox' /></td><td style='display:none'><input id='ProfessionalLine' name='ProfessionalLine' class='easyui-combobox' /><input id='CategoryDimension' name='CategoryDimension' class='easyui-combobox' /><input id='Department' name='Department' class='easyui-combobox' /></td></tr>");
                    $('#DeductionNature').combobox({
                        editable: false,
                        tipPosition: 'bottom',
                        required: true,
                        panelHeight: 'auto',
                        icons: [{
                            iconCls: 'icon-clear',
                            handler: function (e) {
                                $(e.data.target).combobox('clear');
                            }
                        }],
                        valueField: 'id',
                        textField: 'text',
                        data: [
                            { id: '1', text: '扣分' },
                            { id: '2', text: '加分' }
                        ]
                    });
                    if ($("#ScoreType").val() == "1") {
                        $("#DeductionNature").combobox({
                            editable: false,
                            data: [
                                { id: '1', text: '扣分' }
                            ]
                        });
                    }
                    $("#DeductionNature").combobox('setValue', '1');
                    $('#ProfessionalLine').combobox();
                    $('#CategoryDimension').combobox();
                    $('#Department').combobox();
                    $('#Remark').textbox();
                }
            }

            //加载专业条线
            function LoadProfessionalLine() {
                var req = $("#ScoreItem").val().indexOf('1') >= 0;
                $('#ProfessionalLine').combobox({
                    required: req,
                    panelHeight: '150',
                    validType: ['comboBoxValid[\'#ProfessionalLine\']'],
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function (e) {
                            $(e.data.target).combobox('clear');
                        }
                    }],
                    url: '/HM/M_Main/HC/DataGetControl.aspx',
                    method: 'get',
                    valueField: 'Id',
                    textField: 'ScoreItem',
                    onBeforeLoad: function (param) {
                        param.Method = 'DataGet';
                        param.Class = 'CSSupervision';
                        param.Command = 'BindScoreItem';
                        param.CheckTypeId = $("#CheckTypeId").val();
                        param.ScoreType = '1';
                    },
                    onLoadSuccess: function () {
                        $('#ProfessionalLine').combobox('setValue', $('#HiProfessionalLine').val());
                    },
                    onChange: function () {
                        $('#HiProfessionalLine').val($('#ProfessionalLine').combobox('getValue'));
                    }
                });
            }

            //加载类别维度
            function LoadCategoryDimension() {
                var req = $("#ScoreItem").val().indexOf('2') >= 0;
                $('#CategoryDimension').combobox({
                    required: req,
                    panelHeight: '200',
                    validType: ['comboBoxValid[\'#CategoryDimension\']'],
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function (e) {
                            $(e.data.target).combobox('clear');
                        }
                    }],
                    url: '/HM/M_Main/HC/DataGetControl.aspx',
                    method: 'get',
                    valueField: 'Id',
                    textField: 'ScoreItem',
                    onBeforeLoad: function (param) {
                        param.Method = 'DataGet';
                        param.Class = 'CSSupervision';
                        param.Command = 'BindScoreItem';
                        param.CheckTypeId = $("#CheckTypeId").val();
                        param.ScoreType = '2';
                    },
                    onLoadSuccess: function () {
                        $('#CategoryDimension').combobox('setValue', $('#HiCategoryDimension').val());
                    },
                    onChange: function () {
                        $('#HiCategoryDimension').val($('#CategoryDimension').combobox('getValue'));
                    }
                });
            }

            //加载机构部门
            function LoadDepartment() {
                var req = $("#ScoreItem").val().indexOf('3') >= 0;
                $('#Department').combobox({
                    required: req,
                    panelHeight: '200',
                    validType: ['comboBoxValid[\'#Department\']'],
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function (e) {
                            $(e.data.target).combobox('clear');
                        }
                    }],
                    url: '/HM/M_Main/HC/DataGetControl.aspx',
                    method: 'get',
                    valueField: 'Id',
                    textField: 'ScoreItem',
                    onBeforeLoad: function (param) {
                        param.Method = 'DataGet';
                        param.Class = 'CSSupervision';
                        param.Command = 'BindScoreItem';
                        param.CheckTypeId = $("#CheckTypeId").val();
                        param.ScoreType = '3';
                    },
                    onLoadSuccess: function () {
                        $('#Department').combobox('setValue', $('#HiDepartment').val());
                    },
                    onChange: function () {
                        $('#HiDepartment').val($('#Department').combobox('getValue'));
                    }
                });
            }

            function Load() {
                if ($("#OpType").val() == 'edit') {
                    $.tool.DataGet('CSSupervision', 'GetCheckItemInfo', 'Id=' + $("#Id").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            var obj = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            $('#frmForm').form('load', obj[0]);
                            $('#HiProfessionalLine').val(obj[0].ProfessionalLine);
                            $('#HiCategoryDimension').val(obj[0].CategoryDimension);
                            $('#HiDepartment').val(obj[0].Department);
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                } else {
                    $.tool.DataGet('CSSupervision', 'GetCheckItemSort', 'ParentId=' + $("#ParentId").val() + '&CheckTypeId=' + $("#CheckTypeId").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            $('#Sort').numberbox('setValue', _Data);
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }

            function Close() {
                HDialog.Close();
            }

            function Save() {
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'SaveCheckItem', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != "") {
                            HDialog.Info(_Data);
                        }
                        else {
                            HDialog.Close();
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            $(function () {
                $("#OpType").val(GetQueryString('OpType'));
                $("#Id").val(GetQueryString('Id'));
                $("#ParentId").val(GetQueryString('ParentId'));
                $("#CheckTypeId").val(GetQueryString('CheckTypeId'));
                $("#IsScore").val(GetQueryString('IsScore'));
                $("#ScoreType").val(GetQueryString('ScoreType'));
                //是否设置分值  检查类型“检查是否评分”为“是”、“评分方式”为“按样本加扣分”时默认“否”，允许修改； 其他情况只能为“否”
                if ($("#IsScore").val() == "1" && $("#ScoreType").val() == "2") {
                    $("#IsSetScore").combobox({
                        data: [
                            { id: '1', text: '是' },
                            { id: '0', text: '否' }
                        ]
                    });
                    $("#IsSetScore").combobox('setValue', 0);
                } else {
                    $("#IsSetScore").combobox({
                        data: [
                            { id: '0', text: '否' }
                        ]
                    });
                }
                if ($("#ScoreType").val() == "1") {
                    $('#DeductionNature').combobox({
                        data: [
                            { id: '1', text: '扣分' }
                        ]
                    });
                }
                IsSetScoreChange();
                Load();

                if (GetQueryString('CanEdit') == '1')
                    $("#btnSave").show();
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
