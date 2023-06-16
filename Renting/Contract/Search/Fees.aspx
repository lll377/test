<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fees.aspx.cs" Inherits="M_Main.Renting.Contract.Search.Fees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁合同-合同费用查询列表</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <div id="TableContainer" style="width: 100%; height: 100%; background-color: #cccccc;"></div>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 1100px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formSearch" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">项目名称</label>
                    <div class="col-sm-11 col-xs-11">
                        <input type="text" id="CommName" name="CommName" class="easyui-textbox" runat="server"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',width:'100%',height:'50px',multiline:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelComm();}" />
                        <input type="hidden" id="CommID" name="CommID" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="TenantryCustName" name="TenantryCustName" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">房屋编号</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="RoomNames" name="RoomNames" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="TenantryConnectpeople" name="TenantryConnectpeople" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">联系人电话</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="TenantryConnectTel" name="TenantryConnectTel" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同类别</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ContractTypeName" name="ContractTypeName" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同编号</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ContractSign" name="ContractSign" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">合同开始时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="StartContractBeginTime" name="StartContractBeginTime" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="EndContractBeginTime" name="EndContractBeginTime" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同名称</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ContractName" name="ContractName" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">合同结束时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="StartContractEndTime" name="StartContractEndTime" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="EndContractEndTime" name="EndContractEndTime" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                        机构部门/<br />
                        负责人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="DutyDepNameAndUserName" name="DutyDepNameAndUserName" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',multiline:false,width:'100%',
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
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">签约时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="SignUpTimeStart" name="SignUpTimeStart" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="SignUpTimeEnd" name="SignUpTimeEnd" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">发起人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="WorkStartUserName" name="WorkStartUserName" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">发起时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="StartWorkStartDate" name="StartWorkStartDate" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="EndWorkStartDate" name="EndWorkStartDate" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">变更类型</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ContractChangeType" name="ContractChangeType" class="easyui-combobox"
                            data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'120px',multiple:true,
                                    valueField:'id',textField:'text',data: [{id: '变更',text: '变更'},{id: '退租',text: '退租'}]"
                            runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">是否退租</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="IsRentOut" name="IsRentOut" class="easyui-combobox"
                            data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'120px',
                                    valueField:'id',textField:'text',data: [{id: '否',text: '否'},{id: '是',text: '是'}]"
                            runat="server" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearWhere();">清空</a>
                </div>
            </div>
        </form>
    </div>
    <input type="hidden" id="HidCommID" name="HidCommID" runat="server" />
    <input type="hidden" id="HidCommName" name="HidCommName" runat="server" />
    <script language="javascript" type="text/javascript">
        //页面初始化
        $(function () {
            //datebox 添加清空
            var buttons = $.extend([], $.fn.datebox.defaults.buttons);
            buttons.splice(1, 0, {
                text: '清空',
                handler: function (target) {
                    $(target).datebox("setValue", "");
                }
            });
            $('.easyui-datebox').datebox({
                buttons: buttons
            });

            InitDataGrid();
        });

        function ClearWhere() {
            $('#formSearch').form('clear');
            if ($('#HidCommID').val() != "" && $('#HidCommID').val() != "0") {
                $("#CommName").textbox("setValue", $('#HidCommName').val());
                $("#CommID").val($('#HidCommID').val());
            }
        }

        //选择项目
        function SelComm() {
            if ($('#HidCommID').val() == "" || $('#HidCommID').val() == "0") {
                //LayerDialog.OpenWin('1000', '600', '/HM/M_Main/Renting/Dialog/CommSelect.aspx?' + $.param({ "IsPowerPost": "否", "IsPowerLevel": "是" }), '选择项目', true, function callback(data) {
                //    if (data) {
                //        data = $.parseJSON(data);
                //        var id = "", text = "";
                //        $.each(data, function (i, item) {
                //            id += "," + item.CommID;
                //            text += "," + item.CommName;
                //        });
                //        id = id.substr(1);
                //        text = text.substr(1);
                //        $("#CommID").val(id);
                //        $("#CommName").textbox('setValue', text);
                //    }
                //});
                LayerDialog.OpenWin('680', '500', '/HM/M_Main/Renting/Dialog/SelContractCommByCommRole.aspx', "选择项目", false, function callback(data) {
                    if (isValueNull(data)) {
                        data = $.parseJSON(data);
                        $("#CommID").val(data.attributes.CommID);
                        $("#CommName").textbox("setValue", data.text);
                    }
                });
            }
        }
        //加载 列表
        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search').dialog('open');
                }
            }, '-',
            {
                text: '导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    //判断当前页面是否存在数据
                    let Rows = $("#TableContainer").datagrid("getRows");
                    if (Rows.length == 0) {
                        $.messager.alert('温馨提示', "没有可导出的数据，请确认！");
                        return;
                    }
                    var dataFields = $('#TableContainer').datagrid('getColumnFields');
                    var dataColumnFields = [];

                    dataFields.forEach((item, index) => {
                        dataColumnFields += "," + item + " '" + $('#TableContainer').datagrid("getColumnOption", item).title.replace("<br/>", "") + "'";
                    });
                    if (dataColumnFields.startsWith(',')) {
                        dataColumnFields = dataColumnFields.slice(1);
                    }
                    var param = $.getParam();
                    param.DataColumnFields = dataColumnFields;
                    param.PageSize = 5000;
                    param.IsPagination = "否";
                    param.IsZip = "否";
                    param.TableName = "合同费用信息";
                    param.Class = 'Renting_ContractSearch';
                    param.Method = "GetFeesListSqlWhere";
                    console.log($.param(param));
                    window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
                }
            }
        ];

        var column = [[
            { field: 'OrganName', title: '区域名称', width: 120, align: 'center' },
            { field: 'CommName', title: '项目名称', width: 140, align: 'center' },
            {
                field: 'TenantryCustName', title: '客户名称', width: 200, align: 'center'
            },
            {
                field: 'RoomNames', title: '房屋编号', width: 180, align: 'center', formatter: function (value, row, index) {
                    return value.replaceAll(',', '<br/>');
                }
            },
            { field: 'TenantryConnectpeople', title: '联系人', width: 140, align: 'center' },
            { field: 'TenantryConnectTel', title: '联系电话', width: 100, align: 'center' },
            { field: 'ContractTypeName', title: '合同类别', width: 120, align: 'center' },
            {
                field: 'ContractSign', title: '合同编号', width: 140, align: 'center'
            },
            { field: 'ContractName', title: '合同名称', width: 140, align: 'center' },
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
            { field: 'CustName', title: '客户名称', width: '200', align: 'center' },
            { field: 'RoomSign', title: '房屋编号', width: '200', align: 'center' },
            { field: 'RoomName', title: '房屋名称', width: '200', align: 'center' },
            { field: 'CostName', title: '费用项目', width: '140', align: 'center' },
            { field: 'FeeDueYearMonth', title: '费用日期', width: '160', align: 'center' },
            {
                field: 'AccountsDueDate', title: '应收日期', width: '100', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'FeesStartDate', title: '开始日期', width: '100', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'FeesEndDate', title: '结束日期', width: '100', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'DueAmount', title: '应收金额', width: '80', align: 'center' },
            { field: 'PaidAmount', title: '实收金额', width: '80', align: 'center' },
            { field: 'PrecAmount', title: '预交冲抵', width: '80', align: 'center' },
            { field: 'WaivAmount', title: '减免冲销', width: '80', align: 'center' },
            { field: 'DebtsAmount', title: '欠费金额', width: '80', align: 'center' },
            { field: 'ContractChangeType', title: '变更类型', width: 80, align: 'center' },
            { field: 'IsRentOut', title: '是否退租', width: 80, align: 'center' }
        ]];

        function InitDataGrid() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: column,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.SortField = "CommID,RoomName,CustName,CostName,FeesStartDate,FeesEndDate";
                    param.SortOrder = 0;
                    param.IsDelete = 0;
                    param = $.getDataGridParam("Renting_ContractSearch", "GetFeesList", param);
                },
                onLoadSuccess: function (data) {
                    $(this).datagrid("autoMergeCells", ['OrganName', 'CommName']);
                },
                onLoadError: function (data) {

                }
            });
            $('#dlg_search').dialog('close');
        }
    </script>
</body>
</html>
