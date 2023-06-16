<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractImplement.aspx.cs" Inherits="M_Main.DiversifiedManage.ContractManage.ContractImplement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同执行列表</title>
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
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="BuyerCustName" typ="text" name="BuyerCustName" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSigns" typ="text" name="RoomSigns" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>合同编号</span></td>
                    <td class="text">
                        <input id="ContractSign" typ="text" name="ContractSign" runat="server" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>合同名称</span></td>
                    <td class="text">
                        <input id="ContractName" typ="text" name="ContractName" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>合同开始时间</span></td>
                    <td class="text">
                        <input type="text" id="ContractBeginTimeBegin" name="ContractBeginTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="ContractBeginTimeEnd" name="ContractBeginTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>合同结束时间</span></td>
                    <td class="text">
                        <input type="text" id="ContractEndTimeBegin" name="ContractEndTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="ContractEndTimeEnd" name="ContractEndTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>机构部门/负责人</span></td>
                    <td class="text">
                        <input id="DutyDepNameAndUserName" name="DutyDepNameAndUserName" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',multiline:false,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDutyDepNameAndUserName();},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                            $(e.data.target).textbox('clear');
                                            $('#DutyDepCode').val('');
                                            $('#DutyUserCode').val('');
                                            }}] " />

                        <input type="hidden" id="DutyDepCode" name="DutyDepCode" runat="server" />
                        <input type="hidden" id="DutyUserCode" name="DutyUserCode" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title">签约时间</td>
                    <td class="text">
                        <input type="text" id="ContractSignTimeBegin" name="ContractSignTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title">至</td>
                    <td class="text">
                        <input type="text" id="ContractSignTimeEnd" name="ContractSignTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title">变更状态</td>
                    <td class="text">
                        <select id="ContractChangeType" name="ContractChangeType" class="easyui-combobox" data-options="editable:false,panelHeight:'auto',width:'100'">
                            <option value=""></option>
                            <option value="变更">变更</option>
                            <option value="终止">终止</option>
                        </select>
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
                    <td class="title">是否退租</td>
                    <td class="text">
                        <select id="IsRentOut" name="IsRentOut" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto',width:'100'" runat="server">
                            <option value=""></option>
                            <option value="否" selected>否</option>
                            <option value="是">是</option>
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
    <script language="javascript" type="text/javascript">
        //页面初始化
        $(function () {
            var h = $(window).height();
            $('#TableContainer').css("height", h + 'px');
            InitDataGrid();
        });
        function ClearWhere() {
            $('#frmFrom').form('clear');
            $('#IsRentOut').combobox("setValue", '否');
        }
        //加载 列表
        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search').dialog('open');
                }
            }
        ];

        //选择 机构部门/负责人
        function SelDutyDepNameAndUserName() {
            LayerDialog.OpenWin('640', '400', '../DiversifiedManage/Dialog/SelContractDutyUserAndDep.aspx', "机构部门/负责人选择", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $('#DutyUserCode').val(data.UserCode);
                    $('#DutyDepCode').val(data.DepCode);
                    $('#DutyDepNameAndUserName').textbox("setValue", data.DepName + "-" + data.UserName);
                }
            });
        }

        var column = [[
            { field: 'CommName', title: '项目名称', width: 120, align: 'center' },
            { field: 'BuyerCustName', title: '客户名称', width: 120, align: 'center' },
            {
                field: 'RoomSigns', title: '房屋编号', width: 320, align: 'left'
            },
            { field: 'BuyerConnectTel', title: '联系电话', width: 120, align: 'center' },
            { field: 'ContractTypeName', title: '合同类别', width: 180, align: 'left' },
            {
                field: 'ContractSign', title: '合同编号', width: 180, align: 'left', formatter: function (value, row, index) {
                    var str = "<a style=\"color:blue\" onclick=\"Edit('" + row.ID + "')\" href=\"javascript:void(0);\">" + value + "</a>";
                    return str;
                }
            },
            { field: 'ContractName', title: '合同名称', width: 180, align: 'left' },
            { field: 'PointNames', title: '点位编号', width: 180, align: 'left' },
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
            { field: 'ChargeStandard', title: '计费标准(元)', width: 100, align: 'center' },
            { field: 'ContractTotalPrice', title: '合同总额(元)', width: 100, align: 'center' },
            {
                field: 'ContractSignTime', title: '签约时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'WorkStartUserName', title: '发起人', width: 100, align: 'center' },
            {
                field: 'WorkStartDate', title: '发起时间', width: 150, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss')
                }
            },
            { field: 'AuditStatus', title: '审核状态', width: 80, align: 'center' },
            { field: 'ContractChangeType', title: '变更类型', width: 80, align: 'center' },
            { field: 'IsRentOut', title: '是否退租', width: 80, align: 'center' }
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
                    param = $.JQForm.GetParam("DiversifiedManage", "GetContractImplementList", "TableContainer", param);
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_search').dialog('close');
        }
        function Edit(ContractID) {
            var param = { "ContractID": ContractID };
            var w = $(window).width() - 100;
            var h = $(window).height();
            LayerDialog.OpenWin(w, h, '../DiversifiedManage/ContractManage/ContractImplementFrame.aspx?' + $.param(param), "合同信息", false, function callback(_Data) {
                if (_Data != "") {
                    InitDataGrid();
                }
            });
        }
    </script>
</body>
</html>
