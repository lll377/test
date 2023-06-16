<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesDailyChargeModeCommissBrowse_New.aspx.cs" Inherits="M_Main.NoticesNew.FeesDailyChargeModeCommissBrowse_New" %>


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
        <input style="width: 32px" id="PageIndex" size="1" type="hidden" name="PageIndex"
            runat="server" /><input style="height: 21px; width: 24px" id="PrintParms" size="1" type="hidden" name="PrintParms"
                runat="server" /><input style="width: 24px" id="CostGeneType" size="1" type="hidden" name="CostGeneType"
                    runat="server" /><input style="height: 21px; width: 24px" id="OptCode" size="1" type="hidden" name="OptCode"
                        runat="server" /><input style="height: 21px; width: 24px" id="Flag" size="1" type="hidden" name="Flag" runat="server">

        <div class="SearchContainer" id="TableContainer">
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
                    <td colspan="4">
                        <input type="checkbox" id='SelCb1' name="SelCb1" style="display: none;" /><input type="hidden" name='IsSelCb1' id='IsSelCb1' /></td>
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

            var ExcelCol = [[]];

            function SetEasyUiColumn(_Data, IsShowBz) {
                var col = "";
                var col1 = "";
                var fcol = "";
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
                            text: '查询',
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
                                    Export('按收款方式统计Excel', $('#TableContainer'));
                                }

                            }
                        }, '-',
                        {
                            text: '打印',
                            iconCls: 'icon-print',
                            handler: function () {

                                $.tool.DataPost('FeesNotices', 'PrintDailyCommiss1', $('#frmForm').serialize(),
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

                        if (attr == "DailyID") {

                            if (isDetail == 1) {
                                col = col + "," + "{ field: \'" + attr + "\', title: '明细',width:150, align: \'center\',fixed:true, sortable: true,formatter:function(val,row,index){ return \"<a  class='hxbba' style='width:100px' iconCls='icon-cancel'  ></a>\";}}";
                            }
                        }
                        else {
                            if (attr != "IsSelCb1" && attr != "Bz" && attr != "DailyType" && attr != "收款人") {
                                ecol = ecol + "," + "{ field: \'" + attr + "\', title: \'" + attr + "\' ,width:150,align: \'left\',fixed:true, sortable: true}";

                                if (i < 3) {

                                    col = col + "," + "{ field: \'" + attr + "\', title: \'" + attr + "\' ,width:150,rowspan: 2, align: \'left\',fixed:true, sortable: true}";
                                }
                                else if (i >= 3 && i <= 4) {
                                    if (i == 3) {
                                        col = col + ",{ colspan:6, title: '费用明细' }";
                                    }
                                    col1 = col1 + ",{ field: \'" + attr + "\', title: \'" + attr + "\' ,width:150, align: \'left\',fixed:true, sortable: true}";
                                }
                                else if (i > 4 && i < Object.keys(obj).length - 3) {

                                    if (i == 5) {

                                        var k = Object.keys(obj).length - 9;
                                        col = col + ",{ colspan:" + k + ", title: '收款方式' }";
                                    }
                                    col1 = col1 + ",{ field: \'" + attr + "\', title: \'" + attr + "\' ,width:150, align: \'left\',fixed:true, sortable: true}";

                                }
                                else if (i >= Object.keys(obj).length - 3) {
                                    col = col + "," + "{ field: \'" + attr + "\', title: \'" + attr + "\' ,width:150,rowspan: 2, align: \'left\',fixed:true, sortable: true}";

                                }
                            }
                        }
                        i = i + 1;

                    }

                    col = col.substr(1, col.length);
                    ecol = ecol.substr(1, ecol.length);
                    col1 = col1.substr(1, col1.length);
                    col = "[[" + col + "],[" + col1 + "]]";
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

            function LoadListFeesDailyCommiss(page, pageSize) {
                $.tool.DataPostNoLoading('FeesNotices', 'DailyCommiss2New', "page=" + page + "&rows=" + pageSize + "&" + $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Data = eval("(" + _Data + ")"); //转换为json对象
                        SetEasyUiColumn(Data, false);
                        LoadListBindingColumn(Data, pageSize);
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

                        $.tool.DataGet('FeesNotices', 'PrintDailyCommiss1', $('#frmForm').serialize(),
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
                    method: "post",
                    title: '',
                    loadMsg: '',
                    nowrap: false,
                    pageSize: pageSize,
                    pageList: [300, 500, 1000],
                    columns: NewCol,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    border: false,
                    width: "100%",
                    toolbar: toolbar,
                    remoteSort: false,
                    sortOrder: "asc",
                    rownumbers: true,
                    rowStyler: function (index, row) {
                        if (row.DailyType == 1 || row.DailyType == 2 || row.DailyType == 3 || row.DailyType == 4
                            || row.DailyType == 5 || row.DailyType == 9 || row.DailyType == 11) {
                            return 'color:red;';
                        }
                    },
                    onLoadSuccess: function () {
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
                                    var isCheck = document.getElementById('SelCb1').checked;
                                    if (isCheck) {
                                        document.getElementById('IsSelCb1').value = "1";

                                    }
                                    else {
                                        document.getElementById('IsSelCb1').value = "0";
                                    }
                                    LoadListFeesDailyCommiss(Pn, Ps);
                                    $('#TableContainer').datagrid('options').pageNumber = Pn;
                                    $('#TableContainer').datagrid('options').pageSize = Ps;


                                }
                            });
                        }

                    },
                    onLoadError: function () {
                        HDialog.Info('按收款方式生成失败！在操作完成之前超时时间已过或服务器未响应。!');
                    }
                });

                $('#SearchDlg').dialog('close');
            }

            document.getElementById('hiIsSQLData').value = -1;
            LoadListFeesDailyCommiss(1, 300);

            function ExcuteOnServer() {

                var isCheck = document.getElementById('SelCb1').checked;
                if (isCheck) {
                    document.getElementById('IsSelCb1').value = "1";

                }
                else {
                    document.getElementById('IsSelCb1').value = "0";
                }

                document.getElementById('hiIsSQLData').value = "1";
                $("#ChargeMode").val($("#SelChargeMode").combobox('getValues'));
                LoadListFeesDailyCommiss(1, 300);
                $('#SearchDlg').dialog('close');
            }

        </script>
    </form>
</body>
</html>
