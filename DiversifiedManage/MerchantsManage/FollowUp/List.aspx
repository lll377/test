<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.DiversifiedManage.MerchantsManage.FollowUp.List" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>客商跟进</title>
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
    <input id="search" name="search" type="hidden" />
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="toolbar" class="datagrid-toolbar">
        <table cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td class="edittool">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true,onClick:function(){Edit('新增','Add');}">新增</a></td>
                    <td class="edittool">
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td class="edittool"><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true,onClick:function(){Edit('编辑','Edit');}">编辑</a></td>
                    <td class="edittool">
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td class="edittool"><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true,onClick:function(){Del()}">删除</a></td>
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
                    <td><a href="javascript:void(0)" title="温馨提示：<br/>&emsp;&emsp;双击表格一行查看客商跟进详情!" class="easyui-linkbutton easyui-tooltip" data-options="plain:true,iconCls:'icon-help'"></a></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 900px; height: 380px;" data-options="
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
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">客商信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">序号</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="Sort" name="Sort" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom'" />
                    </div>
                </div>
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
                    <label class="col-sm-1 col-xs-1 control-label">跟进阶段</label>
                    <div class="col-sm-5 col-xs-5">
                        <input type="hidden" id="FollowUpStageID" name="FollowUpStageID" />
                        <input id="FollowUpStageName" name="FollowUpStageName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDictionary('跟进阶段');},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#FollowUpStageID').val('');
                            }}] " />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">跟进时间</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="StartFollowUpTime" name="StartFollowUpTime" class="easyui-datebox" data-options="prompt:'>=',editable:false,
                            icons:[{
                                iconCls:'icon-clear',
                                handler: function(e){
                                $(e.data.target).datebox('clear');
                                }
                            }]" /><label class="control-text">-</label><input id="EndFollowUpTime" name="EndFollowUpTime" class="easyui-datebox" data-options="prompt:'<=',editable:false,
                            icons:[{
                                iconCls:'icon-clear',
                                handler: function(e){
                                $(e.data.target).datebox('clear');
                                }
                            }]" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">客户对接人</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="ConnectPeople" name="ConnectPeople" class="easyui-textbox" data-options="required:false,tipPosition:'bottom'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">对接人职位</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="ConnectPost" name="ConnectPost" class="easyui-textbox" data-options="required:false,tipPosition:'bottom'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">对接人电话</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="ConnectPhone" name="ConnectPhone" class="easyui-textbox" data-options="required:false,tipPosition:'bottom'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">跟进内容</label>
                    <div class="col-sm-11 col-xs-11">
                        <input id="Content" name="Content" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:true,width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">后续建议</label>
                    <div class="col-sm-11 col-xs-11">
                        <input id="Propose" name="Propose" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:true,width:'100%'" />
                    </div>
                </div>
            </fieldset>
            <%-- <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
                </div>
            </div>--%>
        </form>
        <div style="height: 50px"></div>
        <div class="fixed-tool-search">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
        </div>
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
                    $("#FollowUpStageID").val(data.ID);
                    $("#FollowUpStageName").textbox('setValue', data.Name);
                }
            });
        }
        function SelMerchants() {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Merchants.aspx?' + $.param({ "IsCheckbox": "否" }), '选择客商', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    $("#MerchantsID").val(data.ID);
                    $("#MerchantsName").textbox('setValue', data.MerchantsName);
                }
            });
        }
        $(function () {
            InitPage();
        });
        function InitPage() {
            var param = $.getUrlParam();
            if (!!param && !!param.search) {
                if (!!param.ID) {
                    $("#MerchantsID").val(param.ID);
                    $("#toolbar").html('');
                }
                $("#search").val(param.search);
                $(".edittool").hide();
            } else {
                $(".searchtool").hide();
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
            InitControl();
            InitDataGrid();
        }
        function InitControl() {

        }

        var column = [[
            //{ field: 'ck', checkbox: true },
            { field: 'MerchantsUnit', title: '管理单位', width: 200, align: 'center', sortable: false },
            { field: 'MerchantsCategoryName', title: '客商类别', width: 150, align: 'center', sortable: false },
            { field: 'MerchantsName', title: '客户名称', width: 200, align: 'center', sortable: false },
            { field: 'FollowUpStageName', title: '跟进阶段  ', width: 150, align: 'center', sortable: false },
            {
                field: 'FollowUpTime', title: '跟进时间', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'ConnectPeople', title: '客户对接人', width: 100, align: 'center', sortable: false },
            { field: 'ConnectPost', title: '对接人职位', width: 100, align: 'center', sortable: false },
            { field: 'ConnectPhone', title: '对接人电话', width: 100, align: 'center', sortable: false },
            { field: 'AddUserName', title: '跟进人', width: 100, align: 'center', sortable: false },
            { field: 'Sort', title: '排序序号', width: 100, align: 'center', sortable: false },
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
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
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
                    param.SortField = "LongTimeStamp";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param = $.getDataGridParam("DivfManage_MerchantsFollowUp", "GetList", param);
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
            var id = "";
            if (opType == "Edit") {
                var row = $("#dg").datagrid("getSelected");
                if (row) {
                    id = row.ID;
                } else {
                    $.messager.alert("温馨提示", '请选择一行需要编辑的数据!');
                    return;
                }
            }
            var param = { "OpType": opType, "ID": id };
            LayerDialog.OpenWin('1000', '520', '/HM/M_Main/DiversifiedManage/MerchantsManage/FollowUp/Edit.aspx?' + $.param(param), title, true, function callback(_Data) {
                InitDataGrid();
            });
        }
        function Detailed(id) {
            var urlParam = { "ID": id };
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/MerchantsManage/FollowUp/Detailed.aspx?' + $.param(urlParam), "详情", true, function callback(data) {
                InitDataGrid();
            });
        }
        function Del() {
            var row = $("#dg").datagrid("getSelected");
            if (row) {
                $.messager.confirm('确定', '是否删除?', function (r) {
                    if (r) {
                        $.dataPostJson('DivfManage_MerchantsFollowUp', 'Del', { "idList": row.ID }, true, false,
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
            } else {
                $.messager.alert("温馨提示", '请选择需要删除的数据!');
            }
        }
        function Export() {
            var param = $.getParam();
            param.PageSize = 5000;
            param.IsPagination = "否";
            param.IsZip = "否";
            param.TableName = "客商跟进信息";
            param.Class = "DivfManage_MerchantsFollowUp";
            param.Method = "GetListSqlWhere";
            console.log($.param(param));
            window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
        }
    </script>
</body>
</html>
