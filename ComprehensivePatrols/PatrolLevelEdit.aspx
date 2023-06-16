<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatrolLevelEdit.aspx.cs" Inherits="M_Main.ComprehensivePatrols.PatrolLevelEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <%--<script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>--%>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <%--    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>--%>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <%--<script type="text/javascript" src="../jscript/linq.js"></script>--%>
    <%--<script type="text/javascript" src="../jscript/City/City.js"></script>--%>

    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmFrom">
        <div style="padding: 5px;">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>序号:</span></td>
                    <td class="text">
                        <input id="Sort" name="Sort" class="easyui-numberbox" data-options="required:true" />
                    </td>
                    <td class="title"><span>任务类型:</span></td>
                    <td class="text">
                        <input id="TaskType" name="TaskType" class="easyui-combobox" tasktypedictionary="true" bindid="ID" bindname="Name" typename="任务类型" data-options="required:true,panelHeight: 'auto',editable:false, onSelect:function(rec){ SelectTaskType();}" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>任务级别:</span></td>
                    <td class="text">
                        <input id="TaskLevelName" name="TaskLevelName" class="easyui-textbox" data-options="required:true" />
                    </td>
                    <td class="title"><span>是否评分:</span></td>
                    <td class="text">
                        <input id="IsScore" name="IsScore" class="easyui-combobox" data-options="required:true,panelHeight:'auto',editable:false,
                        data:[{value:'0',text:'否'},{value:'1',text:'是'}]
                        " />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="IsDecisionSupport" checked="checked" />&nbsp;是否计入决策支撑
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>最低频次:</span></td>
                    <td class="text">
                        <input id="Frequency" name="Frequency" class="easyui-combobox" data-options="panelHeight:'auto',editable:false,
                        data:[
                            {value:'1次/半小时',text:'1次/半小时'},
                            {value:'1次/1小时',text:'1次/1小时'},
                            {value:'1次/2小时',text:'1次/2小时'},
                            {value:'1次/3小时',text:'1次/3小时'},
                            {value:'1次/4小时',text:'1次/4小时'},
                            {value:'1次/6小时',text:'1次/6小时'},
                            {value:'1次/8小时',text:'1次/8小时'},
                            {value:'1次/12小时',text:'1次/12小时'},
                            {value:'1次/天',text:'1次/天'},
                            {value:'3次/周',text:'3次/周'},
                            {value:'2次/周',text:'2次/周'},
                            {value:'1次/周',text:'1次/周'},
                            {value:'1次/10天',text:'1次/10天'},
                            {value:'1次/15天',text:'1次/15天'},
                            {value:'1次/月',text:'1次/月'},
                            {value:'1次/2月',text:'1次/2月'},
                            {value:'1次/季',text:'1次/季'},
                            {value:'1次/半年',text:'1次/半年'},
                            {value:'1次/年',text:'1次/年'}
                            ]
                        ,
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}]" />
                    </td>
                    <td class="title"><span id="IsDiscardTitle">允许甩项:</span></td>
                    <td class="text" id="IsDiscardTextShow">
                        <input id="IsDiscard" name="IsDiscard" class="easyui-combobox" data-options="required:true,panelHeight:'auto',editable:false,data:[{value:'0',text:'否'},{value:'1',text:'是'}]" />
                    </td>
                    <td class="text" id="IsDiscardTextHide">
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>责任岗位:</span></td>
                    <td class="text" colspan="3">
                        <input id="TaskRoleCode" name="TaskRoleCode" class="easyui-textbox" data-options="prompt:'温馨提示:不能为空且禁止输入自定义文本内容! 请单击右侧\'请选择\'按钮进行操作!',editable:false,tipPosition:'top',required:true,multiline:false,width:'98%',
                        buttonText:'请选择',buttonIcon:'icon-add',onClickButton:function(){GetTaskRole('TaskRoleCode');},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>计划设置岗位:</span></td>
                    <td class="text" colspan="3">
                        <input id="CheckRoleCode" name="CheckRoleCode" class="easyui-textbox" data-options="prompt:'温馨提示:不能为空且禁止输入自定义文本内容! 请单击右侧\'请选择\'按钮进行操作!',editable:false,tipPosition:'top',required:true,multiline:false,width:'98%',
                        buttonText:'请选择',buttonIcon:'icon-add',onClickButton:function(){GetTaskRole('CheckRoleCode');},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />

                    </td>
                </tr>
                <tr>
                    <td class="title"><span>计划审核岗位:</span></td>
                    <td class="text" colspan="3">
                        <input id="AuditingRoleCode" name="AuditingRoleCode" class="easyui-textbox" data-options="prompt:'温馨提示:不能为空且禁止输入自定义文本内容! 请单击右侧\'请选择\'按钮进行操作!',editable:false,tipPosition:'top',required:true,multiline:false,width:'98%',
                        buttonText:'请选择',buttonIcon:'icon-add',onClickButton:function(){GetTaskRole('AuditingRoleCode');},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />

                    </td>
                </tr>
                <tr>
                    <td class="title"><span>计划可见岗位:</span></td>
                    <td class="text" colspan="3">
                        <input id="CanSeeRoleCode" name="CanSeeRoleCode" class="easyui-textbox" data-options="prompt:'温馨提示:禁止输入自定义文本内容! 请单击右侧\'请选择\'按钮进行操作!',editable:false,tipPosition:'top',required:false,multiline:false,width:'98%',
                        buttonText:'请选择',buttonIcon:'icon-add',onClickButton:function(){GetTaskRole('CanSeeRoleCode');},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />

                    </td>
                </tr>
                <tr>
                    <td class="title"><span>备注:</span></td>
                    <td class="text" colspan="4">
                        <input id="Remark" name="Remark" class="easyui-textbox" data-options="required:false,validType:'length[0,200]'" style="width: 98%;" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="hidden" name="ID" id="ID" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>
    </form>

    <script type="text/javascript">
        //选择岗位
        function GetTaskRole(id) {
            HDialog.Open('700', '400', '../ComprehensivePatrols/DialogSelectRole.aspx', '选择岗位', true, function callback(data) {
                //console.log(data);
                var idRole = "", textRole = "";
                if (data != "") {
                    var arrayData = data.split('_');
                    idRole = arrayData[0];
                    textRole = arrayData[1];
                }
                $("#" + id).textbox("setValue", idRole);
                $('#' + id).textbox("setText", textRole);
            });
        }

        function SelectTaskType() {
            var TaskType = $("#TaskType").combobox('getText');
            if (TaskType != '品质核查' && TaskType != '公区巡查') {
                $("#IsDiscardTitle").text('');
                $("#IsDiscardTextShow").hide();
                $("#IsDiscardTextHide").show();
                $("#IsDiscard").combobox({ required: false });
            } else {
                $("#IsDiscardTitle").text('允许甩项:');
                $("#IsDiscardTextShow").show();
                $("#IsDiscardTextHide").hide();
                $("#IsDiscard").combobox({ required: true });
                $("#IsDiscard").combobox('setValue', '0');
            }
        }

        $(function () {
            $("#IsDiscardTextShow").show();
            $("#IsDiscardTextHide").hide();
            PageInit();
        });

        function PageInit() {
            var ID = GetQueryString("ID");
            $("#ID").val(ID);
            $('#Sort').numberbox('textbox').attr('maxlength', 8);
            if (isValueNull(ID)) {
                LoadInfo();
            }
            if ($("#hdLoignUserOrganId").val() == "01") {
                $("#CommId").textbox("enable").textbox("clear");
            }

        }

        function GetIsSortRepeat() {
            var sort = $("#Sort").numberbox('getValue');
            if (!isValueNull(sort)) {
                $("#lbl_SortRepeat").text("请输入序号!").css("color", "red");
                return;
            }
            $.tool.DataPostJson('CpComPatrols', 'GetIsSortRepeat', $.JQForm.GetStrParam(),
                function Init() {
                    $("#lbl_SortRepeat").text("正在检测...").css("color", "#666");
                },
                function callback(data) {
                    console.log(data);
                    if (!data.result) {
                        $("#lbl_SortRepeat").text("通过!").css("color", "red");
                    } else {
                        $("#lbl_SortRepeat").text(data.msg).css("color", "#399a28");
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function LoadInfo() {
            $.tool.DataPostJson('CpComPatrols', 'SelPatrolLevel', $.JQForm.GetStrParam(),
                function Init() {
                },
                function callback(data) {
                    debugger;
                    $('#frmFrom').form('load', data);
                    if (isValueNull(data.TaskRoleCode)) {
                        $("#TaskRoleCode").textbox("setValue", data.TaskRoleCode);
                        $("#TaskRoleCode").textbox("setText", data.TaskRoleCodeName);
                    }
                    if (isValueNull(data.CheckRoleCode)) {
                        $("#CheckRoleCode").textbox("setValue", data.CheckRoleCode);
                        $("#CheckRoleCode").textbox("setText", data.CheckRoleCodeName);
                    }
                    if (isValueNull(data.AuditingRoleCode)) {
                        $("#AuditingRoleCode").textbox("setValue", data.AuditingRoleCode);
                        $("#AuditingRoleCode").textbox("setText", data.AuditingRoleCodeName);
                    }
                    if (isValueNull(data.CanSeeRoleCode)) {
                        $("#CanSeeRoleCode").textbox("setValue", data.CanSeeRoleCode);
                        $("#CanSeeRoleCode").textbox("setText", data.CanSeeRoleCodeName);
                    }
                    $("#IsDecisionSupport").attr("checked", data.IsDecisionSupport);

                    var TaskType = data.TaskTypeName;
                    if (TaskType != '品质核查' && TaskType != '公区巡查') {
                        $("#IsDiscardTitle").text('');
                        $("#IsDiscardTextShow").hide();
                        $("#IsDiscardTextHide").show();
                        $("#IsDiscard").combobox({ required: false });
                    } else {
                        $("#IsDiscardTitle").text('允许甩项:');
                        $("#IsDiscardTextShow").show();
                        $("#IsDiscardTextHide").hide();
                        $("#IsDiscard").combobox({ required: true });
                        $("#IsDiscard").combobox('setValue', data.IsDiscard);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function Save() {
            if ($('#frmFrom').form("validate")) {
                $.tool.DataPostJson('CpComPatrols', 'SavePatrolLevel', $.JQForm.GetStrParam(),
                    function Init() {
                        $("#btnSave").attr("disabled", "disabled");
                    },
                    function callback(data) {
                        if (data.result) {
                            HDialog.Close("true");
                        } else { HDialog.Info(data.msg); }
                    },
                    function completeCallback() {
                        $("#btnSave").removeAttr("disabled");
                    }, function errorCallback() {
                        $("#btnSave").removeAttr("disabled");
                    });
            }
        }

        function Close() {
            HDialog.Close();
        }
    </script>
</body>
</html>
