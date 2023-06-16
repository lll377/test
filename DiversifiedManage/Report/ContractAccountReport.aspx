<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractAccountReport.aspx.cs" Inherits="M_Main.DiversifiedManage.Report.ContractAccountReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同台账报表</title>
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
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <input id="IsDelete" name="IsDelete" value="0" type="hidden" />
    <input id="search" name="search" type="hidden" />
    <table id="dg" style="width: 100%; height: 100%; background-color: #cccccc;"></table>
    <div id="toolbar" class="datagrid-toolbar">
        <table cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true,onClick:function(){$('#dlg_search').dialog('open');}">筛选</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel',plain:true,onClick:function(){Export();}">Excel导出</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>
                        <a href="javascript:void(0)" title="温馨提示：<br/>&emsp;&emsp;双击表格一行查看合同台账费用明细详情!" class="easyui-linkbutton easyui-tooltip" data-options="plain:true,iconCls:'icon-help'"></a></td>
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
                            data-options="prompt:'请单击右侧\'放大镜\'按钮!',editable:false,tipPosition:'bottom',width:'96%',height:'50px',multiline:true,required:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelComm();}" />
                        <input type="hidden" id="CommID" name="CommID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>合同类别</span></td>
                    <td class="text" colspan="3">
                        <input id="ContractTypeName" name="ContractTypeName" class="easyui-textbox"
                            data-options="prompt:'请单击右侧\'放大镜\'按钮!',editable:false,tipPosition:'bottom',multiline:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelContractType();},width:'90%',height:'50px'"
                            runat="server" />
                        <input type="hidden" id="ContractType" name="ContractType" runat="server" />
                    </td>
                    <td class="title"><span>服务类别</span></td>
                    <td class="text">
                        <input id="BusinessType" name="BusinessType" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',multiple:true,
                                    valueField:'id',textField:'text',
                                    data: [{id: '房屋租赁',text: '房屋租赁'},{id: '车位租赁',text: '车位租赁'},{id: '广告租赁',text: '广告租赁'},{id: '场地租赁',text: '场地租赁'},
                                    {id: '物业有偿服务',text: '物业有偿服务'},{id: '美居服务',text: '美居服务'},{id: '社区新零售',text: '社区新零售'}]"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>客商类别</span></td>
                    <td class="text" colspan="3">
                        <input id="MerchantsCategoryName" name="MerchantsCategoryName" class="easyui-textbox"
                            data-options="prompt:'请单击右侧\'放大镜\'按钮!',editable:false,tipPosition:'bottom',multiline:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDictionary();},width:'90%',height:'50px'"
                            runat="server" />
                        <input type="hidden" id="MerchantsCategory" name="MerchantsCategory" runat="server" />
                    </td>
                    <td class="title"><span>签约类别</span></td>
                    <td class="text">
                        <input id="SigningType" name="SigningType" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',data: [{id: '',text: '全部'},{id: '新签',text: '新签'},{id: '续签',text: '续签'}]"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>付款单位</span></td>
                    <td class="text" colspan="3">
                        <input id="MerchantsName" name="MerchantsName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'90%',height:'50px',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelMerchants();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#MerchantsID').val('');
                            }}] " />
                        <input type="hidden" id="MerchantsID" name="MerchantsID" />
                    </td>
                    <td class="title"><span></span></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="title"><span>合同开始时间</span></td>
                    <td class="text">
                        <input type="text" id="ContractBeginTimeBegin" name="ContractBeginTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="ContractBeginTimeEnd" name="ContractBeginTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>合同是否终止</span></td>
                    <td class="text">
                        <input id="IsRentOut" name="IsRentOut" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',data: [{id: '',text: '全部'},{id: '是',text: '是'},{id: '否',text: '否'}]"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title">合同结束时间</td>
                    <td class="text">
                        <input type="text" id="ContractEndTimeBegin" name="ContractEndTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title">至</td>
                    <td class="text">
                        <input type="text" id="ContractEndTimeEnd" name="ContractEndTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title">统计截止时间</td>
                    <td class="text">
                        <input type="text" id="ReportEndTime" name="ReportEndTime" class="easyui-datebox" runat="server" data-options="editable:false,required:true" />
                    </td>
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
    <input type="hidden" id="HidCommID" name="HidCommID" runat="server" />
    <input type="hidden" id="HidCommName" name="HidCommName" runat="server" />
    <script type="text/javascript">

        function ClearWhere() {
            $('#frm').form('clear');
            $('#IsRentOut').combobox("setValue", '');
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

        //选择付款单位
        function SelMerchants() {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Merchants.aspx?' + $.param({ "IsCheckbox": "是" }), '选择付款单位', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    var id = "", text = "";
                    $.each(data, function (i, item) {
                        id += "," + item.ID;
                        text += "," + item.MerchantsName;
                    });
                    id = id.substr(1);
                    text = text.substr(1);
                    $("#MerchantsID").val(id);
                    $("#MerchantsName").textbox('setValue', text);
                }
            });
        }

        var model = { MessageInfo: "(0%)", Curr: 0, StartDate: new Date(), EndDate: new Date() };
        function TakeProgress() {
            $.dataPostJson('ContractAccount', 'TaskProgress', $.getParam(), false, false,
                function Init() {
                },
                function callback(data) {
                    if (data.length > 0) {
                        model = data[0];
                        $("#lblStatistics").text("温馨提示:当前数据统计日期 [ " + $.dateFormat(model.StartDate, "yyyy-MM-dd HH:mm:ss") + " ] ");
                        if (model.Curr > 0 && model.Curr < 100) {
                            setTimeout('TakeProgress()', 3000);
                        } else {
                            InitDataGrid();
                        }
                        UpdateProgressBar();
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
                    $.dataPostJson('ContractAccount', 'StartTask', $.getParam(), true, false,
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
            { title: '基本信息', align: 'center', colspan: 22 },
            { title: '费用信息', align: 'center', colspan: 5 },
            { title: '保证金信息', align: 'center', colspan: 4 },
            { title: '营业信息', align: 'center', colspan: 2 }
        ], [
            { field: 'OrganName', title: '区域名称', width: 150, align: 'center' },
            { field: 'CommName', title: '项目名称', width: 150, align: 'center' },
            {
                field: 'ManageTime', title: '接管时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'RoomNumbers', title: '项目户数', width: 80, align: 'center' },
            { field: 'BusinessType', title: '服务类别', width: 80, align: 'center' },
            { field: 'ContractTypeName', title: '合同类别', width: 120, align: 'center' },
            { field: 'SigningType', title: '签约类别', width: 80, align: 'center' },
            { field: 'ContractName', title: '合同名称', width: 240, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 160, align: 'center' },
            { field: 'SellerName', title: '收款单位', width: 180, align: 'center' },
            { field: 'BuyerCustName', title: '付款单位', width: 180, align: 'center' },
            { field: 'MerchantsCategoryName', title: '客商类别', width: 100, align: 'center' },
            {
                field: 'ContractBeginTime', title: '合同开始时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'ContractEndTime', title: '合同结束时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'ContractPeriod', title: '合同期限(月)', width: 100, align: 'center' },
            { field: 'PointChargeNumber', title: '计费数量(个)', width: 100, align: 'center' },
            { field: 'PointChargeArea', title: '计费面积(平米)', width: 100, align: 'center' },
            { field: 'ChargeStandard', title: '计费标准(元)', width: 100, align: 'center' },
            { field: 'ChargeUnit', title: '计费单位', width: 100, align: 'center' },
            { field: 'GuaranteeAmount', title: '合同保底金额(元)', width: 100, align: 'center' },
            { field: 'BusinessRoyaltyRatio', title: '营业提成比例(%)', width: 100, align: 'center' },
            { field: 'IsRentOut', title: '是否终止', width: 100, align: 'center' },

            { field: 'ContractTotalPrice', title: '合同总额(元)<br/>(1)', width: 100, align: 'center' },
            { field: 'DueAmount', title: '应收金额(元)<br/>(2)', width: 100, align: 'center' },
            { field: 'DueAcceptedAmount', title: '应收已收金额(元)<br/>(3)', width: 120, align: 'center' },
            { field: 'DueReductionAmount', title: '应收减免金额(元)<br/>(4)', width: 120, align: 'center' },
            { field: 'DueUncollectedAmount', title: '应收未收金额(元)<br/>(5=2-3-4)', width: 120, align: 'center' },
            { field: 'DueDepositAmount', title: '应收保证金金额(元)<br/>(6)', width: 120, align: 'center' },
            { field: 'AcceptedDepositAmount', title: '已收保证金金额(元)<br/>(7)', width: 120, align: 'center' },
            { field: 'RetiredDepositAmount', title: '已退保证金金额(元)<br/>(8)', width: 120, align: 'center' },
            { field: 'UnreturnedDepositAmount', title: '未退保证金金额(元)<br/>(9=7-8)', width: 120, align: 'center' },
            { field: 'BusinessRoyaltyRaiseAmount', title: '营业提成起提金额(元)', width: 140, align: 'center' },
            { field: 'EstimatedIncome', title: '实际营业收入金额(元)', width: 140, align: 'center' }
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
                remoteSort: false,
                onDblClickRow: function (index, row) {
                    LoadMiningData(row.ID);
                },
                onBeforeLoad: function (param) {
                    param.SortField = "OrganCode,CommID,BusinessType,ContractType,BuyerCustID";
                    param.SortOrder = 1;
                    param = $.getDataGridParam("ContractAccount", "GetList", param);
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
        //加载数据挖掘数据
        function LoadMiningData(ID) {
            var parameter = { "DetailID": ID }
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/Report/ContractAccountDetailReport.aspx?' + $.param(parameter), '合同台账数据挖掘', false, function callback(data) {
            });
        }

        function Export() {
            var Rows = $("#dg").datagrid("getRows");
            if (Rows.length == 0) {
                HDialog.Info("没有数据导出,请先进行统计!");
                return;
            }
            window.open("ContractAccountReportExport.aspx");
        }

    </script>
</body>
</html>
