<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaleRoomHisBrowse.aspx.cs" Inherits="M_Main.HouseNew.SaleRoomHisBrowse" %>



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
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm">
        <input id="AllData" size="1" type="hidden" name="AllData" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 500px; height: 150px;">
            <table style="width: 100%;" class="DialogTable">


                <tr>
                    <td class="TdTitle">业主名称</td>
                    <td class="TdContent">
                        <input id="CustName" name="CustName" runat="server"></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>

                <tr>
                    <td colspan="4" style="text-align: center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>

                </tr>

            </table>
        </div>


        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">



            var column = [[


                {
                    field: 'CustName', title: '业主名称', width: 160, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('业主详细信息'," + row.CustID + ",'');\">" + row.CustName + "</a>";
                        return str;
                    }
                },
                { field: 'RoomSign', title: '房屋编号', width: 160, align: 'left', sortable: true },

                { field: 'FixedTel', title: '固定电话', width: 100, align: 'left', sortable: true },
                { field: 'MobilePhone', title: '移动电话', width: 100, align: 'left', sortable: true },
                {
                    field: 'ChargeTime', title: '变更时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ChargeTime, "yyyy-MM-dd");
                        return str;
                    }
                }





            ]];

            //详情
            function ViewDetail(title, strCustID) {
                HDialog.Open(w, h, '../HouseNew/SaleRoomHisManage.aspx?OPType=Edit&CustID=' + strCustID, title, false,
                    function callback(_Data) {

                    });
            }

            var w = $(window).width();
            var h = $(window).height();


            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");


            }
            InitTableHeight();

            var toolbar = [

                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }, '-',
                {
                    text: '费用转移',
                    iconCls: 'icon-transfer',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row != null)
                        {
                            if (row.LiveID != 0)
                            {
                                if (row.OldCustID != 0)
                                {
                                    var w = $(window).width();
                                    var h = $(window).height();
                                    HDialog.Open(w, h, '../HouseNew/SaleRoomTransFeeNew.aspx?LiveID=' + row.LiveID, '费用转移', false, function (_Data) {

                                    });
                                } else
                                {
                                    //HDialog.Info('请选择要转移费用的转让信息');
                                }
                            }
                            else {
                                HDialog.Info('请选择要转移费用的转让信息');
                            }
                        } else {
                            HDialog.Info('请选择要转移费用的转让信息');

                        }

                    }
                }
            ];


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
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("RoomRental", "SaleRoomHisList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
                $('#SearchDlg').dialog('close');
            }



            LoadList();





        </script>
    </form>
</body>
</html>
