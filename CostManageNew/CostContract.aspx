<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostContract.aspx.cs" Inherits="M_Main.CostManageNew.CostContract" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>合同设置</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery.tool.new.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',border:true,width:380">
            <div class="easyui-layout" data-options="fit:true">
                <div data-options="region:'center',border:false">
                    <ul id="treeDemo" style="width: 100%;" class="easyui-tree">
                    </ul>
                </div>
                <div data-options="region:'south',border:false" style="text-align: center; padding: 5px 0; height: 40px;">
                    <input type="button" class="button" style="width: 90px;" value="新增类别" id="BtnSave" onclick="AddItemClick();" />
                    <input type="button" class="button" style="width: 90px;" value="修改类别" id="BtnUpdate" onclick="UpdateItemClick();" />
                    <input type="button" class="button" style="width: 90px;" value="删除类别" id="BtnDelete" onclick="DeleteItemClick();" />
                </div>
            </div>
        </div>
        <div id="layout_center" data-options="region:'center',border:true" style="overflow: hidden;">
            <div style="background-color: #cccccc;" id="TableContainer"></div>
        </div>
    </div>
    <form id="frmForm" runat="server">
        <input type="hidden" id="CtId" name="CtId" />
        <input type="hidden" id="OpType" name="OpType" />
    </form>
    <script type="text/javascript">
        function zTreeOnClick(TypeName, CtId) {
            document.getElementById("CtId").value = CtId;
            //根据合同类型加载合同内容
            LoadList();
        }

        function InitTree() {
            $.tool.DataGet('CsCost', 'GetContractTypeEasyUiTree', "",
                function Init() {
                },
                function callback(_Data) {
                    if (_Data != '') {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        GetTree(varObjects);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        InitTree();
        function GetTree(obj) {
            $('#treeDemo').html("");
            $('#treeDemo').tree({
                data: obj,
                onClick: function (node) {
                    zTreeOnClick(node.text, node.attributes.CtId);
                }
            });
        }

        function AddItemClick() {
            HDialog.Open('600', '300', '../CostManageNew/CostContractType_XX.aspx?OpType=insert&CtId=' + $("#CtId").val(),
                '新增合同类别', true, function callback(_Data) {
                    InitTree();
                });
        }

        function UpdateItemClick() {
            var CtId = document.getElementById("CtId").value;
            if (CtId != null && CtId != "" && CtId != undefined) {
                HDialog.Open('600', '300', '../CostManageNew/CostContractType_XX.aspx?OpType=edit&CtId=' + $("#CtId").val(),
                    '修改合同类别', true, function callback(_Data) {
                        InitTree();
                    });
            } else {
                HDialog.Info("请先选择修改项");
            }
        }

        function DeleteItemClick() {
            var CtId = document.getElementById("CtId").value;
            if (CtId != null && CtId != "" && CtId != undefined) {
                HDialog.Prompt('是否确定删除!', function () {
                    $.tool.DataGet('CsCost', 'DelCostContractType', $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            $("#Sort").val("");
                            $("#TypeName").val("");
                            $("#Remark").val("");
                            if (_Data != '') {
                                varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                GetTree(varObjects);
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            } else {
                HDialog.Info("请先选择删除项");
            }
        }

        var column = [[
            { field: 'CcId', title: 'CcId', width: 25, align: 'left', sortable: true, hidden: true },
            { field: 'ContentName', title: '合同内容', width: 80, align: 'left', sortable: true },
            { field: 'Remark', title: '备注', width: 40, align: 'left', sortable: true },
        ]];

        var toolbar = [
            {
                text: '新增内容',
                iconCls: 'icon-add',
                handler: function () {
                    var CtId = document.getElementById("CtId").value;
                    if (CtId != null && CtId != "" && CtId != undefined) {
                        HDialog.Open('600', '260', '../CostManageNew/CostContract_XX.aspx?OpType=insert&CtId=' + $("#CtId").val(),
                            '新增合同内容', true, function callback(_Data) {
                                LoadList();
                            });
                    } else {
                        HDialog.Info("请先选择合同类别");
                    }
                }
            }, '-', {
                text: '删除内容',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row != null) {
                        DelRecord(row.CcId);
                    }
                    else {
                        HDialog.Info("请选择一行数据进行删除！");
                    }
                }
            }, '-', {
                text: '修改内容',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row != null && row != "" && row != undefined) {
                        HDialog.Open('600', '260', '../CostManageNew/CostContract_XX.aspx?OpType=edit&CcId=' + row.CcId,
                            '修改合同内容', true, function callback(_Data) {
                                LoadList();
                            });
                    } else {
                        HDialog.Info("请选择一项修改");
                    }
                }
            }];

        function DelRecord(CcId) {
            $.messager.confirm('确定', '是否删除该项', function (r) {
                if (r) {
                    $.tool.DataGet('CsCost', 'DelContractContent', 'CcId=' + CcId,
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
        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsCost&Command=GetContractContentList&' + $('#frmForm').serialize(),
                method: "get",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                rownumbers: true,
                columns: column,
                fitColumns: true,
                singleSelect: true,
                pagination: true,
                border: false,
                toolbar: toolbar,
                height: '100%',
                width: '100%'
            });
        }
        LoadList();

    </script>

</body>
</html>

