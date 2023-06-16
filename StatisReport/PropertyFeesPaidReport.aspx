<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PropertyFeesPaidReport.aspx.cs" Inherits="M_Main.StatisReport.PropertyFeesPaidReport" %>

<!DOCTYPE html>
<html>
<head>
    <title>物管费实收分解表</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: 200px;
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

    </style>
</head>
<body>
    <form id="frmForm">
        <input id="hiDetailType" type="hidden" name="hiDetailType" runat="server" />
        <input id="hiStatID" type="hidden" name="hiStatID" runat="server" />
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <div id="TableContainer" style="width: 100%;"></div>
        <div id="TableContainerDetail" style="width: 100%;"></div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">项目名称
                    </td>
                    <td class="TdContent">
                        <input class="easyui-searchbox" id="CostName" style="width:180px;" data-options="editable:false" name="CostName" searcher="SelCost" runat="server" />
                        <input type="hidden" id="CostID" name="CostID" runat="server" />
                    </td>
                    <td class="TdTitle">统计方式
                    </td>
                    <td class="TdContent">
                        <select id="StatType" name="StatType" runat="server">
                            <option value="0" selected>全部</option>
                            <option value="1" >按客户</option>
                            <option value="2" >按房屋</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">收款开始时间
                    </td>
                    <td class="TdContent">
                        <input id="ChargeBeginDate" name="ChargeBeginDate" onclick="WdatePicker()" runat="server" />
                    </td>
                    <td class="TdTitle">收款结束时间
                    </td>
                    <td class="TdContent">
                        <input id="ChargeEndDate" name="ChargeEndDate" onclick="WdatePicker()" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用开始时间
                    </td>
                    <td class="TdContent">
                        <input id="FeesBeginDate" name="FeesBeginDate" onclick="WdatePicker()" runat="server" />
                    </td>
                    <td class="TdTitle">费用结束时间
                    </td>
                    <td class="TdContent">
                        <input id="FeesEndDate" name="FeesEndDate" onclick="WdatePicker()" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContent">
                        <select id="RegionSNum" name="RegionSNum" runat="server">
                            <option value="0" selected>全部</option>
                        </select>
                    </td>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContent">
                        <select id="BuildSNum" name="BuildSNum" runat="server" width="60">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">费用展示形式</td>
                    <td class="TdContent">
                        <select id="ShowType" name="ShowType" runat="server">
                            <option value="0" selected>月度</option>
                            <option value="1">年度</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">

                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchData();">查询</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Clear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function Clear() {
                $("#CostID").val("");
                $("#CostName").searchbox("setValue","");
            }

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");

                 LoadList(1, 500);
            }
            InitFunction();

            var frozenColumns = [[
                { field: 'CommName', title: '项目名称', align: 'left', sortable: true, width: 150, hidden:true },
                {
                    field: 'ChargeDate', title: '年份', align: 'left', sortable: true, width: 150
                },
                { field: 'CostName', title: '费用名称', align: 'left', sortable: true, width: 150, hidden:true },
                { field: 'RegionName', title: '区域', align: 'left', sortable: true, width: 150 },
            ]];

            //设置表格列
            var NewCol = [
                [
                    { field: ' ', title: '月份', colspan: 12, align: 'center'},
                ],
                [
                    { field: '1月', title: '1月', align: 'center', sortable: true, width: 120 },
                    { field: '2月', title: '2月', align: 'center', sortable: true, width: 120 },
                    { field: '3月', title: '3月', align: 'center', sortable: true, width: 120 },
                    { field: '4月', title: '4月', align: 'center', sortable: true, width: 120 },
                    { field: '5月', title: '5月', align: 'center', sortable: true, width: 120 },
                    { field: '6月', title: '6月', align: 'center', sortable: true, width: 120 },
                    { field: '7月', title: '7月', align: 'center', sortable: true, width: 120 },
                    { field: '8月', title: '8月', align: 'center', sortable: true, width: 120 },
                    { field: '9月', title: '9月', align: 'center', sortable: true, width: 120 },
                    { field: '10月', title: '10月', align: 'center', sortable: true, width: 120 },
                    { field: '11月', title: '11月', align: 'center', sortable: true, width: 120 },
                    { field: '12月', title: '12月', align: 'center', sortable: true, width: 120 }
                ]
            ];

            var Headcolumn = [[
                
                { field: 'ChargeDate', title: '年份', align: 'left', sortable: true, width: 150 },
                { field: 'RegionName', title: '区域', align: 'left', sortable: true, width: 150 },
            ]];

            var ExcelCol = [
                {
                    field: 'ChargeDate', title: '年份', align: 'left', sortable: true, width: 150
                },
                { field: 'RegionName', title: '区域', align: 'left', sortable: true, width: 150 },
            ];

            var HeadcolumnDetail = [[
                
                { field: 'ChargeDate', title: '年份', align: 'left', sortable: true, width: 150 },
                { field: 'RegionName', title: '区域', align: 'left', sortable: true, width: 150 },
            ]];

            var ExcelColDetail = [
                {
                    field: 'ChargeDate', title: '年份', align: 'left', sortable: true, width: 150
                },
                { field: 'RegionName', title: '区域', align: 'left', sortable: true, width: 150 },
            ];

            function SetEasyUiColumn(_Data) {
                var col = "";
                var obj = "";

                var ExcelCols = "";
                var Headcolumns = "";

                var CommName = _Data.rows[0].CommName;
                var ChargeEndDate = formatDate($("#ChargeEndDate").val(),"yyyy年MM月");
                var FeesEndDate = formatDate($("#FeesEndDate").val(),"yyyy");
                var ExcelTitle = CommName + "项目" + ChargeEndDate + "实收（住宅）" + FeesEndDate + "年度物业服务费";
                var i = 1;
                if (_Data.rows.length > 0) {
                        obj = _Data.rows;
                        for (var attr in obj[0]) {
                            if (attr != "RN" && attr != "Sort" && attr != "FeesYear" && attr != "StatID" && attr != "CommID" && attr != "CommName" && attr != "CostID" && attr != "CostName" && attr != "RegionSNum" && attr != "RegionName" && attr != "ChargeBeginDate" && attr != "ChargeEndDate" && attr != "ChargeDate" && attr != "OptUserCode" && attr != "TotalAmount" && attr != "Remarks") {
                                var colTitle = attr.split('-')[0] + '年' + attr.split('-')[1] + '月';
                                col = col + "," + "{ field: \'" + attr + "\', title: \'" + attr + "\', align: \'center\', sortable: true,width:100,formatter:function (value, row, index) { var str = value ==\"\" ? \"-\":value ;return str;}}";
                                i++;
                            }
                        }
                        col = col.substr(1, col.length);

                        if ($("#ShowType").val() == "1") {
                            Headcolumns = "[[{field:'Title',title:'" + ExcelTitle + "',align:'center',rowspan:1,colspan:" + (i + 3) + "}],";
                            Headcolumns = Headcolumns + "[{field: 'ChargeDate', title: '月份', align: 'center', sortable: true, width: 150,rowspan:2,colspan:1 },{ field: 'RegionName', title: '区域', align: 'left', sortable: true, width: 150,rowspan:2,colspan:1 },{ title: '" + FeesEndDate + "年', colspan: " + (i + 1) + " }],";

                            Headcolumns = Headcolumns + "[" + col + ",{ field: 'TotalAmount', title: '小计', align: 'center', sortable: true, width: 100 },{ field: 'Remarks', title: '备注', align: 'center', sortable: true, width: 150 }]]";
                            ExcelCols = "[{field: 'ChargeDate', title: '月份', align: 'center', sortable: true, width: 150 },{ field: 'RegionName', title: '区域', align: 'left', sortable: true, width: 150 }," + col + ",{ field: 'TotalAmount', title: '小计', align: 'center', sortable: true, width: 150 },{ field: 'Remarks', title: '备注', align: 'center', sortable: true, width: 150 }]";

                            col = "[[{ field: ' ', title: '月份', colspan: " + (i+1) + ", align: 'center' },],[" + col + ",{ field: 'TotalAmount', title: '小计', align: 'center', sortable: true, width: 150 },{ field: 'FeesYear', title: '年度详细导出', align: 'center', sortable: true, width: 150 ,formatter: function (value, row, index) { var str = row.Sort==2 ? '<a style=\"color:blue;\" onclick=\"ToExcel('+value+')\">年度详细</a>':'';return str;} }]]";
                        }
                        else {
                            Headcolumns = "[[{field:'Title',title:'" + ExcelTitle + "',align:'center',rowspan:1,colspan:" + (i + 3) + "}],";
                            Headcolumns = Headcolumns + "[{field: 'ChargeDate', title: '月份', align: 'center', sortable: true, width: 150,rowspan:2,colspan:1 },{ field: 'RegionName', title: '区域', align: 'left', sortable: true, width: 150,rowspan:2,colspan:1 },{ title: '" + FeesEndDate + "年', colspan: " + (i + 1) + " }],";

                            Headcolumns = Headcolumns + "[" + col + ",{ field: 'TotalAmount', title: '小计', align: 'center', sortable: true, width: 100 },{ field: 'Remarks', title: '备注', align: 'center', sortable: true, width: 150 }]]";
                            ExcelCols = "[{field: 'ChargeDate', title: '月份', align: 'center', sortable: true, width: 150 },{ field: 'RegionName', title: '区域', align: 'left', sortable: true, width: 150 }," + col + ",{ field: 'TotalAmount', title: '小计', align: 'center', sortable: true, width: 150 },{ field: 'Remarks', title: '备注', align: 'center', sortable: true, width: 150 }]";

                            col = "[[{ field: ' ', title: '月份', colspan: " + i + ", align: 'center' },],[" + col + ",{ field: 'TotalAmount', title: '小计', align: 'center', sortable: true, width: 150 }]]";
                        }

                        Headcolumn = eval(Headcolumns);
                        ExcelCol = eval(ExcelCols);
                        
                        NewCol = eval(col);

                        
                    }

            }

            function SetEasyUiColumnDetail(_Data) {
                var col = "";
                var obj = "";

                var ExcelCols = "";
                var Headcolumns = "";

                var CommName = _Data.rows[0].CommName;
                var ChargeEndDate = formatDate($("#ChargeEndDate").val(),"yyyy年MM月");
                var FeesEndDate = formatDate($("#FeesEndDate").val(),"yyyy");
                var ExcelTitle = CommName + "项目" + ChargeEndDate + "实收（住宅）" + FeesEndDate + "年度物业服务费";
                var i = 1;
                if (_Data.rows.length > 0) {
                        obj = _Data.rows;
                        for (var attr in obj[0]) {
                            if (attr != "RN" && attr != "Sort" && attr != "FeesYear" && attr != "StatID" && attr != "CommID" && attr != "CommName" && attr != "CostID" && attr != "CostName" && attr != "RegionSNum" && attr != "RegionName" && attr != "ChargeBeginDate" && attr != "ChargeEndDate" && attr != "ChargeDate" && attr != "OptUserCode" && attr != "TotalAmount" && attr != "Remarks") {
                                var colTitle = attr.split('-')[0] + '年' + attr.split('-')[1] + '月';
                                col = col + "," + "{ field: \'" + attr + "\', title: \'" + attr + "\', align: \'center\', sortable: true,width:100}";
                                i++;
                            }
                        }
                        col = col.substr(1, col.length);

                        for (var r = 0; r < obj.length; r++) {
                            if (obj[r].Sort == 1) {
                                FeesEndDate = obj[r].FeesYear;
                                ExcelTitle = CommName + "项目" + ChargeEndDate + "实收（住宅）" + FeesEndDate + "年度物业服务费";
                            }
                        }

                        Headcolumns = "[[{field:'Title',title:'" + ExcelTitle + "',align:'center',rowspan:1,colspan:" + (i + 3) + "}],";
                        Headcolumns = Headcolumns + "[{field: 'ChargeDate', title: '月份', align: 'center', sortable: true, width: 150,rowspan:2,colspan:1 },{ field: 'RegionName', title: '区域', align: 'left', sortable: true, width: 150,rowspan:2,colspan:1 },{ title: '" + FeesEndDate + "年', colspan: " + (i + 1) + " }],";

                        Headcolumns = Headcolumns + "[" + col + ",{ field: 'TotalAmount', title: '小计', align: 'center', sortable: true, width: 100 },{ field: 'Remarks', title: '备注', align: 'center', sortable: true, width: 150 }]]";
                        ExcelCols = "[{field: 'ChargeDate', title: '月份', align: 'center', sortable: true, width: 150 },{ field: 'RegionName', title: '区域', align: 'left', sortable: true, width: 150 }," + col + ",{ field: 'TotalAmount', title: '小计', align: 'center', sortable: true, width: 150 },{ field: 'Remarks', title: '备注', align: 'center', sortable: true, width: 150 }]";

                        HeadcolumnDetail = eval(Headcolumns);
                        ExcelColDetail = eval(ExcelCols);
                        
                    }

            }

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
                            Export('物管费实收分解表', $('#TableContainer'));
                        }
                    }
                }
            ];
          

            var ProgressInterval;

            function SearchData() {
                if ($("#ChargeBeginDate").val() == "") {
                    HDialog.Info("收款开始时间不能为空");
                    return;
                }
                if ($("#ChargeEndDate").val() == "") {
                    HDialog.Info("收款结束时间不能为空");
                    return;
                }
                if ($("#FeesBeginDate").val() == "") {
                    HDialog.Info("费用开始时间不能为空");
                    return;
                }
                if ($("#FeesEndDate").val() == "") {
                    HDialog.Info("费用结束时间不能为空");
                    return;
                }
                if ($("#CostID").val() == "")
                {
                    HDialog.Info("费用项目不能为空");
                    return;
                }
                $("#SearchDlg").dialog("close");
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 3000);
            }
            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('PropertyFeesPaidReport', 'StartTask', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        LoadList(1, 500);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            

            function LoadList(page, rows) {
                
                $.tool.DataPostNoLoading('PropertyFeesPaidReport', 'LoadData', "page=" + page + "&rows=" + rows + "&" + $('#frmForm').serialize(),
                    function Init() {

                    },
                    function callback(_Data) {
                        //var Data = _Data;
                        var Data = eval("(" + _Data + ")"); //转换为json对象

                        if (Data.rows.length > 0) {
                            SetEasyUiColumn(Data);
                        }
                        LoadListBindingColumn(Data, rows);

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                        return false;
                    });
            }
            function LoadListBindingColumn(_Data, rows) {
                $("#TableContainer").datagrid({
                    data: _Data,
                    method: "get",
                    nowrap: false,
                    pageSize: rows,
                    pageList: [300, 300, 500, 800, 1000],
                    columns: NewCol,
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

                    },
                    onBeforeLoad: function (param) {

                    }
                });
            }


            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('PropertyFeesPaidReport', 'TakeProgress', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {
                            LoadList(1, 500);
                            CloseProgress();
                        }
                        else {

                            SetProgress(Obj);

                            if (Obj[0].Curr == '100') {

                                LoadList(1, 500);

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
                $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
                $('#DivMsg').html(Obj[0].MessageInfo);
            }


            function SelCost() {
                var varReturn;

                //HDialog.Open('700', '400', "../dialogNew/CorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {


                //    if (_Data != "") {//**获得返回 刷新
                //        var data = JSON.parse(_Data);
                //        $('#CostID').val(data.CostID);
                //        $('#CostName').searchbox('setValue', data.CostName);
                //    }
                //});
                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#CostID').val(varObjects[0]);
                        $('#CostName').searchbox('setValue', varObjects[1]);

                    }
                });
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
            function ToExcel(value) {
                $.tool.DataPostNoLoading('PropertyFeesPaidReport', 'LoadData', "page=1&rows=500&" + $('#frmForm').serialize()+"&FeesYear="+value,
                    function Init() {

                    },
                    function callback(_Data) {

                        var Data = eval("(" + _Data + ")"); //转换为json对象

                        SetEasyUiColumnDetail(Data);

                        $("#TableContainerDetail").datagrid({
                            data: Data,
                            method: "get",
                            nowrap: false,
                            pageSize: 500,
                            pageList: [300, 300, 500, 800, 1000],
                            columns: NewCol,
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
                                ExportDetail('物管费实收分解表', $('#TableContainerDetail'));
                            },
                            onBeforeLoad: function (param) {

                            }
                        });

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                        return false;
                    });
            }
            function ExportDetail(strXlsName, exportGrid) {
                var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                var l = $('<input type="hidden" id="txtName" name="txtName" />');
                i.val(ChangeToTable3(exportGrid, HeadcolumnDetail, ExcelColDetail));
                i.appendTo(f);
                l.val(strXlsName);
                l.appendTo(f);
                f.appendTo(document.body).submit();
                document.body.removeChild(f);
            }
        </script>
    </form>
</body>
</html>