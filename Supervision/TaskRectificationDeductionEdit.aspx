<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskRectificationDeductionEdit.aspx.cs" Inherits="M_Main.Supervision.TaskRectificationDeductionEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>加扣分项编辑</title>
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
            <table class="dlg_table" style="margin-bottom: 0px">
                <tr>
                    <td class="title" colspan="4" style="text-align: center">检查信息</td>
                </tr>
                <tr>
                    <td class="title">序号:</td>
                    <td class="text">
                        <input type="text" id="Sort" name="Sort" class="easyui-numberbox" data-options="required: true, precision: 0, min: 1, readonly:true" />
                    </td>
                    <td class="title">检查地点:</td>
                    <td class="text">
                        <input type="text" id="CheckPlace" name="CheckPlace" class="easyui-textbox" data-options="required: true, readonly:true" />
                    </td>
                </tr>
                <tr>
                    <td class="title">内容描述:</td>
                    <td class="text" colspan="3">
                        <input type="text" id="Content" name="Content" class="easyui-textbox colspan" data-options="required: true, readonly:true" />
                    </td>
                </tr>
                <tr>
                    <td class="title">加扣分数:</td>
                    <td class="text">
                        <input type="text" id="DeductionScore" name="DeductionScore" class="easyui-numberbox" data-options="required: true, precision: 2, readonly:true" />
                    </td>
                    <td class="title"></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="title">问题类型:</td>
                    <td class="text">
                        <input type="text" id="ProblemId" name="ProblemId" class="easyui-combobox" data-options="readonly:true" />
                    </td>
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
                            ],
                            value:'1'" />
                    </td>
                </tr>
                <tr>
                    <td class="title">整改要求:</td>
                    <td class="text" colspan="3">
                        <input type="text" id="RectificationExplain" name="RectificationExplain" class="easyui-textbox colspan" data-options="required: false,readonly:true" />
                    </td>
                </tr>
                <tr>
                    <td class="title">整改时限:</td>
                    <td class="text">
                        <input type="text" id="RectificationTimeLimit" name="RectificationTimeLimit" class="easyui-datebox" data-options="required: false,readonly:true" />
                    </td>
                    <td class="title">登记人:</td>
                    <td class="text">
                        <input type="text" id="AddUserName" name="AddUserName" class="easyui-textbox" data-options="required: false,value:'保存后，自动记录',readonly:true" />
                    </td>
                </tr>
                <tr>
                    <td class="title">登记时间:</td>
                    <td class="text">
                        <input type="text" id="AddDate" name="AddDate" class="easyui-textbox" data-options="required: false,value:'保存后，自动记录',readonly:true" />
                    </td>
                    <td class="title">检查附件:</td>
                    <td class="text"><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',width:80" onclick="Files('加扣分项');">附件</a></td>
                </tr>
            </table>
        </div>
        <div style="padding: 5px;">
            <table class="dlg_table" style="margin-bottom: 0px">
                <tr>
                    <td class="title" colspan="4" style="text-align: center">整改信息</td>
                </tr>
                <tr>
                    <td class="title">是否整改:</td>
                    <td class="text">
                        <input id="IsRectification" name="IsRectification" class="easyui-combobox" data-options="
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
                            value:'0'" />
                    </td>
                    <td class="title"></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="title">整改描述:</td>
                    <td class="text" colspan="3">
                        <input type="text" id="RectificationRemark" name="RectificationRemark" class="easyui-textbox colspan" data-options="required: false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">整改人:</td>
                    <td class="text">
                        <input type="text" id="RectificationUserName" name="RectificationUserName" class="easyui-textbox" data-options="required: false,editable:false,value:'保存后，自动记录'" />
                    </td>
                    <td class="title">整改时间:</td>
                    <td class="text">
                        <input type="text" id="RectificationDate" name="RectificationDate" class="easyui-textbox" data-options="required: false,editable:false,value:'保存后，自动记录'" />
                    </td>
                </tr>
                <tr>
                    <td class="title">整改附件:</td>
                    <td class="text"><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',width:80" onclick="Files('整改');">附件</a></td>
                    <td class="title"></td>
                    <td class="text"></td>
                </tr>
            </table>
        </div>
        <div style="padding: 5px; margin-bottom: 53px">
            <table class="dlg_table" style="margin-bottom: 0px;" id="AcceptedTable">
                <tr>
                    <td class="title" colspan="4" style="text-align: center">验收信息</td>
                </tr>
                <tr>
                    <td class="title">是否验收:</td>
                    <td class="text">
                        <input id="IsAccepted" name="IsAccepted" class="easyui-combobox" data-options="
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
                            value:'0'" />
                    </td>
                    <td class="title"></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="title">验收描述:</td>
                    <td class="text" colspan="3">
                        <input type="text" id="AcceptedRemark" name="AcceptedRemark" class="easyui-textbox colspan" data-options="required: false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">验收人:</td>
                    <td class="text">
                        <input type="text" id="AcceptedUserName" name="AcceptedUserName" class="easyui-textbox" data-options="required: false,value:'保存后，自动记录'" />
                    </td>
                    <td class="title">验收时间:</td>
                    <td class="text">
                        <input type="text" id="AcceptedDate" name="AcceptedDate" class="easyui-textbox" data-options="required: false,value:'保存后，自动记录'" />
                    </td>
                </tr>
                <tr>
                    <td class="title">验收附件:</td>
                    <td class="text"><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',width:80" onclick="Files('验收');">附件</a></td>
                    <td class="title"></td>
                    <td class="text"></td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" id="btnRectification" onclick="Rectification();" style="display: none">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" id="btnAccepted" onclick="Accepted();" style="display: none">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-back',width:80" onclick="Close();">返回</a>
        </div>
        <input type="hidden" id="TaskRectificationDeductionItemId" name="TaskRectificationDeductionItemId" />
        <input type="hidden" id="TaskDeductionItemId" name="TaskDeductionItemId" />
        <input type="hidden" id="OpType" name="OpType" />
        <input type="hidden" id="TaskId" name="TaskId" />
        <input type="hidden" id="CommId" name="CommId" />
        <script type="text/javascript">
            function LoadProblem() {
                $('#ProblemId').combobox({
                    required: true,
                    panelHeight: '200',
                    validType: ['comboBoxValid[\'#ProblemId\']'],
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function (e) {
                            $(e.data.target).combobox('clear');
                        }
                    }],
                    url: '/HM/M_Main/HC/DataGetControl.aspx',
                    method: 'get',
                    valueField: 'Id',
                    textField: 'Name',
                    onBeforeLoad: function (param) {
                        param.Method = 'DataGet';
                        param.Class = 'CSSupervision';
                        param.Command = 'GetDictionaryByDType';
                        param.DType = '问题类型';
                    }
                });
            }

            function Files(Type) {
                var NeedEdit = 0;
                if ($("#OpType").val() == 'Rectification' && Type == '整改')
                    NeedEdit = 1;
                if ($("#OpType").val() == 'Accepted' && Type == '验收')
                    NeedEdit = 1;
                HDialog.Open('600', '340', '../Supervision/TaskFilesList.aspx?Type=' + encodeURI(encodeURI(Type)) + '&KeyId=' + $('#TaskDeductionItemId').val() + '&CommId=' + $('#CommId').val() + "&NeedEdit=" + NeedEdit, '上传附件', false, function callback(_Data) {

                });
            }


            function Load() {
                $.tool.DataGet('CSSupervision', 'TaskRectificationDeductionItemInfo', 'TaskRectificationDeductionItemId=' + $("#TaskRectificationDeductionItemId").val() + '&CommId=' + $("#CommId").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var obj = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        $('#frmForm').form('load', obj[0]);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function Close() {
                HDialog.Close();
            }

            function Rectification() {
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'TaskRectificationDeductionItem_SaveRectification', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info("保存成功");
                        HDialog.Close();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function Accepted() {
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'TaskRectificationDeductionItem_SaveAccepted', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info("保存成功");
                        HDialog.Close();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            $(function () {
                $("#OpType").val(GetQueryString('OpType'));
                $("#TaskId").val(GetQueryString('TaskId'));
                $("#CommId").val(GetQueryString('CommId'));
                $("#TaskRectificationDeductionItemId").val(GetQueryString('TaskRectificationDeductionItemId'));
                LoadProblem();
                if ($("#OpType").val() == 'Accepted') {
                    $("#AcceptedTable").show();
                    $("#btnAccepted").show();
                    $("#IsRectification").combobox({ readonly: true });
                    $("#RectificationRemark").textbox({ readonly: true });
                    $("#RectificationUserName").textbox({ readonly: true });
                    $("#RectificationDate").textbox({ readonly: true });
                } else {
                    $("#AcceptedTable").hide();
                    $("#btnRectification").show();
                }
                Load();
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
