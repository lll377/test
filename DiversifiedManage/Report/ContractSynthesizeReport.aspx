<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractSynthesizeReport.aspx.cs" Inherits="M_Main.DiversifiedManage.Report.ContractSynthesizeReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>多经综合报表</title>
    <link href="/HM/M_Main/css/base.css" rel="stylesheet" />
    <link href="/HM/M_Main/css/button.css" rel="stylesheet" />
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <style type="text/css">
        .dlg_table tr td.title {
            width: 12%;
            text-align: right;
            color: #7f7f7f;
        }

        .dlg_table tr td.text {
            width: 20%;
            text-align: left;
        }

        .textbox-label {
            cursor: pointer;
        }

        .datagrid-mask-msg {
            height: 40px;
        }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <input id="IsDelete" name="IsDelete" value="0" type="hidden" />
    <input id="search" name="search" type="hidden" />
    <input type="hidden" id="IsDetail" name="IsDetail" value="1" />
    <table id="dg" style="width: 100%; height: 100%; background-color: #cccccc;"></table>
    <div id="toolbar" class="datagrid-toolbar">
        <table cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true,onClick:function(){$('#dlg_search').dialog('open');}">筛选</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel',plain:true,onClick:function(){ExportSet();}">Excel导出</a>
                    </td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true,onClick:function(){InitDetailOrTotalDataGrid('1');}">显示明细</a>
                    </td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true,onClick:function(){InitDetailOrTotalDataGrid('0');}">显示汇总</a>
                    </td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>
                        <a href="javascript:void(0)" title="温馨提示：<br/>&emsp;&emsp;双击表格一行查看多经综合报表费用明细详情!" class="easyui-linkbutton easyui-tooltip" data-options="plain:true,iconCls:'icon-help'"></a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>
                        <div id="p" class="easyui-progressbar" style="width: 300px;"></div>
                    </td>
                    <td style="padding: 0px 5px; vertical-align: bottom;">
                        <label id="lblStatistics"></label>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 900px; padding: 5px;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frm">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">项目名称</td>
                    <td class="text" colspan="5">
                        <input type="text" id="CommName" name="CommName" class="easyui-textbox" runat="server"
                            data-options="prompt:'请单击右侧\'放大镜\'按钮!',editable:false,tipPosition:'bottom',width:'94%',height:'50px',multiline:true,required:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelComm();}" />
                        <input type="hidden" id="CommID" name="CommID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>服务类别</span></td>
                    <td class="text">
                        <input id="BusinessType" name="BusinessType" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',multiple:true,
                                    valueField:'id',textField:'text',
                                    data: [{id: '房屋租赁',text: '房屋租赁'},{id: '车位租赁',text: '车位租赁'},{id: '广告租赁',text: '广告租赁'},{id: '场地租赁',text: '场地租赁'},
                                    {id: '物业有偿服务',text: '物业有偿服务'},{id: '美居服务',text: '美居服务'},{id: '社区新零售',text: '社区新零售'}]"
                            runat="server" />
                    </td>
                    <td class="title"><span>合同类别</span></td>
                    <td class="text" colspan="4">
                        <input id="ContractTypeName" name="ContractTypeName" class="easyui-textbox"
                            data-options="prompt:'请单击右侧\'放大镜\'按钮!',editable:false,tipPosition:'bottom',multiline:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelContractType();},width:'90%',height:'50px'"
                            runat="server" />
                        <input type="hidden" id="ContractType" name="ContractType" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>签约类别</span></td>
                    <td class="text">
                        <input id="SigningType" name="SigningType" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',data: [{id: '',text: '全部'},{id: '新签',text: '新签'},{id: '续签',text: '续签'}]"
                            runat="server" />
                    </td>
                    <td class="title"><span>客商类别</span></td>
                    <td class="text" colspan="4">
                        <input id="MerchantsCategoryName" name="MerchantsCategoryName" class="easyui-textbox"
                            data-options="prompt:'请单击右侧\'放大镜\'按钮!',editable:false,tipPosition:'bottom',multiline:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDictionary();},width:'90%',height:'50px'"
                            runat="server" />
                        <input type="hidden" id="MerchantsCategory" name="MerchantsCategory" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title">统计开始时间</td>
                    <td class="text">
                        <input type="text" id="ReportBeginTime" name="ReportBeginTime" class="easyui-datebox" runat="server" data-options="editable:false,required:true" />
                    </td>
                    <td class="title">统计截止时间</td>
                    <td class="text">
                        <input type="text" id="ReportEndTime" name="ReportEndTime" class="easyui-datebox" runat="server" data-options="editable:false,required:true" />
                    </td>
                    <td class="title"></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td style="text-align: center" class="text" colspan="6">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="StartTask();">统计</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearWhere()">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dlg_Export" class="easyui-dialog" title="导出设置" style="width: 300px; padding: 5px;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frmExport">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">管理层级</td>
                    <td class="text" colspan="5">
                        <%--<input id="ManageLevel" name="ManageLevel" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',multiple:false,
                                    valueField:'id',textField:'text',value:'2',
                                    data: [{id: '2',text: '一级'},{id: '4',text: '二级'},{id: '6',text: '三级'},{id: '8',text: '四级'},
                                    {id: '10',text: '五级'}]"
                            runat="server" />--%>
                        <input id="ManageLevel" name="ManageLevel" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',multiple:false,
                                    valueField:'id',textField:'text',value:'2',
                                    data: [{id: '2',text: '一级'},{id: '4',text: '二级'},{id: '6',text: '三级'}]"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" class="text" colspan="6">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel',width:100" onclick="Export();">确定导出</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <input type="hidden" id="HidCommID" name="HidCommID" runat="server" />
    <input type="hidden" id="HidCommName" name="HidCommName" runat="server" />
    <script type="text/javascript">

        function ClearWhere() {
            $('#frm').form('clear');
            $('#SigningType').combobox("setValue", '');
            if ($('#HidCommID').val() != "" && $('#HidCommID').val() != "0") {
                $("#CommName").textbox("setValue", $('#HidCommName').val());
                $("#CommID").val($('#HidCommID').val());
            }
        }
        //选择项目
        function SelComm() {
            if ($('#HidCommID').val() != "" && $('#HidCommID').val() != "0") {
                return;
            }
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/Dialog/Comm.aspx?' + $.param({ "IsPowerPost": "否", "IsPowerLevel": "是" }), '选择项目', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    var id = "", text = "";
                    $.each(data, function (i, item) {
                        id += "," + item.CommID;
                        text += "," + item.CommName;
                    });
                    id = id.substr(1);
                    text = text.substr(1);
                    $("#CommID").val(id);
                    $("#CommName").textbox('setValue', text);
                }
            });
        }
        //选择 合同类别
        function SelContractType() {
            var param = { "Ismultiple": "1" };
            LayerDialog.OpenWin('580', '400', '../DiversifiedManage/Dialog/CotractTypeSelect.aspx?' + $.param(param), "选择合同类别", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#ContractType").val(data.id);
                    $("#ContractTypeName").textbox("setValue", data.text);
                    //根据选择的合同类别 加载合同其他信息
                    LoadContractOtherBaseInformation();
                }
            });
        }
        //选择客商类别
        function SelDictionary() {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Dictionary.aspx?' + $.param({ "Type": '客商类别', "IsMultiple": "是" }), '选择客商类别', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    var id = "", text = "";
                    $.each(data, function (i, item) {
                        id += "," + item.ID;
                        text += "," + item.Name;
                    });
                    id = id.substr(1);
                    text = text.substr(1);
                    $("#MerchantsCategory").val(id);
                    $("#MerchantsCategoryName").textbox('setValue', text);
                }
            });
        }

        var model = { MessageInfo: "(0%)", Curr: 0, StartDate: new Date(), EndDate: new Date() };
        function TakeProgress() {
            $.dataPostJson('ContractSynthesize', 'TaskProgress', $.getParam(), false, false,
                function Init() {
                },
                function callback(data) {
                    if (data.length > 0) {
                        model = data[0];
                        $("#lblStatistics").text("温馨提示:当前数据统计日期 [ " + $.dateFormat(model.StartDate, "yyyy-MM-dd HH:mm:ss") + " ] ");
                        UpdateProgressBar();
                        if (model.Curr > 0 && model.Curr < 100) {
                            setTimeout('TakeProgress()', 3000);
                        } else {
                            InitDataGrid();
                           
                        }
                    } else {
                        $("#lblStatistics").text("温馨提示:请统计数据!");
                        $('#p').progressbar({ text: "(0%)", value: 0 });
                        InitDataGrid();
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function StartTask() {
            if ($('#frm').form("validate")) {
                $("#dlg_search").dialog("close");
                if (model.Curr == 0 || model.Curr == 100) {
                    $.dataPostJson('ContractSynthesize', 'StartTask', $.getParam(), true, false,
                        function Init() {
                            $("#dg").datagrid("loadData", { total: 0, rows: [] });
                        },
                        function callback(data) {
                            if (data.result) {
                                //InitDataGrid();
                                TakeProgress();
                            } else { $.messager.alert('温馨提示', data.msg); }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                } else {
                    $.messager.alert('温馨提示', "数据正在统计中...");
                }
            }
        }

        function UpdateProgressBar() {
            var curDate = new Date();
            if (model.Curr == 100) {
                curDate = model.EndDate;
            }
            $('#p').progressbar({ text: CalculationDateTime($.dateFormat(model.StartDate, "yyyy-MM-dd HH:mm:ss"), $.dateFormat(curDate, "yyyy-MM-dd HH:mm:ss")), value: model.Curr });
        };

        function CalculationDateTime(date1, date2) {
            var date3 = new Date(date2).getTime() - new Date(date1).getTime();   //时间差的毫秒数      
            //计算出相差天数
            var days = Math.floor(date3 / (24 * 3600 * 1000))

            //计算出小时数
            var leave1 = date3 % (24 * 3600 * 1000)    //计算天数后剩余的毫秒数
            var hours = Math.floor(leave1 / (3600 * 1000))

            //计算相差分钟数
            var leave2 = leave1 % (3600 * 1000)        //计算小时数后剩余的毫秒数
            var minutes = Math.floor(leave2 / (60 * 1000))

            //计算相差秒数
            var leave3 = leave2 % (60 * 1000)      //计算分钟数后剩余的毫秒数
            var seconds = Math.round(leave3 / 1000)
            //if (!isValueNull(model.MessageInfo)) {
            //    model.MessageInfo = "初始化数据中...";
            //}
            var str = model.MessageInfo + "(" + model.Curr + "%) ";
            str += "耗时:";
            if (days > 0) {
                str += days + "天";
            }
            if (hours > 0) {
                str += hours + "小时";
            }
            if (minutes > 0) {
                str += minutes + "分钟";
            }
            if (seconds > 0) {
                str += seconds + "秒";
            }
            return str;
        }

        function InitControl() {
            TakeProgress();
        }
        $(function () {
            var h = $(window).height();
            $('#dg').css("height", h + 'px');
            InitDataGrid();
            InitControl();
        });
        var column = [[
            {
                field: 'CommName', title: '项目名称', width: 200, align: 'left', rowspan: 2, formatter: function (value, row, index) {
                    //判断是否为项目
                    if (isValueNull(value)) {
                        return value;
                    } else {
                        return row.OrganName;
                    }
                }
            },
            { field: 'BusinessType', title: '服务类别', width: 100, align: 'center', rowspan: 2 },
            { title: '资源信息', align: 'center', colspan: 8 },
            { title: '签约信息', align: 'center', colspan: 9 },
            { title: '出租信息 ', align: 'center', colspan: 12 },
            { title: '费用信息', align: 'center', colspan: 11 },
            { title: '保证金信息', align: 'center', colspan: 4 }
        ], [
            { field: 'BeforeEffectivePointNum', title: '期初有效点位数量(个)<br/>(1)', width: 130, align: 'center' },
            { field: 'BeforeEffectivePointArea', title: '期初有效点位面积(平米)<br/>(2)', width: 140, align: 'center' },
            { field: 'CurrentNewPointNum', title: '本期新增点位数量(个)<br/>(3)', width: 130, align: 'center' },
            { field: 'CurrentNewPointArea', title: '本期新增点位面积(平米)<br/>(4)', width: 140, align: 'center' },
            { field: 'CurrentStopPointNum', title: '本期停用点位数量(个)<br/>(5)', width: 130, align: 'center' },
            { field: 'CurrentStopPointArea', title: '本期停用点位面积(平米)<br/>(6)', width: 140, align: 'center' },
            { field: 'EndEffectivePointNum', title: '期末有效点位数量(个)<br/>(7=1+3-5)', width: 130, align: 'center' },
            { field: 'EndEffectivePointArea', title: '期末有效点位面积(平米)<br/>(8=2+4-6)', width: 140, align: 'center' },

            { field: 'BeforeEffectiveContractNum', title: '期初有效合同数量(份)<br/>(9)', width: 140, align: 'center' },
            { field: 'CurrentSignContractNum', title: '本期签约合同数量(份)<br/>(10=11+12)', width: 140, align: 'center' },
            { field: 'CurrentSignContractNewNum', title: '其中:新签合同数量(份)<br/>(11)', width: 140, align: 'center' },
            { field: 'CurrentSignContractRenewNum', title: '其中:续签合同数量(份)<br/>(12)', width: 140, align: 'center' },
            { field: 'CurrentSignContractAmount', title: '本期签约合同金额(元)<br/>(13)', width: 140, align: 'center' },
            { field: 'CurrentStopContractNum', title: '本期终止合同数量(份)<br/>(14)', width: 140, align: 'center' },
            { field: 'EndEffectiveContractNum', title: '期末有效合同数量(份)<br/>(15=9+10-14)', width: 140, align: 'center' },
            { field: 'CurrentContractRenewRate', title: '本期合同续签率(%)<br/>(16=(12/(12+14))*100%)', width: 140, align: 'center' },
            { field: 'CurrentSignAmountProportion', title: '本期签约金额占比(%)<br/>(17)', width: 140, align: 'center' },

            { field: 'BeforeLeasePointNum', title: '期初出租点位数量(个)<br/>(18)', width: 140, align: 'center' },
            { field: 'BeforeLeasePointArea', title: '期初出租点位面积(平米)<br/>(19)', width: 140, align: 'center' },
            { field: 'CurrentLeasePointNum', title: '本期出租点位数量(个)<br/>(20)', width: 140, align: 'center' },
            { field: 'CurrentLeasePointArea', title: '本期出租点位面积(平米)<br/>(21)', width: 140, align: 'center' },
            { field: 'CurrentRentOutPointNum', title: '本期退租点位数量(个)<br/>(22)', width: 140, align: 'center' },
            { field: 'CurrentRentOutPointArea', title: '本期退租点位面积(平米)<br/>(23)', width: 140, align: 'center' },
            { field: 'EndLeasePointNum', title: '期末出租点位数量(个)<br/>(24=18+20-22)', width: 140, align: 'center' },
            { field: 'EndLeasePointArea', title: '期末出租点位面积(平米)<br/>(25=19+21-23)', width: 140, align: 'center' },
            { field: 'EndFreePointNum', title: '期末闲置点位数量(个)<br/>(26=7-24)', width: 140, align: 'center' },
            { field: 'EndFreePointArea', title: '期末闲置点位面积(平米)<br/>(27=8-25)', width: 140, align: 'center' },
            { field: 'CurrentLeasePointNumRate', title: '本期点位出租率(按数量,%)<br/>(28=(24/7)*%)', width: 160, align: 'center' },
            { field: 'CurrentLeasePointAreaRate', title: '本期点位出租率(按面积,%)<br/>(29=(25/8)*100%)', width: 160, align: 'center' },

            { field: 'BeforeArrearsAmount', title: '期初欠费金额(元)<br/>(30)', width: 120, align: 'center' },
            { field: 'CurrentDueAmount', title: '本期应收金额(元)<br/>(31)', width: 120, align: 'center' },
            { field: 'TotalDueAmount', title: '累计应收金额(元)<br/>(32=30+3)', width: 120, align: 'center' },
            { field: 'CurrentReceivedBeforeArrears', title: '本期收到期初欠费(元)<br/>(33)', width: 120, align: 'center' },
            { field: 'CurrentReceivedCurrentAueAmount', title: '本期收到本期应收(元)<br/>(34)', width: 120, align: 'center' },
            { field: 'CurrentReceivedTotal', title: '本期收款合计(元)<br/>(35=33+34)', width: 120, align: 'center' },
            { field: 'CurrentReductionBeforeArrears', title: '本期减免期初欠费(元)<br/>(36)', width: 120, align: 'center' },
            { field: 'CurrentReductionCurrentAueAmount', title: '本期减免本期应收(元)<br/>(37)', width: 120, align: 'center' },
            { field: 'CurrentReductionTotal', title: '本期减免合计(元)<br/>(38=36+37)', width: 120, align: 'center' },
            { field: 'EndArrearsAmount', title: '期末欠费金额(元)<br/>(39=32-35-38)', width: 120, align: 'center' },
            { field: 'CurrentReceivedRate', title: '本期收款达成率(%)<br/>(40=(35/(32-38))*100%)', width: 130, align: 'center' },

            { field: 'BeforeNotRefoundAmount', title: '期初未退金额(元)<br/>(41)', width: 120, align: 'center' },
            { field: 'CurrentReceivedAmount', title: '本期收款金额(元)<br/>(42)', width: 120, align: 'center' },
            { field: 'CurrentRefoundAmount', title: '本期退款金额(元)<br/>(43)', width: 120, align: 'center' },
            { field: 'EndNotRefoundAmount', title: '期末未退金额(元)<br/>(44=41+42-43)', width: 120, align: 'center' }
        ]];

        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: '#toolbar',
                onDblClickRow: function (index, row) {
                    LoadMiningData(row.ID);
                },
                onBeforeLoad: function (param) {
                    param.SortField = "OrganCode,CommID,Sort";
                    param.SortOrder = 0;
                    param = $.getDataGridParam("ContractSynthesize", "GetList", param);
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });
            //$('#dg').datagrid('clearSelections');
            //$('#dg').datagrid('clearChecked');
            $("#dlg_search").dialog("close");
        }
        //显示明细还是汇总
        function InitDetailOrTotalDataGrid(flag) {
            $('#IsDetail').val(flag);
            InitDataGrid();
        }

        //加载数据挖掘数据
        function LoadMiningData(ID) {
            var parameter = { "DetailID": ID }
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/Report/ContractSynthesizeDetailReport.aspx?' + $.param(parameter), '多经综合报表数据挖掘', false, function callback(data) {
            });
        }
        function ExportSet() {
            $('#dlg_Export').dialog("open");
        }

        function Export() {
            $('#dlg_Export').dialog("close");
            var Rows = $("#dg").datagrid("getRows");
            if (Rows.length == 0) {
                HDialog.Info("没有数据导出,请先进行统计!");
                return;
            }
            window.open("ContractSynthesizeReportExport.aspx?IsDetail=" + $('#IsDetail').val() + "&ManageLevel=" + $("#ManageLevel").combobox("getValue") + "&MaxManageLevel=6");
        }

    </script>
</body>
</html>
