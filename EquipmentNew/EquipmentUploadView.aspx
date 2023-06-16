<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EquipmentUploadView.aspx.cs" Inherits="M_Main.EquipmentNew.EquipmentUploadView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>设备附件</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmFrom" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <input type="file" id="UpFile" name="UpFile" runat="server"  style="display: none;" />
        <input type="button" id="UploadButton" name="UploadButton" style="display: none;" runat="server" onserverclick="UploadButton_ServerClick" />
        <input type="hidden" name="KeyId" value="" id="KeyId" runat="server" />
        <input type="hidden" name="changBS" value="" id="changBS" runat="server" />
        <input type="hidden" name="FileType" value="" id="FileType" runat="server" />
        
        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var column = [[
                { field: 'FileName', title: '附件名称', width: 80, align: 'left', sortable: true },
                {
                    field: 'FilePath', title: '查看附件', width: 20, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue\" href=\"" + row.FilePath + "\" target=\"_blank\" download=\"" + row.FileName + "\">查看附件</a>";
                        return str;
                    }
                },
                { field: 'AddTime', title: '添加时间', width: 40, align: 'left', sortable: true }
            ]];

            var toolbar = [
                 {
                     text: '上传',
                     iconCls: 'icon-add',
                     handler: function () {
                         $('#UpFile').click();
                         //var SelectComm = $('#treeDemo').tree("getSelected");
                         //if (SelectComm == null) {
                         //    HDialog.Info("请选择管理项目");
                         //    return;
                         //}
                         //EditEquipmentFiles("insert", "", SelectComm.attributes.CommID, '新增设备档案');
                     }
                 }, '-', {
                     text: '删除',
                     iconCls: 'icon-cancel',
                     handler: function () {
                         var row = $("#TableContainer").datagrid("getSelected");
                         if (row != null) {
                             DelRecord(row.Id);
                         }
                         else {
                             HDialog.Info("请选择一行数据进行删除!");
                         }
                     }
                 }];

            function DelRecord(Id) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('CsEquipment', 'DelEquipmentFile', 'Id=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "true") {
                                    HDialog.Info("删除成功");
                                    LoadList();
                                } else {
                                    HDialog.Info(_Data);
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function LoadList() {
                if ($('#changBS').val() == "view") {
                    toolbar = [];
                }
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetEquipmentFileList&' + $('#frmFrom').serialize(),
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
                    toolbar: toolbar,
                    sortOrder: "asc"
                });
            }
            LoadList();

            $("#UpFile").change(function (e) {
                $('#UploadButton').click();
            });
        </script>
    </form>
</body>
</html>
