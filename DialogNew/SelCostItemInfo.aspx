<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelCostItemInfo.aspx.cs" Inherits="M_Main.DialogNew.SelCostItemInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 500px;
            height: 100px;
        }

        .SearchTable {
            width: 500px;
            height: auto;
        }
    </style>
</head>
<body>
    <form id="frmForm">
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <div class="SearchContainer" id="TableContainer">
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();
            var column;
            column = [[
                //{
                //    field: 'ck', checkbox: true
                //},
           
                { field: 'CostName', title: '费用名称', align: 'left', width: 200, sortable: true }
            ]];
            

            var OpType = $("#OpType").val();

            toolbar = [
                {
                    text: '确定选择',
                    iconCls: 'icon-ok',
                    handler: function () {
                        HDialog.ReturnIsJson = true;
                        var rows = $("#TableContainer").datagrid('getChecked');
                        var result = new Object();
                        result["CostID"] = "";
                        result["CostName"] = "";
                        result["CorpCostID"] = "";
                        if (rows != "") {
                            $.each(rows, function (index, item) {
                                result["CostID"] = result["CostID"] + item.CostID + ",";
                                result["CostName"] = result["CostName"] + item.CostName + ",";
                                result["CorpCostID"] = result["CorpCostID"] + item.CorpCostID + ",";
                            });
                            result["CostID"] = result["CostID"].substring(0, result["CostID"].length - 1);
                            result["CostName"] = result["CostName"].substring(0, result["CostName"].length - 1);
                            result["CorpCostID"] = result["CorpCostID"].substring(0, result["CorpCostID"].length - 1);
                            console.log(result);
                            HDialog.Close(result);
                        } else {
                            HDialog.Info('请选择一条数据!');
                        }
                    }
                }
            ];
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=PaymentSubject&Command=SelItem&' + $('#frmForm').serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: false,
                    remoteSort: false,
                    pagination: true,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
                
            LoadList();
        </script>
    </form>
</body>
</html>
