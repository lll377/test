﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EvaluationList.aspx.cs" Inherits="M_Main.HouseNew.EvaluationList" %>

<!DOCTYPE html >
<html>
<head id="Head1" runat="server">
    <title>评价人信息</title>
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
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="FrmForm" runat="server">
        <div style="height: 75px; width: auto">
            <div style="height: 75px; width: 75px; float: left; padding-left: 20px">
                <img id="img" src="../frame/img/panda.png" style="height: 75px; width: 75px;" />
            </div>
            <div style="height: 75px; width: auto; float: left; padding-left: 40px">
                <span id="EvaluationCustName" style="font-size: 14px; height: 25px; display: block">张三</span>
                <span id="BuildRoomName" style="font-size: 14px; height: 25px; display: block">楼栋</span>
                <span id="Score" style="font-size: 14px; height: 25px; display: block">平均评分：1  评价人次：1</span>
            </div>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 400px; height: 150px;">
            <table style="width: 100%; padding-top: 5px">
                <tr>
                    <td class="TdTitle">评价分数</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="EvaluationScoreBg" name="EvaluationScoreBg" style="width: 95%; border: 1px solid #cccccc;" onkeyup="javascript:CheckInputIntFloat(this);" onchange="javascript:CheckInputIntFloat(this);" onblur="javascript:CheckInputIntFloat(this);" />
                    </td>
                    <td class="TdTitle">-</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="EvaluationScoreEnd" name="EvaluationScoreEnd" style="width: 95%; border: 1px solid #cccccc;" onkeyup="javascript:CheckInputIntFloat(this);" onchange="javascript:CheckInputIntFloat(this);" onblur="javascript:CheckInputIntFloat(this);" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">评价日期</td>
                    <td class="TdContent">
                        <input id="EvaluationDateBg" name="EvaluationDateBg" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" style="width: 95%; border: 1px solid #cccccc;" />
                    </td>
                    <td class="TdTitle">-</td>
                    <td class="TdContent">
                        <input id="EvaluationDateEnd" name="EvaluationDateEnd" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" style="width: 95%; border: 1px solid #cccccc;" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 100%;" id="TableContainer">
        </div>
        <input type="hidden" id="EvaluationCustID" name="EvaluationCustID" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function CheckInputIntFloat(oInput) {
                if ('' != oInput.value.replace(/\d{1,}\.{0,1}\d{0,}/, '')) {
                    oInput.value = oInput.value.match(/\d{1,}\.{0,1}\d{0,}/) == null ? '' : oInput.value.match(/\d{1,}\.{0,1}\d{0,}/);
                }
            }

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h-76);
            }
            InitTableHeight();

            var column = [[
                { field: 'KeeperCode', title: 'KeeperCode', width: 200, align: 'left', sortable: false, hidden: true },
                {
                    field: 'KeeperName', title: '管家名称', width: 200, align: 'left', sortable: false,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href=\"#\" onclick=\"KeeperDetail('" + row.KeeperCode + "','" + row.KeeperName + "','" + row.RegionBuildName + "')\">" + row.KeeperName + "</a>";
                        return str;
                    }
                },
                { field: 'RoomCount', title: '管辖户数', width: 200, align: 'left', sortable: false },
                //{ field: 'BuildRoomName', title: '评价人项目楼栋单元', width: 200, align: 'left', sortable: false },
                {
                    field: 'Score', title: '评价分数', width: 200, align: 'left', sortable: false,
                    formatter: function (value, row, index) {
                        var str = "";
                        if (parseFloat(row.Score) <= 3)
                            str = "<span style='color:red'>" + row.Score + "</span>";
                        else
                            str = "<span style='color:green'>" + row.Score + "</span>";
                        return str;
                    }
                },
                { field: 'EvaluationContent', title: '评价内容', width: 200, align: 'left', sortable: false },
                { field: 'EvaluationDate', title: '评价日期', width: 200, align: 'left', sortable: false }
            ]];

            //管家详情
            function KeeperDetail(KeeperCode, KeeperName, RegionBuildName) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open(900, 600, '../HouseNew/KeeperList.aspx?KeeperCode=' + KeeperCode + '&KeeperName=' + escape(KeeperName) + '&RegionBuildName=' + escape(RegionBuildName), '管家详情', false, function callback(_Data) {
                });
            }

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function LoadList() {
                $("#EvaluationCustID").val(GetQueryString("EvaluationCustID"));
                $("#EvaluationCustName").text(unescape(GetQueryString("EvaluationCustName")));
                $("#BuildRoomName").text(unescape(GetQueryString("BuildRoomName")));
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    title: '',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    rownumbers: true,
                    sortOrder: "asc",
                    border: false,
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("HouseKeeper", "HouseKeeperDetail", "TableContainer", param);
                    }
                });
                $.tool.DataPostChk('FrmForm', 'HouseKeeper', 'EvaluationInfo', $('#FrmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        $("#Score").text('平均评分：' + JSON.parse(_Data).rows[0].Score + '  评价人次：' + JSON.parse(_Data).rows[0].EvaluationCount);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
                $("#SearchDlg").dialog("close");
            }
            LoadList();

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
