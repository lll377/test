<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Organ.aspx.cs" Inherits="M_Main.DiversifiedManage.Dialog.Organ" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>区域选择</title>
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
                        <a href="javascript:void(0)" class="easyui-linkbutton " data-options="iconCls:'icon-search',width:80,plain:false" onclick="LoadTree();">筛选</a>
                        <input class="easyui-checkbox " id="ckb_join" name="ckb_join" data-options="" />
                        <%--<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:85" onclick="javascript:$('#tree').tree('reload');">清除勾选</a>--%>
                    </div>
                </div>
            </form>
            <div style="height: 40px"></div>
            <ul id="tree" class="easyui-tree"></ul>
        </div>
        <div id="layout_center" data-options="region:'center',split:false,border:true,title:'已勾选的区域列表',">
            <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
    </div>
    <div id="toolbar" class="easyui-panel" data-options="closed:true" style="background: #F5F5F5">
        <div>
            <form id="frm" class="form-horizontal" role="form">
                <div class="form-group">
                    <div class="col-sm-12 col-md-12" style="padding: 0">
                        <%--  <input id="CommName" name="CommName" class="easyui-textbox" data-options="prompt:'项目名称',
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:85" onclick="InitDataGrid();">筛选</a>--%>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="DgClear()">清空已选列表</a>
                        <%--<a href="javascript:void(0)" title="功能诠释：<br/>&emsp;&emsp;将当前勾选的项目加到下方已勾选项目列表中!" class="easyui-linkbutton easyui-tooltip" data-options="iconCls:'icon-add',width:85" onclick="AddProject()">添加</a>--%>
                        <%--<a href="javascript:void(0)" title="功能诠释：<br/>&emsp;&emsp;将左侧区域列表勾选的区域下的所有项目添加到下方已勾选项目列表中!" class="easyui-linkbutton easyui-tooltip" data-options="iconCls:'icon-add'" onclick="AddAllProject()">一键添加(勾选区域)</a>--%>
                        <a href="javascript:void(0)" id="btn_Save" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="Save();">确定选择</a>
                        <a href="javascript:void(0)" title="温馨提示：<br/>&emsp;&emsp;如果 [ 联动选择 ] 已勾选上,当操作删除区域功能时,区域如果是父节点,则当前节点下的所有子节点区域同时删除!" class="easyui-linkbutton easyui-tooltip" data-options="plain:true,iconCls:'icon-help'"></a>
                    </div>
                </div>
            </form>
        </div>
    </div>
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
            InitDataGrid();
            $("#layout_center").panel({
                onResize: function (width, height) {
                    SetToolbar(width)
                }
            });
        });
        function InitPage() {
            $("#ckb_join").checkbox({
                label: '联动选择',
                labelAlign: 'left',
                labelPosition: 'after',
                labelWidth: 55,
                onChange: function (checked) {
                    IsCascadeCheck = checked;
                    LoadTree();
                }
            });
            setTimeout(function () {
                $('.textbox-label-after').tooltip({
                    position: 'bottom',
                    content: '<div>功能诠释:<br/><p>&emsp;&emsp;1、勾&nbsp;&nbsp;&nbsp;&nbsp;选:选择父节点时当前节点下的所有子节点同时勾选!</p><p>&emsp;&emsp;2、未勾选:只选择当前节点!</p></div>',
                });
            }, 500);
            SetToolbar($("#layout_center").width());
        }
        function SetToolbar(w) {
            $('#toolbar').width(w);
        }

        var IsAdd = true, IsCascadeCheck = false;
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
                cascadeCheck: IsCascadeCheck,
                //cascadeCheck: true,
                //onlyLeafCheck: true,
                loadMsg: '加载中,请稍侯...',
                onLoadSuccess: function (node, data) {
                    $.messager.progress('close');
                    var node, dataDg = $('#dg').datagrid('getData');
                    if (dataDg.rows.length > 0) {
                        IsAdd = false;
                        $.each(dataDg.rows, function (i, item) {
                            node = $('#tree').tree('find', item.id);
                            if (!!node) {
                                $('#tree').tree('check', node.target);
                            }
                        });
                        TreeDelayLoad();
                        IsAdd = true;
                    }
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
                    if (IsAdd && checked) {
                        TreeDelayLoad();
                    }
                    if (!checked) {
                        if (node.attributes.LastNodeTotal > 0 && IsCascadeCheck) {
                            var data = $('#tree').tree('getChildren', node.target);
                            $.each(data, function (i, item) {
                                DelOrgan(item.id);
                            });
                        }
                        DelOrgan(node.id);
                    }
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
            $('#btn_Save').linkbutton('disable').linkbutton({ "text": "正在处理数据..." });
            if (!!IntervalID) {
                clearInterval(IntervalID);
            }
            IntervalID = setInterval(function () {
                AddOrgan();
                clearInterval(IntervalID);
                $("#btn_Save").linkbutton("enable").linkbutton({ "text": "确认选择" });;
            }, 1000);
        }
        function AddOrgan() {
            var nodes = $('#tree').tree('getChecked');
            if (nodes.length > 0) {
                var data = $('#dg').datagrid("getData");
                var idList = "";
                $.each(data.rows, function (i, item) {
                    idList += "_" + item.id + "_";
                });
                $.each(nodes, function (i, item) {
                    //if (item.attributes.LastNodeTotal == 0) {
                    if (idList.indexOf("_" + item.id + "_") == -1) {
                        data.rows.push(item);
                    };
                    //}
                });
                $('#dg').datagrid("loadData", { "total": data.length, "rows": data.rows });
                $.messager.show({
                    title: '温馨提示',
                    msg: '已选择的数据<br/>添加到已勾选区域列表成功!',
                    width: 200,
                    height: 90,
                    timeout: 2000,
                    showType: 'slide'
                });
            }
        }
        function DgClear() {
            $('#dg').datagrid("loadData", { "total": 0, "rows": [] });
            $('#tree').tree('reload');
        }
        function DelOrgan(id) {

            //IsAdd = false;
            var index = $('#dg').datagrid('getRowIndex', id);
            if (index > -1) {
                $('#dg').datagrid('deleteRow', index);
            }
            var node = $('#tree').tree('find', id);
            $('#tree').tree('uncheck', node.target);
        }
        var column = [[
            //{ field: 'ck', checkbox: true },
            { field: 'text', title: '区域名称', width: 250, align: 'center', sortable: false },
            { field: 'id', title: '区域编号', width: 100, align: 'center', sortable: false },
            {
                field: 'Operate', title: '操作', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    value = "<a onclick=\"DelOrgan('" + row.id + "')\" href=\"javascript:void(0)\">删除</a>";
                    return value;
                }
            }
        ]];
        function InitDataGrid() {
            $("#dg").datagrid({
                //url: '/HM/M_Main/HC/DataPost.aspx',
                //method: "post",
                fit: true,
                nowrap: false,
                //pageSize: top.ListPageSize,
                //pageList: top.ListPageList,
                idField: "id",
                columns: column,
                rownumbers: true,
                fitColumns: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: true,
                border: false,
                //pagination: true,
                width: "100%",
                toolbar: "#toolbar",
                sortName: 'id',
                sortOrder: 'asc',
                remoteSort: false,
                onDblClickRow: function (index, row) {
                    //LayerDialog.ReturnIsJson = true;
                    //LayerDialog.Close(row);
                },
                onCheckAll: function (rows) {

                }, onUncheckAll: function (rows) {

                },
                onBeforeSelect: function (index, row) {

                },
                onBeforeUnselect: function (index, row) {
                },
                onSelect: function (index, row) {

                },
                onBeforeLoad: function (param) {

                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {

                }
            });
            $('#dg').datagrid('clearSelections');
            $('#dg').datagrid('clearChecked');
        }
        function Save() {
            var data = $('#dg').datagrid('getData');
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
