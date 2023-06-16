<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelTemplateList.aspx.cs" Inherits="M_Main.HouseInspect.SelTemplateList" %>

<!DOCTYPE html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>选择查验模板</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>

    <style type="text/css">
        body {
            background-color: #f5f5f5;
            overflow: hidden;
        }

        .active {
            background-color: #cccccc;
        }

        #SearchDlg table tr {
            height: 35px;
        }

            #SearchDlg table tr td {
                width: 60px;
            }

        .combobox-item {
            height: 25px;
        }
    </style>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmFrom" runat="server">
        <input type="hidden" id="Flag" name="Flag" value="GenerationTask" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var column = [[
                //{ field: 'ck', checkbox: true },
                { field: 'TemplateId', title: '模板Id', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'Form', title: '产品形态', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'Decoration', title: '装修属性', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'InspectionRange', title: '所属区域', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'Batch', title: '查验批次', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'TemplateName', title: '模板名称', width: 40, align: 'left', sortable: true },
                { field: 'FormName', title: '产品形态', width: 40, align: 'left', sortable: true },
                { field: 'DecorationName', title: '装修属性', width: 40, align: 'left', sortable: true },
                { field: 'BatchName', title: '查验批次', width: 40, align: 'left', sortable: true }
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
                            HDialog.Close(GetSysTemplateDataGridCheckId());
                        }
                    }
                }
            ];

            //获取主table单选或者批量的ID
            function GetSysTemplateDataGridCheckId() {
                var TemplateId = "";
                var TemplateName = [];
                var InspectionRange = "";
                var row = $("#TableContainer").datagrid("getChecked");
                if (row.length > 0) {
                    for (var i = 0; i < row.length; i++) {
                        TemplateId += "," + row[i].TemplateId;
                        TemplateName[i] = row[i].TemplateName;
                        InspectionRange = row[i].InspectionRange;
                    }
                   
                    if (TemplateId.length > 0)
                        TemplateId = TemplateId.substr(1, TemplateId.length - 1);
                    if (TemplateName.length > 0)
                        TemplateName = TemplateName.join(',\r\n');
                }
                
                return TemplateId + "◆" + TemplateName + "◆" + InspectionRange;
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetTemplateList',
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    rownumbers: true,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    checkOnSelect: true,
                    selectOnCheck: true,
                    singleSelect: true,
                    columns: column,
                    fitColumns: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc"
                });
            }
            LoadList();

        </script>
    </form>
</body>
</html>
