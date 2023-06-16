<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaseUnitManageList.aspx.cs" Inherits="M_Main.LeaseManage.LeaseUnitManageList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁合同，出租方管理方列表页面</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
        #dlg_search_AuditSet {
            padding: 10px;
            width: auto;
            height: auto;
        }

        .SearchTable {
            width: 420px;
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
                width: 12%;
                text-align: right;
                background: #F8F8F8;
            }

            .SearchTable tr .TdContentSearch {
                width: 20%;
                text-align: left;
                background: #fff;
            }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        #CommName {
            width: 97%;
            height: 40px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
            border-radius: 5px;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden">
    <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
    </div>
    <div id="dlg_search_AuditSet" class="easyui-dialog" title="筛选" data-options=" iconCls:'icon-search',modal:true,closed:true">
        <form id="frmFrom" runat="server">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">单位类型</td>
                    <td class="TdContentSearch">
                        <select id="UnitType" name="UnitType" class="easyui-combobox" style="width: 80px;" runat="server" data-options="editable:false,panelHeight:'auto'">
                            <option value="" selected></option>
                            <option value="出租方">出租方</option>
                            <option value="管理方">管理方</option>
                        </select>
                    </td>
                    <td class="TdTitle">单位名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="UnitName" name="UnitName" class="easyui-validatebox" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearWhere()">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script type="text/javascript"> 
        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h - 2 + "px");
        }

        function ClearWhere() {
            $('#frmFrom').form('clear');
        }

        var column = [[
            { field: 'UnitType', title: '单位类型', width: 180, align: 'left' },
            {
                field: 'UnitName', title: '单位名称', width: 320, align: 'left', formatter: function (value, row, index) {
                    var str = "<a style=\"color:blue\" onclick=\"Detail('edit','" + row.ID + "')\" href=\"javascript:void(0);\">" + value + "</a>";
                    return str;
                }
            }
        ]];

        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    Detail("insert", '');
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row == null) {
                        HDialog.Info('请选择需要删除的数据!');
                        return;
                    }
                    Del(row.ID);
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search_AuditSet').dialog('open');
                }
            }
        ];

        //详情
        function Detail(OpType, ID) {
            var w = 600;
            var h = 300;
            HDialog.Open(w, h, '../LeaseManage/LeaseUnitManage.aspx?OpType=' + OpType + '&ID=' + ID, "租赁设置详情", false, function callback(_Data) {
                if (_Data != "") {
                    LoadList();
                }
            });
        }
        //删除
        function Del(IdList) {
            $.messager.confirm('温馨提示', '确定删除选择的租赁设置?', function (r) {
                if (r) {
                    $.tool.DataPostJson('LeaseManage', 'DelLeaseUnit', "idList=" + IdList,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                HDialog.Info("删除成功");
                                LoadList();
                            } else {
                                HDialog.Info(data.msg);
                            }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            });
        }

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                pageSize: 50,
                pageList: [50, 100, 300],
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: false,
                remoteSort: false,
                columns: column,
                fitColumns: false,
                rownumbers: true,
                pagination: true,
                toolbar: toolbar,
                border: false,
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("LeaseManage", "GetLeaseUnitList", "TableContainer", param);
                }
            });
            $("#dlg_search_AuditSet").dialog("close");
        }
        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }

        //页面初始化
        $(function () {
            InitTableHeight();
            LoadList();
        });
    </script>

</body>
</html>
