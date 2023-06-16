<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskFilesList.aspx.cs" Inherits="M_Main.Supervision.TaskFilesList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>督查附件</title>
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
        .datagrid-mask-msg {
            height:40px;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmFrom" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <input type="file" id="UpFile" name="UpFile" runat="server" style="display: none;" />
        <input type="button" id="UploadButton" name="UploadButton" style="display: none;" runat="server" onserverclick="UploadButton_ServerClick" />
        <input type="hidden" name="KeyId" value="" id="KeyId" runat="server" />
        <input type="hidden" name="changBS" value="" id="changBS" runat="server" />
        <input type="hidden" name="FileType" value="" id="FileType" runat="server" />
        <input type="hidden" name="CommId" id="CommId" runat="server" />
        <input type="hidden" name="Type" id="Type" runat="server" />
        <input type="hidden" name="NeedEdit" id="NeedEdit" />
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            var column = [[
                { field: 'FileName', title: '附件名称', width: 80, align: 'left', sortable: true },
                {
                    field: 'FilePath', title: '查看附件', width: 20, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue\" href=\"" + row.FilePath + "\" target=\"_blank\" download=\"" + row.FileName + "\">查看附件</a>";
                        return str;
                    }
                },
                { field: 'AddDate', title: '添加时间', width: 40, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '上传',
                    iconCls: 'icon-add',
                    handler: function () {
                        $('#UpFile').click();
                    }
                }, '-', {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row != null) {
                            DelRecord(row.FileId);
                        }
                        else {
                            HDialog.Info("请选择一行数据进行删除!");
                        }
                    }
                }];

            function DelRecord(FileId) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('CSSupervision', 'DelFiles', 'FileId=' + FileId + '&CommId=' + $("#CommId").val(),
                            function Init() {
                            },
                            function callback(_Data) {
                                HDialog.Info("删除成功");
                                LoadList();
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function LoadList() {
                var tool = null;
                if ($('#NeedEdit').val() == "1") {
                    tool = toolbar;
                }
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=FilesList&' + $('#frmFrom').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    rownumbers: true,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    border: false,
                    toolbar: tool,
                    sortOrder: "asc"
                });
            }

            $("#UpFile").change(function (e) {
                $.tool.pageLoading();
                $('#UploadButton').click();
            });

            $(function () {
                $("#NeedEdit").val(GetQueryString('NeedEdit'));
                $("#KeyId").val(GetQueryString('KeyId'));
                $("#CommId").val(GetQueryString('CommId'));
                $("#Type").val(decodeURI(GetQueryString('Type')));
                InitTableHeight();
                LoadList();
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
