<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskRectificationInfo.aspx.cs" Inherits="M_Main.Supervision.TaskRectificationInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>检查类型编辑</title>
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

        .easyui-combobox {
            width: 30%;
        }

        .easyui-numberbox {
            width: 30%;
        }

        .easyui-datebox {
            width: 30%;
        }

        .colspan {
            width: 78.5%;
        }

        td {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="padding: 5px;">
            <table class="dlg_table">
                <tr>
                    <td class="title">报告名称:</td>
                    <td class="text" colspan="3">
                        <input type="text" id="RectificationName" name="RectificationName" class="easyui-textbox colspan" data-options="required: true" />
                    </td>
                </tr>
                <tr>
                    <td class="title">报告编号:</td>
                    <td class="text">
                        <input type="text" id="RectificationNo" name="RectificationNo" class="easyui-textbox" data-options="required: true" />
                    </td>
                    <td class="title">检查时间:</td>
                    <td class="text">
                        <input type="text" id="CheckDate" name="CheckDate" class="easyui-textbox" data-options="editable: false,readonly:true" />
                    </td>
                </tr>
                <tr>
                    <td class="title">编写人:</td>
                    <td class="text">
                        <input type="text" id="AddUserName" name="AddUserName" class="easyui-textbox" data-options="editable: false,readonly:true,value:'保存后，自动记录'" />
                    </td>
                    <td class="title">编写时间:</td>
                    <td class="text">
                        <input type="text" id="AddDate" name="AddDate" class="easyui-textbox" data-options="editable: false,readonly:true,value:'保存后，自动记录'" />
                    </td>
                </tr>
                <tr id="tr1" style="display: none">
                    <td class="title" id="tb1title"></td>
                    <td class="text" id="tb1text">
                        <%--专业条线综合得分:<input type="text" id="ProfessionalLineScore" name="ProfessionalLineScore" class="easyui-numberbox" data-options="editable: false,readonly:true, precision: 2" />--%>
                    </td>
                    <td class="title" id="tb2title"></td>
                    <td class="text" id="tb2text">
                        <%--类别维度综合得分:<input type="text" id="CategoryDimensionScore" name="CategoryDimensionScore" class="easyui-numberbox" data-options="editable: false,readonly:true, precision: 2" />--%>
                    </td>
                </tr>
                <tr id="tr2" style="display: none">
                    <td class="title" id="tb3title"></td>
                    <td class="text" id="tb3text">
                        <%--机构部门综合得分:<input type="text" id="DepartmentScore" name="DepartmentScore" class="easyui-numberbox" data-options="editable: false,readonly:true, precision: 2" />--%>
                    </td>
                    <td class="title"></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="title">是否需要整改:</td>
                    <td class="text">
                        <input id="IsNeedRectification" name="IsNeedRectification" class="easyui-combobox" data-options="
                            editable:false,
                            readonly:true,
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
                            ]" />
                    </td>
                    <td class="title">最晚整改时限:</td>
                    <td class="text">
                        <input type="text" id="RectificationTimeLimit" name="RectificationTimeLimit" class="easyui-datebox" data-options="editable: false,readonly:true" />
                    </td>
                </tr>
                <tr>
                    <td class="title">是否验收合格:</td>
                    <td class="text">
                        <input id="IsAccepted" name="IsAccepted" class="easyui-combobox" data-options="
                            editable:false,
                            readonly:true,
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
                            ]" />
                    </td>
                    <td class="title">验收合格时间:</td>
                    <td class="text">
                        <input type="text" id="AcceptedDate" name="AcceptedDate" class="easyui-datebox" data-options="editable: false,readonly:true" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
            <a href="javascript:void(0)" id="btnSave" class="easyui-linkbutton" style="display: none" data-options="iconCls:'icon-save',width:80" onclick="Save();">保存</a>
            <a href="javascript:void(0)" id="btnSubmit" class="easyui-linkbutton" style="display: none" data-options="iconCls:'icon-edit',width:80" onclick="SubmitExamine();">送审</a>
            <a href="javascript:void(0)" id="btnPass" class="easyui-linkbutton" style="display: none" data-options="iconCls:'icon-edit',width:100" onclick="ExaminePlan(1);">审核通过</a>
            <a href="javascript:void(0)" id="btnBack" class="easyui-linkbutton" style="display: none" data-options="iconCls:'icon-edit',width:100" onclick="ExaminePlan(0);">审核不通过</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-back',width:80" onclick="Close();">返回</a>
        </div>
        <input type="hidden" id="OpType" name="OpType" />
        <input type="hidden" id="TaskId" name="TaskId" />
        <input type="hidden" id="CommId" name="CommId" />
        <script type="text/javascript">
            function Load() {
                $.tool.DataGet('CSSupervision', 'GetTaskRectificationInfo', 'OpType=' + $("#OpType").val() + '&CommId=' + $("#CommId").val() + '&TaskId=' + $("#TaskId").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var obj = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        $('#frmForm').form('load', obj[0]);
                        debugger;
                        if (obj[0].num == 1) {
                            if (obj[0].ProfessionalLineScore > '') {
                                $("#tr1").show();
                                $("#tb1title").html("专业条线综合得分");
                                $("#tb1text").html("<input type='text' id='ProfessionalLineScore' name='ProfessionalLineScore' class='easyui-numberbox' data-options='editable: false, readonly: true, precision: 2' />");
                                $("#ProfessionalLineScore").numberbox();
                                $("#ProfessionalLineScore").numberbox('setValue', obj[0].ProfessionalLineScore);
                            }
                            if (obj[0].CategoryDimensionScore > '') {
                                $("#tr1").show();
                                $("#tb1title").html("类别维度综合得分");
                                $("#tb1text").html("<input type='text' id='CategoryDimensionScore' name='CategoryDimensionScore' class='easyui-numberbox' data-options='editable: false, readonly: true, precision: 2' />");
                                $("#CategoryDimensionScore").numberbox();
                                $("#CategoryDimensionScore").numberbox('setValue', obj[0].CategoryDimensionScore);
                            }
                            if (obj[0].DepartmentScore > '') {
                                $("#tr1").show();
                                $("#tb1title").html("机构部门综合得分");
                                $("#tb1text").html("<input type='text' id='DepartmentScore' name='DepartmentScore' class='easyui-numberbox' data-options='editable: false, readonly: true, precision: 2' />");
                                $("#DepartmentScore").numberbox();
                                $("#DepartmentScore").numberbox('setValue', obj[0].DepartmentScore);
                            }
                        }

                        if (obj[0].num == 2) {
                            $("#tr1").show();
                            if (obj[0].ProfessionalLineScore > '' && obj[0].CategoryDimensionScore > '') {
                                $("#tb1title").html("专业条线综合得分");
                                $("#tb1text").html("<input type='text' id='ProfessionalLineScore' name='ProfessionalLineScore' class='easyui-numberbox' data-options='editable: false, readonly: true, precision: 2' />");
                                $("#ProfessionalLineScore").numberbox();
                                $("#ProfessionalLineScore").numberbox('setValue', obj[0].ProfessionalLineScore);
                                $("#tb2title").html("类别维度综合得分");
                                $("#tb2text").html("<input type='text' id='CategoryDimensionScore' name='CategoryDimensionScore' class='easyui-numberbox' data-options='editable: false, readonly: true, precision: 2' />");
                                $("#CategoryDimensionScore").numberbox();
                                $("#CategoryDimensionScore").numberbox('setValue', obj[0].CategoryDimensionScore);
                            }
                            if (obj[0].ProfessionalLineScore > '' && obj[0].DepartmentScore > '') {
                                $("#tb1title").html("专业条线综合得分");
                                $("#tb1text").html("<input type='text' id='ProfessionalLineScore' name='ProfessionalLineScore' class='easyui-numberbox' data-options='editable: false, readonly: true, precision: 2' />");
                                $("#ProfessionalLineScore").numberbox();
                                $("#ProfessionalLineScore").numberbox('setValue', obj[0].ProfessionalLineScore);
                                $("#tb2title").html("机构部门综合得分");
                                $("#tb2text").html("<input type='text' id='DepartmentScore' name='DepartmentScore' class='easyui-numberbox' data-options='editable: false, readonly: true, precision: 2' />");
                                $("#DepartmentScore").numberbox();
                                $("#DepartmentScore").numberbox('setValue', obj[0].DepartmentScore);
                            }
                            if (obj[0].CategoryDimensionScore > '' && obj[0].DepartmentScore > '') {
                                $("#tb1title").html("类别维度综合得分");
                                $("#tb1text").html("<input type='text' id='CategoryDimensionScore' name='CategoryDimensionScore' class='easyui-numberbox' data-options='editable: false, readonly: true, precision: 2' />");
                                $("#CategoryDimensionScore").numberbox();
                                $("#CategoryDimensionScore").numberbox('setValue', obj[0].CategoryDimensionScore);
                                $("#tb2title").html("机构部门综合得分");
                                $("#tb2text").html("<input type='text' id='DepartmentScore' name='DepartmentScore' class='easyui-numberbox' data-options='editable: false, readonly: true, precision: 2' />");
                                $("#DepartmentScore").numberbox();
                                $("#DepartmentScore").numberbox('setValue', obj[0].DepartmentScore);
                            }
                        }

                        if (obj[0].num == 3) {
                            $("#tr1").show();
                            $("#tr2").show();
                            $("#tb1title").html("专业条线综合得分");
                            $("#tb1text").html("<input type='text' id='ProfessionalLineScore' name='ProfessionalLineScore' class='easyui-numberbox' data-options='editable: false, readonly: true, precision: 2' />");
                            $("#ProfessionalLineScore").numberbox();
                            $("#ProfessionalLineScore").numberbox('setValue', obj[0].ProfessionalLineScore);
                            $("#tb2title").html("类别维度综合得分");
                            $("#tb2text").html("<input type='text' id='CategoryDimensionScore' name='CategoryDimensionScore' class='easyui-numberbox' data-options='editable: false, readonly: true, precision: 2' />");
                            $("#CategoryDimensionScore").numberbox();
                            $("#CategoryDimensionScore").numberbox('setValue', obj[0].CategoryDimensionScore);
                            $("#tb3title").html("机构部门综合得分");
                            $("#tb3text").html("<input type='text' id='DepartmentScore' name='DepartmentScore' class='easyui-numberbox' data-options='editable: false, readonly: true, precision: 2' />");
                            $("#DepartmentScore").numberbox();
                            $("#DepartmentScore").numberbox('setValue', obj[0].DepartmentScore);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function Close() {
                window.parent.HDialog.Close();
            }

            function Save() {
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'SaveTaskRectification', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info("保存成功");
                        localStorage.setItem("OpType", 'edit');
                        $("#OpType").val('edit');
                        Load();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function SubmitExamine() {
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'TaskRectification_SubmitExamine', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info(_Data);
                        Close();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function ExaminePlan(IsPass) {
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'TaskRectification_Examine', 'TaskId=' + $("#TaskId").val() + '&IsPass=' + IsPass + '&CommId=' + $("#CommId").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info(_Data);
                        Close();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            $(function () {
                $("#OpType").val(localStorage.getItem('OpType'));
                $("#TaskId").val(localStorage.getItem('TaskId'));
                $("#CommId").val(localStorage.getItem('CommId'));
                Load();
                if ($("#OpType").val() == "insert")
                    $("#btnSave").show();
                if ($("#OpType").val() == "edit")
                    $("#btnSave").show();
                if ($("#OpType").val() == "submit") {
                    $("#btnSubmit").show();
                    $("#RectificationName").textbox({ readonly: true });
                    $("#RectificationNo").textbox({ readonly: true });
                }
                if ($("#OpType").val() == "examine") {
                    $("#btnPass").show();
                    $("#btnBack").show();
                    $("#RectificationName").textbox({ readonly: true });
                    $("#RectificationNo").textbox({ readonly: true });
                }
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
