<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialBillList.aspx.cs" Inherits="M_Main.Mt.MaterialBillList" %>

<!DOCTYPE html>

<html xmlns="">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/moment.min.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="WareHouseId" value="" name="WareHouseId" type="hidden"  runat="server"/>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
       <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 680px; height: 300px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">发票号：</td>
                    <td class="TdContent">
                       <input type="text" class="easyui-validatebox" id="BillNum" value="" name="BillNum" />
                    </td>
                    <td class="TdTitle">发票日期：</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" id="BillDate" value="" name="BillDate" /></td>
                     </tr>
                <tr>
                    <td class="TdTitle">供方单位：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="SupplierName" value="" name="SupplierName" />
                    </td>
               
                     <td class="TdTitle">入库单号：</td>
                    <td class="TdContent">
                        <input id="StorageName" name="StorageName" style="width: 150px;" runat="server" class="easyui-searchbox " searcher="SelLastDep" />
                        <input type="hidden"  id="StorageId" value="" name="StorageId" />
                    </td>
                     </tr>
                <tr>
                    <td class="TdTitle">发票金额(元)：</td>
                    <td class="TdContent">
                       <input type="text" class="easyui-validatebox" id="BillPrice" value="" name="BillPrice" />
                    </td>
                    <td class="TdTitle">是否付款：</td>
                    <td class="TdContent">                        
                        <select id="IsPayment" name="IsPayment">
                            <option value=""style="color: #000000;" selected="selected">请选择</option>
                            <option value="0" style="color: #000000;">是</option>
                            <option value="1" style="color: #000000;" >否</option>
                        </select>
                    </td>                    
                </tr>
                <tr>
                    <td class="TdTitle">仓库
                    </td>
                    <td class="TdContent">
                        <input id="WareHouseName" name="WareHouseName" class="easyui-validatebox" runat="server" />
                    </td>
                    <td class="TdTitle">金额类型：</td>
                    <td class="TdContent">
                        <select id="AmountType" runat="server" name="AmountType">
                            <option value="" selected="selected"></option>
                            <option value="预估" style="color: #000000;">预估</option>
                            <option value="实开" style="color: #000000;">实开</option>
                        </select>
                    </td>
                    
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="ClearWhere();">清&nbsp;除</a>
                    </td>
                </tr>
            </table>
        </div>
         <script language="javascript" type="text/javascript">


             //监听键盘回车事件
             document.onkeydown = function (event) {
                 var e = event || window.event || arguments.callee.caller.arguments[0];
                 if (e && e.keyCode == 13) { // enter 键
                     LoadList();
                 }
             };

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            InitTableHeight();
            var column = [[
                    {
                        field: 'BillNum', title: '发票号', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                            return "<a class=\"HrefStyle\"  href='#' onclick=\"Detail('" + row.Id + "','edit');\">" + row.BillNum + "</a>";
                        }
                    },
                    {
                        field: 'BillDate', title: '发票日期', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                            return moment(row.BillDate).format('YYYY-MM-DD');
                        }
                    },
                    { field: 'BillPrice', title: '发票金额', width: 80, align: 'left', sortable: true },
                    { field: 'WareHouseName', title: '仓库', width: 80, align: 'left', sortable: true },
                    {
                        field: 'StorageId', title: '入库单编号', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                            var ss = "";
                            if (row.StorageId != "" && row.ReceiptSign!="") {
                                var id = row.StorageId.split(',');
                                var num = row.ReceiptSign.split(',');
                                 
                                if (id.length==num.length) {
                                    for (var i = 0; i < id.length; i++) {
                                        if (num[i]!="") {
                                            ss += "<a class=\"HrefStyle\"  href='#' onclick=\"ShouStorage('" + id[i] + "');\">" + num[i] + "</a>,";
                                        }                                        
                                    }
                                }
                            }
                            return ss;
                        }
                    },
                { field: 'SupplierName', title: '供方单位', width: 150, align: 'left', sortable: true },
                { field: 'AmountType', title: '金额类型', width: 150, align: 'left', sortable: true },
                    {
                        field: 'IsPayment', title: '是否付款', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                            if (row.IsPayment=="0") {
                                return "是";
                            } else {
                                return "否";
                            }
                        }
                    },
                    {
                        field: 'Memo', title: '备注', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                            return cutstr(row.Memo, 30);
                        }
                    },
                   
            ]];

            var toolbar = [
         {
             text: '新增',
             iconCls: 'icon-add',
             handler: function () {
                 Detail('', 'add');
             }
         }, '-',
             {
                 text: '删除',
                 iconCls: 'icon-cancel',
                 handler: function () {
                     var row = $("#TableContainer").datagrid("getSelected");
                     if (row == null) {
                         HDialog.Info("请选择删除数据");
                         return;
                     }
                     DelRecord(row["Id"].toString());
                 }
             }, '-',
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
                    //url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=MaterialBaseHandle&Command=GetBaseList&' + $('#formMaterialBaseList').serialize(),
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
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
                        param = $.JQForm.GetParam("ReceiptRevoke", "GetBillList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });


            }
             $("#WareHouseName").click(function (e) {
                 var w = top.$(window).width();
                 var h = parent.$(window).height();
                 HDialog.Open(300, h, '../DialogNew/SelWareHouses.aspx', '仓库选择', true, function callback(_Data) {
                     var Obj = JSON.parse(_Data);
                     var _n = '';
                     var _Id = '';
                     for (var i = 0; i < Obj.length; i++) {
                         _n = _n + Obj[i].text + ",";
                         _Id = _Id + Obj[i].attributes.Id + ",";
                     }
                     if (_n != '') _n = _n.substr(0, _n.length - 1);
                     if (_Id != '') _Id = _Id.substr(0, _Id.length - 1);
                     $("#WareHouseName").val(_n);
                     $("#WareHouseId").val(_Id);

                 });
             });

            LoadList();
            /** 
           * js截取字符串，中英文都能用 
           * @param str：需要截取的字符串 
           * @param len: 需要截取的长度 
           */
            function cutstr(str, len) {
                var str_length = 0;
                var str_len = 0;
                str_cut = new String();
                str_len = str.length;
                for (var i = 0; i < str_len; i++) {
                    a = str.charAt(i);
                    str_length++;
                    if (escape(a).length > 4) {
                        //中文字符的长度经编码之后大于4  
                        str_length++;
                    }
                    str_cut = str_cut.concat(a);
                    if (str_length >= len) {
                        str_cut = str_cut.concat("...");
                        return str_cut;
                    }
                }
                //如果给定字符串小于指定长度，则返回源字符串；  
                if (str_length < len) {
                    return str;
                }
            }

             //入库单
            function SelLastDep() {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../Mt/StorageDialog/StorageList.aspx', '选择入库单', false, function callback(_Data) {
                    
                    var row = JSON.parse(_Data);
                    $("#StorageId").val(row.Id);
                    $("#StorageName").searchbox("setValue", row.ReceiptSign);
                });
            }

            function ClearWhere() {
                $("#BillNum").val("");
                $("#BillDate").val("");
                $("#SupplierName").searchbox("setValue", "");
                $("#StorageName").val("");
                $("#StorageId").val("");
                $("#BillPrice").val("");
                

            }

            function DelRecord(Id) {
                HDialog.Prompt("是否删除该项", function () {
                    $.tool.DataGet('ReceiptRevoke', 'Del', 'Id=' + Id,
                        function Init() {
                        },
                        function callback(_Data) {
                            LoadList();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            }

            function Detail(RowId, OpType) {//Id、操作类型
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('600', '300', '../Mt/MaterialBillEdit.aspx?&Id=' + RowId + '&OpType=' + OpType, '票据管理', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }

            //打开入库单详情
            function ShouStorage(storageId) {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                HDialog.Open(w, h, '../Mt/StorageDetail.aspx?Id=' + storageId + '&OpType=edit', '入库单', false, function callback(_Data) {
                    //if (_Data != '') {
                    //    LoadList();
                    //}
                });
            }


         </script>
    </form>
</body>
</html>
