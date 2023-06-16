<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LedgerStatementNew.aspx.cs" Inherits="M_Main.CorpCostStatistNew.LedgerStatementNew" %>

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
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: 230px;
        }

        .SearchTable {
            width: 700px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }

        #CostNames {
            width: 550px;
            height: 30px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }

        #CommNames {
            width: 550px;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }
    </style>
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
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>
        <div id="TableContainer" style="width: 100%;" class="easyui-datagrid"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 820px; height: 330px; padding: 10px;">
            <table style="width: 100%; overflow: hidden;" class="DialogTable">
                <tr>
                    <td class="TdTitle">管理项目
                    </td>
                    <td class="TdContentSearch" colspan="3">
                        <input class="easyui-searchbox" id="CommNames" searcher="SelCommInfo" style="width: 80%;" data-options="editable:false" name="CommNames" runat="server" />
                        <input id="CommIDs" type="hidden" name="CommIDs" runat="server" />
                        <input id="CommID" type="hidden" name="CommID" runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch" colspan="3">
                        <input class="easyui-searchbox" searcher="SelCost" id="CostNames" style="width: 80%;" data-options="editable:false"
                            name="CostNames" runat="server" /><input id="CostIDs" type="hidden"
                                name="CostIDs" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">交房状态</td>
                    <td class="TdContentSearch">
                        <select id="RoomState" name="RoomState" runat="server">
                            <option selected="selected"></option>
                        </select></td>
                    <td class="TdTitle">收款方式</td>
                    <td class="TdContentSearch">
                        <select id="ChargeMode" name="ChargeMode" class="easyui-combobox"
                            data-options=" multiple: true " style="width: 140px;" runat="server">
                           <option></option>
                        </select>
                        <input type="hidden" name="ChargeModes" id="ChargeModes" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">开始时间从
                    </td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" class="easyui-datetimebox" id="EditBeginDate" runat="server" name="EditBeginDate" />&nbsp;到&nbsp;<input type="text" runat="server" class="easyui-datetimebox" id="EditEndDate" name="EditEndDate" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <input type="checkbox" id='SelCb1' name="SelCb1" style="display: none;" /><input type="hidden" name='IsSelCb1' id='IsSelCb1' /></td>
                </tr>                             
                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:SearchData(); ">统计</a>

                    </td>
                </tr>
            </table>
        </div>
        
        <script type="text/javascript">
            function SelCommInfo() {
                if ($('#CommID').val() != '' && $('#CommID').val() != '0') {
                    return;
                }
                HDialog.Open(700, 400, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommIDs").val(arrRet.id);
                    $("#CommNames").searchbox("setValue", arrRet.name);
                });
            }

            function InitFunction() {
                var h = $(window).height() / 3 * 2;
                var h2 = $(window).height() / 3
                $("#TableContainer").css("height", h + "px");
                $('#hiIsSQLData').val('-1');
            }
            InitFunction();

            function SelCost() {
                if ($('#hCommID').val() == '') {
                    HDialog.Open('700', '450', "../dialogNew/MultiCorpCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                        var varReturn = _data;

                        if (varReturn != "") {//**获得返回 刷新
                            var varObjects = varReturn.split("\t");
                            $('#CostIDs').val(varObjects[0]);
                            $('#CostNames').searchbox('setValue', varObjects[1]);
                        }

                    });
                }
                else
                {
                    HDialog.Open('700', '450', "../dialogNew/MultiCorpCommCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                        var varReturn = _data;
                        if (varReturn != "") {//**获得返回 刷新
                            var varObjects = varReturn.split("\t");
                            $("#CostIDs").val(varObjects[0]);
                            $('#CostNames').searchbox('setValue', varObjects[1]);
                        }
                    });
                }
            }


            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            var frozenColumns = [[
                {
                    field: '收款日期', title: '收款日期', fixed: true, align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                        var str = value;
                        if (str == "") {
                            return "合计金额";
                        }
                        return formatDate(str, "yyyy-MM-dd");;
                    }
                },
                {
                    field: '票据号', title: '票据号', fixed: true, align: 'center', sortable: true, width: 200, formatter: function (value, row, index) { return value.replace(new RegExp('&lt;br&gt;', "gm")  ,'<br >'); }
                },
                { field: '收款金额合计', title: '收款金额合计', fixed: true, align: 'center', sortable: true, width: 100 },
                //{ field: 'ChargeMode', title: '收款方式', fixed: true, align: 'center', sortable: true, width: 100 }
            ]]

            var column = "";


            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {

                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成报表');
                        }
                        else {
                            window.location.href = "LedgerStatementNewCre.aspx";
                        }
                    }


                }
            ];


            var Headcolumn = "";
            var ExcelCol = "";
            var HeadExceltitle = "";
            function SetEasyUiColumn(_Data) {

                ExcelCol = "";
                Headcolumn = "";
                column = "";
                var col = "";
                var col1 = "";
                var ecol = ""; //导出excel  

                if (_Data.rows.length > 0) {
                    obj = _Data.rows[0];
                    var i = 1
                    //column = column + " { field: '合计减免', title: '合计减免', fixed: true, align: 'center', sortable: true, width: 150, rowspan: 2 },";

                    // ---------



                    // Headcolumn = Headcolumn + "{ field: 'OrganName', title: '区域', fixed: true, align: 'center', sortable: true, width: 150, rowspan: 3 },";
                    Headcolumn = Headcolumn + " { field: '票据号', title: '票据号', fixed: true, align: 'center', sortable: true, width: 250  },";
                    Headcolumn = Headcolumn + " { field: '收款金额合计', title: '收款金额合计', fixed: true, align: 'center', sortable: true, width: 100 },";
                    Headcolumn = Headcolumn + " { field: 'ChargeMode', title: '收款方式', fixed: true, align: 'center', sortable: true, width: 100 }";

                    // ecol = ecol + " { field: 'OrganName', title: '区域', fixed: true, align: 'center', sortable: true, width: 150 },";
                    ecol = ecol + " { field: '票据号', title: '票据号', fixed: true, align: 'center', sortable: true, width: 250 },";
                    ecol = ecol + " { field: '收款金额合计', title: '收款金额合计', fixed: true, align: 'center', sortable: true, width: 100 },";
                    ecol = ecol + " { field: 'ChargeMode', title: '收款方式', fixed: true, align: 'center', sortable: true, width: 100 },";


                    //-------

                    //*********实收*******
                    for (var attr in obj) {

                        if (attr != "IID" && attr != "UserCode" && attr != "收款日期" && attr != "收款人" && attr != "ChargeMode" && attr != "RoomState" && attr != "收款金额合计" && attr != "RN" && attr != "票据号") {

                            if (i == 1) {
                                col = col + "{ field: \'" + attr + "\', title: \'" + attr+ "\' ,width:150,align: \'center\',fixed:true, sortable: true}";
                                col1 = col1 + "{ field: \'" + attr + "\', title: \'(" + i + ")\' ,width:150,align: \'center\',fixed:true, sortable: true}";
                                ecol = ecol + " { field:\'" + attr + "\', title: '" + attr + "\', fixed: true, align: 'center', sortable: true, width: 150 }";
                            } else {
                                col = col + ",{ field: \'" + attr + "\', title: \'" + attr+ "\' ,width:150,align: \'center\',fixed:true, sortable: true}";
                                col1 = col1 + ",{ field: \'" + attr + "\', title: \'(" + i + ")\' ,width:150,align: \'center\',fixed:true, sortable: true}";
                                ecol = ecol + " ,{ field:\'" + attr + "\', title: '" + attr+ "\', fixed: true, align: 'center', sortable: true, width: 150 }";
                            }
                            i = i + 1;
                            // ecol = ecol + " ,{ field:\'" + attr + "\', title: '" + attr + "\', fixed: true, align: 'center', sortable: true, width: 150 }";

                        }
                    }

                    if (i > 1) { var i = i - 1; }

                    var i1 = i + 1;
                    var i2 = i + 2;
                    var i3 = i + 3;

                    var col_1 = "[" + col + "]";
                    var col1_1 = ",[" + col1 + "]";

                    var column1 = "[" + col_1 + "]";

                    //excel

                  

                    Headcolumn = "[ [" + HeadExceltitle + "],[" + Headcolumn + "]" + col_1 + col1_1 + "]";
                    Headcolumn = eval(Headcolumn);
                    ecol = "[" + ecol + "]";
                    column = eval(column1);
                    Headcolumn = Headcolumn;
                    console.log(Headcolumn);

                }



            }

            function LoadListFeesDailyCommiss(page) {
                $.tool.DataPostNoLoading('LedgerStatement_StaticNew', 'LoadData', "page=" + page + "&rows=" + top.ListPageSize + "&" + $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Data = eval("(" + _Data + ")"); //转换为json对象
                        SetEasyUiColumn(Data);
                        LoadData(Data);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function LoadDatChargeMode(_Data) {

                var frozenColumns = [[
                    { field: '作废票据', title: '作废票据', align: 'left', sortable: true, width: 1280 }
                ]]
                $("#TableContainer2").datagrid({
                    data: _Data,
                    method: "post",
                    pageSize: 50,
                    pageList: [50, 100, 200],
                    columns: frozenColumns,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    singleSelect: true,
                    width: "100%",
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false
                });
            }

            var ProgressInterval;
            function Search() {
                // LoadData();
                LoadListFeesDailyCommiss(1);
            }

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('LedgerStatement_StaticNew', 'StartTask', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('LedgerStatement_StaticNew', 'TakeProgress', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {
                            LoadListFeesDailyCommiss(1);
                            CloseProgress();
                        }
                        else {
                            SetProgress(Obj);

                            if (Obj[0].Curr == '100') {
                                $('#hiIsSQLData').val('1');
                                LoadListFeesDailyCommiss(1);
                                CloseProgress();
                            }
                            else {
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            //显示进度
            function ShowProgress() {
                var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                var ht = parseInt($(window).scrollTop());
                $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
            }
            //关闭进度
            function CloseProgress() {
                clearInterval(ProgressInterval);
                $(".datagrid-mask").hide();
                $(".datagrid-mask-msg").hide();
            }
            //设置进度
            function SetProgress(Obj) {
                var i = 20; // parseInt(Obj[0].Curr);

                $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
                $('#DivMsg').html(Obj[0].MessageInfo);
            }

            function SearchData() {
                //if ($("#CostIDs").val() == "") {
                //    HDialog.Info("统计费项不能为空");
                //    return;
                //}
                $("#SearchDlg").dialog("close");
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);
              
            }
            //ShowProgress();

            //加载数据
            function LoadData(_Data) {
                //加载已经统计了的数据
                $("#TableContainer").datagrid({
                    data: _Data,
                    method: "post",
                    nowrap: true,
                    pageSize: top.ListPageSize,
                    pageList: [50, 100, 300],
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $('#SearchDlg').dialog('close');
                        var pg = $("#TableContainer").datagrid("getPager");
                        CloseProgress();
                        if (pg) {
                            $(pg).pagination({
                                onBeforeRefresh: function () {

                                },
                                onRefresh: function (pageNumber, pageSize) {

                                },
                                onChangePageSize: function () {
                                },
                                onSelectPage: function (Pn, Ps) {
                                    LoadListFeesDailyCommiss(Pn);
                                    $('#TableContainer').datagrid('options').pageNumber = Pn;
                                    $('#TableContainer').datagrid('options').pageSize = Ps;
                                }
                            });
                        }
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });
                $('#SearchDlg').dialog('close');
            }

            function Export(strXlsName, exportGrid) {

                var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                var l = $('<input type="hidden" id="txtName" name="txtName" />');
                i.val(ChangeToTable3(exportGrid, Headcolumn, ExcelCol));
                i.appendTo(f);
                l.val(strXlsName);
                l.appendTo(f);
                f.appendTo(document.body).submit();
                document.body.removeChild(f);
            }
            //初始化加载数据
            // LoadData();
            LoadListFeesDailyCommiss(1);

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('LedgerStatement_StaticNew', 'TakeProgress', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {

                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {
                            $('#hiIsSQLData').val('1');
                            LoadListFeesDailyCommiss(1);
                            CloseProgress();
                        }
                        else {
                            SetProgress(Obj);

                            if (Obj[0].Curr == '100') {
                                $('#hiIsSQLData').val('1');
                                LoadListFeesDailyCommiss(1);
                                CloseProgress();
                            }
                            else {
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

        </script>
    </form>
</body>
</html>
