<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractSearch_Royalty.aspx.cs" Inherits="M_Main.DiversifiedManage.ContractManage.ContractSearch_Royalty" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同提成查询</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link href="../../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/basebootstrap.css" rel="stylesheet" />
    <script type="text/javascript" src="../../jscript/jquery.tool.new.js"></script>
    <script src="../../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../../jscript/uuid.js"></script>
    <style type="text/css">
        .dlg_table tr td.title {
            width: 10%;
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
    <div id="TableContainer" style="width: 100%; height: 100%; background-color: #cccccc;"></div>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="padding: 5px; width: 1000px" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frmFrom">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">项目名称</td>
                    <td class="text" colspan="5">
                        <input type="text" id="CommName" name="CommName" class="easyui-textbox" runat="server"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',width:'93%',height:'50px',multiline:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelComm();}" />
                        <input type="hidden" id="CommID" name="CommID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="CustName" typ="text" name="CustName" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSign" typ="text" name="RoomSign" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>合同编号</span></td>
                    <td class="text">
                        <input id="ContractSign" typ="text" name="ContractSign" runat="server" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>点位编号</span></td>
                    <td class="text">
                        <input id="PointNumber" typ="text" name="PointNumber" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>开始时间</span></td>
                    <td class="text">
                        <input type="text" id="BeginDateBegin" name="BeginDateBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="BeginDateEnd" name="BeginDateEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>费用项目</span></td>
                    <td class="text">
                        <input id="CostName" typ="text" name="CostName" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>结束时间</span></td>
                    <td class="text">
                        <input type="text" id="EndDateBegin" name="EndDateBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="EndDateEnd" name="EndDateEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>

                </tr>
                <tr>
                    <td class="title">应收时间</td>
                    <td class="text">
                        <input type="text" id="DueDateBegin" name="DueDateBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title">至</td>
                    <td class="text">
                        <input type="text" id="DueDateEnd" name="DueDateEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title">合同类别</td>
                    <td class="text">
                        <input id="ContractTypeName" name="ContractTypeName" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',multiline:false,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelContractType();}"
                            runat="server" />
                        <input type="hidden" id="ContractType" name="ContractType" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title">发起时间</td>
                    <td class="text">
                        <input type="text" id="WorkStartDateBegin" name="WorkStartDateBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title">至</td>
                    <td class="text">
                        <input type="text" id="WorkStartDateEnd" name="WorkStartDateEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title">审批状态</td>
                    <td class="text">
                        <select id="AuditStatus" name="AuditStatus" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto',width:'100'" runat="server">
                            <option value=""></option>
                            <option value="未启动">未启动</option>
                            <option value="审核中">审核中</option>
                            <option value="已驳回">已驳回</option>
                            <option value="审批不通过">审批不通过</option>
                            <option value="已审核">已审核</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="6">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearWhere()">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <input type="hidden" id="HidCommID" name="HidCommID" runat="server" />
    <input type="hidden" id="HidCommName" name="HidCommName" runat="server" />
    <script language="javascript" type="text/javascript">
        //页面初始化
        $(function () {
            var h = $(window).height();
            $('#TableContainer').css("height", h + 'px');
            InitDataGrid();
        });
        function ClearWhere() {
            $('#frmFrom').form('clear');
            if ($('#HidCommID').val() != "" && $('#HidCommID').val() != "0") {
                $("#CommName").textbox("setValue", $('#HidCommName').val());
                $("#CommID").val($('#HidCommID').val());
            }
        }

        //选择项目
        function SelComm() {
            if ($('#HidCommID').val() == "" || $('#HidCommID').val() == "0") {
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
        }

        //选择 合同类别
        function SelContractType() {
            var param = { "Ismultiple": "0" };
            LayerDialog.OpenWin('580', '400', '../DiversifiedManage/Dialog/CotractTypeSelect.aspx?' + $.param(param), "选择合同类别", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#ContractType").val(data.id);
                    $("#ContractTypeName").textbox("setValue", data.text);
                }
            });
        }

        //加载 列表
        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search').dialog('open');
                }
            }, '-', {
                text: '导出Excel',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var Rows = $("#TableContainer").datagrid("getRows");
                    if (Rows.length == 0) {
                        $.messager.alert("温馨提示", '没有需要导出的合同提成数据!');
                        return;
                    }
                    window.open("ContractSearch_RoyaltyExport.aspx?" + $('#frmFrom').serialize());
                }
            }
        ];
        var column = [[
            { field: 'OrganName', title: '区域名称', width: 120, align: 'center' },
            { field: 'CommName', title: '项目名称', width: 140, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 140, align: 'center' },
            {
                field: 'ChargeCalculation', title: '计费方式', width: 100, align: 'left', formatter: function () {
                    return "营业提成方式";
                }
            },
            { field: 'CalculationMethodName', title: '计算方式', width: 100, align: 'left' },
            { field: 'ContPeriod', title: '计费周期(月)', width: '100', align: 'left' },
            { field: 'GuaranteeAmount', title: '保底金额(元)', width: '100', align: 'left' },
            { field: 'BusinessRoyaltyRatio', title: '提成比例(%)', width: '100', align: 'left' },
            { field: 'CustName', title: '客户名称', width: '120', align: 'center' },
            { field: 'RoomSign', title: '房屋编号', width: 320, align: 'left' },
            { field: 'PointNumber', title: '点位编号', width: 180, align: 'left' },
            { field: 'CostName', title: '费用项目', width: '180', align: 'left' },
            {
                field: 'BeginDate', title: '开始时间', width: '150', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'EndDate', title: '结束时间', width: '150', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'DueDate', title: '应收时间', width: '150', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'BusinessIncome', title: '营业收入(元)', width: '100', align: 'center' },
            { field: 'ReceivableGuaranteeAmount', title: '应收保底金额(元)', width: '120', align: 'center' },
            { field: 'ReceivableRoyaltyAmount', title: '应收提成金额(元)', width: '100', align: 'center' },
            { field: 'Amount', title: '本期应收金额(元)', width: '130', align: 'center' },
            { field: 'WorkStartUserName', title: '发起人', width: '100', align: 'center' },
            {
                field: 'WorkStartDate', title: '发起时间', width: '150', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss')
                }
            },
            { field: 'AuditStatus', title: '审核状态', width: '100', align: 'center' }
        ]];
        function InitDataGrid() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
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
                toolbar: toolbar,
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("DiversifiedManage", "GetContractRoyaltySearchList", "TableContainer", param);
                },
                onLoadSuccess: function (data) {
                    $(this).datagrid("autoMergeCells", ['OrganName', 'CommName']);
                }
            });
            $('#dlg_search').dialog('close');
        }

    </script>
</body>
</html>
