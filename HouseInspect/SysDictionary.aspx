<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysDictionary.aspx.cs" Inherits="M_Main.HouseInspect.SysDictionary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <title>查验字典</title>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="HIDictionary" runat="server">
        <input type="hidden" id="InitDType" name="InitDType" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 500px; height: 115px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">字典类别</td>
                    <td class="TdContent">
                        <select id="DType" name="DType" style="width: 100%; border: 1px solid #cccccc; height: 24px;">
                            <option value="" style="color: #000000;"></option>
                            <optgroup label="字典管理" style="color: Blue; font-weight: bold;">
                                <option value="产品形态" style="color: #000000;">产品形态</option>
                                <option value="装修属性" style="color: #000000;">装修属性</option>
                                <option value="查验批次" style="color: #000000;">查验批次</option>
                                <option value="所属专业" style="color: #000000;">所属专业</option>
                                <option value="重要程度" style="color: #000000;">重要程度</option>
                                <option value="修改原因" style="color: #000000;">修改原因</option>
                                <option value="不合格原因" style="color: #000000;">不合格原因</option>
                                <option value="问题级别" style="color: #000000;">问题级别</option>
                                <option value="房间类型" style="color: #000000;">房间类型</option>
                                <option value="公区类型" style="color: #000000;">公区类型</option>
                            </optgroup>
                        </select>
                    </td>
                    <td class="TdTitle">字典名称</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" style="width: 98%;height: 22px;" id="Name" name="Name" /></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a></td>
                </tr>
            </table>
        </div>
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            $(document).ready(function () {
                $('#DType').change(function () {
                    LoadList();
                })
            })

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();
            var column = [[
                { field: 'Id', title: 'ID', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'DType', title: '类别', width: 25, align: 'left', sortable: true },
                { field: 'Code', title: '编码', width: 25, align: 'left', sortable: true },
                {
                    field: 'Name', title: '名称', width: 25, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href=\"#\" onclick=\"Edit('" + row.Id + "')\">" + row.Name + "</a>";
                        return str;
                    }
                },
                { field: 'Sort', title: '序号', width: 45, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        HDialog.Open('600', '256', '../HouseInspect/SysDictionary_Detail.aspx?OpType=insert&DType=' + $("#DType").val(), '新增字典', true, function callback(_Data) {
                            LoadList();
                        });
                    }
                }, '-',

                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            $.messager.alert("提示", "请选择删除数据");
                            return;
                        }
                        DelRecord(row["Id"].toString());
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function DelRecord(Id) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('CsHouseInspect', 'DelDictionary', 'Id=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                LoadList();
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }
            function Edit(Id) {
                HDialog.Open('600', '256', '../HouseInspect/SysDictionary_Detail.aspx?OpType=edit&DType=' + $("#DType").val() + "&Id=" + Id, '编辑字典', true, function callback(_Data) {
                    LoadList();
                });
            }
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetDictionaryList&' + $('#HIDictionary').serialize(),
                    method: "get",
                    rownumbers: true,
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    border: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc"
                });
                $("#SearchDlg").dialog("close");
            }

            if ($("#InitDType").val() != "") {
                $("#DType").val($("#InitDType").val());
            }

            LoadList();

        </script>
    </form>
</body>
</html>
