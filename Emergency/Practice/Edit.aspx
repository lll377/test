<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.Emergency.Practice.Edit" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>应急演练登记编辑</title>
    <link href="../../css/base.css" rel="stylesheet" />
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
    <script type="text/javascript" src="../../jscript/DateFormat.js"></script>

    <style type="text/css">
        .divPrint {
            width: 100%;
            text-align: right;
            padding-right: 46px;
            height: 40px;
        }

        .bootstrap_table tr td.title {
            width: 14%;
            text-align: center;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            width: 36%;
            text-align: left;
        }
    </style>
</head>
<body>
    <input type="hidden" id="OpType" name="OpType" />
    <div style="margin: 10px; display: block;">
        <form id="mainForm">
            <input type="hidden" id="LongTimeStamp" name="LongTimeStamp" />
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">应急演练计划</legend>
                <table class="bootstrap_table baseinfo Plan" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title">
                            <span>项目名称</span>
                        </td>
                        <td class="text">
                            <input type="hidden" id="CommID" name="CommID" />
                            <label id="CommName"></label>
                        </td>
                        <td class="title"><span>应急类型</span></td>
                        <td class="text">
                            <input id="EmergencyTypeName" name="EmergencyTypeName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'250px',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelType();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                            <input type="hidden" id="EmergencyTypeID" name="EmergencyTypeID" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>计划开始时间</span></td>
                        <td class="text">
                            <input id="PlanBeginTime" name="PlanBeginTime" class="easyui-datetimebox" data-options="required:true,editable:false,width:'250px',tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                        <td class="title"><span>计划结束时间</span></td>
                        <td class="text">
                            <input id="PlanEndTime" name="PlanEndTime" class="easyui-datetimebox" data-options="required:true,editable:false,width:'250px',tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>计划演练内容</span></td>
                        <td class="text" colspan="3">
                            <input id="PlanPracticeContent" name="PlanPracticeContent" maxlength="2000" class="easyui-textbox" data-options="tipPosition:'bottom',multiline:true,width:'620px',height:'50px'" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>责任人</span></td>
                        <td class="text">
                            <input id="DutyUserName" name="DutyUserName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'250px',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelUser();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                            <input type="hidden" id="DutyUserCode" name="DutyUserCode" />
                        </td>
                        <td class="title"><span>计划备注</span></td>
                        <td class="text">
                            <input id="PlanRemark" name="PlanRemark" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:false,width:'250'" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>计划审核人</span></td>
                        <td class="text">
                            <input id="PlanAuditUserName" name="PlanAuditUserName" class="easyui-textbox" disabled="disabled" data-options="required:false,tipPosition:'bottom',multiline:false,width:'250'" />
                        </td>
                        <td class="title"><span>计划审核状态</span></td>
                        <td class="text">
                            <input id="PlanAuditState" name="PlanAuditState" class="easyui-textbox" value="未审核" disabled="disabled" data-options="required:false,tipPosition:'bottom',multiline:false,width:'250'" />
                        </td>
                    </tr>
                </table>

            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">应急演练结果</legend>
                <table class="bootstrap_table baseinfo Result" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title"><span>实际开始时间</span></td>
                        <td class="text">
                            <input id="ActualStartTime" name="ActualStartTime" class="easyui-datetimebox" data-options="editable:false,width:'250px',tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                        <td class="title"><span>实际结束时间</span></td>
                        <td class="text">
                            <input id="ActualEndTime" name="ActualEndTime" class="easyui-datetimebox" data-options="editable:false,width:'250px',tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>实际演练内容</span></td>
                        <td class="text" colspan="3">
                            <input id="ActualPracticeContent" name="ActualPracticeContent" maxlength="2000" class="easyui-textbox" data-options="tipPosition:'bottom',multiline:true,width:'620px',height:'50px'" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>是否完成</span></td>
                        <td class="text">
                            <select id="IsComplete" name="IsComplete" class="easyui-combobox" style="width: 80px;" data-options="tipPosition:'bottom',editable:false,panelHeight:'auto'">
                                <option value="否">否</option>
                                <option value="是">是</option>
                            </select>
                        </td>
                        <td class="title"><span>结果备注</span></td>
                        <td class="text">
                            <input id="ActualResultRemark" name="ActualResultRemark" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:false,width:'250'" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>结果审核人</span></td>
                        <td class="text">
                            <input id="ActualResultAuditUserName" name="ActualResultAuditUserName" class="easyui-textbox" disabled="disabled" data-options="required:false,tipPosition:'bottom',multiline:false,width:'250'" />
                        </td>
                        <td class="title"><span>结果审核状态</span></td>
                        <td class="text">
                            <input id="ActualResultAuditState" name="ActualResultAuditState" value="未审核" class="easyui-textbox" disabled="disabled" data-options="required:false,tipPosition:'bottom',multiline:false,width:'250'" />
                        </td>
                    </tr>
                </table>

            </fieldset>
        </form>

        <fieldset class="frame-fieldset">
            <legend class="frame-legend">文件上传</legend>
            <input type="hidden" id="KeyID" name="KeyID" />
            <form id="fileForm">
                <input id="Type" name="Type" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',required:true,panelHeight:'auto',
                         valueField:'id',textField:'text',value:'演练方案',data: [{id: '演练方案',text: '演练方案'},{id: '签到记录',text: '签到记录'},{id: '演练照片',text: '演练照片'},{id: '演练总结',text: '演练总结'}]" />
                <a id="tip" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'"></a>
                <input type="hidden" name="FileType" id="FileType" />
                <input type="hidden" name="FilePath" id="FilePath" />
                <input type="hidden" name="FileCode" id="FileCode" />
                <input id="uploadFile" name="uploadFile" class="easyui-filebox" data-options="required:true,width:'210px',buttonText:'选择文件',prompt:'请选择一个文件...'" />
                <input id="FileName" name="FileName" class="easyui-textbox" data-options="required:true,width:'250px',prompt:'文件名称',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                <a href="#" onclick="SaveFile()" class="easyui-linkbutton" id="FileUploadButton" data-options="iconCls:'icon-save',width:80">上传</a>
            </form>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">演练方案</legend>
            <div id="mianScheme">
                <table id="dgScheme" border="0" cellspacing="0" cellpadding="0"></table>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">签到记录</legend>
            <table id="dgRecord" border="0" cellspacing="0" cellpadding="0">
            </table>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">演练照片</legend>
            <table id="dgPhoto" border="0" cellspacing="0" cellpadding="0">
            </table>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">演练总结</legend>
            <table id="dgSummary" border="0" cellspacing="0" cellpadding="0">
            </table>
        </fieldset>
        <div style="height: 40px; display: block"></div>
    </div>
    <%-- <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="hidden" name="ID" id="ID" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>--%>
    <div class="btnFixed">
        <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
        <input type="hidden" name="ID" id="ID" runat="server" />
        <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
    </div>

    <script type="text/javascript">
        //选择应急类型
        function SelType() {
            LayerDialog.OpenWin('600', '400', '../Emergency/Dialog/EmergencyType.aspx?', '选择应急类型', true, function callback(data) {
                //console.log(data);
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#EmergencyTypeID").val(data.id);
                    $("#EmergencyTypeName").textbox("setText", data.text);
                }

            });
        }
        function SelUser() {
            LayerDialog.OpenWin('1024', '450', '../Emergency/Dialog/User.aspx?CommID=' + $('#CommID').val(), '选择责任人', true, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#DutyUserCode").val(data.UserCode);
                    $("#DutyUserName").textbox('setText', data.UserName);
                }
            });
        }
        function InitControl() {
            var w = $(window).width();
            $("#mianScheme").width(w - 60);
            $('#tip').tooltip({
                position: 'top',
                content: '<div><p>1、文件限制最大为2M。</p></div>',
            });
            $('#uploadFile').filebox({
                onChange: function (newValue, oldValue) {
                    if (isValueNull(newValue)) {
                        var s = newValue.lastIndexOf("\\");
                        var e = newValue.lastIndexOf(".");
                        var fileName = newValue.substring(s + 1, e);//文件名不带后缀
                        var fileType = newValue.substring(e + 1, newValue.length);//文件后缀
                        $("#FileType").val(fileType);
                        $("#FileName").textbox("setValue", fileName);
                    }
                }
            });

        }
        $(function () {
            InitControl();
            InitPage();
        });

        function InitPage() {
            var OpType = $.getUrlParam("OpType");
            var ID = $.getUrlParam("ID");
            var CommID = $.getUrlParam("CommID");
            var CommName = $.getUrlParam("CommName");
            $("#CommID").val(CommID);
            $("#CommName").text(CommName);
            $("#OpType").val(OpType);
            $("#ID").val(ID);
            $("#KeyID").val(ID);
            if (OpType == "Edit") {
                InitData();
            } else {
                //新增禁用 应急演练结果 文件上传
                $('.Result input,.Result select').each(function () {
                    if ($(this).hasClass("easyui-datetimebox")) {
                        $(this).datetimebox("disable");
                    } else if ($(this).hasClass("easyui-combobox")) {
                        $(this).combobox('disable');
                    } else if ($(this).hasClass("easyui-textbox")) {
                        $(this).textbox("disable");
                    }
                });
                $('#FileUploadButton').linkbutton("disable");
            }
            InitDataGrid("dgScheme", "演练方案");
        }
        //页面数据初始化加载
        function InitData() {
            $.dataPostJson('Emergency_Practice', 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    $('#mainForm').form('load', data);
                    $('#EmergencyTypeID').val(data.EmergencyTypeID);
                    $('#EmergencyTypeName').textbox("setText", data.EmergencyTypeName);

                    $('#DutyUserCode').val(data.DutyUserCode);
                    $('#DutyUserName').textbox("setText", data.DutyUserName);
                    if (data.PlanBeginTime != "") {
                        $("#PlanBeginTime").datetimebox("setValue", formatDate(data.PlanBeginTime, 'yyyy-MM-dd HH:mm:ss'));
                    }
                    if (data.PlanEndTime != "") {
                        $("#PlanEndTime").datetimebox("setValue", formatDate(data.PlanEndTime, 'yyyy-MM-dd HH:mm:ss'));
                    }
                    //判断 计划是否审核通过
                    if (data.PlanAuditState == "已审核") {
                        //判断 结果是否审核通过  
                        if (data.ActualResultAuditState == "已审核") {
                            //结果 审核通过就禁用页面所有
                            $('.Plan input,.Result input,.Result select').each(function () {
                                if ($(this).hasClass("easyui-datetimebox")) {
                                    $(this).datetimebox("disable");
                                } else if ($(this).hasClass("easyui-combobox")) {
                                    $(this).combobox('disable');
                                } else if ($(this).hasClass("easyui-textbox")) {
                                    $(this).textbox("disable");
                                }
                            });
                            $('#FileUploadButton').linkbutton("disable");
                            $('#btnSave').attr("disabled", "disabled");
                        } else {
                            //结果未审核通过，只禁用计划内容
                            $('.Plan input,.Plan select').each(function () {
                                if ($(this).hasClass("easyui-datetimebox")) {
                                    $(this).datetimebox("disable");
                                } else if ($(this).hasClass("easyui-combobox")) {
                                    $(this).combobox('disable');
                                } else if ($(this).hasClass("easyui-textbox")) {
                                    $(this).textbox("disable");
                                }
                            });
                            $('.Result .easyui-datetimebox').each(function () {
                                $(this).datetimebox({ required: true });
                            });
                        }
                    } else {
                        //计划未审核通过 只允许填写计划内容
                        $('.Result input,.Result select').each(function () {
                            if ($(this).hasClass("easyui-datetimebox")) {
                                $(this).datetimebox("disable");
                            } else if ($(this).hasClass("easyui-combobox")) {
                                $(this).combobox('disable');
                            } else if ($(this).hasClass("easyui-textbox")) {
                                $(this).textbox("disable");
                            }
                        });
                        $('#FileUploadButton').linkbutton("disable");
                    }
                    if (data.ActualStartTime != "") {
                        $("#ActualStartTime").datetimebox("setValue", formatDate(data.ActualStartTime, 'yyyy-MM-dd HH:mm:ss'));
                    }
                    if (data.ActualEndTime != "") {
                        $("#ActualEndTime").datetimebox("setValue", formatDate(data.ActualEndTime, 'yyyy-MM-dd HH:mm:ss'));
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function Save() {
            if ($('#mainForm').form("validate")) {
                $.dataPostJson('Emergency_Practice', 'Save', $.getParam(), true, false,
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


        var column = [[
            {
                field: 'FileCode', title: '附件编号', width: 100, align: 'left', sortable: false, formatter: function (value, row, index) {
                    var arr = value.split('.');
                    return arr[0];
                }
            },
            {
                field: 'FileName', title: '附件名称', width: 160, align: 'left', sortable: false, formatter: function (value, row, index) {
                    value = GetAHtml(row.FilePath, value);
                    return value;
                }
            },
            { field: 'FileType', title: '附件类型', width: 40, align: 'center', sortable: false },
            {
                field: 'AddTime', title: '添加日期', width: 60, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'Opt', title: '操作', width: 40, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return "<a href=\"javascript:DelFile('" + row.ID + "','" + row.Type + "')\" >删除</a>";
                }
            },
        ]];
        function GetAHtml(url, fileName) {
            var html = "";
            if (url && url != "") {
                // url = "http://120.77.74.255:8001/ErpUploadFile/1853/RoomAdjunct/2018/05/18531753454642601.pdf";
                var arr = url.split('/');
                var name = arr[arr.length - 1];
                arr = name.split('.');
                var IdNew = arr[arr.length - 2];
                html = "<a target=\"_blank\" id=\"11831617369\" href=\"" + url + "\" class=\"HrefStyle\" url=\"" + url + "\">" + fileName + "</a>";
                //html = "<a target=\"_blank\" id=\"" + IdNew + "\" href=\"" + url + "\" class=\"HrefStyle\" url=\"" + url + "\">" + name + "</a><span  style='cursor:hand' onclick=\"Delete(this,'" + IdNew + "','" + url + "','" + name + "','" + IdNew + "');\">&nbsp;<img src='../Images/cancel.png' style='width:12px;height:12px;cursor:pointer'  title='删除'/>&nbsp;</span><input id=\"" + IdNew + "\" Type='hidden' value='" + url + "'>"
            }
            return html;
        }
        var loadType = "Init";
        function InitDataGrid(dgName, typeName) {

            $("#" + dgName).datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                height: 200,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "ID",
                columns: column,
                rownumbers: true,
                fitColumns: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: true,
                pagination: true,
                width: "100%",
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onSelect: function (index, row) {

                },
                onBeforeLoad: function (param) {
                    param.Type_Name = typeName;
                    param = $.getDataGridParam("Emergency_File", "GetList", param);


                },
                onLoadSuccess: function (data) {
                    $("#" + dgName).datagrid('resize');
                    $("#uploadFile").textbox('disableValidation');
                    $("#FileName").textbox('disableValidation');
                    if (loadType == "Init") {
                        if (dgName == "dgScheme") { InitDataGrid("dgRecord", "签到记录", "Init"); }
                        else if (dgName == "dgRecord") { InitDataGrid("dgPhoto", "演练照片", "Init"); }
                        else if (dgName == "dgPhoto") { InitDataGrid("dgSummary", "演练总结", "Init"); }
                    }

                },
                onLoadError: function (data) {

                }
            });
            $("#" + dgName).datagrid('clearSelections');
            $("#" + dgName).datagrid('clearChecked');
        }


        //上传附件
        function SaveFile() {
            $("#uploadFile").textbox('enableValidation');
            $("#FileName").textbox('enableValidation');
            if (!$("#fileForm").form('validate')) { return; };
            var file = $("input[name='uploadFile']")[0].files[0];
            var maxsize = 2 * 1024 * 1024;
            var tipFileSize = 2;
            var fileType = file.type;
            console.log(fileType);
            if ($("#Type").combobox("getValue") == "演练照片") {
                if (fileType != "image/bmp" && fileType != "image/jpeg" && fileType != "image/png" && fileType != "image/gif") {
                    HDialog.Info("图片格式不正确!");
                    return false;
                }
            }
            if (file.size > parseInt(maxsize)) {
                HDialog.Info("不能上传超过" + tipFileSize + "M的附件！");
                return false;
            }

            $.messager.progress({ title: "温馨提示", msg: "正在上传..." });
            var options = {
                type: "POST",
                url: "../../AjaxUploadFile.aspx?Cmd=ins&FileType=room&FileURL=",
                //data: "upfile=" + $("#uploadfile").val(),
                success: function (data, status) {
                    $.messager.progress('close');
                    var stringArray = data.split("|");
                    var FileName = stringArray[1];
                    var FileError = stringArray[2];
                    var FileURL = stringArray[3];
                    var FileServerName = stringArray[4];
                    if (stringArray[0] == "1") {
                        //stringArray[0]    成功状态(1为成功，0为失败)
                        //stringArray[1]    文件名
                        //stringArray[2]    消息提示
                        //stringArray[3]    文件路径
                        UploadCallBack(FileURL, FileName);
                    }
                    else {
                        $.messager.alert('错误', FileError, 'error');
                    }

                },
                error: function (data, status, e) {
                    $.messager.alert('错误', e.toString(), 'error');
                    $.messager.progress('close');
                }
            };
            $('#fileForm').ajaxSubmit(options);
            return false;
        }

        //上传文件相关绑定
        function UploadCallBack(url, Name) {
            $("#FileCode").val(Name);
            $("#FilePath").val(url);
            $.dataPostJson('Emergency_File', 'Save', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        $('#uploadFile').filebox('clear');
                        $('#FileName').textbox('clear');
                        var type = $("#Type").combobox("getValue");
                        RefreshDataGrid(type);
                    } else { $.messager.alert('温馨提示', data.msg); }
                },
                function completeCallback() {

                }, function errorCallback() {

                });
        }

        //上传附件文件信息删除
        function DeleteFile(filename) {
            var postFileName = encodeURI(filename);
            $.ajax
                ({
                    type: "POST",
                    url: "../AjaxUploadFile.aspx?Cmd=del&FileType=room&FileURL=" + postFileName,
                    data: "",
                    success: function (data, status) {
                        //alert(data);
                        var stringArray = data.split("|");
                        var FileName = stringArray[1];
                        var FileError = stringArray[2];
                        if (stringArray[0] == "1") {
                            //stringArray[0]    成功状态(1为成功，0为失败)
                            //stringArray[1]    文件名
                            //stringArray[2]    消息提示
                            //stringArray[3]    文件路径
                            //HDialog.Info('删除成功');
                        }
                        else {
                            //HDialog.Info(FileError);
                        }

                    },
                    error: function (data, status, e) {
                        //alert("上传失败:" + e.toString());
                    }
                });
            return false; //.NET按钮控件取消提交
        }
        function DelFile(idList, type) {
            if ($('#ActualResultAuditState').val() == "已审核") {
                return;
            }
            $.messager.confirm('温馨提示', '确定删除?', function (r) {
                if (r) {
                    $.dataPostJson('Emergency_File', 'Del', { "idList": idList }, true, false,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                RefreshDataGrid(type);
                            } else { $.messager.alert("温馨提示", data.msg); }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            });
        }

        function RefreshDataGrid(type) {
            loadType = "FileLoad";
            if (type == "演练方案") {
                $("#dgScheme").datagrid("reload"); $("#dgScheme").datagrid("clearSelections");
            }
            else if (type == "签到记录") {
                $("#dgRecord").datagrid("reload"); $("#dgRecord").datagrid("clearSelections")
            }
            else if (type == "演练照片") {
                $("#dgPhoto").datagrid("reload"); $("#dgPhoto").datagrid("clearSelections")
            }
            else if (type == "演练总结") {
                $("#dgSummary").datagrid("reload"); $("#dgSummary").datagrid("clearSelections")
            }
        }

        //$.fn.datetimebox.defaults.formatter = function (date) {
        //    //显示格式: 2017-05-08 17(只显示年月日和小时)
        //    var year = date.getFullYear();
        //    var month = date.getMonth() + 1;
        //    var day = date.getDate();
        //    var hour = date.getHours();
        //    month = month < 10 ? '0' + month : month;
        //    day = day < 10 ? '0' + day : day;
        //    hour = hour < 10 ? '0' + hour : hour;
        //    return year + "-" + month + "-" + day + " " + hour;
        //}

    </script>
</body>
</html>
