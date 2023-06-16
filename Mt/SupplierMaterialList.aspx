<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierMaterialList.aspx.cs" Inherits="M_Main.Mt.SupplierMaterialList" %>

<!DOCTYPE html>

<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 500px;
            height: 250px;
        }

        .SearchTable {
            width: 500px;
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

        <div id="TableContainer"></div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">物资名称
                    </td>
                    <td class="TdContent">
                        <input id="MaterialName" name="MaterialName" runat="server" />
                    </td>
                    <td class="TdTitle">物资编号
                    </td>
                    <td class="TdContent">
                        <input id="Num" name="Num" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">物资类别
                    </td>
                    <td class="TdContent">
                        <input id="MaterialType" name="MaterialType" runat="server" />
                    </td>
                    <td class="TdTitle">物资属性</td>
                    <td class="TdContent">
                        <input id="Property" name="Property" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">供应商名称</td>
                    <td class="TdContent">
                        <input id="SupplierName" name="SupplierName" runat="server" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>&nbsp;&nbsp;
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="btnClear_OnClick();">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">


            //监听键盘回车事件
            document.onkeydown = function (event) {
                var e = event || window.event || arguments.callee.caller.arguments[0];
                if (e && e.keyCode == 13) { // enter 键
                    LoadList();
                }
            };
            function btnClear_OnClick() {
                $('#MaterialName').val("");
                $('#Num').val("");
                $("#MaterialType").val("");
                $("#Property").val("");
                $('#SupplierName').val("")

            }
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();
            var column;
            column = [[
                { field: 'SupplierName', title: '供应商名称', align: 'left', width: 120, sortable: true },
                { field: 'MaterialName', title: '物资名称', align: 'left', width: 170, sortable: true },
                { field: 'MaterialTypeName1', title: '物资类别', align: 'left', width: 100, sortable: true },
                { field: 'Num', title: '物资编号', align: 'left', width: 100, sortable: true },
                { field: 'Property', title: '属性', width: 100, align: 'left', sortable: true },
                { field: 'UnitName', title: '单位', width: 100, align: 'left', sortable: true },
                { field: 'ColorName', title: '颜色', width: 100, align: 'left', sortable: true },
                { field: 'Price', title: '参考单价', width: 100, align: 'left', sortable: true }
            ]];
            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-'
            ];


            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=MaterialSupplierInfo&Command=SupplierMaterial&' + $('#frmForm').serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    showFooter: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });

            }

            $('#SearchDlg').parent().appendTo($("form:first"));

            LoadList();

            $('#TableContainer').datagrid({
                rowStyler: function (index, row) {

                    if (parseFloat(row.SafeCount) > 0 && parseFloat(row.SafeCount) > parseFloat(row.Quantity)) {
                        return 'background-color:#009BDB;color:#ffffff;';
                    }
                }
            });

            $("#MaterialType").click(function (e) {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                HDialog.Open(300, h, '../DialogNew/SelMaterialType.aspx', '类别选择', true, function callback(_Data) {
                    var Obj = JSON.parse(_Data);
                    //console.log(Obj);
                    //var _n = '';
                    //var _Id = '';
                    //for (var i = 0; i < Obj.length; i++) {
                    //    _n = _n + Obj[i].text + ",";
                    //    _Id = _Id + Obj[i].attributes.Id + ",";
                    //}
                    //if (_n != '') _n = _n.substr(0, _n.length - 1);
                    //if (_Id != '') _Id = _Id.substr(0, _Id.length - 1);
                    //$("#MaterialType").val(Obj.id);

                });
            });
        </script>
    </form>
</body>
</html>
