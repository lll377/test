<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WeChatCorpCostManage.aspx.cs" Inherits="M_Main.ChargesNew.WeChatCorpCostManage" %>

<!DOCTYPE html>
<html>
<head>
    <title>标准变化情况</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 600px;
            height: 150px;
        }
          #SearchDlgItem {
            padding: 10px;
            width: 600px;
            height: 150px;
        }
        #SearchSaveDlg {
            padding: 10px;
            width: 600px;
            height: 150px;
        }

        .SearchTable {
            width: 600px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="FeesTypeId" name="FeesTypeId" runat="server" />
        <input type="hidden" id="FeesTypeCommIDs" name="FeesTypeCommIDs" runat="server" />
        <input type="hidden" id="FeesItemCommIDs" name="FeesItemCommIDs" runat="server" />
        <%--费用类型--%>
        <div id="TableContainer1">
        </div>
        <%--费用科目--%>
        <div id="TableContainer2">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">类型名称
                    </td>
                    <td class="TdContent">
                        <input type="text" id="FeesTypeName" name="FeesTypeName" class="easyui-textbox" data-options="width:'85%',height:'30px'" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">项目
                    </td>
                    <td class="TdContent">
                        <input name="FeesTypeCommNames" id="FeesTypeCommNames"
                            class="easyui-searchbox"
                            data-options="searcher:FeesTypeSelCommInfo,prompt:'请选择项目',
                            editable:false,width:'85%',height:'60px',multiline:true" />

                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList1();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-no'" onclick="Clear1();">清空</a>
                    </td>
                </tr>
            </table>
        </div>

        <div id="SearchDlgItem" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">费用项目名称
                    </td>
                    <td class="TdContent">
                        <input type="text" id="FeesItemName" name="FeesItemName" class="easyui-textbox" data-options="width:'85%',height:'30px'" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">项目
                    </td>
                    <td class="TdContent">
                        <input name="FeesItemCommNames" id="FeesItemCommNames"
                            class="easyui-searchbox"
                            data-options="searcher:FeesItemSelCommInfo,prompt:'请选择项目',
                            editable:false,width:'85%',height:'60px',multiline:true" />

                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList2();">确定筛选</a>
                         <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-no'" onclick="Clear2();">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();
                var w = $(window).width();
                $("#TableContainer1").css("height", h / 2 + "px");
                $("#TableContainer2").css("height", h / 2 + "px");
                $("#TableContainer1").css("width", w + "px");
                $("#TableContainer2").css("width", w + "px");
            }
            InitFunction();

            function Clear1() {
                $("#FeesTypeName").textbox("setValue", "");
                $("#FeesTypeCommNames").searchbox("setValue", "");
                $("#FeesTypeCommIDs").val("");
            }
            function Clear2() {
                $("#FeesItemName").textbox("setValue", "");
                $("#FeesItemCommNames").searchbox("setValue", "");
                $("#FeesItemCommIDs").val("");
            }
            function FeesTypeSelCommInfo() {
                HDialog.Open(700, 400, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#FeesTypeCommIDs").val(arrRet.id);
                    $("#FeesTypeCommNames").searchbox("setText", arrRet.name);
                });
            }
            function FeesItemSelCommInfo() {
                HDialog.Open(700, 400, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#FeesItemCommIDs").val(arrRet.id);
                    $("#FeesItemCommNames").searchbox("setText", arrRet.name);
                });
            }
            var column1 = [[
                { field: 'ck', checkbox: true },
                { field: 'OrganName', title: '区域名称', align: 'left', width: 200, sortable: true },
                { field: 'CommName', title: '小区名称', align: 'left', width: 200, sortable: true },
                {
                    field: 'Name', title: '费用类型名称', align: 'left', width: 200, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.Id + "','edit');\">" + row.Name + "</a>";
                        return str;
                    }
                }
            ]];
            var column2 = [[
                { field: 'ck', title: '', align: 'left', checkbox: true, sortable: true },
                { field: 'OrganName', title: '区域名称', align: 'left', width: 200, sortable: true },
                { field: 'CommName', title: '小区名称', align: 'left', width: 200, sortable: true },
                { field: 'TypeName', title: '类型名称', align: 'left', width: 200, sortable: true },
                { field: 'CostName', title: '费项名称', align: 'left', width: 200, sortable: true }
            ]];
            var toolbar1 = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        HDialog.Open('800', '400', '../ChargesNew/WeChatCorpCostTypeInfo.aspx?OpType=insert', '新增', false, function callback(_Data) {
                            LoadList1();
                        });
                    }
                }
                , '-',
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                         $("#FeesTypeId").val('0');
                        LoadList2();
                    }
                }
                , '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer1").datagrid("getChecked");
                        DelRecord(row, "费用类型");
                    }
                }
            ];
            var toolbar2 = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        var row = $("#TableContainer1").datagrid("getChecked");
                        console.log(row);
                        var Id = "";
                        var CommID = "";
                        if (row == null || row.length == 0) {
                            HDialog.Info("请勾选费用类型!");
                            return;
                        } else {
                            for (var i = 0; i < row.length; i++) {
                                Id += row[i].Id + ",";
                                CommID += row[i].CommID + ",";
                            }
                        }
                        if (Id != "") {
                            Id = Id.substring(0, Id.length - 1);
                            CommID = CommID.substring(0, CommID.length - 1);
                        }


                        HDialog.Open('800', '400', '../ChargesNew/WeChatCorpCostItemInfo.aspx?TypeIds=' + Id + "&CostItemCommIDs=" + CommID, '新增', false, function callback(_Data) {
                            LoadList2();
                        });

                        //HDialog.Open('800', '400', '../ChargesNew/CostStanWeChat.aspx?CostCode=' + row.id, '收费标准', false, function callback(_Data) {
                        //    LoadList2();
                        //});
                    }

                } , '-',
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlgItem').parent().appendTo($("form:first"));
                        $('#SearchDlgItem').dialog('open');
                    }
                }, '-', {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer2").datagrid("getChecked");
                        DelRecord(row, "费用项目");
                    }
                }
                , '-',
                {
                    text: '<font color=red>&nbsp;&nbsp;&nbsp;&nbsp;*管控模型收费标准是否需要审核如果为是,未审核标准不能发放;</font>'
                }
            ];
            function LoadList1() {
                $("#TableContainer1").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CostStan&Command=WeChatCorpCostTypeList&' + $('#frmForm').serialize(),
                    idField: 'Id',
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column1,
                    fitColumns: true,
                    singleSelect: true,
                    checkOnSelect: false,
                    selectOnCheck: false,
                    pagination: true,
                    rownumbers: true,
                    remoteSort: false,
                    IsCustomHead: false,
                    cascadeCheck: false,
                    width: "100%",
                    border: true,
                    toolbar: toolbar1,
                    sortOrder: "asc",
                    onClickRow: function (rowIndex, rowData) {
                        $("#FeesTypeId").val(rowData.Id);
                        LoadList2();
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });
            }

            LoadList1();
            //费用科目
            function LoadList2() {
                $("#TableContainer2").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CostStan&Command=WeChatCorpCostItemList&' + $('#frmForm').serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column2,
                    fitColumns: true,
                    singleSelect: false,
                    remoteSort: false,
                    pagination: true,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar2,
                    border: true,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlgItem").dialog("close");
                    }
                });
            }
            LoadList2();

            function SelCostName() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '600', '../DialogNew/SelCorpCostItem.aspx', '费用项目选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var Obj = JSON.parse(_Data);
                        $("#CostName").searchbox("setValue", Obj.text);
                    }
                });
            }


            function DelRecord(row, OpType) {

                if (row == null) {
                    HDialog.Info("请选择数据!");
                    return;
                }

                HDialog.Prompt('确定删除?', function () {
                    var Id = "";

                    for (var i = 0; i < row.length; i++) {
                        Id += row[i].Id + ",";
                    }
                    Id = Id.substring(0, Id.length - 1);
                    if (OpType == "费用类型") {
                        $.tool.DataPost('CostStan', 'WeChatCorpCostTypeDel', 'Id=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data.split('|')[0] == "true") {
                                    LoadList1();
                                }
                                HDialog.Info(_Data.split('|')[1]);
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    } else if (OpType == "费用项目") {
                        var Id = "";
                        for (var i = 0; i < row.length; i++) {
                            Id += row[i].Id + ",";
                        }
                        Id = Id.substring(0, Id.length - 1);
                        $.tool.DataGet('CostStan', 'WeChatCostItemDel', 'Id=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data.split('|')[0] == "true") {
                                    LoadList2();
                                }
                                HDialog.Info(_Data.split('|')[1]);
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }
            function Detail(Id, OpType) {
                HDialog.Open('800', '400', '../ChargesNew/WeChatCorpCostTypeInfo.aspx?Id=' + Id + '&OpType=' + OpType, '详情', false, function callback(_Data) {
                    LoadList1();
                });
            }
        </script>
    </form>
</body>
</html>
