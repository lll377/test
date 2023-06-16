<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelProjectTemplate.aspx.cs" Inherits="M_Main.DutyManage.SelProjectTemplate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>设备空间列表</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/demo/demo.css" />
    <script type="text/javascript" language="javascript" src="../jscript/JSClient.js"></script>
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/QualityDictionaryCanNull.js"></script>
     <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
        <script src="../jscript/Dialog.js" type="text/javascript"></script>
</head>
<body style="margin: 0px; margin: 0px; overflow: hidden;">
    <form id="frmFrom" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <input type="hidden" name="CommId" id="CommId" value="" runat="server" />
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $("#CommId").val(GetQueryString('CommId'));
            }
            InitTableHeight();

            var column = [[
                { field: 'CommName', title: '项目名称', width: 60, align: 'left', sortable: true },
                { field: 'RoleName', title: '岗位名称', width: 60, align: 'left', sortable: true },
                { field: 'DutyPoint', title: '值班点位', width: 60, align: 'left', sortable: true },
                { field: 'IsNormalHandoverPhotograph', title: '正常交班是否拍照', width: 60, align: 'left', sortable: true, hidden: true },
                { field: 'IsAbnormalHandoverPhotograph', title: '异常交班是否拍照', width: 60, align: 'left', sortable: true, hidden: true }
            ]];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Duty&Command=SelProjectTemplate&' + $('#frmFrom').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    border: false,
                    toolbar: null,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                    },
                    onDblClickRow: function (rowIndex, rowData) {
                        console.log(rowData);
                       checkProjectIsOk(rowData)
                     
                    }
                });
            }
            LoadList();

            function checkProjectIsOk(rowData) {
                $.tool.DataPostJson('Duty', 'checkProjectIsOk', 'ID=' + rowData.ID + '&page=1&rows=1',
                    function Init() { },
                    function callback(data) {
                        console.log(data);
                        if (data.result == false) {
                            HDialog.Info(data.msg);
                            return false;
                        } else {
                            HDialog.ReturnIsJson = true;
                            HDialog.Close(rowData);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
