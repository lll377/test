<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttachedFile.aspx.cs" Inherits="M_Main.RenovationNew.AttachedFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>装修登记附件</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <link href="../css/basebootstrap.css" rel="stylesheet" />

    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <style type="text/css">
        .toolbartable {
            margin: 0;
            padding: 0;
        }

            .toolbartable tr {
            }

                .toolbartable tr td {
                    padding: 5px 3px;
                }
    </style>
</head>
<body>
    <input type="hidden" name="RID" id="RID" />
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="toolbar" class="easyui-panel" data-options="closed:true">
        <form id="mainForm" method="post" enctype="multipart/form-data">
            <input type="hidden" name="FileUrl" id="FileUrl" />
            <input type="hidden" name="FileCode" id="FileCode" />
            <input type="hidden" name="FileType" id="FileType" />

            <table class="toolbartable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td><span>选择附件:</span></td>
                    <td>
                        <input id="uploadFile" name="uploadFile" class="easyui-filebox" data-options="required:true,width:'250px',buttonText:'选择文件',prompt:'请选择一个文件...'" />
                        <a id="tip" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'"></a>
                    </td>
                    <td><span>附件名称:</span></td>
                    <td>
                        <input id="FileName" name="FileName" class="easyui-textbox" data-options="required:true,width:'250px',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="Save();">保存</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onclick="Del();">删除</a>
                    </td>
                    <%-- <td>
                        <div class="datagrid-btn-separator"></div>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="InitDataGrid();">查询</a>
                    </td>--%>
                </tr>
            </table>
        </form>
    </div>
    <script language="javascript" type="text/javascript">
        function InitControl() {
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
        function InitTableHeight() {
            var h = $(window).height();
            $("#dg").css("height", h + "px");
        }

        function InitPage() {
            $("#RID").val($.getUrlParam("RID"));
        }


        $(function () {
            InitPage();
            InitControl();
            InitTableHeight();
            InitDataGrid();
        });



        var column = [[
            {
                field: 'FileCode', title: '附件编号', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var arr = value.split('.');
                    return arr[0];
                }
            },
            {
                field: 'FileName', title: '附件名称', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                    value = GetAHtml(row.FileUrl, value);
                    return value;
                }
            },
            {
                field: 'FileType', title: '附件类型', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            },
            {
                field: 'AddDate', title: '添加日期', width: 80, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd");
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
        function InitDataGrid() {
            var toolbar = "#toolbar";
            var OpType = $.getUrlParam("OpType");
            if (OpType == "Detailed") {
                toolbar = [];
            }

            $("#uploadFile").textbox('disableValidation');
            $("#FileName").textbox('disableValidation');
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "ID",
                columns: column,
                rownumbers: true,
                fitColumns: true,
                checkbox: true,
                singleSelect: false,
                checkOnSelect: true,
                selectOnCheck: false,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onSelect: function (index, row) {

                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("Renovation", "GetListAttachedFile", "dg", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {

                }
            });
            $('#dg').datagrid('clearSelections');
            $('#dg').datagrid('clearChecked');
        }


        function Del() {
            $.messager.confirm('温馨提示', '确定删除?', function (r) {
                if (r) {
                    var row = $("#dg").datagrid("getSelected");
                    if (row) {
                        $.tool.DataPostJson('Renovation', 'DelAttachedFile', "idList=" + row.ID,
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

                    } else {
                        $.messager.alert("温馨提示", '请选择需要删除的数据!');
                    }

                    //var rows = $("#dg").datagrid("getChecked");
                    //if (rows.length > 0) {
                    //    var idList = "";
                    //    for (var i = 0; i < rows.length; i++) {
                    //        idList += rows[i].ID + ',';
                    //    }
                    //    idList = idList.substr(0, idList.length - 1);

                    //} else {
                    //    $.messager.alert("温馨提示", '请选择需要删除的数据!');
                    //}


                }
            });
        }



        //上传
        function Save() {
            $("#uploadFile").textbox('enableValidation');
            $("#FileName").textbox('enableValidation');
            $("#mainForm").form('validate');
            var file = $("input[name='uploadFile']")[0].files[0];
            var maxsize = 2 * 1024 * 1024;
            var tipFileSize = 2;
            var imgType = file.type;
            //console.log(fileupload.files[0]);
            //if (controlID == "FileURL") {
            //    maxsize = 1024 * 1024;
            //    tipFileSize = 1;
            //if (imgType != "image/bmp" && imgType != "image/jpeg" && imgType != "image/png" && imgType != "image/gif") {
            //    HDialog.Info("图片格式不正确!");
            //    return false;
            //}
            //}
           // if (file.size > parseInt(maxsize)) {
           //     HDialog.Info("不能上传超过" + tipFileSize + "M的附件！");
           //     return false;
           // }

            $.messager.progress({ title: "温馨提示", msg: "正在上传..." });
            var options = {
                type: "POST",
                url: "../AjaxUploadFile.aspx?Cmd=ins&FileType=room&FileURL=",
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
                        $("#uploadForm").form('clear');
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
            $('#mainForm').ajaxSubmit(options);

            return false; //.NET按钮控件取消提交
        }

        //上传文件相关绑定
        function UploadCallBack(url, Name) {
            $("#FileCode").val(Name);
            $("#FileUrl").val(url);
            $.tool.DataPostJson('Renovation', 'SaveAttachedFile', $.JQForm.GetStrParam(),
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        $('#mainForm').form('clear');
                        InitDataGrid();
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

    </script>
</body>
</html>
