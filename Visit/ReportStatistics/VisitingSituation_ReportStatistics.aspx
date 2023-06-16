<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisitingSituation_ReportStatistics.aspx.cs" Inherits="M_Main.Visit.VisitingSituation_ReportStatistics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>拜访情况</title>
    <script type="text/javascript" src="../../jscript/jquery-1.11.3.min.js"></script>
    <script src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../../jscript/export.js"></script>
    <script type="text/javascript" src="../../jscript/Cache.js"></script>
    <script type="text/javascript" src="../../jscript/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 5px;
            width: 760px;
            height: 200px;
        }

        .SearchTable {
            width: 760px;
            height: auto;
        }

        .TdContent input, select {
            border: 1px #cccccc solid;
        }

        #CommNames {
            width: 95%;
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
        <input id="BuildSNums" type="hidden" size="1" name="BuildSNums" value="" runat="server" />
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
                    <td class="TdContent" colspan="5">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();"></textarea>
                        <input id="CommIDs" name="CommIDs" value="" type="hidden" runat="server" />
                        <input id="hCommID" name="hCommID" value="" type="hidden" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">拜访时间
                    </td>
                    <td class="TdContent">
                        <input id="CompleteTimeStart" name="CompleteTimeStart" style="width: 120px;" class="easyui-datebox" data-options="editable:false" runat="server" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input id="CompleteTimeEnd" name="CompleteTimeEnd" style="width: 120px;" class="easyui-datebox" data-options="editable:false" runat="server" />
                    </td>
                    <td class="TdTitle">房屋状态</td>
                    <td class="TdContent">
                        <select id="RoomStateList" name="RoomStateList" class="easyui-combobox" style="width: 160px;" runat="server"
                            data-options="editable:false,panelHeight: 200,panelWidth:'auto',required:true,multiple:true">
                        </select>
                    </td>
                </tr>

                <tr>
                    <td colspan="6" style="text-align: center; padding-top: 10px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-sum'" onclick="SearchData();">统计并查询</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="Clear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input id="OrganName" name="OrganName" type="hidden" value="" runat="server" />
        <input id="OrganCode" name="OrganCode" type="hidden" value="" runat="server" />
        <input id="CommName" name="CommName" type="hidden" value="" runat="server" />
        <input id="IsLode" name="IsLode" type="hidden" value="0" runat="server" />
        <script src="../../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            //选择管理项目
            function SelCommInfo() {
                if ($('#hCommID').val() == "") {
                    var w = $(window).width() * 0.7;
                    HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#CommIDs").val(arrRet.id);
                        Cache.SetData("InformCommIDLists", arrRet.id)
                        $("#CommNames").val(arrRet.name);
                    });
                }
            }
            //清空条件
            function Clear() {
                if ($('#hCommID').val() == "") {
                    $("#CommName").val("");
                    $("#CommNames").val("");
                    $("#CommIDs").val("");
                    Cache.SetData("InformCommIDLists", '')
                }
                $('#CompleteTimeStart').datebox("setValue", "");
                $('#CompleteTimeEnd').datebox("setValue", "");
            }
            //当前时间
            function CreateTime() {
                var curr_time = new Date();
                var str = curr_time.getFullYear() + "-";
                str += curr_time.getMonth() + 1 + "-";
                str += curr_time.getDate();
                $('#CompleteTimeEnd').val(str);
            };
            //初始化页面
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();
            CreateTime();
            var frozenColumns = [[
                { field: '区域', title: '区域', align: 'center', width: 300 },
                { field: '公司', title: '公司', align: 'center', width: 200 },
                { field: '项目名称', title: '项目名称', align: 'center', width: 150 }
            ]];
            //  区域	公司	项目名称	总户数	完成户数	覆盖率
            var column;
            column = [[
                { field: '总户数', title: '总户数', align: 'center', width: 120 },
                { field: '完成户数', title: '完成户数', align: 'center', width: 120 },
                { field: '覆盖率', title: '覆盖率', align: 'center', width: 240 }
            ]];

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }
                , '-',
                {
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        window.location.href = 'VisitingSituation_ReportStatistics_Export.aspx';
                    }
                }
            ];

            var ProgressInterval;
            function Search() {
                LoadData();
            }
            function getDays(strDateStart, strDateEnd) {
                var strSeparator = "-"; //日期分隔符
                var oDate1;
                var oDate2;
                var iDays;
                oDate1 = strDateStart.split(strSeparator);
                oDate2 = strDateEnd.split(strSeparator);
                var strDateS = new Date(oDate1[0], oDate1[1] - 1, oDate1[2]);
                var strDateE = new Date(oDate2[0], oDate2[1] - 1, oDate2[2]);
                iDays = parseInt(Math.abs(strDateS - strDateE) / 1000 / 60 / 60 / 24)//把相差的毫秒数转换为天数
                return iDays;
            }

            function SearchData() {
                if ($("#CommIDs").val() == "") {
                    HDialog.Info("请选择统计的项目");
                    return;
                }
                if (getDays($("#CompleteTimeStart").val(), $("#CompleteTimeEnd").val()) > 366) {
                    HDialog.Info("只能查询一年内的报表数据");
                    return;
                }
                $("#SearchDlg").dialog("close");
                $("#IsLode").val("-1");
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度  
                ProgressInterval = setInterval("TakeProgress()", 1000);
            }
            function StartTask() {
                //if ($('#CompleteTimeEnd').val() != "" && $('#CompleteTimeStart').val() != "") {
                //    var CompleteTimeEnd = new Date($('#CompleteTimeEnd').val());
                //    var CompleteTimeStart = new Date($('#CompleteTimeStart').val());
                //    if (CompleteTimeEnd.getFullYear() != CompleteTimeStart.getFullYear()) {
                //        HDialog.Info("无法进行跨年份查询");
                //        return;
                //    }
                //}
                //启动一个任务
                $.tool.DataPostNoLoading('VisitingSituation_ReportStatistics', 'StartTask', $('#frmForm').serialize(),
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
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
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
                        $("#SearchDlg").dialog("close");
                        CloseProgress();
                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("VisitingSituation_ReportStatistics", "LoadCorpData", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });
            }
            LoadData();
            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('VisitingSituation_ReportStatistics', 'TakeProgress', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {

                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {
                            CloseProgress();
                            LoadData();
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

