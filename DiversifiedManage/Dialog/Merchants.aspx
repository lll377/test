<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Merchants.aspx.cs" Inherits="M_Main.DiversifiedManage.Dialog.Merchants" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>客商选择框</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
</head>
<body>
  
    <input id="IsCheckbox" name="IsCheckbox" value="否" type="hidden" />
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="toolbar">
        <form id="frm" class="form-horizontal" role="form">
            <input type="hidden" id="ChangeID" name="ChangeID" value="" />
            <div class="form-group">
                <label class="control-label">管理单位</label>
                <input id="MerchantsUnit" name="MerchantsUnit" class="easyui-textbox" />
                <label class="control-label">客商类别</label>
                <input type="hidden" id="MerchantsCategoryID" name="MerchantsCategoryID" />
                <input id="MerchantsCategoryName" name="MerchantsCategoryName" class="easyui-textbox" data-options="prompt:'',editable:false,
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDictionary('客商类别');},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#MerchantsCategoryID').val('');
                            }}] " />
                <label class="control-label">客户名称</label>
                <input id="MerchantsName" name="MerchantsName" class="easyui-textbox" />
                <label class="control-label">证件号码</label>
                <input id="CertificatesNo" name="CertificatesNo" class="easyui-textbox" />
                <label class="control-label">联&nbsp;&nbsp;系&nbsp;&nbsp;人</label>
                <input id="ContactPeople" name="ContactPeople" class="easyui-textbox" />
            </div>
            <div class="form-group">
                <label class="control-label">联系电话</label>
                <input id="ContactPhoneNo" name="ContactPhoneNo" class="easyui-textbox" />
                <label class="control-label">联系地址</label>
                <input id="ContactAddress" name="ContactAddress" class="easyui-textbox" />
                <label class="control-label">负&nbsp;&nbsp;责&nbsp;&nbsp;人</label>
                <input id="ChargePeople" name="ChargePeople" class="easyui-textbox" />
                <label class="control-label">负责人电话</label>
                <input id="ChargePeoplePhoneNo" name="ChargePeoplePhoneNo" class="easyui-textbox" data-options="width:125" />
                <label class="control-label">审核状态</label>
                <input id="AuditState" name="AuditState" class="easyui-combobox" />
            </div>
            <div class="form-group">
                <label class="control-label">客商经营业态</label>
                <input type="hidden" id="TradeStateID" name="TradeStateID" />
                <input id="TradeStateName" name="TradeStateName" class="easyui-textbox" data-options="editable:false,
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDictionary('客商经营业态');},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#TradeStateID').val('');
                            }}] " />
                <label class="control-label">客商经营品牌</label>
                <input id="Brand" name="Brand" class="easyui-textbox" />
                <label class="control-label">客商经营级别</label>
                <input id="Level" name="Level" class="easyui-textbox" />
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitDataGrid();">筛选</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:false,width:80" onclick="Save();">保存</a>
            </div>
        </form>
    </div>
    <script language="javascript" type="text/javascript">
        function SelDictionary(type) {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Dictionary.aspx?' + $.param({ "Type": type }), '选择' + type, true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    if (type == "客商类别") {
                        $("#MerchantsCategoryID").val(data.ID);
                        $("#MerchantsCategoryName").textbox('setValue', data.Name);
                    } else {
                        $("#TradeStateID").val(data.ID);
                        $("#TradeStateName").textbox('setValue', data.Name);
                    }

                }
            });
        }
        $(function () {
            InitPage();
        });
        function InitPage() {
            var IsCheckbox = $.getUrlParam("IsCheckbox");
            $("#IsCheckbox").val(IsCheckbox);
            InitControl();
            InitDataGrid();
        }
        function InitControl() {
            data = [{ id: '未审核', text: '未审核' }, { id: '已审核', text: '已审核' }];
            $('#AuditState').combobox({
                editable: false,
                tipPosition: 'bottom',
                panelHeight: 'auto',
                valueField: 'id',
                textField: 'text',
                data: data,
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                    }
                }]
            });
        }


        var column = [[
            { field: 'ck', checkbox: true },
            { field: 'MerchantsUnit', title: '管理单位', width: 200, align: 'center', sortable: false },
            { field: 'MerchantsCategoryName', title: '客商类别', width: 150, align: 'center', sortable: false },
            { field: 'MerchantsName', title: '客户名称', width: 200, align: 'center', sortable: false },
            { field: 'CertificatesNo', title: '证件号码', width: 150, align: 'center', sortable: false },
            { field: 'ContactPeople', title: '联系人', width: 100, align: 'center', sortable: false },
            {
                field: 'ContactPhoneNo', title: '联系电话', width: 100, align: 'center', sortable: false
            },
            {
                field: 'ContactAddress', title: '联系地址', width: 250, align: 'center', sortable: false
            },
            { field: 'ChargePeople', title: '负责人', width: 100, align: 'center', sortable: false },
            { field: 'ChargePeoplePhoneNo', title: '负责人电话', width: 100, align: 'center', sortable: false },
            { field: 'TradeStateName', title: '客商经营业态', width: 150, align: 'center', sortable: false },
            { field: 'Brand', title: '客商经营品牌', width: 150, align: 'center', sortable: false },
            {
                field: 'Level', title: '客商经营级别', width: 150, align: 'center', sortable: false
            },
            { field: 'AuditState', title: '审核状态', width: 100, align: 'center', sortable: false },
            { field: 'Sort', title: '序号', width: 100, align: 'center', sortable: false },
            {
                field: 'Opt', title: '操作', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    value = "<a onclick=\"Detailed('" + row.ID + "')\" href=\"javascript:void(0)\">查看详情</a>";
                    return value;
                }
            },
        ]];
        function InitDataGrid() {
            var IsCheckbox = false;
            if ($("#IsCheckbox").val() == "是") {
                IsCheckbox = true;
            }
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                idField: "ID",
                columns: column,
                rownumbers: true,
                checkbox: IsCheckbox,
                singleSelect: !IsCheckbox,
                checkOnSelect: true,
                selectOnCheck: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: "#toolbar",
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onClickRow: function (index, row) {
                },
                onDblClickRow: function (index, row) {
                    if ($("#IsCheckbox").val() == "否") {
                        LayerDialog.ReturnIsJson = true;
                        LayerDialog.Close(row);
                    }
                },
                onBeforeLoad: function (param) {
                    param.SortField = "LongTimeStamp";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param.IsBlackList = "否";
                    param = $.getDataGridParam("DivfManage_Merchants", "GetList", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {
                }
            });
            $('#dg').datagrid('clearSelections');
            $('#dg').datagrid('clearChecked');
            $("#dlg_search").dialog("close");
        }

        function Save() {
            if ($("#IsCheckbox").val() == "否") {
                var row = $("#dg").datagrid("getSelected");
                if (row) {
                    LayerDialog.ReturnIsJson = true;
                    LayerDialog.Close(row);
                } else {
                    $.messager.alert("温馨提示", '请选择一行需要的数据!');
                }
            } else {
                var row = $("#dg").datagrid("getChecked");
                if (row.length > 0) {
                    LayerDialog.ReturnIsJson = true;
                    LayerDialog.Close(row);
                } else {
                    $.messager.alert("温馨提示", '请选择一行需要的数据!');
                }
            }
        }
        function Detailed(id) {
            var urlParam = { "ID": id };
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/MerchantsManage/Merchants/Detailed.aspx?' + $.param(urlParam), "详情", true, function callback(data) {
                InitDataGrid();
            });
        }

    </script>
</body>
</html>
