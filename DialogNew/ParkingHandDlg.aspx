<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParkingHandDlg.aspx.cs" Inherits="M_Main.DialogNew.ParkingHandDlg" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
        }

        .Container {
            width: 100%;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .ContainerLeft {
            float: left;
            overflow-y: auto;
            border-right: 1px solid #cccccc;
        }

        .ContainerRight {
            float: left;
            width: 100%;
            overflow: auto;
        }
    </style>
</head>
<body>
    <form id="FrmForm">
        <input id="LiveType" name="LiveType" type="hidden" runat="server" />
        <input id="IsHis" name="IsHis" type="hidden" runat="server" />
        <div style="width: 100%;" id="TableContainer"></div>
        <div>
            <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
                style="width: 450px; height: 160px;">
                <table style="width: 100%; font-size: 12px; font-family: 微软雅黑; line-height: 25px;">
                    <tr>
                        <td class="TdTitle">车位区域</td>
                        <td class="TdContent">
                            <select id="CarparkName" name="CarparkName" style="width: 120px;" runat="server">
                            </select>
                        </td>
                        <td class="TdTitle">车位号</td>
                        <td class="TdContent">
                            <input type="text" id="ParkName" name="ParkName" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">停车卡号</td>
                        <td class="TdContent">
                            <input type="text" id="ParkingCarSign" name="ParkingCarSign" style="width: 120px;" runat="server" />
                        </td>
                        <td class="TdTitle">车牌号</td>
                        <td class="TdContent">
                            <input type="text" id="CarSign" name="CarSign" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="4">
                            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="Cancel();">清&nbsp;空</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="CommID" name="CommID" />

        <input type="hidden" id="UnitSNum" name="UnitSNum" />
        <input type="hidden" id="FloorSNum" name="FloorSNum" />

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                LoadList();
            });

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var column = [[
                    { field: 'CarparkName', title: '车位区域', width: 120, align: 'left', sortable: true },
                    { field: 'ParkName', title: '车位编号', width: 120, align: 'left', sortable: true },
                    { field: 'ParkingCarSign', title: '停车卡号', width: 120, align: 'left', sortable: true },
                    { field: 'CarSign', title: '车牌号', width: 120, align: 'left', sortable: true },
                    { field: 'CustName', title: '客户名称', width: 120, align: 'left', sortable: true },
                    { field: 'RoomSign', title: '房屋编号', width: 120, align: 'left', sortable: true }
            ]];

            var toolbar = [
                 {
                     text: '筛选',
                     iconCls: 'icon-search',
                     handler: function () {
                         $('#SearchDlg').parent().appendTo($("form:first"))
                         $('#SearchDlg').dialog('open');
                     }
                 }
            ];


            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Parking&Command=searchparkinghandhis&' + $('#FrmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
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
                    onDblClickRow: function (rowIndex, rowData) {
                        HDialog.ReturnIsJson = true;

                        HDialog.Close(rowData);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
                $("#SearchDlg").dialog("close");
                $("#CarparkName").val("");
                $("#ParkName").val("");
                $("#ParkingCarSign").val("");
                $("#CarSign").val("");
            }
            function Cancel() {
                $("#SearchDlg").dialog("close");
                $("#CarparkName").val("");
                $("#ParkName").val("");
                $("#ParkingCarSign").val("");
                $("#CarSign").val("");
            }

        </script>
    </form>
</body>
</html>
