<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EqDictionary.aspx.cs" Inherits="M_Main.EquipmentNew.EqDictionary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>设备字典</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
        .SearchTable {
            width: 500px;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

            .SearchTable tr td {
                color: #666;
                padding: 5px;
                background: #F8F8F8;
                border-right: 1px solid #E7EAEC;
                border-bottom: 1px solid #E7EAEC;
            }

            .SearchTable tr .TdTitle {
                width: 8%;
                text-align: right;
                background: #F8F8F8;
            }

            .SearchTable tr .TdContentSearch {
                width: 15%;
                text-align: left;
                background: #fff;
            }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden">
    <form id="EqDictionary" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 500px; height: 130px; padding: 10px; overflow: hidden;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">字典类别</td>
                    <td class="TdContentSearch">
                        <select id="DType" name="DType" class="easyui-combobox" data-options="editable:false,panelHeight:'auto',width:'auto'">
                            <option value="通用设备空间">通用设备空间</option>
                            <option value="巡检类别">巡检类别</option>
                            <option value="维保类别">维保类别</option>
                            <option value="大事件类别">大事件类别</option>
                            <option value="关闭原因">关闭原因</option>
                        </select>
                    </td>
                    <td class="TdTitle">字典名称</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-validatebox" id="Name" name="Name" /></td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#EqDictionary').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">


            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            var column = [[
                    { field: 'Sort', title: '序号', width: 25, align: 'left', sortable: true },
                    { field: 'DType', title: '类别', width: 25, align: 'left', sortable: true },
                    { field: 'Code', title: '编码', width: 25, align: 'left', sortable: true },
                    {
                        field: 'Name', title: '名称', width: 25, align: 'left', sortable: true, formatter: function (value, row, index) {
                            var str = "<a class=\"HrefStyle\" href=\"javascript:void(0)\" onclick=\"Edit('" + row.Id + "','edit')\">" + row.Name + "</a>";
                            return str;
                        }
                    }
            ]];

            var toolbar = [
                 {
                     text: '新增',
                     iconCls: 'icon-add',
                     handler: function () {
                         Edit('', 'insert')
                     }
                 }, '-',
                     {
                         text: '删除',
                         iconCls: 'icon-cancel',
                         handler: function () {
                             var row = $("#TableContainer").datagrid("getSelected");
                             if (row == null) {
                                 HDialog.Info("请选择需要删除数据");
                                 return;
                             }
                             DelRecord(row["Id"].toString());
                         }
                     }, '-',
                    {
                        text: '筛选',
                        iconCls: 'icon-search',
                        handler: function () {
                            $('#SearchDlg').parent().appendTo($("form:first"))
                            $('#SearchDlg').dialog('open');
                        }
                    }
            ];

            function DelRecord(Id) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('CsEquipment', 'DelDictionary', 'Id=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "true") {
                                    HDialog.Info("删除成功");
                                    LoadList();
                                } else {
                                    HDialog.Info(_Data);
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }
            //编辑
            function Edit(Id, OpType) {
                HDialog.Open('600', '260', '../EquipmentNew/EqDictionary_Detail.aspx?OpType=' + OpType + '&DType=' + $("#DType").val() + "&Id=" + Id, '编辑字典', true, function callback(_Data) {
                    if (_Data != "") {
                        LoadList();
                    }
                });
            }
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetDictionaryList&' + $('#EqDictionary').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: 20,
                    pageList: [20, 50, 100],
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

            $(function () {
                InitTableHeight();
                $('#DType').combobox("clear");
                $('#DType').change(function () {
                    LoadList();
                })
                LoadList();
            });

        </script>
    </form>
</body>
</html>
