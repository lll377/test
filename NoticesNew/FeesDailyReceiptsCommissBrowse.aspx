<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesDailyReceiptsCommissBrowse.aspx.cs" Inherits="M_Main.NoticesNew.FeesDailyReceiptsCommissBrowse" %>


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

</head>
<body>
    <form id="frmForm" runat="server">
        <input style="width: 8px" id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server" />
        <input style="width: 8px" id="hiLoginUserCode" size="1" type="hidden" name="hiLoginUserCode" runat="server" />
        <input style="width: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <input style="width: 8px" id="hiLoadFeesPaid" size="1" type="hidden" name="hiLoadFeesPaid" runat="server" />
        <input style="width: 8px" id="hiLoadFeesPaidPrec" size="1" type="hidden" name="hiLoadFeesPaidPrec" runat="server" />
        <input style="width: 8px" id="hiLoadFeesPaidLt" size="1" type="hidden" name="hiLoadFeesPaidLt" runat="server" />
        <input style="width: 8px" id="ApplicationPath" size="1" type="hidden" name="ApplicationPath" runat="server" />
        <input style="width: 8px" id="hiDailyID" size="1" type="hidden" name="hiDailyID" runat="server" />
        <input style="width: 8px" id="hiStatist" size="1" type="hidden" name="hiStatist" runat="server" />
        <input style="width: 32px" id="PageIndex" size="1" type="hidden" name="PageIndex"
            runat="server" /><input style="height: 21px; width: 24px" id="PrintParms" size="1" type="hidden" name="PrintParms"
                runat="server" /><input style="width: 24px" id="CostGeneType" size="1" type="hidden" name="CostGeneType"
                    runat="server" /><input style="height: 21px; width: 24px" id="OptCode" size="1" type="hidden" name="OptCode"
                        runat="server" /><input style="height: 21px; width: 24px" id="Flag" size="1" type="hidden" name="Flag" runat="server">

        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 150px;">
            <table class="DialogTable">
                <tr>
                    <td class="DialogTdTitle">开始时间从
                    </td>
                    <td class="DialogTdContent" colspan="3">
                        <input type="text" class="easyui-datetimebox" id="EditBeginDate" runat="server" name="EditBeginDate" />&nbsp;到&nbsp;<input type="text" runat="server" class="easyui-datetimebox" id="EditEndDate" name="EditEndDate" />
                    </td>

                </tr>
                <tr>
                    <td class="DialogTdTitle">收款人</td>
                    <td class="DialogTdContent">
                        <select id="UserCode" name="UserCode" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="DialogTdTitle">统计范围</td>
                    <td class="DialogTdContent">
                        <select id="RangeType" name="RangeType" runat="server">
                            <option value="" selected>全部</option>
                            <option value="1">收款</option>
                            <option value="2">退款</option>
                        </select></td>
                </tr>
                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:ExcuteOnServer(); ">查询</a>
                    </td>
                </tr>
            </table>
        </div>

        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var column2 = [[
                { field: 'BillTypeName', fixed: true, title: '票据类别', resizable: true, align: 'left', sortable: true, width: 150 },
                { field: 'UserCaseName', fixed: true, title: '使用方式', resizable: true, align: 'left', sortable: true, width: 150 },
                { field: 'BillNum', fixed: true, title: '数量', resizable: true, align: 'left', sortable: true, width: 150 },
                {
                    field: 'BillAmount', fixed: true, title: '金额', resizable: true, align: 'left', sortable: true, width: 150, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                    }
                },
                { field: 'BillsSigns', fixed: true, title: '摘要', resizable: true, align: 'left', sortable: true, width: 650 }
            ]];

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, '-', {
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成报表');
                        }
                        else {
                            window.location.href = "../Notices/FeesDailyCommissCreRece.aspx";
                        }

                    }
                }
            ];

            function Win_OnLoad() {
                var strPrintParms = getObject("PrintParms").value;
                if (strPrintParms != "") {
                    showOperatWin(strPrintParms);

                    getObject("PrintParms").value = "";
                }
            }

            function LoadListReceipts(page, rows) {


                $.tool.DataPost('FeesNotices', 'DailyCommiss3', "page=" + page + "&rows=" + rows + "&" + $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Data = eval("(" + _Data + ")"); //转换为json对象
                        if (Data.rows.length > 0) {

                            obj = Data.rows[0];

                            var sBz = "时间从" + obj.StartDate + "---" + obj.EndDate;


                            toolbar = [
                                {
                                    text: '筛选',
                                    iconCls: 'icon-search',
                                    handler: function () {
                                        $('#SearchDlg').parent().appendTo($("form:first"))
                                        $('#SearchDlg').dialog('open');

                                    }
                                }, '-', {
                                    text: '导出Excel',
                                    iconCls: 'icon-page_white_excel',
                                    handler: function () {
                                        var rowData = $('#TableContainer').datagrid('getData');
                                        if (rowData == '') {
                                            HDialog.Info('请先生成报表');
                                        }
                                        else {
                                            window.location.href = "../Notices/FeesDailyCommissCreRece.aspx";
                                        }

                                    }
                                }, '-', {
                                    text: "<span style='color:red'>" + sBz + "</span>"
                                }
                            ];
                        }

                        $("#TableContainer").datagrid({
                            data: Data,
                            method: "post",
                            loadMsg: '',
                            pageSize: rows,
                            pageList: top.ListPageList,
                            columns: column2,
                            fitColumns: true,
                            singleSelect: true,
                            pagination: true,
                            nowrap: false,
                            width: "100%",
                            toolbar: toolbar,
                            rownumbers: true,
                            sortOrder: "asc",
                            rowStyler: function (index, row) {
                                if (row.StatType == 1) {

                                    return 'color:red;';
                                }
                            }
                            , onLoadSuccess: function () {
                                var pg = $("#TableContainer").datagrid("getPager");
                                if (pg) {
                                    $(pg).pagination({
                                        onBeforeRefresh: function () {

                                        },
                                        onRefresh: function (pageNumber, pageSize) {

                                        },
                                        onChangePageSize: function () {
                                        },
                                        onSelectPage: function (Pn, Ps) {

                                            LoadListReceipts(Pn, Ps);
                                            $('#TableContainer').datagrid('options').pageNumber = Pn;
                                            $('#TableContainer').datagrid('options').pageSize = Ps;


                                        }
                                    });
                                }

                            },
                        });

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });


            }


            document.getElementById('hiIsSQLData').value = -1;
            LoadListReceipts(1, top.ListPageSize);

            function ExcuteOnServer() {

                document.getElementById('hiIsSQLData').value = "1";
                LoadListReceipts(1, top.ListPageSize);
                $('#SearchDlg').dialog('close');
            }

            function formatNumberRgx(num) {
                var parts = num.toString().split(".");
                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                return parts.join(".");
            };
        </script>
    </form>
</body>
</html>
