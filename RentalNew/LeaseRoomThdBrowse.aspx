<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaseRoomThdBrowse.aspx.cs" Inherits="M_Main.RentalNew.LeaseRoomThdBrowse" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
</head>
<body> 
  <form id="frmForm"> 
   <input id="AllData" size="1" type="hidden" name="AllData" runat="server" /> 
   <div style="width: 100%; background-color: #cccccc;" id="TableContainer"> 
   </div> 
   <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 900px; height: 240px;"> 
    <table style="width: 100%;" class="DialogTable"> 
     <tbody>
      <tr> 
       <td class="TdTitle">租户名称</td> 
       <td class="TdContent"> <input id="CustName" name="CustName" runat="server" /></td> 
       <td class="TdTitle">房屋编号</td> 
       <td class="TdContent"> <input id="RoomSign" name="RoomSign" runat="server" /></td> 
      </tr> 
      <tr> 
       <td class="TdTitle">固定电话</td> 
       <td class="TdContent"> <input id="FixedTel" name="FixedTel" runat="server" /></td> 
       <td class="TdTitle">移动电话</td> 
       <td class="TdContent"> <input id="MobilePhone" name="MobilePhone" runat="server" /></td> 
      </tr> 
      <tr> 
       <td class="TdTitle">证件号码</td> 
       <td class="TdContent"> <input id="PaperCode" name="PaperCode" runat="server" /></td> 
       <td class="TdTitle">是否有合同</td> 
       <td class="TdContent"> <select id="IsLeaseContract" name="IsLeaseContract" runat="server"> <option selected=""></option> </select></td> 
      </tr> 
      <tr> 
       <td class="TdTitle">审核状态</td> 
       <td class="TdContent"> <select id="IsAuditing" name="IsAuditing" runat="server"> <option selected=""></option> <option value="0">未审核</option> <option value="1">已通过</option> <option value="2">未通过</option> <option value="3">审核中</option> </select></td> 
       <td class="TdTitle">签约状态</td> 
       <td class="TdContent"> <select id="SignStatus" name="SignStatus" runat="server"></select></td> 
      </tr> 
      <tr> 
       <td class="TdTitle">合同编号</td> 
       <td class="TdContent"> <input id="ContSign" size="17" name="ContSign" runat="server" /></td> 
       <td class="TdTitle"></td> 
       <td class="TdContent"></td> 
      </tr> 
      <tr> 
       <td colspan="4" style="text-align: center"> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a> </td> 
      </tr> 
     </tbody>
    </table> 
   </div> 
  </form> 
 </body>
</html>
<script type="text/javascript">
    var column = [[
        {
            field: 'CustName', title: '租户名称', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改房屋租赁信息','" + row.ContID + "');\">" + row.CustName + "</a>";
                return str;
            }
        },
        { field: 'RoomSigns', title: '房屋编号', width: 160, align: 'left', sortable: true },

        { field: 'FixedTel', title: '固定电话', width: 100, align: 'left', sortable: true },
        { field: 'MobilePhone', title: '移动电话', width: 100, align: 'left', sortable: true },
        { field: 'IsLeaseContractName', title: '是否有合同', width: 100, align: 'left', sortable: true },
        { field: 'ContSign', title: '合同编号', width: 100, align: 'left', sortable: true },
        { field: 'IsAuditingName', title: '审核状态', width: 100, align: 'left', sortable: true },
        { field: 'AuditReasons', title: '审核原因', width: 200, align: 'left', sortable: true },
        {
            field: 'IsLock', title: '是否锁定', width: 50, align: 'center', sortable: true, formatter: function (value, row, index) {
                var str = "否";
                if (value == 1) {
                    str = "是";
                }
                return str;
            }
        }
        //{
        //    field: 'RoomSign', title: '房屋编号', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
        //        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改房屋租赁设置','search'," + row.RoomID + ",'manage');\">" + row.RoomSign + "</a>";
        //        return str;
        //    }
        //},
    ]];

    function ViewDetail(title, ContID) {
        var w = $(window).width();
        var h = $(window).height();

        HDialog.Open(w, h, '../RentalNew/LeaseRoomThdManage.aspx?OPType=Edit&ContID=' + ContID, title, true, function (_Data) {

            if (_Data == '1') {
                LoadList();
            }

        });
    }


    function InitTableHeight() {
        var h = $(window).height();
        $("#TableContainer").css("height", h + "px");


        $("select").each(function () {

            $(this).css("width", document.body.clientWidth * 0.166);
        });
    }
    InitTableHeight();

    var toolbar = [
        {
            text: '新增',
            iconCls: 'icon-add',
            handler: function () {
                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, '../RentalNew/LeaseRoomThdCreManage.aspx?OPType=Insert', '出租办理', true, function (_Data) {

                    if (_Data == '1') {
                        LoadList();
                    }

                });

            }
        }, '-',
        {
            text: '更名历史',
            iconCls: 'icon-mini-edit',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row != null) {
                    if (row.CustID != 0) {
                        var w = $(window).width();
                        var h = $(window).height();

                        HDialog.Open(w, h, '../HouseNew/CustomerChangeNameBrowse.aspx?CustID=' + row.CustID, '更名历史', false,
                            function callback(_Data) {

                            });
                    }
                    else {
                        HDialog.Info('请选择要查看更名历史的信息');
                    }
                } else {
                    HDialog.Info('请选择要查看更名历史的信息');

                }
            }
        }
        //'-',
        // {
        //     text: '合同办理',
        //     iconCls: 'icon-edit',
        //     handler: function () {

        //         var row = $("#TableContainer").datagrid("getSelected");
        //         if (row != null) {
        //             if (row.ContID != 0) {
        //                 var w = $(window).width();
        //                 var h = $(window).height();

        //                 HDialog.Open(w, h, '../RentalNew/LeaseRoomThdManage.aspx?OPType=Edit&ContID=' + row.ContID, '租赁合同办理', true, function (_Data) {

        //                     if (_Data == '1') {
        //                         LoadList();
        //                     }

        //                 });
        //             }
        //             else {
        //                 HDialog.Info('请选择要办理合同的租赁信息');
        //             }
        //         } else {
        //             HDialog.Info('请选择要办理合同的租赁信息');

        //         }

        //     }
        // },
        , '-',
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
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: "100%",
            toolbar: toolbar,
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            toolbar: toolbar,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("RoomRental", "LeaseContractNewFilterList", "TableContainer", param);
            },
            onLoadSuccess: function (data) {

            }
        });
        $('#SearchDlg').dialog('close');
    }

    LoadList();
</script>