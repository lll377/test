<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.Renting.Merchants.PotentialCustomers.OrganRegister.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>客商登记-公司登记</title>
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
                    <label class="col-sm-1 col-xs-1 control-label">客户类别</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="CustTypeName" name="CustTypeName" class="easyui-textbox" data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:false,multiline:true,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelCustType();},
                                icons:[{
                                    iconCls:'icon-clear',
                                    handler: function(e){
                                    $(e.data.target).textbox('clear');
                                    $('#CustTypeID').val('');
                                    }}] " />
                        <input type="hidden" id="CustTypeID" name="CustTypeID" runat="server" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="CustName" name="CustName" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">证件号码</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="PaperCode" name="PaperCode" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">法定代表人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="LegalRepr" name="LegalRepr" class="easyui-textbox"
                            data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">法定代表人电话</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="LegalReprTel" name="LegalReprTel" class="easyui-textbox"
                            data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ConnectPeople" name="ConnectPeople" class="easyui-textbox"
                            data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">联系人电话</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ConnectPeopleTel" name="ConnectPeopleTel" class="easyui-textbox"
                            data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">客户经营业态</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="TradeStateName" name="TradeStateName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:true,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelTradeState();},
                                icons:[{
                                    iconCls:'icon-clear',
                                    handler: function(e){
                                    $(e.data.target).textbox('clear');
                                    $('#TradeStateID').val('');
                                    }}] " />
                        <input type="hidden" id="TradeStateID" name="TradeStateID" runat="server" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">客户经营品牌</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="BusinessBrand" name="BusinessBrand" class="easyui-textbox"
                            data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客户经营级别</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="BusinessLevel" name="BusinessLevel" class="easyui-textbox"
                            data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#formSearch').form('clear')">清空</a>
                </div>
            </div>
        </form>
    </div>
    <script language="javascript" type="text/javascript">
        //页面初始化
        $(function () {
            InitDataGrid();
        });

        //选择客户类别
        function SelCustType() {
            var param = {
                IsMultiple: "是"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/CustomerTypeSelect.aspx?' + $.param(param), "选择客户类别", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    let CustTypeID = "";
                    let CustTypeName = "";
                    data.forEach((itemRow) => {
                        CustTypeID = CustTypeID + itemRow.CustTypeID + ",";
                        CustTypeName = CustTypeName + itemRow.CustTypeName + ",";
                    });
                    if (CustTypeID.endsWith(",")) {
                        CustTypeID = CustTypeID.substring(0, CustTypeID.length - 1)
                        CustTypeName = CustTypeName.substring(0, CustTypeName.length - 1)
                    }

                    $("#CustTypeID").val(CustTypeID); // 
                    $("#CustTypeName").textbox("setValue", CustTypeName); //
                }
            });
        }

        //选择客户经营业态
        function SelTradeState() {
            var param = {
                IsMultiple: "是",
                Type: "经营业态"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/DictionarySelect.aspx?' + $.param(param), "选择经营业态", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    let TradeStateID = "";
                    let TradeStateName = "";
                    data.forEach((itemRow) => {
                        TradeStateID = TradeStateID + itemRow.ID + ",";
                        TradeStateName = TradeStateName + itemRow.Name + ",";
                    });
                    if (TradeStateID.endsWith(",")) {
                        TradeStateID = TradeStateID.substring(0, TradeStateID.length - 1)
                        TradeStateName = TradeStateName.substring(0, TradeStateName.length - 1)
                    }

                    $("#TradeStateID").val(TradeStateID); // 
                    $("#TradeStateName").textbox("setValue", TradeStateName); //
                }
            });
        }

        //加载 列表
        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    var guid = new GUID();
                    Edit(guid.newGUID(), 'add');
                }
            }, '-',
            {
                text: '修改',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row) {
                        Edit(row.ID, 'edit');
                    } else {
                        $.messager.alert("温馨提示", '请选择一行需要编辑的数据!');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row == null) {
                        $.messager.alert("温馨提示", '请选择需要删除的数据!');
                        return;
                    }
                    $.messager.confirm('确定', '是否删除选中的客商信息?', function (r) {
                        if (r) {
                            $.dataPostJson('Renting_PotentialCustomers_Organ', 'Del', { "idList": row.ID }, true, false,
                                function Init() {
                                },
                                function callback(data) {
                                    if (data.result) {
                                        InitDataGrid();
                                    } else { $.messager.alert("温馨提示", data.msg); }
                                },
                                function completeCallback() {
                                }, function errorCallback() {
                                });
                        }
                    });
                }
            }, '-',
            {
                text: '发放管理',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row) {
                        var param = { "CustTypeName": row.CustTypeName, "ID": row.ID, "CustName": row.CustName };
                        var w = '600';
                        var h = '400';
                        LayerDialog.OpenWin(w, h, '/HM/M_Main/Renting/Merchants/PotentialCustomers/OrganRegister/Send.aspx?' + $.param(param), "客商发放管理", true, function callback(_Data) {
                            if (isValueNull(_Data)) {
                                $.messager.alert("温馨提示", '发放管理操作成功!');
                            }
                        });
                    } else {
                        $.messager.alert("温馨提示", '请选择需要发放的客商!');
                    }
                }
            }, '-',
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
                    param.TableName = "公司客商信息";
                    param.Class = 'Renting_PotentialCustomers_Organ';
                    param.Method = "GetListSqlWhere";
                    console.log($.param(param));
                    window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
                }
            }
        ];
        var column = [[
            { field: 'CustTypeName', title: '客户类别', width: 100, align: 'center' },
            {
                field: 'CustName', title: '客户名称', width: 200, align: 'center', formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\"  onclick=\"Edit('" + row.ID + "','edit')\" \">" + value + "</a>";
                    return str;
                }
            },
            { field: 'PaperCode', title: '证件号码', width: 140, align: 'center' },
            { field: 'LegalRepr', title: '法定代表人', width: 160, align: 'center' },
            { field: 'LegalReprTel', title: '法定代表人电话', width: 140, align: 'center' },
            { field: 'ConnectPeople', title: '联系人', width: 180, align: 'center' },
            { field: 'ConnectPeopleTel', title: '联系人电话', width: 100, align: 'center' },
            { field: 'TradeStateName', title: '客户经营业态', width: 100, align: 'center' },
            { field: 'BusinessBrand', title: '客户经营品牌', width: 140, align: 'center' },
            { field: 'BusinessLevel', title: '客户经营级别', width: 140, align: 'center' }
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
                    param.SortField = "AddTime";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param = $.getDataGridParam("Renting_PotentialCustomers_Organ", "GetList", param);
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });
            $('#dlg_search').dialog('close');
        }
        function Edit(id, OpType) {
            var param = { "OpType": OpType, "ID": id };
            LayerDialog.OpenWin('900', '600', '/HM/M_Main/Renting/Merchants/PotentialCustomers/OrganRegister/Edit.aspx?' + $.param(param), "商机登记", true, function callback(_Data) {
                if (_Data != "") {
                    $.messager.alert('温馨提示', "保存成功");
                    InitDataGrid();
                }
            });
        }
    </script>
</body>
</html>
