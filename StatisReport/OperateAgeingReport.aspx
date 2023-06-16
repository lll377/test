<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OperateAgeingReport.aspx.cs" Inherits="M_Main.StatisReport.OperateAgeingReport" %>

<!DOCTYPE html>
<html>
<head>
    <title>运营账龄报表</title>
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
            height: 240px;
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
            width: 91.7%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }

        #CommNames {
            width: 91.7%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }
    </style>
</head>
<body>
    <form id="frmForm">
        <input id="CostIDs" name="CostIDs" value="" type="hidden" />
        <input id="hCommID" name="hCommID" value="" type="hidden" runat="server" />
        <input id="hBuildSNum" name="hBuildSNum" value="" type="hidden" runat="server" />
        <input id="hYearPeriod" name="hYearPeriod" value="" type="hidden" runat="server" />
        <input id="CommIDs" name="CommIDs" value="" type="hidden" runat="server" />
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <div id="TableContainer" style="width: 100%;"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">项目名称
                    </td>
                    <td class="TdContent" colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" ru="server" onclick="SelComm();"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用项目
                    </td>
                    <td class="TdContent" colspan="3">
                        <textarea id="CostNames" name="CostNames" runat="server" onclick="SelCost();"></textarea>
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">费用开始时间
                    </td>
                    <td class="TdContent">
                        <input id="FeesStartDate" name="FeesStartDate" onclick="SelStart();" runat="server" />
                    </td>
                    <td class="TdTitle">费用结束时间</td>
                    <td class="TdContent">
                        <input id="FeesEndDate" name="FeesEndDate" onclick="SelStart();" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">截止收款时间
                    </td>
                    <td class="TdContent">
                        <input id="FeesCutDate" name="FeesCutDate" onclick="SelStart();" runat="server" />
                    </td>
                    <%--                    <td class="TdTitle">显示方式</td>
                    <td class="TdContent">
                        <select id="Displaymode" name="Displaymode" runat="server">
                            <option value="0">按账龄</option>
                            <option value="1">按年度</option>
                        </select>
                    </td>--%>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchData();">统计</a>
                    </td>
                </tr>
            </table>
        </div>

        <div id="DlgDetail" class="easyui-dialog" title="运营账龄报表明细" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1024px; height: 500px; padding: 10px;">
            <div style="width: 90%; background-color: #cccccc;" id="TableContainerDetail"></div>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            $(function () {

                //获取进度
                $.tool.DataPostNoLoading('OperateAgeingReport', 'TakeProgress', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {
                            LoadData();
                        }
                        else {
                            SetProgress(Obj);
                            if (Obj[0].Curr == '100') {
                                LoadData();
                            }
                            else {
                                LoadData();
                                //展示进度
                                ShowProgress();
                                //获取执行情况进度
                                ProgressInterval = setInterval("TakeProgress()", 1000);
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

            });

            function SelComm() {
                var w = $(window).width() * 0.7;
                HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommIDs").val(arrRet.id);
                    $("#CommNames").val(arrRet.name);
                });
            }

            function SelStart() {
                WdatePicker();
            }

            function Clear() {
                $("#CostIDs").val("");
                $("#CostNames").val("");
                $("#FeesStartDate").val("");
                $("#FeesEndDate").val("");
                $("#FeesCutDate").val("");
            }

            function SelCost() {
                HDialog.Open('700', '450', "../dialogNew/MultiCorpCostDlg.aspx" + "?SysCostSign=B0001&Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                    var varReturn = _data;
                    if (varReturn != "") {
                        //**获得返回 刷新
                        var varObjects = varReturn.split("\t");
                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').val(varObjects[1]);
                    }
                });

            }

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $("#TableContainerDetail").css("height", "440px");
            }
            InitFunction();

            var frozenColumns =
                [[
                    { field: 'OrganName', title: '区域', align: 'center', width: 150, sortable: false },
                    { field: 'CommName', title: '项目', align: 'center', width: 150, sortable: false },
                    { field: 'BuildName', title: '楼宇', align: 'center', width: 100, sortable: false },
                    { field: 'SumRoomCount', title: '总户数', align: 'center', width: 80, sortable: false },
                    { field: 'SumBuildArea', title: '总面积', align: 'center', width: 100, sortable: false }
                ]];
            var column =
                [
                    [
                        { colspan: 2, align: 'center', title: '一年期欠费' },
                    ],
                    [
                        { field: 'RoomCount1', title: '欠费户数', align: 'center', width: 100, sortable: false },
                        { field: 'YearPeriod1', title: '欠费金额', align: 'center', width: 100, sortable: false }
                    ]
                ];

            var toolbar = [
                {
                    text: '统计',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            var ProgressInterval;

            function SearchData() {
                if ($("#CommIDs").val() == "") {
                    HDialog.Info("请选择需要统计的小区");
                    return;
                }
                if ($("#CostIDs").val() == "") {
                    HDialog.Info("统计费项不能为空");
                    return;
                }
                if ($("#FeesCutDate").val() == "") {
                    HDialog.Info("请选择收款截止时间");
                    return;
                }
                if ($("#FeesStartDate").val() == "") {
                    HDialog.Info("请选择费用开始时间");
                    return;
                }
                if ($("#FeesEndDate").val() == "") {
                    HDialog.Info("请选择费用结束时间");
                    return;
                }

                var begintime = new Date($("#FeesStartDate").val());
                var endtime = new Date($("#FeesEndDate").val());

                if (begintime > endtime) {
                    HDialog.Info('费用结束时间不能小于费用开始时间！');
                    return;
                }
                $("#SearchDlg").dialog("close");
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);
            }

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('OperateAgeingReport', 'StartTask', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //加载数据
            function LoadData() {
                //加载已经统计了的数据
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: true,
                    pageSize: [100],
                    pageList: [100, 200, 500, 1000],
                    frozenColumns: frozenColumns,
                    columns: column,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                        $.tool.MergeEasyUiGrid("TableContainer", "CommName");
                        $.tool.MergeEasyUiGrid("TableContainer", "OrganName");
                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("OperateAgeingReport", "LoadData", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });
            }

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('OperateAgeingReport', 'TakeProgress', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {
                            LoadData();
                            CloseProgress();
                        }
                        else {

                            SetProgress(Obj);

                            if (Obj[0].Curr == '100') {

                                CloseProgress();
                                if ('1' == '1') {
                                    $.tool.DataPost('OperateAgeingReport', 'GetEasyUiColumn', $('#frmForm').serialize(),
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            var colarray = JSON.parse(_Data);
                                            //console.log(colarray);
                                            var miny = colarray.rows[0].Miny;
                                            var maxy = colarray.rows[0].Maxy;
                                            var col = "";
                                            var col2 = "";
                                            for (var i = miny; i <= maxy; i++) {
                                                col = col + "{ colspan: 2, align: \'center\', title: \'" + i + "年期欠费\' },";
                                                col2 = col2 + "{ field: \'RoomCount" + i + "\', title: \'欠费户数\', align: \'center\', width: 100, sortable: false },{ field: \'YearPeriod" + i + "\', title: \'欠费金额\', align: \'center\', width: 100, sortable: false,formatter: function (value, row, index) {return \"<a href=\'#\' onclick=\'ShowDetail(" + i + ",\"+row.BuildSNum+\",\"+row.CommID+\");\'>\"+value+\"</a>\"}},";
                                                //console.log(col2)
                                            }

                                            var col3 = "[[" + col + "{ colspan: 2, align: \'center\', title: \'合计\' }],[" + col2 + "{ field: \'RoomCount\', title: \'欠费户数\', align: \'center\', width: 100, sortable: false },{ field: \'DealAmount\', title: \'欠费金额\', align: \'center\', width: 100, sortable: false }]]";
                                            //console.log(eval(col3));
                                            column = eval(col3);
                                            LoadData();
                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                } else {
                                    LoadData();
                                }
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

            function formatNumberRgx(num) {
                console.log(num);
                var parts = num.toString().split(".");
                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                return parts.join(".");
            };

            function formatNumberRgx2(num) {
                //console.log(num);
                return num;
            };


            var columnDetail = [[
                { field: 'OrganName', title: '区域', align: 'center', width: 150, sortable: false },
                { field: 'CommName', title: '项目', align: 'center', width: 150, sortable: false },
                { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 100 },
                { field: 'BuildSNum', title: '楼宇', align: 'left', sortable: true, width: 100 },
                { field: 'DealAmount', title: '欠费金额', align: 'left', sortable: true, width: 100 },
                { field: 'BuildArea', title: '面积', align: 'left', sortable: true, width: 100 }
            ]]
            function ShowDetail(YearPeriod, BuildSNum, CommID) {
                $('#hCommID').val(CommID);
                $('#hBuildSNum').val(BuildSNum);
                $('#hYearPeriod').val(YearPeriod);

                $("#TableContainerDetail").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: columnDetail,
                    fitColumns: false,
                    singleSelect: true,
                    rownumbers: true,
                    pagination: true,
                    border: false,
                    width: "100%",
                    toolbar: '#tb',
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("OperateAgeingReport", "LoadDataDetail", "TableContainerDetail", param);
                    },
                });

                $('#DlgDetail').parent().appendTo($("form:first"))
                $('#DlgDetail').dialog('open');
            }

        </script>
    </form>
</body>
</html>
