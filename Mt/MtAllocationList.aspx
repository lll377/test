<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MtAllocationList.aspx.cs" Inherits="M_Main.Mt.MtAllocationList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>调拨管理</title>
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
        #SearchDlg 
        {
            padding:10px;
            width: 500px; 
            height: 132px; 
        } 
        .SearchTable
        {
            width: 500px; 
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
   <div id="TableContainer"></div>
    <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow:hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
        <table class="SearchTable">
            <tr>
                <td class="TdTitle">
                    审核状态：
                </td>
                <td class="TdContent">
                   <select name="IsState" id="IsState" style="Z-INDEX: 0">
                    <option selected="selected" value="">全部</option>
                    <option value="未启动">未启动</option>
                    <option value="审核中">审核中</option>
                    <option value="审核未通过">审核未通过</option>
                    <option value="已审核">已审核</option>
                    </select>
                </td>
                <td class="TdTitle">
                    调拨单号：
                </td>
                <td class="TdContent">
                    <input name="ReceiptSign" type="text" id="ReceiptSign" class="easyui-validatebox" />
                </td>
            </tr>
            <tr>
                  <td class="TdTitle">
                    入库单号：
                </td>
                <td class="TdContent">
                    <input name="StorageNum" type="text" id="StorageNum" class="easyui-validatebox" />
                </td>
                <td class="TdTitle">
                    出库单号：
                </td>
                <td class="TdContent">
                    <input name="CheckOutNum" type="text" id="CheckOutNum" class="easyui-validatebox" />
                </td>
             
            </tr>
            <tr>
                <td class="TdTitle">
                      调入仓库：
                </td>
                <td class="TdContent">
                    <input type="hidden" id="InWareHouseId" name="InWareHouseId" runat="server" />
                <input type="text" class="easyui-validatebox"  id="InWareHouse" onclick="WareHouseChoice('InWareHouse');" style="width:80%;" name="InWareHouse"   />
          
                </td>
                   <td class="TdTitle">
                    调出仓库：
                </td>
                <td class="TdContent">
                   <%-- <input name="OutWareHouseId" type="text" id="OutWareHouseId" class="easyui-validatebox" />--%>
                     <input type="hidden" id="OutWareHouseId" name="OutWareHouseId" runat="server" />
                <input type="text" class="easyui-validatebox" id="OutWareHouse" onclick="WareHouseChoice('OutWareHouse');" style="width:80%;" name="OutWareHouse" />
         
                </td>
                <td class="TdTitle">
                </td>
                <td class="TdContent">
                </td>
            </tr>
            <tr>
                 <td class="TdTitle">
                     调拨日期
                </td>
                <td class="TdContent">
                    
                     <input name="ReciptDate" type="text" id="ReciptDate" class="easyui-datebox" style="width:80%;" />
                </td>
              <td class="TdTitle">
                  至
                </td>
                <td class="TdContent">
                     <input name="ReciptDateEnd" type="text" id="ReciptDateEnd" class="easyui-datebox" style="width:80%;" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center;padding-top:5px;">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="ClearWhere();">清除条件</a>
                </td>
            </tr>
        </table>
    </div>
    </form>
    <script type="text/javascript">


        //监听键盘回车事件
        document.onkeydown = function (event) {
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if (e && e.keyCode == 13) { // enter 键
                LoadList();
            }
        };


        function ClearWhere()
        {
            $("#IsState").val("");
            $("#ReceiptSign").val("");
            $("#StorageNum").val("");
            $("#CheckOutNum").val("");
            $("#InWareHouseId").val("");
            $("#InWareHouse").val("");
            $("#OutWareHouseId").val("");
            $("#OutWareHouse").val("");
            $("#ReciptDate").datebox("setValue", "");
            $("#ReciptDateEnd").datebox("setValue", "");
        }
        function WareHouseChoice(id) {
        
            HDialog.Open('500', '500', '../DialogNew/SelWareHouse.aspx', '选择仓库', true, function callback(_Data) {
                if (_Data != '') {
                    //选择仓库后重新加载列表及供商
                    var arrRet = _Data.split(',');
                    $("#" + id + "Id").val(arrRet[0]);
                    $("#" + id).val(arrRet[1]);
                   
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
                { field: 'Id', title: 'Id', width: 50, align: 'left', sortable: true, hidden: true },
                {
                    field: 'ReceiptSign', title: '调拨单号', align: 'left', width: 85, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.Id + "','edit','" + row.State + "');\">" + row.ReceiptSign + "</a>";
                        return str;
                    }
                },
                { field: 'Originator', title: 'Originator', width: 50, align: 'left', sortable: true, hidden: true },
                { field: 'OriginatorName', title: '制单人', align: 'left', width: 35, sortable: true },
                //{ field: 'Quantity', title: '调拨数量', align: 'left', width: 40, sortable: true },
                {
                    field: 'ReciptDate', title: '调拨日期', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.ReciptDate, "yyyy-MM-dd");
                        return str;
                    } 
                },
                { field: 'AllocationDepCode', title: 'AllocationDepCode', width: 50, align: 'left', sortable: true, hidden: true },
                { field: 'AllocationDepName', title: '调拨部门', align: 'left', width: 50, sortable: true },
                { field: 'Allocationtor', title: '调拨人', align: 'left', width: 35, sortable: true },
                //{ field: '', title: '调入单位', align: 'left', width: 50, sortable: true },
                //{ field: '', title: '调出单位', width: 50, align: 'left', sortable: true },
                { field: 'InWareHouseId', title: 'InWareHouseId', width: 50, align: 'left', sortable: true, hidden: true },
                { field: 'InWareHouseName', title: '调入仓库', width: 50, align: 'left', sortable: true },
                { field: 'OutWareHouseId', title: 'OutWareHouseId', width: 50, align: 'left', sortable: true, hidden: true },
                { field: 'OutWareHouseName', title: '调出仓库', width: 50, align: 'left', sortable: true },
                { field: 'StorageNum', title: '入库单号', align: 'left', width: 65, sortable: true },
                { field: 'CheckOutNum', title: '出库单号', align: 'left', width: 65, sortable: true },
                 { field: 'State', title: '审核状态', align: 'left', width: 35, sortable: true }
                //
                
        ]];
        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    Detail('','add','');
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
                    if (row != null) {
                        if (row.State == "未启动") {
                            $.tool.DataGet('MtAllocationManger', 'AllocationDelete', 'Id=' + row.Id,//
                            function Init() {
                            },
                            function callback(_Data) {
                                $('#SearchDlg').parent().appendTo($("form:first"));
                                if (_Data == "false") {
                                    HDialog.Info("删除不成功!");
                                }
                                else {
                                    LoadList();
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                                HDialog.Info("删除不成功!");
                            });
                        }
                        else {
                            HDialog.Info("只能删除未启动数据!");
                        }
                    }
                    else {
                        HDialog.Info("请选中需要删除的数据!");
                    }
                }
            });
        } 

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=MtAllocationManger&Command=GetMtAllocationMangerList&' + $('#frmForm').serialize(),
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

        function Detail(Id, OpType, State) {
            var w = top.$(window).width();
            var h = parent.$(window).height();
            HDialog.Open(w, h, '../Mt/MtAllocationDetailed.aspx?Id=' + Id + '&OpType=' + OpType + "&State=" + State, '物资调拨', true, function callback(_Data) {
                if (_Data != '') {
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    LoadList();
                }
            });
        }
    </script>
</body>
</html>
