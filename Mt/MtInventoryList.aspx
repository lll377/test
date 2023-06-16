<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MtInventoryList.aspx.cs" Inherits="M_Main.Mt.MtInventoryList" %>

<!DOCTYPE html>

<html>
<head>
    <title>盘点单</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding:10px;
            width: 700px; 
            height: 180px; 
        } 
        .SearchTable
        {
            width: 700px; 
            height:auto;
        }
        .SearchTable .TdTitle {
            width:15%;
        }
        .SearchTable .TdContent {
            width:35%;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
    <input id="WorkFlowTypeId" type="hidden" name="WorkFlowTypeId" runat="server" />
    <div id="TableContainer"></div>
    <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow:hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
        <table class="SearchTable">
            <tr>
                <td class="TdTitle">
                    盘点仓库
                </td>
                <td class="TdContent">
                    <input id="WareHouseName" name="WareHouseName" value=""  runat="server"  />
                </td>
                <td class="TdTitle">
                    盘点日期
                </td>
                <td class="TdContentSearch">
                    <input id="InventoryDate" runat="server" name="InventoryDate" value="" style="width: 154.2px; height: 22px;" type="text" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    盘点部门
                </td>
                <td class="TdContent">
                    <input id="DepCodeName" name="DepCodeName" value="" runat="server" />
                </td>
                <td class="TdTitle">
                    盘&nbsp;点&nbsp;人
                </td>
                <td class="TdContent">
                    <input id="InventoryerName" name="InventoryerName" value="" onclick="SelUserSer('Inventoryer')" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    盘点类型
                </td>
                <td class="TdContent">
                    <select id="TypeCode" name="TypeCode" runat="server">
                        <option value="" selected="selected">请选择</option>
                        <option value="日盘">日 盘</option>
                        <option value="月盘">月 盘</option>                        
                    </select>
                </td>
                <td class="TdTitle">
                    盘点单号
                </td>
                <td class="TdContent">
                    <input id="InventoryNum" name="InventoryNum" value="" runat="server" />
                </td>                
            </tr>
            <tr>
                <td colspan="4" class="TdContent">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center;padding-top:5px;">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>&nbsp;&nbsp;&nbsp;
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ClaerWhere();">清  除</a>
                </td>
            </tr>
        </table>
    </div>
        <%--盘点仓库--%>
        <input type="hidden" value="" runat="server" id="WareHouseId" name="WareHouseId" />
        <%--盘点部门--%>
        <input type="hidden" value="" runat="server" id="DepCode" name="DepCode" />
        <%--盘点人--%>
        <input type="hidden" value="" runat="server" id="Inventoryer" name="Inventoryer" />

    <script  src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">


        //监听键盘回车事件
        document.onkeydown = function (event) {
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if (e && e.keyCode == 13) { // enter 键
                LoadList();
            }
        };

        //清空筛选条件
        function ClaerWhere()
        {
            $("#WareHouseName").val("");
            $("#InventoryDate").val("");
            $("#DepCodeName").val("");
            $("#InventoryerName").val("");
            $("#TypeCode").val("");
            $("#InventoryNum").val("");
            $("#WareHouseId").val("");
            $("#DepCode").val("");
            $("#Inventoryer").val("");
        }
        //获取盘点仓库
        $("#WareHouseName").click(function (e) {
            HDialog.Open('500', '500', '../DialogNew/SelWareHouse.aspx', '选择盘点仓库', true, function callback(_Data) {
                if (_Data != '') {
                    var arrRet = _Data.split(',');
                    $("#WareHouseId").val(arrRet[0]);
                    $("#WareHouseName").val(arrRet[1]);
                }
            });
        });
        //盘点部门
        $("#DepCodeName").click(function (e) {
            HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
                if (_Data != '') {
                    var arrRet = _Data.split(',');
                    $("#DepCode").val(arrRet[0]);
                    $("#DepCodeName").val(arrRet[1]);
                }
            });
        });
        //盘点人
        function SelUserSer(str) {
            HDialog.Open('740', '450', '../DialogNew/SelUser.aspx', '选择人员', true, function callback(_Data) {
                if (_Data != "") {//**获得返回的参数信息
                    var varObjects = JSON.parse(_Data);
                    $("#" + str).val(varObjects.UserCode);
                    $("#" + str + "Name").val(varObjects.UserName);
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
                { field: 'WareHouseName', title: '盘点仓库', width: 50, align: 'left', sortable: true },
                {
                    field: 'InventoryNum', title: '盘点单号', width: 50, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.Id + "','edit');\">" + row.InventoryNum + "</a>";
                        return str;
                    }
                },
                { field: 'TypeCode', title: '盘点类型', width: 50, align: 'left', sortable: true },
                { field: 'DepCodeName', title: '盘点部门', width: 50, align: 'left', sortable: true },
                { field: 'InventoryerName', title: '盘点人', width: 50, align: 'left', sortable: true },
                {
                    field: 'InventoryDate', title: '盘点日期', width: 50, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.InventoryDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'Prisoner', title: '监盘人', width: 50, align: 'left', sortable: true },
                { field: 'State', title: '盘点单状态', width: 50, align: 'left', sortable: true }
        ]];
        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    Detail('','add');
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
                text: '筛选',
                iconCls: 'icon-filter',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    $('#SearchDlg').dialog('open');
                }
            }
        ];

        function DelRecord(row) {
            $.messager.confirm('确定', '是否删除该项', function (r) {
                if (r) {
                    if (row.State == "未启动") {
                        $.tool.DataGet('MtInventory', 'DelInventory', 'Id=' + row.Id,
                        function Init() {
                        },
                        function callback(_Data) {
                            //$('#SearchDlg').parent().appendTo($("form:first"));
                            //if (_Data.substring(0, 5) == "false") {
                            //    HDialog.Info(_Data);
                            //}
                            //else {
                                LoadList();
                            //}
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                    }
                    else {
                        HDialog.Info("无法删除");
                    }
                }
            });
        } 

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: true,
                singleSelect: true,
                pagination: true,
                remoteSort: false,
                rownumbers: true,
                width: "100%",
                toolbar: toolbar,
                border: false,
                sortOrder: "asc",
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("MtInventory", "GetInfoList", "TableContainer", param);
                },
                onLoadSuccess: function (data) {
                    //$.tool.MergeEasyUiGrid("TableContainer", "DepName");
                    $("#SearchDlg").dialog("close");
                },
                rowStyler: function (index, row) {
                    return 'height:20px;';
                }
            });
        }

        $('#SearchDlg').parent().appendTo($("form:first"));
        LoadList();

        function Detail(Id,OpType) {
            var w = top.$(window).width();
            var h = parent.$(window).height();
            HDialog.Open(w, h, '../Mt/MtInventoryEdit.aspx?Id=' + Id + '&OpType=' + OpType, '盘点单', true, function callback(_Data) {
                if (_Data != '') {
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    LoadList();
                }
            });
        }
    </script>
    </form>
</body>
</html>
