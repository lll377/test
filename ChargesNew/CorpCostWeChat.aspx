<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorpCostWeChat.aspx.cs" Inherits="M_Main.ChargesNew.CorpCostWeChat" %>
<!DOCTYPE html>
<html>
<head>
    <title>费用科目设置</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 120px;
            height: 80px;
        }

        .SearchTable {
            width: 120px;
            height: auto;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="CorpCostID" name="CorpCostID" runat="server" />
        <input type="hidden" id="CostCode" name="CostCode" runat="server" />
        <input type="hidden" id="CostName" name="CostName" runat="server" />
        <input type="hidden" id="ChkRoot" name="ChkRoot" value="0" runat="server" />
        <div id="TableContainer">
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function Detail(CorpCostID, OpType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('800', '400', '../ChargesNew/CorpCostItemManage.aspx?ChkRoot=' + $("#ChkRoot").val() + '&CostCode=' + $("#CostCode").val() + '&CorpCostID=' + CorpCostID + '&OpType=' + OpType, '收费项目详细', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }


            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();
            var column;
            column = [[{ field: 'ck', checkbox: true },
                {
                    field: 'text', title: '费用项目', align: 'left', width: 200, sortable: true, editor: {
                        type: "text"
                    }
                },
                {
                    //B0001物业管理、B0002车位物管、B0003出租租金、B0004特约服务、B0005产权税费、G0001水公摊、G0002电公摊、G0003气公摊、G0004暖公摊、S1000水、S2000电、S3000气、S4000暖气、K0000宿管类
                    field: 'SysCostSign', title: '费用类型', align: 'left', width: 100, sortable: true, formatter: function (value, row, index) {
                        var str = row.attributes.SysCostSign;
                        switch (str) {
                            case "B0001":
                                str = "物管类";
                                break;
                            case "B0002":
                                str = "车位类";
                                break;
                            case "B0003":
                                str = "房屋租金";
                                break;
                            case "B0004":
                                str = "服务类";
                                break;
                            case "B0005":
                                str = "产权类";
                                break;
                            case "G0001":
                                str = "水公摊";
                                break;
                            case "G0002":
                                str = "电公摊";
                                break;
                            case "G0003":
                                str = "气公摊";
                                break;
                            case "G0004":
                                str = "暖公摊";
                                break;
                            case "S1000":
                                str = "水";
                                break;
                            case "S2000":
                                str = "电";
                                break;
                            case "S3000":
                                str = "气";
                                break;
                            case "S4000":
                                str = "暖气";
                                break;
                            case "K0000":
                                str = "宿管类";
                                break;
                        }
                        return str;
                    }
                },
                {
                    field: 'CorpCostID', title: '费用编号', align: 'left', width: 100, sortable: true, formatter: function (value, row, index) {
                        var str = row.attributes.CorpCostID; 
                        return str;
                    }
                }

            ]];

            var IsCollapseAll = false;
            var toolbar = [
                {
                    text: '展开/折叠',
                    iconCls: 'icon-redo',
                    handler: function () {
                        if (IsCollapseAll == true) {

                            $('#TableContainer').treegrid('expandAll');
                            IsCollapseAll = false;
                        }
                        else {

                            $('#TableContainer').treegrid('collapseAll');
                            IsCollapseAll = true;
                        }
                    }
                }, '-',{
                    text: '确定选择',
                    iconCls: 'icon-ok',
                    handler: function () {
                        var rows = $('#TableContainer').treegrid('getSelections');
                        if (rows == null) {
                            HDialog.Info("请勾选数据!");
                        } else {
                            Save(rows);
                        }
                    }
                }
            ];
            function Save(rows) {
                var CorpCostID = "";
                var CostName = "";
                for (var i = 0; i < rows.length; i++) {
                    CorpCostID += rows[i].attributes.CorpCostID + ",";
                    CostName += rows[i].text + ",";
                }
                CorpCostID = CorpCostID.substring(0, CorpCostID.length - 1);
                CostName = CostName.substring(0, CostName.length - 1);
                HDialog.Close(CorpCostID+"|"+CostName);
            }

            function LoadList() {
                $("#TableContainer").treegrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CostStan&Command=CorpCostItemList&' + $('#frmForm').serialize(),
                    treeField: 'text',
                    idField: 'id',
                    method: "get",
                    nowrap: false,
                    animate: false,
                    pageSize: 50,
                    pageList: [50, 150, 300],
                    columns: column,
                    fitColumns: false,
                    singleSelect: false,
                    checkOnSelect: true,
                    pagination: true,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onCheck: function (rowData) {
                        if (rowData.children != null) {
                                for (var i = 0; i < rowData.children.length; i++) {
                                    $('#TableContainer').treegrid('selectRow', rowData.children[i].id);
                                }
                            }
                    },
                    onUncheck: function (rowData) {
                         if (rowData.children != null) {
                                for (var i = 0; i < rowData.children.length; i++) {
                                    $('#TableContainer').treegrid('unselectRow', rowData.children[i].id);
                                }
                            }
                    },
                    onLoadSuccess: function (data) {
                        $('#TableContainer').treegrid('collapseAll');
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
            LoadList();


            var editIndex = undefined;
            function clickRow(node) {
                if (endEditing()) {
                    if (editIndex != undefined) {
                        $('#TableContainer').treegrid('select', editIndex);
                        return;
                    } else {
                        var row = node;//= $('#TableContainer').treegrid('getSelect');
                        if (row) {
                            editIndex = row.id;
                            $('#TableContainer').treegrid('beginEdit', editIndex);
                        }
                    }
                }
            }

            function endEditing() {
                if (editIndex == undefined) { return true; }
                if ($('#TableContainer').treegrid('validateRow', editIndex)) {
                    var ed = $('#TableContainer').treegrid('getEditor', { index: editIndex, field: 'text' });
                    $('#TableContainer').treegrid('endEdit', editIndex);
                    editIndex = undefined;
                    return true;
                } else {
                    return false;
                }
            }

        </script>
    </form>
</body>
</html>
