﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentMonNewStatistics.aspx.cs" Inherits="M_Main.IncidentNew.IncidentMonNewStatistics" %>

<!DOCTYPE html>

<html>
<head>
    <title>按月分类统计</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/export.js"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

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
        <input type="hidden" name="himm" id="himm" value="" />
        <input id="hiIsSQLData" name="hiIsSQLData" value="-1" type="hidden" />
        <input id="hiCommNames" style="width: 8px; height: 22px" type="hidden"
            size="1" name="hiCommNames" runat="server">
        <input id="CommIDs" style="width: 8px; height: 22px" type="hidden"
            size="1" name="CommIDs" runat="server">
        <input id="hCommID" name="hCommID" value="" type="hidden" runat="server" />
        <input id="TypeCode" name="TypeCode" type="hidden" runat="server" />
        <input id="TypeID" name="TypeID" type="hidden" runat="server" />

        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <div id="TableContainer" class="easyui-datagrid"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContent" colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();" style="width: 90%;"></textarea>
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">报事类型
                    </td>
                    <td class="TdContent">
                        <select id="SelClass" name="SelClass" runat="server" style="width: 154px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">报事来源
                    </td>
                    <td class="TdContentSearch">
                        <select id="IncidentSource" style="width: 154px;" name="IncidentSource" runat="server">
                            <option value="" selected="selected">全部</option>
                            <option value="客户报事">客户报事</option>
                            <option value="自查报事">自查报事</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">报事位置
                    </td>
                    <td class="TdContent">
                        <select id="IncidentPlace" name="IncidentPlace" style="width: 154px;" runat="server">
                            <option value="">全部</option>
                            <option value="户内">户内</option>
                            <option value="公区">公区</option>
                        </select>
                    </td>
                    <td class="TdTitle">报事责任
                    </td>
                    <td class="TdContent">
                        <select id="Duty" name="Duty" runat="server" style="width: 154px;">
                            <option value="" selected="selected">全部</option>
                            <option value="物业类">物业类</option>
                            <option value="地产类">地产类</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">报事类别</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="TypeName" name="TypeName" searcher="SelTypeName"
                            style="width: 144px;" />
                    </td>
                    <td class="TdTitle">是否投诉</td>
                    <td class="TdContent">
                        <select id="IsTousu" name="IsTousu" style="width: 142px;" runat="server">
                            <option value="">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                </tr>
