<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentCorpRepair.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentCorpRepair" %>

<!DOCTYPE html>
<html>
<head>
    <title>公司报事汇总统计2</title>
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
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: 300px;
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
        <input type="hidden" id="TypeCode" name="TypeCode" runat="server" />
        <input type="hidden" id="IsDetail" name="IsDetail" runat="server" />
        <input id="CommIDs" name="CommIDs" value="" type="hidden" runat="server" />
        <input id="CorpTypeID" name="CorpTypeID" type="hidden" runat="server" />
        <input id="hCommID" name="hCommID" value="" type="hidden" runat="server" />

        <input type="hidden" id="hitype" name="hitype" runat="server" />
        <input type="hidden" id="hiduty" name="hiduty" runat="server" />
        <input type="hidden" id="hicommid" name="hicommid" runat="server" />

        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <div id="TableContainer"></div>

        <div id="DlgDetail" class="easyui-dialog" title="报事明细" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1024px; height: 500px; padding: 10px;">
            <div id="TableContainerDetail"></div>
        </div>

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
                    <%--<td class="TdTitle">报事责任
                    </td>
                    <td class="TdContent">
                        <select id="Duty" name="Duty" runat="server" style="width: 154px;">
                            <option value="" selected="selected">全部</option>
                            <option value="物业类">物业类</option>
                            <option value="地产类">地产类</option>
                        </select>
                    </td>--%>
                </tr>
                <tr>
                    <td class="TdTitle">报事类别
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="TypeName" name="TypeName"
                            style="width: 154px;" searcher="SelTypeName" />
                    </td>
                    <td class="TdTitle">是否投诉
                    </td>
                    <td class="TdContent">
                        <select id="IsTousu" name="IsTousu" style="width: 154px;" runat="server">
                            <option value="">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">受理时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" id="BeginIncidentDate" name="BeginIncidentDate" style="width: 150px;" runat="server"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" class="Wdate"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" id="EndIncidentDate" name="EndIncidentDate" style="width: 150px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">预约处理时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" id="BeginReserveDate" name="BeginReserveDate" style="width: 150px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" id="EndReserveDate" name="EndReserveDate" style="width: 150px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">关闭时间从
                    </td>
                    <td class="TdContent">
                        <input type="text" id="BeginCloseTime" name="BeginCloseTime" style="width: 150px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContent">
                        <input type="text" id="EndCloseTime" name="EndCloseTime" style="width: 150px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">数据挖掘</td>
                    <td class="TdContentSearch">
                        <input type="checkbox" id="CkIsDetail" name="CkIsDetail" />
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

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");

                $("#TableContainerDetail").css("height", (h * 0.7) + "px");
            }
            InitFunction();

            var column = [[
                {
                    field: 'OrganName', width: 300, title: '区域', align: 'left', formatter: function (value, row, index) {
                        if (row.OrganName != undefined && row.OrganName != '') {
                            return row.OrganName;
                        }
                    }
                },
                {
                    field: 'CommName', width: 100, title: '项目', align: 'left', formatter: function (value, row, index) {
                        if (row.CommName != undefined && row.CommName != '') {
                            return row.CommName;
                        }
                    }
                },
                {
                    field: '报事总量', width: 100, title: '报事总量', align: 'left', formatter: function (value, row, index) {
                        var str = "";
                        if (row.CommName.indexOf("合计") > 0) {
                            str = row.报事总量;
                        } else {
                            str = "<a href=\"#\" onclick=\"ShowDetail(1,\'\',\'" + row.CommID + "\');\">" + row.报事总量 + "</a>";
                        }
                        return str;
                    }
                },
                {
                    field: '物业报事量', width: 100, title: '物业报事量', align: 'left', formatter: function (value, row, index) {
                        var str = "";
                        if (row.CommName.indexOf("合计") > 0) {
                            str = row.物业报事量;
                        } else {
                            str = "<a href=\"#\" onclick=\"ShowDetail(1,\'物业类\',\'" + row.CommID + "\');\">" + row.物业报事量 + "</a>";
                        }
                        return str;
                    }
                },
                {
                    field: '地产报事量', width: 100, title: '地产报事量', align: 'left', formatter: function (value, row, index) {
                        var str = "";
                        if (row.CommName.indexOf("合计") > 0) {
                            str = row.地产报事量;
                        } else {
                            str = "<a href=\"#\" onclick=\"ShowDetail(1,\'地产类\',\'" + row.CommID + "\');\">" + row.地产报事量 + "</a>";
                        }
                        return str;
                    }
                },
                {
                    field: '总关闭量', width: 100, title: '总关闭量', align: 'left', formatter: function (value, row, index) {
                        var str = "";
                        if (row.CommName.indexOf("合计") > 0) {
                            str = row.总关闭量;
                        } else {
                            str = "<a href=\"#\" onclick=\"ShowDetail(2,\'\',\'" + row.CommID + "\');\">" + row.总关闭量 + "</a>";
                        }
                        return str;
                    }
                },
                {
                    field: '物业关闭量', width: 100, title: '物业关闭量', align: 'left', formatter: function (value, row, index) {
                        var str = "";
                        if (row.CommName.indexOf("合计") > 0) {
                            str = row.物业关闭量;
                        } else {
                            str = "<a href=\"#\" onclick=\"ShowDetail(2,\'物业类\',\'" + row.CommID + "\');\">" + row.物业关闭量 + "</a>";
                        }
                        return str;
                    }
                },
                {
                    field: '地产关闭量', width: 100, title: '地产关闭量', align: 'left', formatter: function (value, row, index) {
                        var str = "";
                        if (row.CommName.indexOf("合计") > 0) {
                            str = row.地产关闭量;
                        } else {
                            str = "<a href=\"#\" onclick=\"ShowDetail(2,\'地产类\',\'" + row.CommID + "\');\">" + row.地产关闭量 + "</a>";
                        }
                        return str;
                    }
                },
                { field: '总关闭率', width: 100, title: '总关闭率', align: 'left' },
                { field: '物业关闭率', width: 100, title: '物业关闭率', align: 'left' },
                { field: '地产关闭率', width: 100, title: '地产关闭率', align: 'left' }
            ]]

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function SelTypeName() {
                var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlgLazyLoad.aspx";
                HDialog.Open('800', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=1&Duty=&IsCheck=1&IsEdit=true&IncidentPlace=', '选择报事类别', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#TypeCode").val(arrRet.code);
                    $("#CorpTypeID").val(arrRet.id);
                    $("#TypeName").searchbox("setText", arrRet.FullTypeName);
                });


            }

            var ProgressInterval;
            function SearchData() {

                if ($("#OrganCode").val() != "01") {
                    if ($("#CommIDs").val() == "") {
                        HDialog.Info("请选择需要统计的小区");
                        return;
                    }
                }

                if ($('#CkIsDetail').is(':checked')) {
                    $('#IsDetail').val("1");
                }
                else {
                    $('#IsDetail').val("0");
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
                $.tool.DataPostNoLoading('CorpRepair_Static', 'StartTask', $('#frmForm').serialize(),
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
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CorpRepair_Static&Command=LoadData&' + $('#frmForm').serialize(),
                    method: "get",
                    nowrap: true,
                    pageSize: 150,
                    pageList: [150, 300, 500],
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    },
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
                $.tool.DataPostNoLoading('CorpRepair_Static', 'TakeProgress', $('#frmForm').serialize(),
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

            //显示详情
            var detailFrozenColumns = [[
                {
                    field: 'IncidentNum', title: '报事编号', width: 170, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail(" + index + ");\">" + row.IncidentNum + "</a>";
                        return str;
                    }
                },
                { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
                { field: 'RegionalPlace', title: '公区名称', width: 100, align: 'left', sortable: true },

                { field: 'IncidentContent', title: '报事内容', width: 200, align: 'left', sortable: true },
                { field: 'DealSituation', title: '处理情况', width: 150, align: 'left', sortable: true },
            ]]

            var detailColumn = [[
                { field: 'OrganName', title: '区域名称', width: 120, align: 'left', sortable: true },
                { field: 'CommName', title: '项目名称', width: 120, align: 'left', sortable: true },
                {
                    field: 'IncidentDealStateName', title: '工单状态', width: 60, align: 'left', sortable: true
                },
                { field: 'CoordinateNum', title: '派工单号', width: 120, align: 'left', sortable: true },


                {
                    field: 'DrClass', title: '报事类型', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.DrClass == '1') {
                            str = "书面报事";
                        } else if (row.DrClass == '2') {
                            str = "口派报事";
                        }
                        return str;
                    }

                },
                { field: 'Duty', title: '报事责任', width: 80, align: 'left', sortable: true },
                {
                    field: 'BigTypeName', title: '报事类别', width: 100, align: 'left', sortable: true
                },
                { field: 'FineTypeName', title: '原因细类', width: 120, align: 'left', sortable: true },
                { field: 'DealLimit', title: '处理时限(小时)', width: 80, align: 'left', sortable: true },
                { field: 'IncidentMode', title: '报事方式', width: 80, align: 'left', sortable: true },
                { field: 'IncidentSource', title: '报事来源', width: 80, align: 'left', sortable: true },
                { field: 'IncidentPlace', title: '报事位置', width: 80, align: 'left', sortable: true },
                { field: 'LocalePositionName', title: '公区方位', width: 100, align: 'left', sortable: true },
                { field: 'LocaleFunctionName', title: '公区功能', width: 100, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 220, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true },
                { field: 'IncidentMan', title: '报事人', width: 200, align: 'left', sortable: true },
                { field: 'Phone', title: '报事电话', width: 100, align: 'left', sortable: true },
                { field: 'DealMan', title: '责任人', width: 100, align: 'left', sortable: true },
                { field: 'UserName', title: '管家', width: 100, align: 'left', sortable: true },
                { field: 'AdmiMan', title: '受理人', width: 200, align: 'left', sortable: true },
                { field: 'IncidentDate', title: '受理时间', width: 200, align: 'left', sortable: true },
                { field: 'ReserveDate', title: '预约处理时间', width: 200, align: 'left', sortable: true },
                { field: 'DispDate', title: '分派时间', width: 150, align: 'left', sortable: true },
                { field: 'DispMan', title: '分派人', width: 150, align: 'left', sortable: true },
                { field: 'ReceivingDate', title: '接单时间', width: 150, align: 'left', sortable: true },
                { field: 'ArriveData', title: '到场时间', width: 150, align: 'left', sortable: true },
                { field: 'MainEndDate', title: '完成时间', width: 150, align: 'left', sortable: true },
                { field: 'FinishUser', title: '完成人', width: 150, align: 'left', sortable: true },

                { field: 'RatedWorkHour', title: '额定工时', width: 100, align: 'left', sortable: true },
                { field: 'KPIRatio', title: '绩效系数', width: 100, align: 'left', sortable: true },
                { field: 'RatedWorkHourNumber', title: '完成数量', width: 100, align: 'left', sortable: true },
                {
                    field: 'IsTouSu', title: '是否投诉', width: 88, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = '';
                        if (value == '1') {
                            str = "是";
                        }
                        else {
                            str = "否";
                        }
                        return str;
                    }
                },
                { field: 'DueAmount', title: '收费金额', width: 100, align: 'left', sortable: true },
                { field: 'EquipmentName', title: '设备名称', width: 100, align: 'left', sortable: true },
                { field: 'CloseTime', title: '关闭时间', width: 100, align: 'left', sortable: true },
                { field: 'CloseUser', title: '关闭人', width: 100, align: 'left', sortable: true },
                { field: 'CloseSituation', title: '关闭情况', width: 200, align: 'left', sortable: true },
                {
                    field: 'CloseType', title: '关闭类型', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = '';
                        if (value == '0') {
                            str = "正常关闭";
                        }
                        if (value == '1') {
                            str = "非正常关闭";
                        }
                        return str;
                    }
                },
                { field: 'NoNormalCloseReasons', title: '非正常关闭原因', width: 100, align: 'left', sortable: true },
                {
                    field: 'IsBeoverdue', title: '是否逾期', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'IsBeoverdueHour', title: '处理逾期小时', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = '';
                        if (value != 0 && value != '') {
                            str = value;
                        }
                        return str;
                    }
                },
                { field: 'OverdueReason', title: '逾期原因', width: 80, align: 'left', sortable: true },
                { field: 'reminderCount', title: '催办', width: 100, align: 'left', sortable: true },
                { field: 'ReplyContent', title: '回访情况', width: 100, align: 'left', sortable: true },
                {
                    field: 'ReplyResult', title: '回访结果', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = '';
                        if (value == '1') {
                            str = "成功回访";
                        }
                        if (value == '0') {
                            str = "不成功回访";
                        }
                        return str;
                    }
                },
                { field: 'ServiceQuality', title: '回访评价', width: 100, align: 'left', sortable: true },
                { field: 'ReplyDate', title: '回访时间', width: 100, align: 'left', sortable: true },
                { field: 'ReplyMan', title: '回访人', width: 100, align: 'left', sortable: true },
                { field: 'IsTransmit', title: '是否转发', width: 100, align: 'left', sortable: true },
                {
                    field: 'CloseGoBackTime', title: '取消完成', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = '';
                        if (value == '' || value == null) {
                            str = "否";
                        }
                        else {
                            str = "是";
                        }
                        return str;
                    }
                },
                {
                    field: 'ReplyGoBackTime', title: '取消关闭', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = '';
                        if (value == '' || value == null) {
                            str = "否";
                        }
                        else {
                            str = "是";
                        }
                        return str;
                    }
                },
                { field: 'DeleteDate', title: '废弃时间', width: 100, align: 'left', sortable: true },
                { field: 'DeleteMan', title: '废弃人', width: 100, align: 'left', sortable: true },
                { field: 'DeleteReasons', title: '废弃原因', width: 100, align: 'left', sortable: true }

            ]];

            function ShowDetail(type, duty, commid) {

                $('#hitype').val(type);
                $('#hiduty').val(duty);
                $('#hicommid').val(commid);

                $("#TableContainerDetail").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    //url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CorpRepair_Static&Command=LoadDataDetail&' + $('#frmForm').serialize(),
                    //method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    frozenColumns: detailFrozenColumns,
                    columns: detailColumn,
                    fitColumns: false,
                    singleSelect: true,
                    rownumbers: true,
                    pagination: true,
                    border: false,
                    width: "100%",
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CorpRepair_Static", "LoadDataDetail", "TableContainerDetail", param);
                    },
                });

                $('#DlgDetail').parent().appendTo($("form:first"))
                $('#DlgDetail').dialog('open');
            }

            function Detail(rowIndex) {
                var w = $(window).width();
                var h = $(window).height();
                var rows = $('#TableContainerDetail').datagrid('getRows');
                var row = rows[rowIndex];
                Cache.SetData("IncidentInfos", JSON.stringify(row));
                var content = '../IncidentNewJH/IncidentControlManage.aspx?IncidentID=' + row.IncidentID;
                HDialog.Open(w, h, content, '报事查询详细记录', true, function callback(_Data) {
                    Cache.SetData("IncidentInfos", '');
                });
            }
        </script>
    </form>
</body>
</html>

