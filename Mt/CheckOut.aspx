<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="M_Main.Mt.CheckOut" %>
<!DOCTYPE html>
<html>
<head>
    <title>物资出库</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">

        #SearchDlg {
            padding:10px;
            width: 700px; 
            height: 200px; 
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
                    出库开始时间
                </td>
                <td class="TdContentSearch">
                    <input id="ReceiptStartDate" name="ReceiptStartDate" class="easyui-datebox" runat="server"  />
                </td>
                <td class="TdTitle">
                    出库结束时间
                </td>
                <td class="TdContentSearch">
                    <input id="ReceiptEndDate" name="ReceiptEndDate" class="easyui-datebox"  runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    出库单号
                </td>
                <td class="TdContent">
                    <input id="ReceiptSign" name="ReceiptSign" runat="server" />
                </td>
                <td class="TdTitle">
                    出库仓库
                </td>
                <td class="TdContent">
                    <input id="WareHouseName" name="WareHouseName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    制单人
                </td>
                <td class="TdContent">
                    <input id="OriginatorName" name="OriginatorName" runat="server" />
                </td>
                <td class="TdTitle">
                    出库类别
                </td>
                <td class="TdContent">
                    <select id="CheckOutType" name="CheckOutType" runat="server">
                        <option value=""></option>
                        <option value="领料出库">领料出库</option>
                        <option value="调拨出库">调拨出库</option>
                        <%--<option value="盘亏出库">盘亏出库</option>--%>
                        <option value="报损出库">报损出库</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    使用人
                </td>
                <td class="TdContent">
                    <input id="UseUserName" name="UseUserName" runat="server" />
                </td>
                <td class="TdTitle">审核状态</td>
                <td class="TdContent" >
                    <select id="State" name="State" runat="server">
                        <option value=""></option>
                        <option value="未启动">未启动</option>
                        <option value="审核中">审核中</option>
                        <option value="已审核">已审核</option>
                        <option value="审核不通过">审核不通过</option>
                    </select>
                </td>
               
            </tr>
            
            <tr>
                <td colspan="4" style="text-align:center;padding-top:5px;">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </td>
            </tr>
        </table>
    </div>
    <script  src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">


        //监听键盘回车事件
        document.onkeydown = function (event) {
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if (e && e.keyCode == 13) { // enter 键
                LoadList();
            }
        };

        function InitFunction() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        } 
        InitFunction();
        var column;
        column = [[
                { field: 'CheckOutType', title: '出库类型', align: 'left', width: 50, sortable: true },
                {
                    field: 'ReceiptSign', title: '出库单号', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.Id + "','edit');\">" + row.ReceiptSign + "</a>";
                        return str;
                    }
                },
                { field: 'Amount', title: '出库总额', align: 'left', width: 50, sortable: true },
                { field: 'ReceiptDate', title: '时间', align: 'left', width: 50, sortable: true },
                { field: 'UseUserName', title: '使用人', align: 'left', width: 50, sortable: true },
                { field: 'OriginatorName', title: '制单人', align: 'left', width: 50, sortable: true },
                { field: 'WareHouseName', title: '仓库名称', width: 50, align: 'left', sortable: true },
                { field: 'State', title: '出库单状态', width: 50, align: 'left', sortable: true }
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
                        $.tool.DataGet('CheckOut', 'CheckOutDelete', 'Id=' + row.Id,
                        function Init() {
                        },
                        function callback(_Data) {
                            $('#SearchDlg').parent().appendTo($("form:first"));
                            if (_Data.substring(0, 5) == "false") {
                                HDialog.Info(_Data.substring(6));
                            }
                            else {
                                LoadList();
                            }
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
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CheckOut&Command=CheckOutList&' + $('#frmForm').serialize(),
                method: "get",
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
            HDialog.Open(w, h, '../Mt/CheckOutDetail.aspx?Id=' + Id + '&OpType=' + OpType, '出库单', false, function callback(_Data) {
                if (_Data != '') {
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    LoadList();
                }
            });
        }
    
        
        $("#WareHouseName").click(function (e) {
            HDialog.Open('500', '500', '../DialogNew/SelWareHouse.aspx', '选择出库仓库', true, function callback(_Data) {
                if (_Data != '')
                {
                    var arrRet = _Data.split(',');
                    $("#WareHouseName").val(arrRet[1]);
                    
                }
            });
        });

    </script>
    </form>
</body>
</html>
