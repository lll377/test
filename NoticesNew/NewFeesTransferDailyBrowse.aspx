<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewFeesTransferDailyBrowse.aspx.cs" EnableEventValidation="false" ViewStateEncryptionMode="Never" EnableViewStateMac="false" EnableViewState="false" Inherits="M_Main.NoticesNew.NewFeesTransferDailyBrowse" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>


    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <script src="../jscript/format.js" type="text/javascript"></script>
    <script src="../jscript/jquery-datagird-extended.js"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>


    <script language="javascript" type="text/javascript">
    <!--
    function btnClear_OnClick() {
        document.getElementById('RegionSNum').value = "";
        document.getElementById('BuildSNum').value = "全部";
        document.getElementById('UserCode').value = "全部";
        document.getElementById('ChargeMode').value = "全部";
        document.getElementById('CustTypeID').value = "全部";
        document.getElementById('ChargeTypeID').value = "全部";
        document.getElementById('RoomState').value = "";

    }




    function Win_OnLoad() {
        var strPrintParms = getObject("PrintParms").value;
        if (strPrintParms != "") {
            showOperatWin(strPrintParms);

            getObject("PrintParms").value = "";
        }
    }

    </script>
</head>
<body>
    <form id="NewFeesDueCutSearch" runat="server">

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
                        runat="server" /><input style="height: 21px; width: 24px" id="Flag" size="1" type="hidden" name="Flag" runat="server" />
        <%--<div id = 'tb'> 注：实收合计等于实收金额+预存金额-实收退款-预收退款-预存退款；预交冲抵和减免冲销收款方式为转帐。
