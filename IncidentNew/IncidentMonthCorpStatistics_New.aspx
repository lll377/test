<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentMonthCorpStatistics_New.aspx.cs" Inherits="M_Main.IncidentNew.IncidentMonthCorpStatistics_New" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>报事按月汇总发生量统计</title>
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
        <input id="Attribute" name="Attribute" value="" type="hidden" />
        <input id="TypeCode" name="TypeCode" value="" type="hidden" />
        <input id="TypeID" name="TypeID" type="hidden" runat="server" />
        <input id="CommIDs" name="CommIDs" value="" type="hidden" runat="server" />
        <input id="OrganCode" name="OrganCode" value="" type="hidden" runat="server" />
        <input id="hiIsSQLData" name="hiIsSQLData" value="-1" type="hidden" />
        <input id="hiCommNames" style="width: 8px; height: 22px" type="hidden"
            size="1" name="hiCommNames" runat="server"><input id="Hidden1" style="width: 8px; height: 22px" type="hidden"
                size="1" name="CommIDs" runat="server">
        <input id="HChargeMode" style="width: 8px; height: 22px" type="hidden"
            size="1" name="HChargeMode" runat="server">

        <input id="hCommID" name="hCommID" value="" type="hidden" runat="server" />
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">

                <tr>
                    <td class="TdTitle">项目名称
                    </td>
                    <td class="TdContent" colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();"></textarea>
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
                <tr>
                    <td class="TdTitle">统计年度</td>
                    <td class="TdContent" colspan="3">
                        <input id="StartDate" name="StartDate" style="width: 150px;" onclick="SelStart()" runat="server" class="Wdate" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
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

            function SelStart() {
                $("#StartDate").val("");
                WdatePicker({ dateFmt: 'yyyy' });
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
                    field: 'OrganName', title: '区域', align: 'center', width: 100
                },
                {
                    field: 'CommName', title: '项目', align: 'center', width: 100
                }

            ]]

            var column = [
                [
                    { colspan: 3, title: '1月', width: 300 },
                    { colspan: 3, title: '2月', width: 300 },
                    { colspan: 3, title: '3月', width: 300 },
                    { colspan: 3, title: '4月', width: 300 },
                    { colspan: 3, title: '5月', width: 300 },
                    { colspan: 3, title: '6月', width: 300 },
                    { colspan: 3, title: '7月', width: 300 },
                    { colspan: 3, title: '8月', width: 300 },
                    { colspan: 3, title: '9月', width: 300 },
                    { colspan: 3, title: '10月', width: 300 },
                    { colspan: 3, title: '11月', width: 300 },
                    { colspan: 3, title: '12月', width: 300 },
                    { colspan: 3, title: '年度累计', width: 300 },
                ],
                [
                    { field: 'January', title: '总计', align: 'left', sortable: true },
                    { field: 'JanuaryWritten', title: '书面', align: 'center', sortable: true },
                    { field: 'JanuaryAssign', title: '口派', align: 'center', sortable: true },

                    { field: 'February', title: '总计', align: 'center', sortable: true },
                    { field: 'FebruaryWritten', title: '书面', align: 'center', sortable: true },
                    { field: 'FebruaryAssign', title: '口派', align: 'center', sortable: true },

                    { field: 'March', title: '总计', align: 'center', sortable: true },
                    { field: 'MarchWritten', title: '书面', align: 'center', sortable: true },
                    { field: 'MarchAssign', title: '口派', align: 'center', sortable: true },

                    { field: 'April', title: '总计', align: 'center', sortable: true },
                    { field: 'AprilWritten', title: '书面', align: 'center', sortable: true },
                    { field: 'AprilAssign', title: '口派', align: 'center', sortable: true },

                    { field: 'May', title: '总计', align: 'center', sortable: true },
                    { field: 'MayWritten', title: '书面', align: 'center', sortable: true },
                    { field: 'MayAssign', title: '口派', align: 'center', sortable: true },

                    { field: 'June', title: '总计', align: 'center', sortable: true },
                    { field: 'JuneWritten', title: '书面', align: 'center', sortable: true },
                    { field: 'JuneAssign', title: '口派', align: 'center', sortable: true },

                    { field: 'July', title: '总计', align: 'center', sortable: true },
                    { field: 'JulyWritten', title: '书面', align: 'center', sortable: true },
                    { field: 'JulyAssign', title: '口派', align: 'center', sortable: true },

                    { field: 'August', title: '总计', align: 'center', sortable: true },
                    { field: 'AugustWritten', title: '书面', align: 'center', sortable: true },
                    { field: 'AugustAssign', title: '口派', align: 'center', sortable: true },

                    { field: 'September', title: '总计', align: 'center', sortable: true },
                    { field: 'SeptemberWritten', title: '书面', align: 'center', sortable: true },
                    { field: 'SeptemberAssign', title: '口派', align: 'center', sortable: true },

                    { field: 'October', title: '总计', align: 'center', sortable: true },
                    { field: 'OctoberWritten', title: '书面', align: 'center', sortable: true },
                    { field: 'OctoberAssign', title: '口派', align: 'center', sortable: true },

                    { field: 'November', title: '总计', align: 'center', sortable: true },
                    { field: 'NovemberWritten', title: '书面', align: 'center', sortable: true },
                    { field: 'NovemberAssign', title: '口派', align: 'center', sortable: true },

                    { field: 'December', title: '总计', align: 'center', sortable: true },
                    { field: 'DecemberWritten', title: '书面', align: 'center', sortable: true },
                    { field: 'DecemberAssign', title: '口派', align: 'center', sortable: true },

                    { field: 'MonthCount', title: '总计', align: 'center', sortable: true },
                    { field: 'MonthCountWritten', title: '书面', align: 'center', sortable: true },
                    { field: 'MonthCountAssign', title: '口派', align: 'center', sortable: true },
                ]
            ];

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
                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '' || rowData == undefined || rowData.rows.length == 0) {
                            HDialog.Info('请先生成报表');
                        }
                        else {
                            window.open("IncidentMonthCorpStatistics_New_outexcel.aspx");
                        }
                    }
                }

            ];


            function SelTypeName() {

                HDialog.Open('600', '600', '../DialogNew/CorpIncidentTypeDlg.aspx?IsCheck=1&IsAll=True&IsTJ=true', '选择报事类别', true, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    if (arrRet != undefined) {
                        $("#TypeCode").val(arrRet.code);
                        $("#TypeID").val(arrRet.id);
                        $("#TypeName").searchbox("setText", arrRet.FullTypeName);
                    }
                    else {
                        $("#TypeCode").val();
                        $("#TypeID").val();
                        $("#TypeName").searchbox('clear');
                    }
                });
            }

            var ProgressInterval;

            function SearchData() {

                if ($("#StartDate").val() == "" || $("#StartDate").val() == "") {
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

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('JHNewIncidentReport6', 'CorpIncidentStaticMonthHappStartTask', $('#frmForm').serialize(),
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
            $('#hiIsSQLData').val('1');
            //加载数据
            function LoadData() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    title: '',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: true,
                    remoteSort: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("JHNewIncidentReport6", "CorpIncidentStaticMonthHappLoadData", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
                $("#SearchDlg").dialog("close");
            }

            function Export(strXlsName, exportGrid) {
                var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                var l = $('<input type="hidden" id="txtName" name="txtName" />');
                i.val(ChangeToTable2(exportGrid, Column, Column));
                i.appendTo(f);
                l.val(strXlsName);
                l.appendTo(f);
                f.appendTo(document.body).submit();
                document.body.removeChild(f);
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
                $.tool.DataPostNoLoading('JHNewIncidentReport6', 'CorpIncidentStaticMonthHappTakeProgress', $('#frmForm').serialize(),
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
