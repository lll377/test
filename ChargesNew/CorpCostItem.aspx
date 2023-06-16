<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorpCostItem.aspx.cs" Inherits="M_Main.ChargesNew.CorpCostItem" %>

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
        <div id="mm" class="easyui-menu" data-options="onClick:menuHandler" style="width: 120px;">
            <div data-options="name:'newbj',iconCls:'icon-add'">新增本级</div>
            <div data-options="name:'newxj',iconCls:'icon-add'">新增下级</div>
            <div data-options="name:'newstan',iconCls:'icon-add'" id="add_next">新增收费标准</div>
            <div class="menu-sep"></div>
            <div data-options="name:'del',iconCls:'icon-cancel'">删除</div>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function menuHandler(item) {
                switch (item.name) {
                    case "newbj":
                        $("#ChkRoot").val("0");
                        HDialog.Open('800', '450', '../ChargesNew/CorpCostItemManage.aspx?ChkRoot=' + $("#ChkRoot").val() + '&CostCode=' + $("#CostCode").val() + '&CorpCostID=' + $("#CorpCostID").val() + '&OpType=insert', '收费项目详细', false, function callback(_Data) {
                            if (_Data != '') {
                                LoadList();
                            }
                        });
                        break;
                    case "newxj":
                        $("#ChkRoot").val("1");
                        HDialog.Open('800', '450', '../ChargesNew/CorpCostItemManage.aspx?ChkRoot=' + $("#ChkRoot").val() + '&CostCode=' + $("#CostCode").val() + '&CorpCostID=' + $("#CorpCostID").val() + '&OpType=insert', '收费项目详细', false, function callback(_Data) {
                            if (_Data != '') {
                                LoadList();
                            }
                        });
                        break;
                    case "newstan":
                        HDialog.Open('800', '600', '../ChargesNew/CorpCostStandardManage.aspx?CorpCostID=' + $("#CorpCostID").val() + '&OpType=insert&CorpStanID=0', '标准详细', false, function callback(_Data) {
                            if (_Data != '') {
                                LoadList();
                            }
                        });
                        break;
                    case "del":
                        var row = $("#TableContainer").datagrid("getSelected");
                        DelRecord(row)
                        break;
                }
            }

            function Detail(CorpCostID, OpType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('800', '450', '../ChargesNew/CorpCostItemManage.aspx?ChkRoot=' + $("#ChkRoot").val() + '&CostCode=' + $("#CostCode").val() + '&CorpCostID=' + CorpCostID + '&OpType=' + OpType, '收费项目详细', false, function callback(_Data) {
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
            column = [[
                {
                    field: 'text', title: '费用项目', align: 'left', width: 250, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.attributes.CorpCostID + "','edit');\">" + row.text + "</a>";
                        return str;
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
                                str = "其他公摊";
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
                            case "H0000":
                                str = "合同类";
                                break;
                        }
                        return str;
                    }
                },
                {
                    field: 'CorpCostID', title: '费用编号', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = row.attributes.CorpCostID;
                        return str;
                    }
                }
            ]];

            var IsCollapseAll = false;
            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        $("#ChkRoot").val("1");
                        HDialog.Open('800', '450', '../ChargesNew/CorpCostItemManage.aspx?CorpCostID=' + $("#CorpCostID").val() + '&ChkRoot=' + $("#ChkRoot").val() + '&CostCode=' + $("#CostCode").val() + '&CorpCostID=' + $("#CorpCostID").val() + '&OpType=insert', '收费项目详细', false, function callback(_Data) {
                            if (_Data != '') {
                                LoadList();
                            }
                        });
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        DelRecord(row)
                    }
                }, '-',
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
                }
            ];

            function DelRecord(row) {
                HDialog.Prompt('是否删除该收费项目', function () {

                    $.tool.DataGet('CostItem', 'Del', 'CorpCostID=' + row.attributes.CorpCostID,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data.substring(0, 5) == "false") {
                                HDialog.Info(_Data.substring(6));
                            }
                            else {
                                $('#SearchDlg').parent().appendTo($("form:first"));
                                LoadList();
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });

                });
                //$.messager.confirm('确定', '是否删除该收费项目', function (r) {
                //    if (r) {
                //        $.tool.DataGet('CostItem', 'Del', 'CorpCostID=' + row.attributes.CorpCostID,
                //        function Init() {
                //        },
                //        function callback(_Data) {
                //            if (_Data.substring(0, 5) == "false") {
                //                HDialog.Info(_Data.substring(6));
                //            }
                //            else {
                //                $('#SearchDlg').parent().appendTo($("form:first"));
                //                LoadList();
                //            }
                //        },
                //        function completeCallback() {
                //        },
                //        function errorCallback() {
                //        });
                //    }
                //});
            }

            function LoadList() {
                $("#TableContainer").treegrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CostItem&Command=List&' + $('#frmForm').serialize(),
                    treeField: 'text',
                    idField: 'id',
                    method: "get",
                    nowrap: false,
                    animate: false,
                    pageSize: 50,
                    pageList: [50, 150, 300],
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onClickRow: function (node) {
                        var IsParent = 0;
                        if ($('#TableContainer').treegrid("getChildren", node.id) == "") {
                            $("#mm").menu("enableItem", $("#add_next"));
                            IsParent = 0;
                        }
                        else {
                            $("#mm").menu("disableItem", $("#add_next"));
                            IsParent = 1;
                        }
                        $("#CostCode").val(node.id);
                        $("#CostName").val(node.text);
                        $("#CorpCostID").val(node.attributes.CorpCostID);
                        parent.$("#CorpCostStandardBrowse").attr("src", "CorpCostStandardBrowse.aspx?CorpCostID=" + node.attributes.CorpCostID + "&CostCode=" + node.id + "&IsParent=" + IsParent);
                    },
                    onLoadSuccess: function (data) {
                        $('#TableContainer').treegrid('collapseAll');
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
            LoadList();

            $(function () {

                $(document).bind('contextmenu', function (e) {
                    e.preventDefault();
                    $('#mm').menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });
                });
            });
        </script>
    </form>
</body>
</html>
