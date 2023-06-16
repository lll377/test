<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScanExceptionStatistics_TaskLevel.aspx.cs" Inherits="M_Main.ComprehensivePatrols.ScanExceptionStatistics_TaskLevel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>扫码已查统计表</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/PatrolDictionariesCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <style type="text/css">
        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            /*width: 180px;*/
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 88%;
            height: 46px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable .TdTitle {
            width: 120px;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            text-align: left;
            background: #fff;
        }

        .TdContentSearchDisable {
            background-color: #ccc;
        }

        .tabs-container .tab-content {
            padding: 0px;
        }

        .tabs-container .tab-pane {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .tabs-container .nav-tabs {
            background-color: #f5f5f5;
        }

        .SearchTable .InputColspan3 {
            width: 88%;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 230px; padding: 10px;">
            <table class="SearchTable" style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-validatebox" id="CommName" name="CommName" readonly="readonly" onclick="SelComm();" style="border: 1px #cccccc solid; width: 580px; height: 50px;" />
                        <input type="hidden" id="CommId" name="CommId" value="" />
                    </td>
                </tr>
                <tr>
                     <td class="TdTitle">扫码时间</td>
                    <td>
                        <input type="text" id="ScanDate" name="ScanDate" runat="server" style="border: 1px solid #cccccc; width: 120px; height: 18px;" class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" />
                    </td>
                </tr>
                <tr>
                    <td class="TdContentSearch" colspan="2" style="text-align: center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',width:80" onclick="$('#frmForm').form('clear');">重置</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>

     <script type="text/javascript">
         function InitTableHeight() {

             var h = $(window).height();
             $("#TableContainer").css("height", h + "px");
         }
         InitTableHeight();
         $(function () {
             InitDataGrid();
         });

         
         var column = [[
             { field: 'CommName', title: '项目名称', width: 150, align: 'left', sortable: true },
             { field: 'TaskNO', title: '任务编号', width: 150, align: 'left', sortable: true },
             { field: 'PointName', title: '点位名称', width: 150, align: 'left', sortable: true },
             { field: 'ScanUserName', title: '扫码人', width: 150, align: 'left', sortable: true },
             { field: 'ScanDate', title: '扫码时间', width: 150, align: 'left', sortable: true },
             { field: 'ScannedQRCodeGenerateDate', title: '被扫码的二维码生成时间', width: 150, align: 'left', sortable: true },
             { field: 'ActualQRCodeGenerateDate', title: '当时二维码的生成时间', width: 150, align: 'left', sortable: true }
         ]];
         var toolbar = [
             {
                 text: '筛选',
                 iconCls: 'icon-search',
                 handler: function () {
                     $('#SearchDlg').parent().appendTo($("form:first"))
                     $('#SearchDlg').dialog('open');
                 }
             }
         ];


         function SelComm() {
             HDialog.Open('700', '500', '../ComprehensivePatrols/SelComm.aspx?IsCheck=1', "选择项目", false, function callback(_Data) {
                 var arrRet = JSON.parse(_Data);
                 $("#CommId").val(arrRet.id);
                 $("#CommName").val(arrRet.name);
             });
         }

         function InitDataGrid() {
             $("#TableContainer").datagrid({
                 url: '/HM/M_Main/HC/DataPostControl.aspx',
                 method: "post",
                 loadMsg: '数据加载中,请稍候...',
                 nowrap: false,
                 pageSize: top.ListPageSize,
                 pageList: top.ListPageList,
                 columns: column,
                 fitColumns: false,
                 singleSelect: true,
                 pagination: true,
                 width: "100%",
                 toolbar: toolbar,
                 remoteSort: false,
                 border: false,
                 sortOrder: "asc",
                 onBeforeLoad: function (param) {
                     param = $.JQForm.GetParam("ExceptionScanned", "GetExceptionScannedList", "TableContainer", param);
                 }
             });
             $("#SearchDlg").dialog("close");
         }
     </script>
</body>
</html>