<%--                <tr>
                    <td class="TdTitle">报事区域</td>
                    <td class="TdContent">
                        <select id="IncidentPlace" name="IncidentPlace" style="width: 142px;" runat="server">
                            <option value="全部">全部</option>
                            <option value="户内">户内</option>
                            <option value="公区">公区</option>
                        </select>
                    </td>
                </tr>--%>
                <%--         <tr>
                <td class="TdTitle">统计年度
                    </td>
                    <td class="TdContentSearch">
                        <select id="CreYear" style="width: 140px; height: 22px;" name="CreYear" runat="server" class="easyui-combobox">
                           <option selected="selected"></option>
                            </select>
                    </td>
                    <td class="TdTitle">
                    </td>
                    <td >
                    </td>
                </tr>--%>

                <tr>
                    <td class="TdTitle">统计年度</td>
                    <td class="TdContent" colspan="3">
                        <input id="CreYear" name="CreYear" class="Wdate" style="width: 150px;" onclick="SelStart()" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td colspan="8" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchData();">统计</a>
                    </td>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function SelCommInfo() {
                if ($('#hCommID').val() == '') {
                    var w = $(window).width() * 0.7;
                    HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#CommIDs").val(arrRet.id);
                        $("#CommNames").val(arrRet.name);
                    });
                }
            }

            function SelTypeName() {
                //HDialog.Open('600', '600', '../DialogNew/CorpIncidentTypeDlg.aspx?IsCheck=1&IsAll=True&IsTJ=true&IsClosed=1', '选择报事类别', true, function callback(_Data) {
                //    var arrRet = JSON.parse(_Data);
                //    if (arrRet != undefined) {
                //        $("#TypeCode").val(arrRet.code);
                //        $("#TypeID").val(arrRet.id);
                //        $("#TypeName").searchbox("setText", arrRet.FullTypeName);
                //    }
                //    else {
                //        $("#TypeCode").val();
                //        $("#TypeID").val();
                //        $("#TypeName").searchbox('clear');
                //    }
                //});
                var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlgLazyLoad.aspx";
                HDialog.Open('800', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=1&Duty=物业类&IsCheck=1&IsEdit=true&IncidentPlace=', '选择报事类别', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#TypeCode").val(arrRet.code);
                    $("#TypeID").val(arrRet.id);
                    $("#TypeName").searchbox("setText", arrRet.FullTypeName);
                });
            }




            function Clear() {
                $("#CostIDs").val("");
                $("#CostNames").val("");
            }

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();



            var frozenColumns = [[
                {
                    field: 'OrganName', width: 300, title: '区域', align: 'left', formatter: function (value, row, index) {
                        if (row.attributes.OrganName != undefined && row.attributes.OrganName != '') {
                            return row.attributes.OrganName;
                        }
                    }
                },
                {
                    field: 'CommName', width: 100, title: '项目', align: 'left', formatter: function (value, row, index) {
                        if (row.attributes.CommName != undefined && row.attributes.CommName != '') {
                            return row.attributes.CommName;
                        }
                    }
                },
                {
                    field: 'text', title: '报事类别', width: 250, align: 'left', sortable: true
                    , formatter: function (value, row, index) {
                        //if (row.attributes.January != undefined && row.attributes.January != '') {
                        //    return row.attributes.January;
                        //}
                        return row.text.replace(/　/g, '');

                    }
                }
            ]];

            var Columns = [[
                {
                    field: 'January', title: '1月', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.attributes.January != undefined && row.attributes.January != '') {
                            return row.attributes.January;
                        }
                    }
                },
                {
                    field: 'February', title: '2月', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.attributes.February != undefined && row.attributes.February != '') {
                            return row.attributes.February;
                        }
                    }
                },
                {
                    field: 'March', title: '3月', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.attributes.March != undefined && row.attributes.March != '') {
                            return row.attributes.March;
                        }
                    }
                },
                {
                    field: 'April', title: '4月', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.attributes.April != undefined && row.attributes.April != '') {
                            return row.attributes.April;
                        }
                    }
                },
                {
                    field: 'May', title: '5月', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.attributes.May != undefined && row.attributes.May != '') {
                            return row.attributes.May;
                        }
                    }
                },
                {
                    field: 'June', title: '6月', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.attributes.June != undefined && row.attributes.June != '') {
                            return row.attributes.June;
                        }
                    }
                },
                {
                    field: 'July', title: '7月', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.attributes.July != undefined && row.attributes.July != '') {
                            return row.attributes.July;
                        }
                    }
                },
                {
                    field: 'August', title: '8月', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.attributes.August != undefined && row.attributes.August != '') {
                            return row.attributes.August;
                        }
                    }
                },
                {
                    field: 'September', title: '9月', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.attributes.September != undefined && row.attributes.September != '') {
                            return row.attributes.September;
                        }
                    }
                },
                {
                    field: 'October', title: '10月', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.attributes.October != undefined && row.attributes.October != '') {
                            return row.attributes.October;
                        }
                    }
                },
                {
                    field: 'November', title: '11月', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.attributes.November != undefined && row.attributes.November != '') {
                            return row.attributes.November;
                        }
                    }
                },
                {
                    field: 'December', title: '12月', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.attributes.December != undefined && row.attributes.December != '') {
                            return row.attributes.December;
                        }
                    }
                },
                {
                    field: 'MonthCount', title: '全年合计', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.attributes.MonthCount != undefined && row.attributes.MonthCount != '') {
                            return row.attributes.MonthCount;
                        }
                    }
                }
            ]]



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
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        window.location.href = 'IncidentMonNewStatisticsCreExcel.aspx';

                    }
                    //{
                    //text: 'Excel导出',
                    //iconCls: 'icon-page_white_excel',
                    //handler: function () {
                    //    var rowData = $('#TableContainer').datagrid('getData');
                    //    if (rowData == '') {
                    //        HDialog.Info('请先生成报表');
                    //    }
                    //    else {

                    //        Export('按月分类统计', $('#TableContainer'));
                    //    }
                    //}
                }
            ];
            function SelStart() {
                $("#CreYear").val("");
                WdatePicker({ dateFmt: 'yyyy' });
            }
            var Headcolumn = [[
                { field: 'Unit', title: '单位名称', width: 100, align: 'left', sortable: true },
                { field: 'SelClass', title: '报事类型', width: 100, align: 'left', sortable: true }
            ],
            [
                { field: 'January', title: '1月', width: 100, align: 'left', sortable: true },
                { field: 'February', title: '2月', width: 100, align: 'left', sortable: true },
                { field: 'March', title: '3月', width: 100, align: 'left', sortable: true },
                { field: 'April', title: '4月', width: 100, align: 'left', sortable: true },
                { field: 'May', title: '5月', width: 100, align: 'left', sortable: true },
                { field: 'June', title: '6月', width: 100, align: 'left', sortable: true },
                { field: 'July', title: '7月', width: 100, align: 'left', sortable: true },
                { field: 'August', title: '8月', width: 100, align: 'left', sortable: true },
                { field: 'September', title: '9月', width: 100, align: 'left', sortable: true },
                { field: 'October', title: '10月', width: 100, align: 'left', sortable: true },
                { field: 'November', title: '11月', width: 100, align: 'left', sortable: true },
                { field: 'December', title: '12月', width: 100, align: 'left', sortable: true },
                { field: 'MonthCount', title: '全年合计', width: 100, align: 'left', sortable: true }
            ]]

            var ExcelCol = [
                { field: 'Unit', title: '单位名称', width: 100, align: 'left', sortable: true },
                { field: 'SelClass', title: '报事类型', width: 100, align: 'left', sortable: true },
                { field: 'January', title: '1月', width: 100, align: 'left', sortable: true },
                { field: 'February', title: '2月', width: 100, align: 'left', sortable: true },
                { field: 'March', title: '3月', width: 100, align: 'left', sortable: true },
                { field: 'April', title: '4月', width: 100, align: 'left', sortable: true },
                { field: 'May', title: '5月', width: 100, align: 'left', sortable: true },
                { field: 'June', title: '6月', width: 100, align: 'left', sortable: true },
                { field: 'July', title: '7月', width: 100, align: 'left', sortable: true },
                { field: 'August', title: '8月', width: 100, align: 'left', sortable: true },
                { field: 'September', title: '9月', width: 100, align: 'left', sortable: true },
                { field: 'October', title: '10月', width: 100, align: 'left', sortable: true },
                { field: 'November', title: '11月', width: 100, align: 'left', sortable: true },
                { field: 'December', title: '12月', width: 100, align: 'left', sortable: true },
                { field: 'MonthCount', title: '全年合计', width: 100, align: 'left', sortable: true }

            ];



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


            function SearchData() {

                if ($("#CreYear").val() == "" || $("#CreYear").val() == "") {
                    HDialog.Info("统计年度不能为空");
                    return;
                }

                if ($("#OrganCode").val() != "01") {
                    if ($("#CommIDs").val() == "") {
                        HDialog.Info("请选择需要统计的小区");
                        return;
                    }
                }
                $("#SearchDlg").dialog("close");
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);
            }

            $('#hiIsSQLData').val('1');
            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('CSCustInfo', 'IncidentMonNewStatisticsStartTask', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {

                        //  LoadData();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //加载数据
            function LoadData() {
                $("#TableContainer").treegrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSCustInfo&Command=IncidentMonNewStatisticsLoadData&hiIsSQLData=' + $('#hiIsSQLData').val(),
                    treeField: 'text',
                    idField: 'id',
                    method: "get",
                    nowrap: true,
                    pageSize: 50,
                    pageList: [50, 150, 300],
                    columns: Columns,
                    frozenColumns: frozenColumns,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    initialState: "collapsed",
                    onClickRow: function (node) {

                    },
                    onBeforeExpand: function (row, param) {
                        if (row) {
                            $("#TableContainer").treegrid('options').url = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSCustInfo&Command=IncidentMonNewStatisticsLoadDataChild&hiIsSQLData=' + $('#hiIsSQLData').val() + '&TreeCode=' + row.id;
                        }
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                        $.tool.MergeEasyUiGrid("TableContainer", "Unit");
                    },
                    loadFilter: function (data) {
                        if (data.d) {
                            return data.d;
                        } else {
                            return data;
                        }
                    }
                });



            }


            //初始化加载数据
            LoadData();
            //展示进度
            ShowProgress();
            //获取执行情况进度
            ProgressInterval = setInterval("TakeProgress()", 1000);

            TakeProgress();

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('CSCustInfo', 'IncidentMonNewStatisticsTakeProgress', $('#frmForm').serialize(),
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
                                $('#hiIsSQLData').val('1');
                                LoadData();

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


        </script>


    </form>
</body>
</html>
