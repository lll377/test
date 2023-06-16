<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.Emergency.Organization.List" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>应急组织管理</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/basebootstrap.css" rel="stylesheet" />

    <script src="../../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/echarts-3.7.2/WithTree/echarts.min.js"></script>

</head>

<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <input type="hidden" name="LoginRoleCode" id="LoginRoleCode" runat="server" />
    <input type="hidden" name="CommID" id="CommID" value="-1" />
    <input type="hidden" name="CommName" id="CommName" />
    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',border:true,width:300,title:'项目列表'">
            <ul id="treeOrgan" class="easyui-tree"></ul>
        </div>
        <div id="layout_center" data-options="region:'center',border:true,title:'应急组织登记-请选择项目!'," style="overflow: hidden">
            <div id="tab" class="easyui-tabs" data-options="onSelect:tabsSelect">
                <div id="tab0" issel="true" title="列表详情" style="overflow: hidden">
                    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
                </div>
                <div id="tab1" issel="false" title="图标详情" style="overflow: hidden">
                    <div id="main_orgStructure" style="overflow: hidden;"></div>
                </div>
            </div>
        </div>
    </div>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 600px; height: 172px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>应急组织岗位</span></td>
                    <td class="text">
                        <input id="RoleName" name="RoleName" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>姓名</span></td>
                    <td class="text">
                        <input id="UserName" name="UserName" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>联系电话</span></td>
                    <td class="text" colspan="3">
                        <input id="Tel" name="Tel" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script language="javascript" type="text/javascript">
        $(function () {
            PageInit();
        });
        function InitHeight() {
            var h = $(window).height();
            $("#tab0").css("height", h - 68 + "px");
            $("#tab1").css("width", $(window).width() + "px");
            $("#tab1").css("height", h - 82 + "px");
            $("#main_orgStructure").css("height", h - 82 + "px");
        }
        function PageInit() {
            InitHeight();
            InitDataTree();
            InitDataGrid();
        }

        function tabsSelect(title, index) {
            if (index == 1) {
                setTimeout(function () {
                    GetOrganizationData();
                }, 300);
            } else {
                setTimeout(function () {
                    InitDataGrid();
                }, 300);
            }
        }
        //机构
        function InitDataTree() {
            $("#treeOrgan").tree({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                treeField: 'text',
                idField: 'id',
                lines: true,
                animate: true,
                border: false,
                loadMsg: '加载中,请稍侯...',
                onLoadSuccess: function (node, data) {
                    if (data.length > 0) {
                        var dataJson = $("#treeOrgan").tree("getChildren");
                        $.each(dataJson, function (i, itemNode) {
                            if ($("#treeOrgan").tree("isLeaf", itemNode.target)) {
                                //默认选中第一个节点
                                $("#treeOrgan").tree('select', itemNode.target);
                                return false;
                            }
                        });
                    } else {
                        InitDataGrid();
                    }
                },
                onBeforeLoad: function (row, param) {
                    param.Class = "CpComPatrols";
                    param.Method = "DepMenuList";
                    //控制用户权限
                    param.SelRoleCode = $("#LoginRoleCode").val();

                },
                onBeforeSelect: function (node) {
                    if (!$(this).tree('isLeaf', node.target) || node.attributes.CommID == 0) {
                        return false;
                    }
                },
                onSelect: function (row) {
                    $('#layout_center').panel('setTitle', '应急组织登记列表-' + row.text);
                    $("#CommID").val(row.attributes.CommID);
                    $("#CommName").val(row.text);
                    $('#frm').form('clear');
                    var tab = $('#tab').tabs('getSelected');
                    var index = $('#tab').tabs('getTabIndex', tab);
                    tabsSelect('', index);
                    //InitDataGrid();
                }
            });
        }
        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    if ($("#CommID").val() == "-1") {
                        $.messager.alert('温馨提示', '请选择项目!');
                        return;
                    }
                    Edit("新增", '');
                }
            }, '-',
            {
                text: '编辑',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#dg").datagrid("getSelected");
                    if (row) {
                        Edit('编辑', row.ID);
                    } else {
                        $.messager.alert("温馨提示", '请选择一行需要编辑的数据!');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#dg").datagrid("getSelected");
                    if (row) {
                        Del(row.ID);
                    } else {
                        $.messager.alert("温馨提示", '请选择需要删除的数据!');
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
                text: '上传文档',
                iconCls: 'icon-save',
                handler: function () {
                    var param = {"KeyID": $("#CommID").val()};
                    LayerDialog.OpenWin('800', '500', '../Emergency/Organization/UploadFile.aspx?' + $.param(param), "管理组织文档上传", false, function callback(_Data) {
                    });
                }
            }
            //'-', {
            //    text: '导出',
            //    iconCls: 'icon-page_white_excel',
            //    handler: function () {
            //        if ($("#CommID").val() == "-1") {
            //            $.messager.alert('温馨提示', '请选择项目!');
            //            return;
            //        }
            //        window.open("EqSpaceListoutput.aspx?random=" + Math.random());
            //    }
            //}
        ];
        var column = [[
            //{ field: 'ck', checkbox: true },
            {
                field: 'CommName', title: '项目名称', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                field: 'RoleName', title: '应急组织岗位', width: 80, align: 'center', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                field: 'UserName', title: '姓名', width: 40, align: 'center', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                field: 'Tel', title: '联系电话', width: 60, align: 'center', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                field: 'Remark', title: '备注', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }
        ]];
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
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
                toolbar: toolbar,
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onClickRow: function (index, row) {
                },
                onBeforeLoad: function (param) {
                    param = $.getDataGridParam("Emergency_Organization", "GetList", param);
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
        function Edit(title, id) {
            var OpType = "Add";
            if (isValueNull(id)) { OpType = "Edit"; }
            var param = { "OpType": OpType, "ID": id, "CommID": $("#CommID").val(), "CommName": $("#CommName").val() };
            LayerDialog.OpenWin('450', '350', '../Emergency/Organization/Edit.aspx?' + $.param(param), title, true, function callback(_Data) {
                InitDataGrid();
            });
        }
        function Del(idList) {
            $.messager.confirm('确定', '是否删除?', function (r) {
                if (r) {
                    $.dataPostJson('Emergency_Organization', 'Del', { "idList": idList }, true, false,
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
    </script>
    <script type="text/javascript">

        //获取数据
        function GetOrganizationData() {
            $.dataPostJson('Emergency_Organization', 'GetTreeList', { "CommID": $('#CommID').val() }, true, false,
                function Init() {
                },
                function callback(Resultdata) {
                    var RowsCount = 0;
                    if (Resultdata.RowsCount != "") {
                        RowsCount = Resultdata.RowsCount;
                    }
                    InitTable(Resultdata.Data, RowsCount);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function InitTable(DataObj, RowsCount) {
            var OptionWith = 0;
            var OptionHeight = 0;
            if (DataObj.length == 1) {
                OptionWith = 185 * parseInt(RowsCount);
                OptionHeight = 300;
            }
            var myChart1 = echarts.init(document.getElementById('main_orgStructure'));
            myChart1.clear();
            // 基于准备好的dom，初始化echarts图表
            var option = {
                series: [
                    {
                        type: 'tree',
                        width: OptionWith, // 185*Level
                        height: OptionHeight,// 70*Level
                        top: '20%',
                        left: '10%',
                        bottom: '20%',
                        right: '15%',
                        orient: 'vertical',  // vertical horizontal
                        symbol: 'rectangle',
                        symbolSize: [120, 40],
                        symbolKeepAspect: false,
                        initialTreeDepth: -1,
                        roam: true,
                        itemStyle: {
                            normal: {
                                color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
                                    offset: 0,
                                    color: '#2196f3'
                                }, {
                                    offset: 1,
                                    color: '#4c6cca'
                                }]),//节点背景色
                                label: {
                                    show: true,
                                    position: 'inside',
                                    color: 'white',
                                    textStyle: {
                                        fontSize: 13,
                                    }
                                },
                                borderWidth: 0,
                                borderColor: 'white',
                                shadowColor: '#6A48D7',//阴影颜色
                                shadowBlur: 5,
                                shadowOffsetX: 5,
                                shadowOffsetY: 5
                            },
                            emphasis: {
                                label: {
                                    show: false
                                }
                            }
                        },
                        lineStyle: {
                            color: '#4C6CCA',
                            width: 3,
                            type: 'solid', // 'curve'|'broken'|'solid'|'dotted'|'dashed'
                            curveness: 0.8
                        },
                        data: DataObj
                    }
                ]
            };
            // 为echarts对象加载数据 
            myChart1.setOption(option);
        }
    </script>
</body>
</html>
