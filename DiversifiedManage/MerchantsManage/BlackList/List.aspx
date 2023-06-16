<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.DiversifiedManage.PointManage.BlackList.List" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>黑名单</title>
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

    <input id="IsDelete" name="IsDelete" value="0" type="hidden" />
    <input id="IsHistory" name="IsHistory" value="否" type="hidden" />
    <input id="search" name="search" type="hidden" />
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="toolbar" class="datagrid-toolbar">
        <table cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td class="edittool">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true,onClick:function(){Edit('加入黑名单','Add');}">加入黑名单</a></td>
                    <td class="edittool">
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td class="edittool"><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true,onClick:function(){Edit('移除黑名单','Remove');}">移除黑名单</a></td>
                    <td class="edittool">
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true,onClick:function(){$('#dlg_search').dialog('open');}">筛选</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel',plain:true,onClick:function(){Export();}">导出</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" title="温馨提示：<br/>&emsp;&emsp;双击表格一行查看详情!" class="easyui-linkbutton easyui-tooltip" data-options="plain:true,iconCls:'icon-help'"></a></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 900px; height: 360px;" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset searchtool">
                <legend class="frame-legend">查询区域</legend>
                <div class="col-sm-12 col-xs-12" style="padding: 0">
                    <input type="hidden" id="OrganCode" name="OrganCode" />
                    <input id="OrganName" name="OrganName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮!',editable:false,multiline:true,height:60,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelOrgan();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#OrganCode').val('');
                            }}] " />
                </div>
            </fieldset>
            <fieldset class="frame-fieldset ">
                <legend class="frame-legend">基本信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                    <div class="col-sm-5 col-xs-5">
                        <input type="hidden" id="MerchantsID" name="MerchantsID" />
                        <input id="MerchantsName" name="MerchantsName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelMerchants();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#MerchantsID').val('');
                            }}] " />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">客商类别</label>
                    <div class="col-sm-5 col-xs-5">
                        <input type="hidden" id="MerchantsCategoryID" name="MerchantsCategoryID" />
                        <input id="MerchantsCategoryName" name="MerchantsCategoryName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDictionary('客商类别');},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#MerchantsCategoryID').val('');
                            }}] " />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">经办人</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="AddUserName" name="AddUserName" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">办理时间</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="StartHandleTime" name="StartHandleTime" class="easyui-datebox" data-options="prompt:'>=',editable:false,icons:[{iconCls:'icon-clear',handler: function(e){$(e.data.target).datebox('clear');}}]" /><label class="control-text">-</label>
                        <input id="EndHandleTime" name="EndHandleTime" class="easyui-datebox" data-options="prompt:'<=',editable:false,icons:[{iconCls:'icon-clear',handler: function(e){$(e.data.target).datebox('clear');}}]" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">办理原因</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="Reason" name="Reason" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">备注</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="Remark" name="Remark" class="easyui-textbox" data-options="width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12 col-xs-12" style="text-align: center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
                    </div>
                </div>
            </fieldset>
        </form>
        <%--<div style="height: 50px"></div>
        <div class="fixed-tool-search">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
        </div>--%>
    </div>
    <script language="javascript" type="text/javascript">
        function SelOrgan() {
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/Dialog/Organ.aspx?' + $.param({ "IsPowerPost": "否", "IsPowerLevel": "否" }), '选择区域', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    var id = "", text = "";
                    $.each(data, function (i, item) {
                        id += "," + item.id;
                        text += "," + item.text;
                    });
                    id = id.substr(1);
                    text = text.substr(1);
                    $("#OrganCode").val(id);
                    $("#OrganName").textbox('setValue', text);
                }
            });
        }
        function SelDictionary(type) {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Dictionary.aspx?' + $.param({ "Type": type }), '选择' + type, true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    $("#MerchantsCategoryID").val(data.ID);
                    $("#MerchantsCategoryName").textbox('setValue', data.Name);
                }
            });
        }
        $(function () {
            InitPage();
        });
        function InitPage() {
            InitControl();
            InitDataGrid();
        }
        function InitControl() {
            var param = $.getUrlParam();
            if (!!param && !!param.search) {
                if (!!param.ID) {
                    $("#IsHistory").val('');
                    $("#MerchantsID").val(param.ID);
                    $("#toolbar").html('');
                }
                $("#search").val(param.search);
                $(".edittool").hide();
            } else {
                $(".searchtool").hide();
                $("#dlg_search").height(210);
            }

            //else {
            //    $.dataPostJson('DivfManage_Dialog', 'GetModelCurOrganCommunity', {}, true, false,
            //        function Init() {
            //        },
            //        function callback(data) {
            //            if (!data.result) {
            //                $("#OrganCode").val(data.OrganCode);
            //                $("#OrganName").textbox('setValue', data.OrganName).textbox("disable");
            //            }
            //        },
            //        function completeCallback() {
            //        }, function errorCallback() {
            //        });
            //}
        }

        var column = [[
            { field: 'ck', checkbox: true },
            { field: 'MerchantsUnit', title: '管理单位', width: 200, align: 'center', sortable: false },
            { field: 'MerchantsCategoryName', title: '客商类别', width: 150, align: 'center', sortable: false },
            {
                field: 'MerchantsName', title: '客户名称', width: 200, align: 'center', sortable: false, formatter: function (value, row, index) {
                    value = "<a onclick=\"MerchantsDetailed('" + row.MerchantsID + "')\" href=\"javascript:void(0)\">" + value + "</a>";
                    return value;
                }
            },
            {
                field: 'HandleTime', title: '办理时间', width: 110, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'HandleUserName', title: '经办人', width: 100, align: 'center', sortable: false },
            {
                field: 'Reason', title: '办理原因', width: 200, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (value.length > 13) {
                        value = value.substring(0, 13) + "...";
                    }
                    return value;
                }
            },
            {
                field: 'Remark', title: '备注', width: 200, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (value.length > 13) {
                        value = value.substring(0, 13) + "...";
                    }
                    return value;
                }
            },
            {
                field: 'Opt', title: '操作', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    value = "<a onclick=\"Detailed('" + row.ID + "')\" href=\"javascript:void(0)\">查看详情</a>";
                    return value;
                }
            },
        ]];
        function InitDataGrid() {
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
                checkbox: true,
                singleSelect: false,
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
                    Detailed(row.ID);
                },
                onBeforeLoad: function (param) {
                    param.IsDelete = 0;
                    param.SortField = "LongTimeStamp";
                    param.SortOrder = 1;
                    param = $.getDataGridParam("DivfManage_BlackList", "GetList", param);
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

        function Edit(title, opType) {
            var ID = "", MerchantsID = "", MerchantsName = "";
            if (opType == "Remove") {
                var row = $("#dg").datagrid("getChecked");
                if (row.length > 0) {
                    $.each(row, function (i, item) {
                        ID += "," + item.ID;
                        MerchantsID += "," + item.MerchantsID;
                        MerchantsName += "," + item.MerchantsName;
                    });
                    ID = ID.substr(1);
                    MerchantsID = MerchantsID.substr(1);
                    MerchantsName = MerchantsName.substr(1);
                } else {
                    $.messager.alert("温馨提示", '请选择一行需要移除黑名单的客户数据!');
                    return;
                }
            }
            var param = { "OpType": opType, "ID": ID, "MerchantsID": MerchantsID, "MerchantsName": MerchantsName };
            LayerDialog.OpenWin('1000', '520', '/HM/M_Main/DiversifiedManage/MerchantsManage/BlackList/Edit.aspx?' + $.param(param), title, true, function callback(_Data) {
                InitDataGrid();
            });
        }
        function Detailed(id) {
            var urlParam = { "ID": id };
            LayerDialog.OpenWin('1000', '300', '/HM/M_Main/DiversifiedManage/MerchantsManage/BlackList/Detailed.aspx?' + $.param(urlParam), "详情", true, function callback(data) {
                InitDataGrid();
            });
        }

        function MerchantsDetailed(id) {
            var urlParam = { "ID": id };
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/MerchantsManage/Merchants/Tab.aspx?' + $.param(urlParam), "详情", true, function callback(data) {
                InitDataGrid();
            });
        }
        function Export() {
            var param = $.getParam();
            param.PageSize = 5000;
            param.IsPagination = "否";
            param.IsZip = "否";
            param.TableName = "客商限制信息";
            param.Class = "DivfManage_BlackList";
            param.Method = "GetListSqlWhere";
            console.log($.param(param));
            window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
        }
    </script>
</body>
</html>
