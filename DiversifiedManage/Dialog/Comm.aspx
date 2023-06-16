<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comm.aspx.cs" Inherits="M_Main.DiversifiedManage.Dialog.Comm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>项目选择</title>
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
    <style type="text/css">
        .form-horizontal {
            padding: 5px;
        }

            .form-horizontal .form-group {
                margin: 0;
                /*margin-top: 5px;*/
            }

                .form-horizontal .form-group:first-child {
                    margin: 0;
                }

        .panel_lable {
            font-weight: normal;
            color: #159115
        }
    </style>
</head>
<body>
    <%--岗位控权 --%>
    <input id="IsPowerPost" name="IsPowerPost" type="hidden" value="否" />
    <%--层级控权 --%>
    <input id="IsPowerLevel" name="IsPowerLevel" type="hidden" value="否" />
    <input id="OrganCode" name="OrganCode" type="hidden" />
    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',border:true,width:325,title:'区域列表',expandMode:'dock'">
            <form class="form-horizontal dialog-fixed-tool-top" style="width: 322px;" role="form">
                <div class="form-group">
                    <div class="col-sm-12 col-xs-12" style="padding: 0">
                        <input id="Name" name="Name" class="easyui-textbox" data-options="prompt:'区域名称',
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:63,plain:false" onclick="LoadTree();">筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:85" onclick="javascript:$('#tree').tree('reload');">清除勾选</a>
                    </div>
                </div>
            </form>
            <div style="height: 40px"></div>
            <ul id="tree" class="easyui-tree"></ul>
        </div>
        <div id="layout_center" data-options="region:'center',split:false,border:true,title:'项目列表 - <lable class=\'panel_lable\'>[ 温馨提示 : 鼠标移动到 (一键添加) 按钮(悬停)查看功能说明 ! ]</lable>',">
            <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="PanelSelect" data-options="region:'south',border:false,iconCls:'icon-ok',title:'已勾选项目 ( 可点击右侧小箭头按钮 隐藏 / 显示 当前界面 )',split:false,expandMode:'dock' "
            style="height: 224px;">
            <table id="dgSelect" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
    </div>
    <div id="toolbar" class="easyui-panel" data-options="closed:true" style="background: #F5F5F5">
        <div>
            <form id="frm" class="form-horizontal" role="form">
                <div class="form-group">
                    <div class="col-sm-12 col-md-12" style="padding: 0">
                        <input id="CommName" name="CommName" class="easyui-textbox" data-options="prompt:'项目名称',
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:65" onclick="InitDataGrid();">筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:65" onclick="$('#frm').form('clear')">清空</a>
                        <%--<a href="javascript:void(0)" title="功能诠释：<br/>&emsp;&emsp;将当前勾选的项目加到下方已勾选项目列表中!" class="easyui-linkbutton easyui-tooltip" data-options="iconCls:'icon-add',width:85" onclick="AddProject()">添加</a>--%>
                        <a href="javascript:void(0)" title="功能诠释：<br/>&emsp;&emsp;将左侧区域列表勾选的区域下的所有项目添加到下方已勾选项目列表中!" class="easyui-linkbutton easyui-tooltip" data-options="iconCls:'icon-add'" onclick="AddAllProject()">一键添加(勾选区域)</a>
                        <a href="javascript:void(0)" id="btn_Save" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="Save();">确定选择</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <style>
        a:link {
            text-decoration: none;
        }

        a:visited {
            text-decoration: none;
        }

        a:hover {
            text-decoration: none;
        }

        a:active {
            text-decoration: none;
        }

        .panel_btn {
            display: inline-block;
            margin-top: -3px;
            padding: 2px 5px;
            border-radius: 4px;
            background: #e6e6e6;
            -moz-border-radius: 5px 5px 5px 5px;
            -webkit-border-radius: 5px 5px 5px 5px;
            border-radius: 5px 5px 5px 5px;
            cursor: pointer;
            vertical-align: middle;
            border: 1px solid #bbbbbb;
            background: linear-gradient(to bottom,#FBFBFB 0,#E6E6E6 100%);
            /*background: linear-gradient(to bottom,#ffffff 0,#e6e6e6 100%);*/
        }

            .panel_btn:hover {
                background: linear-gradient(to bottom,#e6e6e6 0,#e6e6e6 100%);
                text-decoration: none;
            }

        .panel_btn {
            font-style: normal;
        }

            .panel_btn span {
                color: #444;
                font-weight: 400;
                padding-left: 20px;
                background: url('/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icons/cancel.png') no-repeat left center;
                background-size: 14px 14px;
            }
    </style>
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <script language="javascript" type="text/javascript">
        $(function () {
            var param = $.getUrlParam();
            if (!!param.IsPowerPost) {
                $("#IsPowerPost").val(param.IsPowerPost);
            }
            if (!!param.IsPowerLevel) {
                $("#IsPowerLevel").val(param.IsPowerLevel);
            }
            InitPage()
            LoadTree();
            InitDataGridSelect();
            $("#layout_center").panel({
                onResize: function (width, height) {
                    SetToolbar(width)
                }
            });
        });
        function InitPage() {
            SetToolbar($("#layout_center").width());
            var title = "已勾选项目列表 <a href=\"javascript:void(0)\" onclick=\"DgDataClear()\" class=\"panel_btn\"><span>清空已勾选项目列表</span></a><lable class=\'panel_lable\'> ( 温馨提示:可点击右侧小箭头按钮 隐藏 / 显示 当前界面 )</lable>";
            //加载Panel
            $("#PanelSelect").panel({ title: title, });
        }
        function SetToolbar(w) {
            $('#toolbar').width(w);
        }


        function LoadTree() {
            $("#tree").tree({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                treeField: 'text',
                idField: 'id',
                lines: true,
                animate: true,
                border: false,
                checkbox: true,
                //cascadeCheck: true,
                //onlyLeafCheck: true,
                loadMsg: '加载中,请稍侯...',
                onLoadSuccess: function (node, data) {
                    //console.log(node, data);
                    //InitDataGrid();
                    //$("#tree").tree('collapseAll');
                    $.messager.progress('close');
                    //if (data.length > 0) {
                    //    var dataJson = $("#tree").tree("getChildren");
                    //    $.each(dataJson, function (i, itemNode) {
                    //        //if ($("#tree").tree("isLeaf", itemNode.target)) {
                    //        //默认选中第一个节点
                    //        $("#tree").tree('select', itemNode.target);
                    //        return false;
                    //        //}
                    //    });
                    //} else {
                    InitDataGrid();
                    //}
                    //InitTableHeight();
                },
                onBeforeLoad: function (row, param) {
                    param.Class = "DivfManage_Dialog";
                    param.Method = "GetListTreeOrgan";
                    param.Name = $("#Name").textbox('getValue');
                    param.IsPowerPost = $("#IsPowerPost").val();
                    param.IsPowerLevel = $("#IsPowerLevel").val();
                    $.messager.progress({
                        title: '温馨提示',
                        msg: '正在加载数据,请稍候...',
                        interval: 3000
                    });
                },
                onCheck: function (node, checked) {
                    TreeDelayLoad();
                },
                onBeforeSelect: function (node) {
                    //console.log('单选:' + node.id);
                    //if (node.id != "01" && $("#CurOrganCode").val() != "01") {
                    //    if (!$(this).tree('isLeaf', node.target)) {
                    //        return false;
                    //    }
                    //}
                    if (node.checked) {
                        $('#tree').tree('uncheck', node.target);
                    } else {
                        $('#tree').tree('check', node.target);

                    }
                    //$("#OrganCode").val(node.id);
                },
                onSelect: function (row) {
                    //$('#layout_center').panel('setTitle', '房间列表-' + row.attributes.Location + '( 温馨提示:双击表格一行也可以选择房屋! )');
                    //InitDataGrid();
                },
                onLoadError: function (arguments) {
                    $.messager.progress('close');
                    $.messager.alert("温馨提示", '系统错误!');
                }
            });
        }

        var IntervalID = null;
        //点击树延时执行
        function TreeDelayLoad() {
            if (!!IntervalID) {
                clearInterval(IntervalID);
            }
            IntervalID = setInterval(function () {
                SearchOrgan();
                clearInterval(IntervalID);
            }, 1000);
        }
        function SearchOrgan() {
            var nodes = $('#tree').tree('getChecked');
            var val = "", text = "";
            if (nodes.length > 0) {
                $.each(nodes, function (i, item) {
                    //if ($(this).tree('isLeaf', item.target)) {
                    if (item.attributes.LastNodeTotal == 0) {
                        val += "," + item.id;
                        text += "," + item.text;
                    }
                });
                val = val.substr(1);
                text = text.substr(1);
            }
            $("#OrganCode").val(val);
            //console.log(text);
            InitDataGrid();
        }
        var column = [[
            { field: 'ck', checkbox: true },
            { field: 'OrganName', title: '区域名称', width: 250, align: 'center', sortable: false },
            { field: 'CommName', title: '项目名称', width: 250, align: 'center', sortable: false },
            { field: 'OrganCode', title: '区域编号', width: 100, align: 'center', sortable: false },
            { field: 'CommID', title: '项目编号', width: 100, align: 'center', sortable: false }
        ]];

        var IsLoad = true;
        function InitDataGrid() {
            IsLoad = true;
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                fit: true,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "CommID",
                columns: column,
                rownumbers: true,
                fitColumns: true,
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
                onDblClickRow: function (index, row) {
                    //LayerDialog.ReturnIsJson = true;
                    //LayerDialog.Close(row);
                },
                onCheckAll: function (rows) {
                    if (!IsLoad) {
                        DgDelayLoad();
                    }
                }, onUncheckAll: function (rows) {
                    if (!IsLoad) {
                        $.each(rows, function (i, item) {
                            var index = $('#dgSelect').datagrid('getRowIndex', item.CommID);
                            if (index > -1) {
                                $('#dgSelect').datagrid('deleteRow', index);
                            }
                        });
                    }
                },
                onBeforeSelect: function (index, row) {
                    if (!IsLoad) {
                        var data = $('#dgSelect').datagrid('getData');
                        var idList = "";
                        $.each(data.rows, function (i, item) {
                            idList += "," + item.CommID;
                        });
                        if (idList.indexOf(row.CommID) == -1) {
                            DgDelayLoad();
                        };
                    }
                    //DgDelayLoad();
                },
                onBeforeUnselect: function (index, row) {
                    if (!IsLoad) {
                        DelProject(row.CommID);
                    }
                },
                onSelect: function (index, row) {

                },
                onBeforeLoad: function (param) {
                    param.SortField = "OrganCode";
                    param.SortOrder = 0;
                    param.IsDelete = 0;
                    param.OrganCode = $("#OrganCode").val();
                    param.CommName = $("#CommName").textbox('getValue');
                    param.IsPowerPost = $("#IsPowerPost").val();
                    param.IsPowerLevel = $("#IsPowerLevel").val();
                    param = $.getDataGridParam("DivfManage_Dialog", "GetListCommunity", param);
                },
                onLoadSuccess: function (data) {
                    IsLoad = true;
                    $('#dg').datagrid('clearSelections');
                    $('#dg').datagrid('clearChecked');
                    var dataDgSelect = $('#dgSelect').datagrid('getData');
                    if (dataDgSelect.rows.length > 0) {
                        $.each(dataDgSelect.rows, function (i, item) {
                            $('#dg').datagrid('selectRecord', item.CommID);
                        });
                    }
                    IsLoad = false;
                },
                onLoadError: function (data) {

                }
            });
            //$('#dg').datagrid('clearSelections');
            //$('#dg').datagrid('clearChecked');
        }
        function DgDataClear() {
            $('#dgSelect').datagrid('loadData', { total: 0, rows: [] });
            $('#dgSelect').datagrid('clearSelections');
            $('#dgSelect').datagrid('clearChecked');
            InitDataGrid();
        }
        var IntervalIDDgSelect = null;
        //点击树延时执行
        function DgDelayLoad() {
            $('#btn_Save').linkbutton('disable').linkbutton({ "text": "正在处理数据..." });
            if (!!IntervalIDDgSelect) {
                clearInterval(IntervalIDDgSelect);
            }
            IntervalIDDgSelect = setInterval(function () {
                $("#btn_Save").linkbutton("enable").linkbutton({ "text": "确认选择" });;
                AddProject();
                clearInterval(IntervalIDDgSelect);
            }, 1000);
        }
        function AddProject() {
            var rows = $('#dg').datagrid('getChecked');
            if (rows.length == 0) {
                //$.messager.alert("温馨提示", '请选择项目!');
                return;
            }
            var data = $('#dgSelect').datagrid('getData');
            var idList = "";
            $.each(data.rows, function (i, item) {
                idList += "," + item.CommID;
            });
            $.each(rows, function (i, item) {
                if (idList.indexOf(item.CommID) == -1) {
                    data.rows.push(item);
                };
            });
            $('#dgSelect').datagrid("loadData", { "total": data.length, "rows": data.rows });
            //$('#dgSelect').datagrid('reload');
            //$('#dg').datagrid('clearSelections');
            //$('#dg').datagrid('clearChecked');
            $.messager.show({
                title: '温馨提示',
                msg: '已选择的数据<br/>添加到已勾选项目列表成功!',
                width: 200,
                height: 90,
                timeout: 2000,
                showType: 'slide'
            });
        }

        function AddAllProject() {
            var nodes = $('#tree').tree('getChecked');
            if (nodes.length > 0) {
                var val = "";
                $.each(nodes, function (i, item) {
                    if ($(this).tree('isLeaf', item.target)) {
                        val += "," + item.id;
                    }
                });
                val = val.substr(1);
                var param = {};
                param.OrganCode = val;
                param.IsDelete = 0;
                param.IsPowerPost = $("#IsPowerPost").val();
                param.IsPowerLevel = $("#IsPowerLevel").val();
                $.dataPostJson('DivfManage_Dialog', 'GetListDataTableCommunity', param, true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.length > 0) {
                            var dgData = $('#dgSelect').datagrid('getData');
                            var idList = "";
                            $.each(dgData.rows, function (i, item) {
                                idList += "," + item.CommID;
                            })
                            $.each(data, function (i, item) {
                                if (idList.indexOf(item.CommID) == -1) {
                                    dgData.rows.push(item);
                                };
                            })
                            $('#dgSelect').datagrid("loadData", { "total": dgData.length, "rows": dgData.rows });
                            //$('#dg').datagrid('clearSelections');
                            //$('#dg').datagrid('clearChecked');
                            //$('#dg').datagrid('reload');
                            $.messager.show({
                                title: '温馨提示',
                                msg: '勾选的区域下的所有项目<br/>添加到勾选项目列表成功!',
                                width: 170,
                                height: 90,
                                timeout: 2000,
                                showType: 'slide'
                            });
                            InitDataGrid();
                        }
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
            } else {
                $.messager.alert("温馨提示", '请勾选区域!');
                return;
            }

        }
        function DelProject(commID) {
            var index = $('#dgSelect').datagrid('getRowIndex', commID);
            if (index > -1) {
                $('#dgSelect').datagrid('deleteRow', index);
                index = $('#dg').datagrid('getRowIndex', commID);
                if (index > -1) {
                    $('#dg').datagrid('unselectRow', index);

                }
            }
        }
        var columnSelect = [[
            //{ field: 'ck', checkbox: true },
            { field: 'OrganName', title: '区域名称', width: 250, align: 'center', sortable: false },
            { field: 'CommName', title: '项目名称', width: 250, align: 'center', sortable: false },
            { field: 'OrganCode', title: '区域编号', width: 100, align: 'center', sortable: false },
            { field: 'CommID', title: '项目编号', width: 100, align: 'center', sortable: false },
            {
                field: 'Operate', title: '操作', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    value = "<a onclick=\"DelProject('" + row.CommID + "')\" href=\"javascript:void(0)\">删除</a>";
                    return value;
                }
            }
        ]];

        function InitDataGridSelect() {
            $("#dgSelect").datagrid({
                //url: '/HM/M_Main/HC/DataPost.aspx',
                //method: "post",
                fit: true,
                nowrap: false,
                //pageSize: top.ListPageSize,
                //pageList: top.ListPageList,
                idField: "CommID",
                columns: columnSelect,
                rownumbers: true,
                fitColumns: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: true,
                border: false,
                //pagination: true,
                width: "100%",
                sortName: 'OrganCode',
                sortOrder: 'asc',
                remoteSort: false,
                onDblClickRow: function (index, row) {
                    //LayerDialog.ReturnIsJson = true;
                    //LayerDialog.Close(row);
                },
                onSelect: function (index, row) {

                },
                onBeforeLoad: function (param) {
                    //param.SortField = "CommID";
                    //param.SortOrder = 0;
                    //param.IsDelete = 0;
                    //param.OrganCode = $("#OrganCode").val();
                    //param.CommName = $("#CommName").textbox('getValue');
                    //param = $.getDataGridParam("DivfManage_Dialog", "GetListCommunity", param);
                },
                onLoadSuccess: function (data) {


                },
                onLoadError: function (data) {

                }
            });
        }
        function Save() {
            var data = $('#dgSelect').datagrid('getData');
            if (data.rows.length > 0) {
                LayerDialog.ReturnIsJson = true;
                LayerDialog.Close(data.rows);
            } else {
                $.messager.alert("温馨提示", '请选择需要的项目数据!');
            }
        }


    </script>
</body>
</html>
