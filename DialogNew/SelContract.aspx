<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelContract.aspx.cs" Inherits="M_Main.DialogNew.SelContract" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
        }
        
    </style>
</head>
<body>
    <form id="FrmForm">
        <input id="LiveType" name="LiveType" type="hidden" runat="server" />
        <input id="IsHis" name="IsHis" type="hidden" runat="server" />
           <input id="BuildSNums"  type="hidden"
            size="1" name="BuildSNums" value="-1" runat="server"/><input id="hiBuildNames"  type="hidden"
                size="1" name="hiBuildNames" runat="server" designtimedragdrop="492"/>
        <input  id="RegionSNums" size="1" type="hidden" name="RegionSNums" runat="server" />

            <div>
                <div class="datagrid-toolbar" id="divtt">
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                            <td>合同编号<input type="text" class="easyui-validatebox" id="ContSign" name="ContSign"
                                            runat="server" /></td>
                             <td>
                                <div class="datagrid-btn-separator"></div>
                            </td>
                            
                            <td><a href="javascript:void(0)" onclick="LoadList(); " class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                            <td>
                                <div class="datagrid-btn-separator"></div>
                            </td>
                    
                        </tr>
                    </table>
                </div>
                <div style="width: 100%;" id="TableContainer"></div>
            </div>

        <input type="hidden" id="CommID" name="CommID" runat="server"/>
        <input id="HBuildSNum" name="HBuildSNum" type="hidden" runat="server" />
        <input type="hidden" id="UnitSNum" name="UnitSNum" />
        <input type="hidden" id="FloorSNum" name="FloorSNum" />

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                var w = $(window).width() * 0.25 - 1;
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            var frozenColumns = [[
               { field: 'CommName', title: '项目名称', align: 'left', sortable: true, width: 100 },
               { field: 'NewContTypeName', title: '合同类别', align: 'left', sortable: true, width: 100 },
               {
                   field: 'ContSign', title: '合同编号', align: 'left', sortable: true, width: 120
               }
            ]];

            var Columns = [[

                { field: 'ContName', title: '合同名称', width: 240, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 240, align: 'left', sortable: true }
                //{ field: 'UnitName', title: '对方单位', width: 100, align: 'left', sortable: true },
                //{ field: 'Vender', title: '联系人', width: 100, align: 'left', sortable: true },
                //{ field: 'VenderTel', title: '联系电话', width: 100, align: 'left', sortable: true },
                //{ field: 'ContractPeriod', title: '合同期限', width: 100, align: 'left', sortable: true },
                //{
                //    field: 'ContStartDate', title: '合同开始时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                //        var str = formatDate(row.ContStartDate, "yyyy-MM-dd");
                //        return str;
                //    }
                //},
                //{
                //    field: 'ContEndDate', title: '合同结束时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                //        var str = formatDate(row.ContEndDate, "yyyy-MM-dd");
                //        return str;
                //    }
                //},
                //{ field: 'ContAmount', title: '合同金额', width: 100, align: 'left', sortable: true },
                //{ field: 'Margin', title: '合同保证金', width: 100, align: 'left', sortable: true },
                //{ field: 'DutyDepName', title: '机构部门', width: 100, align: 'left', sortable: true },
                //{ field: 'DutyUserName', title: '负责人', width: 100, align: 'left', sortable: true },
                //{
                //    field: 'SignDate', title: '签约时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                //        var str = formatDate(row.SignDate, "yyyy-MM-dd");
                //        return str;
                //    }
                //},
                //{ field: 'IsExpire', title: '是否到期', width: 100, align: 'left', sortable: true },
                //{ field: 'RegUserName', title: '发起人', width: 100, align: 'left', sortable: true },
                //{ field: 'RegDate', title: '发起时间', width: 100, align: 'left', sortable: true },
                //{ field: 'IsAuditing', title: '审批状态', width: 100, align: 'left', sortable: true },
                //{ field: 'ChangeType', title: '变更类型', width: 100, align: 'left', sortable: true }
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

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Contract&Command=ContractList&' + $('#FrmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: Columns,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    //toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onDblClickRow: function (rowIndex, rowData) {
                        HDialog.ReturnIsJson = true;

                        HDialog.Close(rowData);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
                $("#SearchDlg").dialog("close");
              
            }

            $(document).ready(function ()
            {
                LoadList();
            });

        </script>
    </form>
</body>
</html>
