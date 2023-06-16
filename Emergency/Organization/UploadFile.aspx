<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadFile.aspx.cs" Inherits="M_Main.Emergency.Organization.UploadFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管理组织登记上传附件</title>
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
<body style="margin:0px; padding:0px;overflow:hidden;">
    <div style="margin: 10px; display: block;">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">文件上传</legend>
            <input type="hidden" id="KeyID" name="KeyID" />
            <input type="hidden" id="type" name="type" value="管理组织文档" />
            <form id="fileForm">
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
            <legend class="frame-legend">文档详情</legend>
            <div id="mianScheme">
                <table id="TableFile" border="0" cellspacing="0" cellpadding="0"></table>
            </div>
        </fieldset>
    </div>

    <script type="text/javascript">
        function InitControl() {
            var w = $(window).width();
            $("#mianScheme").width(w - 60);
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


        function InitPage() {
            var KeyID = $.getUrlParam("KeyID");
            $("#KeyID").val(KeyID);
            InitDataGrid();
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
                var arr = url.split('/');
                var name = arr[arr.length - 1];
                arr = name.split('.');
                var IdNew = arr[arr.length - 2];
                html = "<a target=\"_blank\" id=\"11831617369\" href=\"" + url + "\" class=\"HrefStyle\" url=\"" + url + "\">" + fileName + "</a>";
            }
            return html;
        }
        function InitDataGrid() {
            $("#TableFile").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                height: 300,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                rownumbers: true,
                fitColumns: true,
                checkbox: true,
                singleSelect: true,
                border: true,
                pagination: true,
                width: "100%",
                sortOrder: "desc",
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.Type_Name = $('#type').val();
                    param = $.getDataGridParam("Emergency_File", "GetList", param);
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {

                }
            });
        }

        //上传附件
        function SaveFile() {
            $("#uploadFile").textbox('enableValidation');
            $("#FileName").textbox('enableValidation');
            if (!$("#fileForm").form('validate')) { return; };
            var file = $("input[name='uploadFile']")[0].files[0];
            $.messager.progress({ title: "温馨提示", msg: "正在上传..." });
            var options = {
                type: "POST",
                url: "../../AjaxUploadFile.aspx?Cmd=ins&FileType=Emergency&FileURL=",
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
                        InitDataGrid();
                    } else { $.messager.alert('温馨提示', data.msg); }
                },
                function completeCallback() {

                }, function errorCallback() {

                });
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
                                InitDataGrid();
                            } else { $.messager.alert("温馨提示", data.msg); }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            });
        }


        $.fn.datetimebox.defaults.formatter = function (date) {
            //显示格式: 2017-05-08 17(只显示年月日和小时)
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var day = date.getDate();
            var hour = date.getHours();
            month = month < 10 ? '0' + month : month;
            day = day < 10 ? '0' + day : day;
            hour = hour < 10 ? '0' + hour : hour;
            return year + "-" + month + "-" + day + " " + hour;
        }
        //页面初始化
        $(function () {
            InitControl();
            InitPage();
        });

    </script>
</body>
</html>
