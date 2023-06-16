<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GeneralStandardSettingImport.aspx.cs" Inherits="M_Main.ComprehensivePatrols.GeneralStandardSettingImport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>核查标准批量导入</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script language="javascript" src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <link href="../css/editcss.css" type="text/css" rel="stylesheet">
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
</head>
<body style="margin: 0px; margin-top: 0px; padding: 0px; overflow-y: hidden;" scroll="no">
    <form id="frmForm" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <input type="hidden" id="FilePath" name="FilePath" />
        <input type="hidden" id="TableName" name="TableName" value="Sheet1$" />
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="file" id="UpFile" name="UpFile" style="left: -9999px; position: absolute;" />
        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();
            var column = [[
                    { field: '序号', title: '序号', width: 50, align: 'left', sortable: true },
                    { field: '任务类型', title: '任务类型', width: 60, align: 'left', sortable: true },
                    { field: '适用项目类型', title: '适用项目类型', width: 60, align: 'left', sortable: true },
                    { field: '所属专业', title: '所属专业', width: 60, align: 'left', sortable: true },
                    { field: '所属类别', title: '所属类别', width: 60, align: 'left', sortable: true },
                    { field: '最高风险等级', title: '最高风险等级', width: 60, align: 'left', sortable: true },
                    { field: '通用点位', title: '通用点位', width: 60, align: 'left', sortable: true },
                    { field: '通用对象', title: '通用对象', width: 60, align: 'left', sortable: true },
                    { field: '标准代码', title: '标准代码', width: 60, align: 'left', sortable: true },
                    { field: '所占分值', title: '所占分值', width: 60, align: 'left', sortable: true },
                    { field: '标准内容', title: '标准内容', width: 60, align: 'left', sortable: true },
                    { field: '巡查方法', title: '巡查方法', width: 60, align: 'left', sortable: true },
                    { field: '支撑文件', title: '支撑文件', width: 80, align: 'left', sortable: true },
                    { field: '是否启用', title: '是否启用', width: 40, align: 'left', sortable: true },
                    { field: '备注', title: '备注', width: 60, align: 'left', sortable: true }
            ]];

            var toolbar = [
                 {
                     text: '导出模板',
                     iconCls: 'icon-page_white_excel',
                     handler: function () {
                         window.open("StandardOutPutTemplate.aspx");
                     }
                 }, '-',
                {
                    text: '上传模板',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        $("#UpFile").click();
                    }
                }, '-',
                {
                    text: '确定导入',
                    iconCls: 'icon-ok',
                    handler: function () {
                        StartImport();
                    }
                }
            ];
            function StartImport() {
                $.tool.DataPost('CpComPatrols', 'ImportGeneralStandardSettingt', $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                HDialog.Close("1");
                            }
                            else {
                                HDialog.Info(_Data);
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CpComPatrols&Command=BindImportStandardTemplate&' + $("#frmForm").serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    rownumbers: true,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc"
                });
            }
            LoadList();
            function UpLoadFile() {
                var fd = new FormData();
                fd.append("UpFile", $("#UpFile").get(0).files[0]);
                fd.append("IsCompleteAddr", "true");
                $.tool.pageLoading("正在上传模板文件");
                $.ajax({
                    url: "../AjaxUpload.aspx",
                    type: "POST",
                    processData: false,
                    contentType: false,
                    data: fd,
                    success: function (addr) {
                        if (addr != "") {
                            $("#FilePath").val(addr);
                            //绑定上传的列表
                            LoadList();
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.messager.alert('提示', "上传模板失败", "error");
                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.tool.pageUnLoading();
                    }
                });

                var jqObj = $("#UpFile");
                jqObj.val("");
                var domObj = jqObj[0];
                domObj.outerHTML = domObj.outerHTML;
                var newJqObj = jqObj.clone();
                jqObj.before(newJqObj);
                jqObj.remove();
                $("#UpFile").unbind().change(function (e) {
                    UpLoadFile();
                });
            }
            $("#UpFile").change(function (e) {
                UpLoadFile();
            });
        </script>
    </form>
</body>
</html>

