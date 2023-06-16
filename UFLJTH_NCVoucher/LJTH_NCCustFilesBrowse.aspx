<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LJTH_NCCustFilesBrowse.aspx.cs" Inherits="M_Main.UFLJTH_NCVoucher.LJTH_NCCustFilesBrowse" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 500px; height: 200px; padding: 10px;">

            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
               
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContent" colspan="3">
                        <input id="CustFilesName" name="CustFilesName" maxlength="50" style="width: 90%; "  />                       
                    </td>
                 </tr>
                  <tr>
                       <td  colspan="4" align="center">
                     <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                     </td>
                </tr>
            </table>
        </div>

        <script type="text/javascript">
            var column = [[
                        { field: 'IID', title: 'IID', width: 50, align: 'left', sortable: true, hidden: true },                        
                        {
                            field: 'CustFilesID', title: '客户ID', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                                 var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改设置','update'," + row.IID + ");\">" + row.CustFilesID + "</a>";
                                 return str;
                             }
                         },
                       { field: 'CustFilesCode', title: '客户编码', width: 100, align: 'left', sortable: true },
                       { field: 'CustFilesName', title: '客户名称', width: 100, align: 'left', sortable: true }
            ]];


            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var toolbar = [
                 {
                     text: '新增',
                     iconCls: 'icon-add',
                     handler: function () {
                         ViewDetail("客户设置", 'add', 0);
                     }
                 }, '-',
                    {
                        text: '删除',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            var row = $("#TableContainer").datagrid("getSelected");
                            if (row != undefined && row != null) {
                                DelRecord(row.IID);
                            }
                        }
                    }, '-',

                    {
                        text: '筛选',
                        iconCls: 'icon-filter',
                        handler: function () {
                            $('#SearchDlg').parent().appendTo($("form:first"))
                            $('#SearchDlg').dialog('open');                            
                        }
                    },'-',
                    {
                        text: 'Excel导入',
                        iconCls: 'icon-page_white_excel',
                        handler: function () {
                            HDialog.Open(770, 400, '../UFLJTH_NCVoucher/LJTH_NCCustFilesExcelInput.aspx', '批量导入信息', false, function callback(_Data) {
                                if (_Data == "true") {
                                    LoadList();
                                }
                            });                             
                        }
                    }
            ];

            LoadList();

            function DelRecord(Id) {
                HDialog.Prompt('是否删除该项', function () {
                    $.tool.DataGet('LJTH_NCCustFiles', 'delete', 'IID=' + Id,
                                function Init() {
                                },
                                function callback(_Data) {

                                    var varObjects = _Data.split("|");

                                    if (varObjects[0] == "true") {
                                        HDialog.Info(varObjects[1]);
                                    }
                                    else { HDialog.Info('删除失败,' + varObjects[1]); }
                                    LoadList();


                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                    
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=LJTH_NCCustFiles&Command=List&' + $("#frmForm").serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    border: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    remoteSort: false,
                    onLoadSuccess: function (data) {

                    }
                });
                $("#SearchDlg").dialog("close");
            }

            function ViewDetail(title, OpType, ID) {

                HDialog.Open('800', '300', '../UFLJTH_NCVoucher/LJTH_NCCustFilesManage.aspx?IID=' + ID + '&OpType=' + OpType, title, true, function callback(_Data) {
                    //if (_Data == "true") {
                        LoadList();
                    //}
                   
                });
            }
        </script>
    </form>
</body>
</html>
