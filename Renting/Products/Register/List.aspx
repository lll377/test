<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.Renting.Products.Register.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-竞品登记列表页面</title>
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
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 1000px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formSearch" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">竞品项目</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ProductsName" name="ProductsName" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">业主单位</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="OwnerUnitName" name="OwnerUnitName" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">商管单位</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="BusinessUnitName" name="BusinessUnitName" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">物管单位</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="PropertyUnitName" name="PropertyUnitName" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">物业大类</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="PropertyCategory" name="PropertyCategory" class="easyui-combobox"
                            data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'100%',multiple:true,
                                    valueField:'id',textField:'text',data: [
                                   {id: '居住物业',text: '居住物业'},
                                   {id: '商业物业',text: '商业物业'},
                                   {id: '工业物业',text: '工业物业'},
                                   {id: '政府物业',text: '政府物业'},
                                   {id: '其他物业',text: '政府物业'}]"
                            runat="server" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">物业细类</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="PropertyFinelinesName" name="PropertyFinelinesName" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelPropertyFinelines();}"
                            runat="server" />
                        <input type="hidden" id="PropertyFinelinesID" name="PropertyFinelinesID" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">租售类型</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="RentAndSellType" name="RentAndSellType" class="easyui-combobox"
                            data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'100%',multiple:true,
                                    valueField:'id',textField:'text',data: [
                                   {id: '出租',text: '出租'},
                                   {id: '出售',text: '出售'},
                                   {id: '租售结合',text: '租售结合'}]"
                            runat="server" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">经营业态</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="BusinessFormName" name="BusinessFormName" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelBusinessForm();}"
                            runat="server" />
                        <input type="hidden" id="BusinessFormID" name="BusinessFormID" runat="server" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">租金均价</label>
                    <div class="col-sm-3 col-xs-3">
                        <input type="text" id="RentQuote" name="RentQuote" class="easyui-numberbox" runat="server"
                            data-options="width:'100%',min:0,precision:2" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">距本项目距离</label>
                    <div class="col-sm-3 col-xs-3">
                        <input type="text" id="Distance" name="Distance" class="easyui-numberbox" runat="server"
                            data-options="width:'100%',min:0,precision:2" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">客群重叠度</label>
                    <div class="col-sm-3 col-xs-3">
                        <input type="text" id="CustomerOverlapDegree" name="CustomerOverlapDegree" class="easyui-numberbox" runat="server"
                            data-options="width:'100%',min:0,precision:2" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label"></label>
                    <div class="col-sm-3 col-xs-3">
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

        //选择物业细类
        function SelPropertyFinelines() {
            var param = {
                IsMultiple: "是",
                Type: "物业细类"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/DictionarySelect.aspx?' + $.param(param), "选择物业细类", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    let PropertyFinelinesID = "";
                    let PropertyFinelinesName = "";
                    data.forEach((itemRow) => {
                        PropertyFinelinesID = PropertyFinelinesID + itemRow.ID + ",";
                        PropertyFinelinesName = PropertyFinelinesName + itemRow.Name + ",";
                    });
                    if (PropertyFinelinesID.endsWith(",")) {
                        PropertyFinelinesID = PropertyFinelinesID.substring(0, PropertyFinelinesID.length - 1)
                        PropertyFinelinesName = PropertyFinelinesName.substring(0, PropertyFinelinesName.length - 1)
                    }

                    $("#PropertyFinelinesID").val(PropertyFinelinesID); // 
                    $("#PropertyFinelinesName").textbox("setValue", PropertyFinelinesName); //
                }
            });
        }

        //选择经营业态
        function SelBusinessForm() {
            var param = {
                IsMultiple: "是",
                Type: "经营业态"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/DictionarySelect.aspx?' + $.param(param), "选择经营业态", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    let BusinessFormID = "";
                    let BusinessFormName = "";
                    data.forEach((itemRow) => {
                        BusinessFormID = BusinessFormID + itemRow.ID + ",";
                        BusinessFormName = BusinessFormName + itemRow.Name + ",";
                    });
                    if (BusinessFormID.endsWith(",")) {
                        BusinessFormID = BusinessFormID.substring(0, BusinessFormID.length - 1)
                        BusinessFormName = BusinessFormName.substring(0, BusinessFormName.length - 1)
                    }
                    $("#BusinessFormID").val(BusinessFormID); // 
                    $("#BusinessFormName").textbox("setValue", BusinessFormName); //
                }
            });
        }

        //加载 列表
        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    Edit("", 'add');
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
                    $.messager.confirm('确定', '是否删除选中的竞品信息?', function (r) {
                        if (r) {
                            $.dataPostJson('Renting_Products', 'Del', { "idList": row.ID }, true, false,
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
                    param.TableName = "竞品信息";
                    param.Class = 'Renting_Products';
                    param.Method = "GetListSqlWhere";
                    console.log($.param(param));
                    window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
                }
            }
        ];
        var column = [[
            { field: 'CommName', title: '项目名称', width: 120, align: 'center' },
            {
                field: 'ProductsName', title: '竞品项目', width: 160, align: 'left', formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\"  onclick=\"Edit('" + row.ID + "','edit')\" \">" + value + "</a>";
                    return str;
                }
            },
            { field: 'OwnerUnitName', title: '业主单位', width: 220, align: 'center' },
            { field: 'BusinessUnitName', title: '商管单位', width: 220, align: 'center' },
            { field: 'PropertyUnitName', title: '物管单位', width: 220, align: 'center' },
            { field: 'BuildArea', title: '建筑面积', width: 100, align: 'center' },
            { field: 'PropertyCategory', title: '物业大类', width: 100, align: 'center' },
            { field: 'PropertyFinelinesName', title: '物业细类', width: 100, align: 'center' },
            { field: 'RentAndSellType', title: '租售类型', width: 100, align: 'center' },
            { field: 'BusinessFormName', title: '经营业态', width: 100, align: 'center' },
            { field: 'RentQuote', title: '租金均价', width: 100, align: 'center' },
            { field: 'Distance', title: '距本项目距离', width: 100, align: 'center' },
            { field: 'CustomerOverlapDegree', title: '客群重叠度', width: 100, align: 'center' }
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
                    param = $.getDataGridParam("Renting_Products", "GetList", param);
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
            LayerDialog.OpenWin('800', '500', '/HM/M_Main/Renting/Products/Register/Edit.aspx?' + $.param(param), "竞品信息登记", true, function callback(_Data) {
                if (_Data != "") {
                    $.messager.alert('温馨提示', "保存成功");
                    InitDataGrid();
                }
            });
        }
    </script>
</body>
</html>
