<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelEmergencyMaterial.aspx.cs" Inherits="M_Main.Emergency.SelEmergencyMaterial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择应急物资</title>
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
    <script src="../jscript/help.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>

    <style type="text/css">
       
        .SearchTable {
            width: 700px;
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
                width: 11%;
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
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmForm" runat="server">
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <div style="background-color: #cccccc; width: 100%; height: 100%;" id="TableContainer"></div>
        <div id="dlg_search_point" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">物资类别</td>
                    <td class="TdContentSearch">
                        <input type="text" id="MaterialCategoryName" name="MaterialCategoryName" runat="server" onclick="SelMaterialCategory()" class="easyui-validatebox" readonly />
                        <input type="hidden" id="MaterialCategoryID" name="MaterialCategoryID" runat="server" />
                    </td>
                    <td class="TdTitle">物资名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="MaterialName" name="MaterialName" runat="server" onclick="SelMaterialName()" class="easyui-validatebox" readonly />
                        <input type="hidden" id="MaterialNameID" name="MaterialNameID" runat="server" />
                    </td>
                    <td class="TdTitle">应急类别</td>
                    <td class="TdContentSearch">
                        <input type="text" id="EmergencyTypeNames" name="EmergencyTypeNames" runat="server" onclick="SelEmergencyType()" class="easyui-validatebox" readonly />
                        <input type="hidden" id="EmergencyTypeID" name="EmergencyTypeID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearValue()">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css({ "height": h + "px" });
            }

            function ClearValue() {
                $('#MaterialCategoryName').val("");
                $('#MaterialCategoryID').val("");
                $('#MaterialName').val("");
                $('#MaterialNameID').val("");
                $('#EmergencyTypeNames').val("");
                $('#EmergencyTypeID').val("");
            }

            //选择 物资类别
            function SelMaterialCategory() {
                HDialog.OpenWin('600', '400', '../Emergency/Dialog/EmergencyDictionary.aspx?' + $.param({ DType: '应急物资类别' }), '选择物资类别', false, function callback(data) {
                    if (data != "") {
                        data = $.parseJSON(data);
                        $("#MaterialCategoryID").val(data.ID);
                        $("#MaterialCategoryName").val(data.Name);
                    }

                });
            }
            //选择 物资名称
            function SelMaterialName() {
                HDialog.OpenWin('600', '400', '../Emergency/Dialog/EmergencyDictionary.aspx?' + $.param({ DType: '应急物资名称' }), '选择物资类别', false, function callback(data) {
                    if (data != "") {
                        data = $.parseJSON(data);
                        $("#MaterialNameID").val(data.ID);
                        $("#MaterialName").val(data.Name);
                    }

                });
            }

            //选择 应急类型  多选末级应急类型
            function SelEmergencyType() {
                HDialog.Open('600', '400', '../Emergency/Dialog/EmergencyType.aspx?Ismultiple=1', '选择应急类型', false, function callback(_Data) {
                    if (_Data) {
                        var data = $.parseJSON(_Data);
                        $("#EmergencyTypeID").val(data.id);
                        $("#EmergencyTypeNames").val(data.name);
                    };
                })
            }

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'CommName', title: '项目名称', width: 140, align: 'left', sortable: true },
                { field: 'MaterialCategoryName', title: '物资类别', width: 120, align: 'left', sortable: true },
                { field: 'MaterialName', title: '物资名称', width: 140, align: 'left', sortable: true },
                { field: 'MaterialUnit', title: '物资单位', width: 80, align: 'left', sortable: true },
                { field: 'SpecificationType', title: '规格型号', width: 100, align: 'left', sortable: true },
                { field: 'ShouldMatchNum', title: '应配数量', width: 80, align: 'left', sortable: true },
                {
                    field: 'QualityLimit', title: '质保期限', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (value != "") {
                            return formatDate(value, 'yyyy-MM-dd');
                        }
                        return "";
                    }},
                { field: 'DepositPlace', title: '存放地点', width: 180, align: 'left', sortable: true }
            ]];


            var toolbar = [
                {
                    text: '确定选择',
                    iconCls: 'icon-save',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getChecked");
                        if (row.length == 0) {
                            HDialog.Info("请至少勾选一行数据!");
                            return;
                        } else {
                            HDialog.ReturnIsJson = true;
                            HDialog.Close(row);
                        }
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#dlg_search_point').dialog('open');
                    }
                }];

            function LoadList() {
                $('#CommID').val($.getUrlParam('CommID'));
                var parameterStr = "CommID=" + $('#CommID').val() + "&MaterialCategoryID=" + $('#MaterialCategoryID').val()
                    + "&MaterialNameID=" + $('#MaterialNameID').val() + "&EmergencyTypeID=" + $('#EmergencyTypeID').val();
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Emergency&Command=GetEmergencyMaterialListForSelect&' + parameterStr,
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: 50,
                    pageList: [50, 100, 300],
                    checkOnSelect: false,
                    selectOnCheck: false,
                    singleSelect: true,
                    rownumbers: true,
                    columns: column,
                    fitColumns: true,
                    pagination: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc"
                });
                $('#dlg_search_point').dialog('close');
            }
            $(function () {
                InitTableHeight();
                LoadList();
            })
        </script>
    </form>
</body>
</html>