<div  id='RbBz' style="vertical-align:middle;border-left:0px; border-top:0px; width:100%;color:Red">

        </div></div>--%>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 600px; height: 230px;">

            <table class="DialogTable">
                <tr>
                    <td class="DialogTdTitle">收款人

                    </td>
                    <td class="DialogTdContent">
                        <select id="UserCode" name="UserCode" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="DialogTdTitle">收款方式
                    </td>
                    <td class="DialogTdContent">
                        <select id="ChargeMode" name="ChargeMode" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">客户类别
                    </td>
                    <td class="DialogTdContent">
                        <select id="CustTypeID" name="CustTypeID" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="DialogTdTitle">收费类型
                    </td>
                    <td class="DialogTdContent">
                        <select id="ChargeTypeID" name="ChargeTypeID" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">开始时间从
                    </td>
                    <td colspan="3">
                        <input type="text" class="easyui-datetimebox" id="EditBeginDate" runat="server" name="EditBeginDate" />&nbsp;到&nbsp;<input type="text" runat="server" class="easyui-datetimebox" id="EditEndDate" name="EditEndDate" /></td>
                </tr>
                <tr>
                    <td colspan="4">备注&nbsp;各个费项的收款金额中包括单项预存和预收后期的费用。
                    </td>
                </tr>
                <tr>
                    <td colspan="4" valign="middle" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadData();">查询</a>

                    </td>
                </tr>
            </table>
        </div>

        <div style="width: 100%; background-color: #ffffff;" id="TableContainer"></div>
        <div id="DlgDetail" class="easyui-dialog" title="收费明细" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1024px; height: 500px;">
            <div style="width: 100%; background-color: #ffffff;" id="TableContainerDetail"></div>
        </div>
        <div id="DlgDetail1" class="easyui-dialog" title="预交明细" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1024px; height: 500px;">
            <div style="width: 100%; background-color: #ffffff;" id="TableContainerPrecDetail"></div>
        </div>
        <div id="DlgDetail2" class="easyui-dialog" title="预交冲抵明细" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1024px; height: 500px;">
            <div style="width: 100%; background-color: #ffffff;" id="TableContainerOffsetDetail"></div>
        </div>
        <div id="DlgDetail3" class="easyui-dialog" title="减免冲销明细" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1024px; height: 500px;">
            <div style="width: 100%; background-color: #ffffff;" id="TableContainerWaivDetail"></div>
        </div>
        <div id='tbDetail'>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ToExcel1();">Excel导出</a>
        </div>
        <div id='tbDetail1'>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ToExcel2();">Excel导出</a>
        </div>
        <div id='tbDetail2'>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ToExcel3();">Excel导出</a>
        </div>
        <div id='tbDetail3'>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ToExcel4();">Excel导出</a>
        </div>

        <input style="width: 8px" id="CostIDs" class="easyui-validatebox" size="1"
            type="hidden" name="CostIDs" runat="server" />
        <input style="width: 8px" id="StanIDs" class="easyui-validatebox" size="1"
            type="hidden" name="StanIDs" runat="server" />
        <input style="width: 8px" id="hiStanNames" class="easyui-validatebox" size="1"
            type="hidden" name="hiStanNames" runat="server" />
        <input style="width: 8px" id="CostID" class="easyui-validatebox" size="1"
            type="hidden" name="CostID" runat="server" />
        <input style="width: 8px" id="OPType" class="easyui-validatebox" size="1"
            type="hidden" name="OPType" runat="server" />
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $("#TableContainerDetail").css("height", "464px");
                $("#TableContainerPrecDetail").css("height", "464px");
                $("#TableContainerOffsetDetail").css("height", "464px");
                $("#TableContainerWaivDetail").css("height", "464px");
            }

            InitTableHeight();
            var NewCol;
            var frozenColumns = [[
                { field: '费用期间', title: '费用期间', align: 'left', sortable: true, width: 280 },
                { field: '费用序号', title: '费用序号', align: 'left', sortable: true, width: 100 },
                { field: '费用名称', title: '费用名称', align: 'left', sortable: true, width: 100 }
            ]];
            function setIsSQLData() {
                document.getElementById('hiIsSQLData').value = 1;
            }

            function LoadData() {
                setIsSQLData();
                LoadList(1, top.ListPageSize);
            }

            function Print() {
                $.tool.DataGet('FeesNotices', 'TransferDailyPrint', $('#NewFeesDueCutSearch').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Data = eval("(" + _Data + ")"); //转换为json对象
                        if (Data.rows.length > 0) {
                            obj = Data.rows[0];
                            if (obj.EtFileName != "" && obj.FileName != "") {

                                var ReportURL = "../include/print.aspx?wj=" + obj.FileName + "&et=" + obj.EtFileName + "&PrintId="
                                showOperatWin(ReportURL);
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function LoadList(page, rows) {
                $.tool.DataGet('FeesNotices', 'TransferDaily', "page=" + page + "&rows=" + rows + "&" + $('#NewFeesDueCutSearch').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Data = eval("(" + _Data + ")"); //转换为json对象
                        SetEasyUiColumn(Data, true);
                        if (Data.rows.length > 0) {
                            var obj = Data.rows[0];
                            var obj1 = Data.rows[1];
                            if (obj1 != null) {
                                var StartDate = obj1.StartDate;
                                var EndDate = obj1.EndDate;
                                toolbar = [
                                            {
                                                text: '筛选',
                                                iconCls: 'icon-search',
                                                handler: function () {
                                                    $('#SearchDlg').parent().appendTo($("form:first"));
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
                                            , '-', {
                                                text: '打印',
                                                iconCls: 'icon-print',
                                                handler: function () {
                                                    Print();
                                                }
                                            }, '-',
                                            {
                                                text: '注：实收合计等于实收金额+预存金额-实收退款-预存退款；预交冲抵和减免冲销收款方式为转帐。' + "<span style='color:red'>时间从：" + StartDate + "--" + EndDate + "</span>"
                                            }
                                ];
                            }
                        }
                        LoadListBindingColumn(Data, rows);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function SetEasyUiColumn(_Data, IsShowBz) {
                var col = "";
                var obj = "";
                var ecol = "";

                if (_Data.rows.length > 0) {
                    var row = _Data.rows.length;
                    obj = _Data.rows[0];
                    var i = 0;

                    for (var attr in obj) {
                        i = i + 1;
                        if (attr != "CostID" && attr != "StartDate" && attr != "EndDate" && attr != "费用期间" && attr != "费用序号" && attr != "费用名称" && attr != "预收退款") {

                            col = col + "," + "{ field: \'" + attr + "\', title: \'" + attr + "\', align: \'left\',fixed:true, sortable: true,width:120}";
                        }
                    }

                    col = col.substr(1, col.length);
                    ecol = "{ field: '费用期间', title: '费用期间', align: 'left',rowspan:\'" + row + "\', sortable: true, width: 280 },{ field: '费用序号', title: '费用序号', align: 'left', sortable: true, width: 100 },{ field: '费用名称', title: '费用名称', align: 'left', sortable: true, width: 100 }";
                    ecol = ecol + "," + col;


                    col = "[[" + col + "]]";
                    ecol = "[[" + ecol + "]]";
                    NewCol = eval(col);

                    ExcelCol = eval(ecol);
                }

            }

            var ExcelCol = [[]];


            function Export(strXlsName, exportGrid) {
                var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                var l = $('<input type="hidden" id="txtName" name="txtName" />');
                i.val(ChangeToTable(exportGrid, ExcelCol, ExcelCol));
                i.appendTo(f);
                l.val(strXlsName);
                l.appendTo(f);
                f.appendTo(document.body).submit();
                document.body.removeChild(f);
            }


            var toolbar = [
              {
                  text: '筛选',
                  iconCls: 'icon-search',
                  handler: function () {
                      $('#SearchDlg').parent().appendTo($("form:first"));
                      $('#SearchDlg').dialog('open');
                  }
              }
              , '-', {
                  text: '打印',
                  iconCls: 'icon-print',
                  handler: function () {
                      Print();
                  }
              }, '-',
              {
                  text: '注：实收合计等于实收金额+预存金额-实收退款-预存退款；预交冲抵和减免冲销收款方式为转帐。'
              }
            ];


            var toolbar1 = [
                {
                    text: 'Excel输出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        ToExcel1();
                    }
                }
            ];
            var toolbar2 = [
              {
                  text: 'Excel输出',
                  iconCls: 'icon-page_white_excel',
                  handler: function () {
                      ToExcel2();
                  }
              }
            ];
            var toolbar3 = [
              {
                  text: 'Excel输出',
                  iconCls: 'icon-page_white_excel',
                  handler: function () {
                      ToExcel3();
                  }
              }
            ];
            var toolbar4 = [
              {
                  text: 'Excel输出',
                  iconCls: 'icon-page_white_excel',
                  handler: function () {
                      ToExcel4();
                  }
              }
            ];

            function LoadListBindingColumn(_Data, pageSize) {

                $("#TableContainer").datagrid({
                    data: _Data,
                    method: "get",
                    title: '',
                    loadMsg: '数据加载中,请稍候...',
                    fitColumns: true,
                    frozenColumns: frozenColumns,
                    nowrap: false,
                    pageSize: pageSize,
                    pageList: top.ListPageList,
                    columns: NewCol,
                    fitColumns: true,
                    nowrap: false,
                    rownumbers: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    rownumbers: true,
                    rowStyler: function (index, row) {
                        if (row.StatType == 1) {
                            return 'color:red;';
                        }
                    },
                    onClickCell: function (rowIndex, field, value) {


                    },
                    onLoadSuccess: function (_Data) {
                        $.tool.MergeEasyUiGrid("TableContainer", "费用期间");
                        if (_Data.rows.length > 0) {
                            obj = _Data.rows[0];

                            var obj1 = _Data.rows[1];

                            if (obj1 != null) {
                                var StartDate = obj1.StartDate;
                                var EndDate = obj1.EndDate;
                            }
                        }
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
                                    LoadList(Pn, Ps);
                                    $('#TableContainer').datagrid('options').pageNumber = Pn;
                                    $('#TableContainer').datagrid('options').pageSize = Ps;
                                }
                            });
                        }

                    },
                    onLoadError: function () {
                        HDialog.Info('按费用明细生成失败！在操作完成之前超时时间已过或服务器未响应。!');
                    }
                });

                $('#SearchDlg').dialog('close');
            }
            function ShowDetailDlg(type, OPType, CostID) {
                document.getElementById('OPType').value = OPType;
                document.getElementById('CostID').value = CostID;
                switch (type) {
                    case 1:
                        $('#DlgDetail').parent().appendTo($("form:first"))
                        $('#DlgDetail').dialog('open');

                        LoadListPaidDetail();
                        break;
                    case 2:
                        $('#DlgDetail1').parent().appendTo($("form:first"))
                        $('#DlgDetail1').dialog('open');
                        LoadListPrecDetail();
                        break;
                    case 3:
                        $('#DlgDetail2').parent().appendTo($("form:first"))
                        $('#DlgDetail2').dialog('open');
                        LoadListOffsetDetail();
                        break;
                    case 4:
                        $('#DlgDetail3').parent().appendTo($("form:first"))
                        $('#DlgDetail3').dialog('open');
                        LoadListWaivDetail();
                        break;
                }
            }

            document.getElementById('hiIsSQLData').value = -1;

            //LoadList(1, top.ListPageSize);
            LoadListBindingColumn([], top.ListPageSize); //默认不加载数据
            document.getElementById('hiLoadFeesPaid').value = 1;

            
            function LoadListPaidDetail() {
                var columnPaidDetail = [[
                    { field: 'CustName', title: '客户名称', align: 'left', sortable: true },
                    { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true },
                    { field: 'ChargeDate', title: '收款时间', align: 'left', sortable: true },
                    { field: 'BillsSign', title: '票据号码', align: 'left', sortable: true },
                    { field: 'FeesDueDate', title: '应收日期', align: 'left', sortable: true },
                    { field: 'CostSNum', title: '费用编号', align: 'left', sortable: true },
                    { field: 'CostName', title: '费用名称', align: 'left', sortable: true },
                    { field: 'ChargeAmount', title: '收款金额', align: 'left', sortable: true },
                    { field: 'LateFeeAmount', title: '滞纳金', align: 'left', sortable: true },
                    { field: 'UserName', title: '收款人', align: 'left', sortable: true },
                    { field: 'NotaxAmount', title: '不含税金额', align: 'left', sortable: true },
                    { field: 'taxAmount', title: '税额', align: 'left', sortable: true },
                    { field: 'TaxRate', title: '税率', align: 'left', sortable: true },
                    { field: 'FeesMemo', title: '备注', align: 'left', sortable: true }
                ]];
                $("#TableContainerDetail").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=FeesNotices&Command=TransferDailyPaidDetail&' + $("#NewFeesDueCutSearch").serialize(),
                    method: "get",

                    loadMsg: '数据加载中,请稍候...',
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: columnPaidDetail,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    fitColumns: true,
                    width: "100%",
                    toolbar: toolbar1,
                    sortOrder: "asc",
                    border: false,
                    rowStyler: function (index, row) {
                        if (row.StatType == 1) {

                            return 'color:red;';
                        }
                    }
                });

            }
            function LoadListPrecDetail() {
                var columnPrecDetail = [[
                    { field: 'CustName', title: '客户名称', align: 'left', sortable: true },
                    { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true },
                    { field: 'ChargeDate', title: '预交登记时间', align: 'left', sortable: true },
                    { field: 'BillsSign', title: '票据号码', align: 'left', sortable: true },
                    { field: 'CostName', title: '冲抵费用项目', align: 'left', sortable: true },
                    { field: 'ChargeAmount', title: '预交金额', align: 'left', sortable: true },
                    { field: 'UserName', title: '预交操作人', align: 'left', sortable: true },
                    { field: 'NotaxAmount', title: '不含税金额', align: 'left', sortable: true },
                    { field: 'taxAmount', title: '税额', align: 'left', sortable: true },
                    { field: 'TaxRate', title: '税率', align: 'left', sortable: true },
                    { field: 'FeesMemo', title: '备注', align: 'left', sortable: true }

                ]];
                $("#TableContainerPrecDetail").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=FeesNotices&Command=TransferDailyPrecDetail&' + $("#NewFeesDueCutSearch").serialize(),
                    method: "get",

                    loadMsg: '数据加载中,请稍候...',
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: columnPrecDetail,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    fitColumns: true,
                    width: "100%",
                    toolbar: toolbar2,
                    border: false,
                    sortOrder: "asc",
                    rowStyler: function (index, row) {
                        if (row.StatType == 1) {

                            return 'color:red;';
                        }
                    }
                });
            }
            function LoadListOffsetDetail() {
                var columnOffsetDetail = [[
                    { field: 'CustName', title: '客户名称', align: 'left', sortable: true },
                    { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true },
                    { field: 'OffsetDate', title: '预交冲抵日期(或撤销冲抵日期)', align: 'left', sortable: true },
                    { field: 'CostSNum', title: '费用编号', align: 'left', sortable: true },
                    { field: 'CostName', title: '费用名称', align: 'left', sortable: true },
                    { field: 'FeesDueDate', title: '费用日期', align: 'left', sortable: true },
                    { field: 'CostName', title: '冲抵费用项目', align: 'left', sortable: true },
                    { field: 'OffsetAmount', title: '冲抵金额', align: 'left', sortable: true },
                    { field: 'NotaxAmount', title: '不含税金额', align: 'left', sortable: true },
                    { field: 'taxAmount', title: '税额', align: 'left', sortable: true },
                    { field: 'TaxRate', title: '税率', align: 'left', sortable: true }


                ]];
                $("#TableContainerOffsetDetail").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=FeesNotices&Command=TransferOffsetDetail&' + $("#NewFeesDueCutSearch").serialize(),
                    method: "get",

                    loadMsg: '数据加载中,请稍候...',
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: columnOffsetDetail,
                    fitColumns: true,
                    singleSelect: true,
                    fitColumns: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar3,
                    sortOrder: "asc",
                    border: false,
                    rowStyler: function (index, row) {
                        if (row.StatType == 1) {

                            return 'color:red;';
                        }
                    }
                });
            }
            function LoadListWaivDetail() {
                var columnWaivDetail = [[
                    { field: 'CustName', title: '客户名称', align: 'left', sortable: true },
                    { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true },
                    { field: 'OffsetDate', title: '减免冲抵日期(或撤销冲抵日期)', align: 'left', sortable: true },
                    { field: 'CostSNum', title: '费用编号', align: 'left', sortable: true },
                    { field: 'CostName', title: '费用名称', align: 'left', sortable: true },
                    { field: 'FeesDueDate', title: '费用日期', align: 'left', sortable: true },
                    { field: 'CostName', title: '冲抵费用项目', align: 'left', sortable: true },
                    { field: 'OffsetAmount', title: '冲抵金额', align: 'left', sortable: true },
                    { field: 'WaivMemo', title: '减免备注', align: 'left', sortable: true },
                    { field: 'NotaxAmount', title: '不含税金额', align: 'left', sortable: true },
                    { field: 'taxAmount', title: '税额', align: 'left', sortable: true },
                    { field: 'TaxRate', title: '税率', align: 'left', sortable: true }


                ]];
                $("#TableContainerWaivDetail").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=FeesNotices&Command=TransferDailyWaivDetail&' + $("#NewFeesDueCutSearch").serialize(),
                    method: "get",

                    loadMsg: '数据加载中,请稍候...',
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: columnWaivDetail,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    border: false,
                    width: "100%",
                    toolbar: toolbar4,
                    sortOrder: "asc",
                    rowStyler: function (index, row) {
                        if (row.StatType == 1) {

                            return 'color:red;';
                        }
                    }
                });
            }
            function ToExcel1() {
                window.location.href = "../Notices/FeesTransferDailyDetailCreExcel.aspx";
            }
            function ToExcel2() {
                window.location.href = "../Notices/FeesTransferDailyPrecDetailCreExcel.aspx";
            }
            function ToExcel3() {
                window.location.href = "../Notices/FeesTransferDailyOffsetDetailCreExcel.aspx";
            }
            function ToExcel4() {
                window.location.href = "../Notices/FeesTransferDailyWaivDetailCreExcel.aspx";
            }
        </script>


    </form>
</body>
</html>
