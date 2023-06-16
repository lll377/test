<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesDailyCostPeriodCommissBrowse.aspx.cs" Inherits="M_Main.NoticesNew.FeesDailyCostPeriodCommissBrowse" %>

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
    <script type="text/javascript" src="../jscript/export.js"></script>
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
        <input type="hidden" name='hiIsDetail' id='hiIsDetail' runat="server" />
        <input style="width: 32px" id="PageIndex" size="1" type="hidden" name="PageIndex"
            runat="server" /><input style="height: 21px; width: 24px" id="PrintParms" size="1" type="hidden" name="PrintParms"
                runat="server" /><input style="width: 24px" id="CostGeneType" size="1" type="hidden" name="CostGeneType"
                    runat="server" /><input style="height: 21px; width: 24px" id="OptCode" size="1" type="hidden" name="OptCode"
                        runat="server" /><input style="height: 21px; width: 24px" id="Flag" size="1" type="hidden" name="Flag" runat="server">



        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="DlgDetail" class="easyui-dialog" title="收费明细" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1024px; height: 300px;">
            <div style="width: 100%; background-color: #ffffff;" id="TableContainerDetail"></div>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 250px;">
            <table class="DialogTable">
                <tr>
                    <td class="DialogTdTitle">开始时间从
                    </td>
                    <td class="DialogTdContent" colspan="3">
                        <input type="text" class="easyui-datetimebox" id="EditBeginDate" runat="server" name="EditBeginDate" />&nbsp;到&nbsp;<input type="text" runat="server" class="easyui-datetimebox" id="EditEndDate" name="EditEndDate" />

                    </td>

                </tr>
                <tr>
                    <td colspan="4">生成选项&nbsp;<input type="checkbox" id='SelCb1' name="SelCb1" /><input type="hidden" name='IsSelCb1' id='IsSelCb1' />按收费明细(备注：是指每个费项的明细构成，勾选后才能“按收费明细输出”，但耗时较长。)</td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">组团区域</td>
                    <td class="DialogTdContent">
                        <select id="RegionSNum" name="RegionSNum" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="DialogTdTitle">楼宇</td>
                    <td class="DialogTdContent">
                        <select id="BuildSNum" name="BuildSNum" runat="server" width="60">
                            <option selected></option>
                        </select></td>
                </tr>

                <tr>
                    <td class="DialogTdTitle">客户类别</td>
                    <td class="DialogTdContent">
                        <select id="CustTypeID" name="CustTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="DialogTdTitle">收费类型</td>
                    <td class="DialogTdContent">
                        <select id="ChargeTypeID" name="ChargeTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">交房状态</td>
                    <td class="DialogTdContent">
                        <select id="RoomState" name="RoomState" runat="server">
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
                    <td class="DialogTdTitle">收款人</td>
                    <td class="DialogTdContent">
                        <select id="UserCode" name="UserCode" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="DialogTdTitle">收款方式</td>
                    <td class="DialogTdContent">
                        <select class="easyui-combobox" id="SelChargeMode" name="SelChargeMode" runat="server" data-options="multiple:true,panelHeight:'auto'">
                            <option selected></option>
                        </select>
                        <input type="hidden" id="ChargeMode" name="ChargeMode" />
                    </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">费用展示形式</td>
                    <td class="DialogTdContent">
                        <select id="ShowType" name="ShowType" runat="server">
                            <option value="月度" selected>月度</option>
                            <option value="季度">季度</option>
                            <option value="年度">年度</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:ExcuteOnServer(); ">查询</a>

                    </td>
                </tr>
            </table>
        </div>


        <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 500px; height: 150px; padding: 10px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red'>
                <tr>
                    <td rowspan="4" width="40px" valign="top" style='color: Red'>备注：</td>
                    <td>全部合计=实收合计+合同违约金合计-实收退款合计+综合预存收款-综合预存退款+零头结转合计。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'></td>
                </tr>

            </table>
        </div>

        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $("#TableContainerDetail").css("height", "270px");
            }
            InitTableHeight();

            var NewCol = [[

                { field: 'CorpCostName', title: '费用大项', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'CostName', title: '费用名称', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'Period', title: '摘要', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'ChargeAmount', title: '金额', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'UserName', title: '收款人', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'ChargeMode', fixed: true, title: '收款方式', align: 'left', sortable: true, width: 150 }


            ]];

            var columnDetail = [[

                { field: 'CustName', title: '客户名称', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'RoomSign', title: '房屋编号', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'CostName', title: '费用名称', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'FlagTypeName', title: '费用说明', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'FeeDueYearMonth', title: '费用日期', fixed: true, align: 'left', sortable: true, width: 150 },
                {
                    field: 'FeesStateDate', title: '开始日期', align: 'left', sortable: true, width: 150, formatter: function (value, row, index) {
                        var str = row.FeesStateDate.ToCustomizeDate();
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '结束日期', align: 'left', sortable: true, width: 150, formatter: function (value, row, index) {
                        var str = row.FeesEndDate.ToCustomizeDate();
                        return str;
                    }
                },
                { field: 'PaidAmount', fixed: true, title: '金额', align: 'left', sortable: true, width: 150 },
                { field: 'LateFeeAmount', fixed: true, title: '合同违约金', align: 'left', sortable: true, width: 150 },
                { field: 'UserName', fixed: true, title: '收款人', align: 'left', sortable: true, width: 150 },
                { field: 'ChargeMode', fixed: true, title: '收款方式', align: 'left', sortable: true, width: 150 },
                { field: 'ChargeDate', fixed: true, title: '时间', align: 'left', sortable: true, width: 150 },
                { field: 'BillsSign', fixed: true, title: '收据号', align: 'left', sortable: true, width: 150 },
                { field: 'InvoiceBill', fixed: true, title: '发票号', align: 'left', sortable: true, width: 150 }


            ]];
            var ExcelCol = [[]];

            function SetEasyUiColumn(_Data, IsShowBz) {
                var col = "";
                var obj = "";
                var ecol = "";
                if (_Data.rows.length > 0) {
                    obj = _Data.rows[0];
                    var i = 0;
                    var isDetail = 0;
                    if (obj.IsSelCb1 == 1) {
                        isDetail = 1;
                    }


                    var sBz = "时间从" + obj.Bz;
                    toolbar = [
                        {
                            text: '筛选',
                            iconCls: 'icon-search',
                            handler: function () {
                                $('#SearchDlg').parent().appendTo($("form:first"))
                                $('#SearchDlg').dialog('open');

                            }
                        }, '-',
                        {
                            text: '导出Excel',
                            iconCls: 'icon-page_white_excel',
                            handler: function () {
                                var rowData = $('#TableContainer').datagrid('getData');
                                if (rowData == '') {
                                    HDialog.Info('请先生成报表');
                                }
                                else {
                                    Export('按费项期间统计Excel', $('#TableContainer'));
                                }

                            }
                        }
                        , '-',
                        {
                            text: '按客户明细输出',
                            iconCls: 'icon-page_white_excel',
                            handler: function () {
                                var rowData = $('#TableContainer').datagrid('getData');
                                if (rowData == '') {
                                    HDialog.Info('请先生成报表');
                                }
                                else {
                                    window.location.href = "../Notices/FeesDailyCommissCrePaid.aspx";
                                }

                            }
                        }
                        , '-',
                        {
                            text: '换票明细输出',
                            iconCls: 'icon-page_white_excel',
                            handler: function () {
                                var rowData = $('#TableContainer').datagrid('getData');
                                if (rowData == '') {
                                    HDialog.Info('请先生成报表');
                                }
                                else {
                                    window.location.href = "../Notices/FeesDailyCommissCreExChargeBill.aspx";
                                }

                            }
                        }
                        , '-',
                        {
                            text: '打印',
                            iconCls: 'icon-print',
                            handler: function () {


                                $.messager.confirm("打印提示提示", "是否分月打印？", function (data) {
                                    if (data) {
                                        document.getElementById('hiIsDetail').value = "1";
                                    }
                                    else {
                                        document.getElementById('hiIsDetail').value = "0";
                                    }

                                    $.tool.DataPost('FeesNotices', 'PrintDailyCommiss2', $('#frmForm').serialize(),
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            var Data = eval("(" + _Data + ")"); //转换为json对象

                                            if (Data.rows.length > 0) {
                                                obj = Data.rows[0];
                                                if (obj.EtFileName != "" && obj.FileName != "") {

                                                    var ReportURL = "../include/print.aspx?wj=" + obj.FileName + "&et=" + obj.EtFileName + ""
                                                    showOperatWin(ReportURL);
                                                }
                                            }


                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                });


                            }
                        }
                        , '-', {
                            text: '备注',
                            iconCls: 'icon-help',
                            handler: function () {
                                $('#DlgMemo').parent().appendTo($("form:first"))
                                $('#DlgMemo').dialog('open');

                            }
                        }, '-', {
                            text: "<span style='color:red'>报表生成：" + sBz + "</span>"
                        }
                    ];

                    for (var attr in obj) {
                        i = i + 1;
                        if (attr == "DailyID") {

                            if (isDetail == 1) {
                                col = col + "," + "{ field: \'" + attr + "\', title: '明细',width:200, align: \'center\',fixed:true, sortable: true,formatter:function(val,row,index){ return \"<a  class='hxbba' style='width:100px' iconCls='icon-cancel'  ></a>\";}}";
                            }
                        }
                        else {
                            if (attr != "IsSelCb1" && attr != "Bz" && attr != "DailyType") {
                                if (attr == '费用期间')
                                    col = col + "," + "{ field: \'" + attr + "\', title: \'" + attr + "\',width:200, align: \'left\',fixed:true, sortable: true,formatter:function(val,row,index){  if(row.费用期间.indexOf(':')>0) {return '&nbsp;&nbsp;'+row.费用期间} else return row.费用期间;}}";
                                else
                                    col = col + "," + "{ field: \'" + attr + "\', title: \'" + attr + "\',width:200, align: \'left\',fixed:true, sortable: true}";


                                ecol = ecol + "," + "{ field: \'" + attr + "\', title: \'" + attr + "\' ,width:200,align: \'left\',fixed:true, sortable: true}";

                            }
                        }

                    }

                    col = col.substr(1, col.length);
                    col = "[[" + col + "]]";
                    ecol = ecol.substr(1, ecol.length);
                    ecol = "[[" + ecol + "]]";
                    ExcelCol = eval(ecol);
                    NewCol = eval(col);
                }

            }

            function Export(strXlsName, exportGrid) {
                var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                var l = $('<input type="hidden" id="txtName" name="txtName" />');
                i.val(ChangeToTable(exportGrid, ExcelCol));
                i.appendTo(f);
                l.val(strXlsName);
                l.appendTo(f);
                f.appendTo(document.body).submit();
                document.body.removeChild(f);
            }

            function LoadListFeesDailyCommiss(page, rows) {
                $.tool.DataPost('FeesNotices', 'DailyCommiss1', "page=" + page + "&rows=" + rows + "&" + $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Data = eval("(" + _Data + ")"); //转换为json对象
                        console.log(Data);
                        SetEasyUiColumn(Data);
                        LoadListBindingColumn(Data, rows);


                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }


            var toolbar = [
                {
                    text: '查询',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }, '-',
                {
                    text: '打印',
                    iconCls: 'icon-print',
                    handler: function () {

                        document.getElementById('hiIsDetail').value = "0";

                        HDialog.Prompt('是否分月打印', function () {

                            document.getElementById('hiIsDetail').value = "1";
                        });

                        $.tool.DataGet('FeesNotices', 'PrintDailyCommiss2', $('#frmForm').serialize(),
                            function Init() {
                            },
                            function callback(_Data) {
                                var Data = eval("(" + _Data + ")"); //转换为json对象

                                if (Data.rows.length > 0) {
                                    obj = Data.rows[0];
                                    if (obj.EtFileName != "" && obj.FileName != "") {

                                        var ReportURL = "../include/print.aspx?wj=" + obj.FileName + "&et=" + obj.EtFileName + ""
                                        showOperatWin(ReportURL);
                                    }
                                }


                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });

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


            function LoadListBindingColumn(_Data, pageSize) {

                $("#TableContainer").datagrid({
                    data: _Data,
                    method: "get",
                    title: '',
                    loadMsg: '',
                    fitColumns: true,
                    nowrap: false,
                    pageSize: 1000,
                    pageList: [1000],
                    columns: NewCol,
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

                    rowStyler: function (index, row) {
                        if (row.DailyType == 30
                            || row.DailyType >= 5 && row.DailyType <= 7
                            || row.DailyType >= 20 && row.DailyType <= 23
                        ) {
                            return 'color:red;';
                        }
                    },
                    onClickCell: function (rowIndex, field, value) {

                        if (field == "DailyID") {

                            //  $('#DlgDetail').parent().appendTo($("#test"))

                            document.getElementById('hiDailyID').value = value;
                            $("#TableContainerDetail").datagrid({
                                url: '/HM/M_Main/HC/DataPostControl.aspx',
                                method: "post",
                                loadMsg: '数据加载中,请稍候...',
                                pageSize: top.ListPageSize,
                                pageList: top.ListPageList,
                                columns: columnDetail,
                                fitColumns: true,
                                singleSelect: true,
                                pagination: true,
                                width: "100%",
                                sortOrder: "asc",
                                onBeforeLoad: function (param) {
                                    param = $.JQForm.GetParam("FeesNotices", "DailyCommissDetail", "TableContainerDetail", param);
                                }

                            });

                            $('#DlgDetail').dialog('open');


                        }
                    },
                    onLoadSuccess: function () {
                        $('.hxbba').each(function () {

                            $(this).linkbutton({
                                iconCls: 'icon-redo'
                            });



                        });

                        $.tool.MergeEasyUiGrid("TableContainer", "费用大项");
                        $.tool.MergeEasyUiGrid("TableContainer", "费用名称");



                        //var pg = $("#TableContainer").datagrid("getPager");
                        //if (pg) {
                        //    $(pg).pagination({
                        //        onBeforeRefresh: function () {

                        //        },
                        //        onRefresh: function (pageNumber, pageSize) {

                        //        },
                        //        onChangePageSize: function () {
                        //        },
                        //        onSelectPage: function (Pn, Ps) {

                        //            var isCheck = document.getElementById('SelCb1').checked;
                        //            if (isCheck) {
                        //                document.getElementById('IsSelCb1').value = "1";

                        //            }
                        //            else {
                        //                document.getElementById('IsSelCb1').value = "0";
                        //            }
                        //            LoadListFeesDailyCommiss(Pn, Ps);
                        //            $('#TableContainer').datagrid('options').pageNumber = Pn;
                        //            $('#TableContainer').datagrid('options').pageSize = Ps;


                        //        }
                        //    });
                        //}

                    },
                    onLoadError: function () {
                        HDialog.Info('按费用期间生成失败！在操作完成之前超时时间已过或服务器未响应。!');
                    }
                });

                $('#SearchDlg').dialog('close');
            }

            document.getElementById('hiIsSQLData').value = -1;
            LoadListFeesDailyCommiss(1, 1000);

            function ExcuteOnServer() {
                var isCheck = document.getElementById('SelCb1').checked;
                if (isCheck) {
                    document.getElementById('IsSelCb1').value = "1";
                }
                else {
                    document.getElementById('IsSelCb1').value = "0";
                }

                //alert($("#ShowType").val());
                document.getElementById('hiIsSQLData').value = "1";
                $("#ChargeMode").val($("#SelChargeMode").combobox('getValues'));
                LoadListFeesDailyCommiss(1, 1000);
                $('#SearchDlg').dialog('close');
            }

        </script>
    </form>
</body>
</html>
