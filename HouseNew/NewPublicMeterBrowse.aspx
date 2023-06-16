<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewPublicMeterBrowse.aspx.cs" Inherits="M_Main.HouseNew.NewPublicMeterBrowse" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">

        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 400px; height: 150px;">

            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">表计类型
                    </td>
                    <td class="TdContentSearch">
                        <select id="MeterType" runat="server" style="width: 50%" name="MeterType"></select></td>

                </tr>
                <tr>
                    <td class="TdTitle">表计名称</td>
                    <td class="TdContentSearch">
                        <input id="MeterName" type="text"
                            size="17" name="MeterName" runat="server" /></td>
                </tr>

                <tr>
                    <td align="center" colspan="2">
                        <input class="button" id="btnSave"
                            type="button" value="查询" name="btnSave" runat="server" />
                    </td>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#SelectRoomID').css("width", 150 + 'px');
            }
            InitFunction();



            var column = [[
                { field: 'MeterID', title: 'MeterID', width: 50, align: 'left', sortable: true, hidden: true },
                { field: 'MeterSNum', title: '表计序号', width: 100, align: 'left', sortable: true },
                { field: 'Location', title: '安装位置', width: 100, align: 'left', sortable: true },
                {
                    field: 'MeterName', title: '表计名称', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改表计','edit'," + row.MeterID + ");\">" + row.MeterName + "</a>";
                        return str;
                    }
                },
                { field: 'MeterTypeName', title: '表计类型', width: 100, align: 'left', sortable: true },
                { field: 'PoolTypeName', title: '分摊方式', width: 100, align: 'left', sortable: true },
                { field: 'StanName', title: '标准名称', width: 100, align: 'left', sortable: true },
                { field: 'StanAmount', title: '单价', width: 100, align: 'left', sortable: true }


            ]];


            var toolbar = [

                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {

                        ViewDetail('新增公区表计', "Insert", 0);
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {

                        var row = $("#TableContainer").datagrid("getSelected");

                        DelRecord(row.MeterID);
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }
            ];


            function ViewDetail(title, ReceID, type) {

                var w = $(window).width();
                var h = $(window).height();


            }

            function LoadList() {

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Meter", "PublicMeter", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });

            }
            LoadList();

            function DelRecord(Id) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('Meter', 'PublicMeterDelete', 'MeterID=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {

                                if (_Data != "true") {

                                    HDialog.Info('删除失败!');
                                }
                                else {
                                    HDialog.Info('删除成功!');
                                }
                                LoadList();

                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }
            $('#btnSave').click(function () {
                LoadList();
            });


            function ViewDetail(title, OpType, MeterID) {


                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, '../HouseNew/PublicMeterManage.aspx?OpType=' + OpType + '&MeterID=' + MeterID, title, false, function callback(_Data) {
                    LoadList();
                });
            }

        </script>
    </form>
</body>
</html>


