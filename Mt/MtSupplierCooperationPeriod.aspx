<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MtSupplierCooperationPeriod.aspx.cs" Inherits="M_Main.Mt.MtSupplierCooperationPeriod" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript/Guid.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/moment.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/Taxes.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
        }

        .Container {
            width: 100%;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .ContainerLeft {
            border-bottom: 1px solid #cccccc;
        }

        .ContainerRight {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="Container">

            <div id="ContainerLeft" class="ContainerLeft">
                <div style="width: 100%; background-color: #cccccc;" id="TableContainerTop"></div>
                <div id="SearchDlgTop" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 690px; height: 100px; padding: 10px;">
                    <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                        <tr>
                            <td class="TdTitle">开始时间：</td>
                            <td class="TdContent">
                                <input id="StartDate" runat="server" value="" name="StartDate" type="text" style="width: 85%; height: 22px;" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
                            </td>
                            <td class="TdTitle">结束时间：</td>
                            <td class="TdContent">
                                <input id="EndDate" runat="server" value="" name="EndDate" type="text" style="width: 85%; height: 22px;" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
                            </td>
                            <td colspan="12" align="center">
                                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadListTop();">确定筛选</a>
                                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="ClearWhere();">清除条件</a>
                            </td>
                        </tr>

                    </table>
                </div>
            </div>
            <div class="ContainerRight">
                <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
                <div id="SearchDlg1" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 390px; height: 100px; padding: 10px;">
                    <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                        <tr>
                            <td class="TdTitle">物资名称：</td>
                            <td class="TdContent">
                                <input type="text" class="easyui-validatebox" runat="server" id="Name" value="" name="Name" />
                            </td>
                            <td colspan="12" align="center">
                                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <%-- 供应商编号 --%>
        <input type="hidden" runat="server" id="SupplierId" name="SupplierId" value="" />
        <%-- 供方合作期限ID --%>
        <input type="hidden" runat="server" id="PeriodId" name="PeriodId" value="" />
        <%-- 供方合作期间物资Id --%>
        <input type="hidden" runat="server" id="PeriodMaterialId" name="PeriodMaterialId" value="" />
        <%-- 是否生效 --%>
        <input type="hidden" runat="server" id="StaraValue" name="StaraValue" value="1" />

         <%--小数位数--%>
    <input type="hidden" id="DecimalNum" name="DecimalNum" runat="server" value="4" />
    
        <script type="text/javascript">
            //计算小数位数
            var decimalPos = Number($("#DecimalNum").val());
            
            //编辑的行号
            var editIndex = undefined;
            function ClearWhere() {
                $("#StartDate").val("");
                $("#EndDate").val("");
            }

            //设置页面高宽
            InitFunction();
            function InitFunction() {
                var h = $(parent.window).height();
                var w = $(parent.window).width() - 1;
                $("#ContainerLeft").css("height", h * 0.4 + "px");
                $("#TableContainerTop").css("height", h * 0.4 + "px");
                $("#ContainerRight").css("height", h * 0.6 + "px");
                $("#TableContainer").css("height", h * 0.6 - 42 + "px");
            }

            var columnTop = [[
                   { field: 'Id', title: 'ID', width: 45, align: 'left', sortable: true, hidden: true },
                   { field: 'IsDelete', title: '是否生效值', width: 45, align: 'left', sortable: true, hidden: true },
                   { field: 'SupplierName', title: '供应商名称', width: 45, align: 'left', sortable: true },
                   { field: 'StartDate', title: '开始时间', width: 45, align: 'left', sortable: true, formatter: function (value, row, index) {
                       return moment(row.StartDate).format('YYYY-MM-DD');                            
                   } },
                   {
                       field: 'EndDate', title: '结束时间', width: 45, align: 'left', sortable: true, formatter: function (value, row, index) {
                           return moment(row.EndDate).format('YYYY-MM-DD');
                       }
                   },
                   { field: 'IsDeleteValue', title: '是否生效', width: 45, align: 'left', sortable: true },
                   {
                       field: 'EvaluateMessage', title: '评价信息', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                           return cutstr(row.EvaluateMessage, 45);
                       }
                   }
            ]];

            var toolbarTop = [
         {
             text: '新增',
             iconCls: 'icon-add',
             handler: function () {
                 DetailTop('', 'add');
             }
         }, '-',
         {
             text: '修改',
             iconCls: 'icon-edit',
             handler: function () {
                 var row = $("#TableContainerTop").datagrid("getSelected");
                 if (row == null) {
                     HDialog.Info("请选择要编辑的数据");
                     return;
                 }
                 if (row.IsDeleteValue=="无效") {
                     HDialog.Info("无效的合作时间区间无法修改");
                     return;
                 }
                 DetailTop(row["Id"].toString(), 'edit');
             }
         }, '-',
             {
                 text: '删除',
                 iconCls: 'icon-cancel',
                 handler: function () {
                     var row = $("#TableContainerTop").datagrid("getSelected");
                     if (row == null) {
                         HDialog.Info("请选择删除数据");
                         return;
                     }
                     if (row.IsDeleteValue == "无效") {
                         HDialog.Info("无效的合作时间区间无法修改");
                         return;
                     }
                     DelRecordTop(row["Id"].toString());
                 }
             }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlgTop').parent().appendTo($("form:first"))
                    $('#SearchDlgTop').dialog('open');
                    $('#SearchDlgTop').dialog('center');
                }
            }
            ];

            //deleteTop
            function DelRecordTop(Id) {
                HDialog.Prompt("是否删除该项", function () {
                    var _Data = $('#TableContainer').datagrid('getData');
                    
                    if (_Data.rows.length>0) {
                        HDialog.Info("该合作期间内有物资存在，不能删除");
                        return false;
                    }
                    $.tool.DataGet('MaterialSupplierInfo', 'DeleteSupplierCooperationPeriod', 'Id=' + Id,
                        function Init() {
                        },
                        function callback(_Data) {
                            LoadListTop();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            }

            //top:Add/Edit
            function DetailTop(RowId, OpType) {//Id、操作类型
                //var w = top.$(window).width();
                //var h = parent.$(window).height();
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open(600, 310, '../Mt/MtSupplierCooperationPeriodEdit.aspx?&Id=' + RowId + '&OpType=' + OpType + '&SupplierId=' + $("#SupplierId").val(), '供方合作期间', false, function callback(_Data) {
                    if (_Data == 1) {
                        LoadListTop();
                    }
                });
            }

            var processToolbar = new Array(4);

            //loadTopList
            function LoadListTop() {
                $("#TableContainerTop").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: columnTop,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: processToolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbarTop,
                    sortOrder: "asc",
                    onClickRow: function (rowIndex, rowData) {
                        $("#PeriodId").val(rowData.Id);
                        $("#Name").val("");
                        $("#StaraValue").val(rowData["IsDelete"]);
                        LoadList(rowData["IsDelete"]);
                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("MaterialSupplierInfo", "SelSupplierCooperationPeriod", "TableContainerTop", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlgTop").dialog("close");
                    }
                });
            }



            var column = [[
                  { field: 'PricingNum', title: '序号', width: 45, align: 'left', sortable: true, editor: { type: 'numberbox', options: {  min: 1} } },
                { field: 'Id', title: 'ID', width: 45, align: 'left', sortable: true, hidden: true },
                { field: 'MaterialId', title: '物资ID', width: 45, align: 'left', sortable: true, hidden: true },
                { field: 'PeriodId', title: '供方合作期限ID', width: 45, align: 'left', sortable: true, hidden: true },
                { field: 'MaterialTypeName', title: '物资类别', width: 45, align: 'left', sortable: true },
                { field: 'Name', title: '物资名称', width: 45, align: 'left', sortable: true },
                { field: 'Num', title: '物资编号', width: 45, align: 'left', sortable: true },
                { field: 'Property', title: '物资属性', width: 45, align: 'left', sortable: true },
                { field: 'Specification', title: '规格', width: 45, align: 'left', sortable: true },
                { field: 'UnitName', title: '单位', width: 45, align: 'left', sortable: true },
                { field: 'ColorName', title: '颜色', width: 45, align: 'left', sortable: true },
                { field: 'Brand', title: '品牌', width: 45, align: 'left', sortable: true },
                {
                    field: 'Price', title: '含税价', width: 45, align: 'left', sortable: true, editor: {
                        type: 'numberbox', options: { precision: decimalPos, min: 0 }
                    }
                },
              
                { field: 'Taxes', title: '税率', width: 45, align: 'left', sortable: true, editor: { type: 'numberbox', options: { precision: 2, min: 0, max: 1 } }, formatter: function (value, row, index) {
                    return ToDecimal(row.Taxes, 2);
                } },
                {
                    field: 'NoTaxPrice', title: '不含税价', width: 45, align: 'left', sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.NoTaxPrice, decimalPos);
                    }
                },
                {
                    field: 'SupplierStartDate', title: '开始时间', width: 45, align: 'left', sortable: true, editor: { type: 'datetimebox', options: { required: true } }
                    , formatter: function (value, row, index)
                    {
                        return moment(row.SupplierStartDate).format('YYYY-MM-DD');
                    }
                },
                {
                    field: 'SupplierEndDate', title: '结束时间', width: 45, align: 'left', sortable: true, editor: { type: 'datetimebox', options: { required: true } }
                    , formatter: function (value, row, index) {
                        return moment(row.SupplierEndDate).format('YYYY-MM-DD');
                    }
                }
                
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
                     DelRecord(row["Id"]);
                 }
             }, '-',
            {
                text: 'EXCEL导入',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    HDialog.Open('900', '500', "../Mt/SupplierCooperationPeriodImportExcel.aspx?PeriodId=" + $("#PeriodId").val(), '选择', false, function callback(_Data) {
                                LoadList();
                            });                    
                }
            }, '-',
             {
                 text: '变更记录',
                 iconCls: 'icon-search',
                 handler: function () {
                     var row = $("#TableContainer").datagrid("getSelected");
                     
                     if (row == null) {
                         HDialog.Info("请选择要查看的物资");
                         return;
                     }
                     RecordList(row["Id"]);
                 }
             }, '-',
             {
                 text: '导出',
                 iconCls: 'icon-page_white_excel',
                 handler: function () {
                     window.open("../Mt/MtReport/MtSupplierCooperationPeriodExcel.aspx?PeriodId='" + $("#PeriodId").val() + "'&random=" + Math.random());
                 }
             }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg1').parent().appendTo($("form:first"))
                    $('#SearchDlg1').dialog('open');
                    $('#SearchDlg1').dialog('center');
                }
            }
            ];

            var toolbarSel = [
          {
              text: '筛选',
              iconCls: 'icon-search',
              handler: function () {
                  $('#SearchDlg1').parent().appendTo($("form:first"))
                  $('#SearchDlg1').dialog('open');
                  $('#SearchDlg1').dialog('center');
              }
          }, '-',
             {
                 text: '导出',
                 iconCls: 'icon-page_white_excel',
                 handler: function () {
                     window.open("../Mt/MtReport/MtSupplierCooperationPeriodExcel.aspx?PeriodId='" + $("#PeriodId").val() + "'&random=" + Math.random());
                 }
             }
            ];

            //delete
            function DelRecord(Id) {
                HDialog.Prompt("是否删除该项", function () {//删除数据库后再删页面数据
                    $.tool.DataGet('MaterialSupplierInfo', 'DeleteSupplierCooperationPeriodMaterial', 'Id=' + Id,
                        function Init() {
                        },
                        function callback(_Data) {
                            var row = $("#TableContainer").datagrid("getSelected");
                            var index = $("#TableContainer").datagrid("getRowIndex", row);
                            $('#TableContainer').datagrid('deleteRow', index);
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            }

            //Add/Edit
            function Detail(RowId, OpType) {//Id、操作类型
                var w = top.$(window).width();
                var h = parent.$(window).height();

                HDialog.Open(w, h, '../Mt/SupplierDialLog/SupplierSelFrame.aspx', '选择物资', true, function callback(_Data) {
                    //将选择的物资添加到行
                    //alert(_Data);
                    var rows = JSON.parse(_Data);
                    $.tool.DataPost('MaterialSupplierInfo', 'AddSupplierCooperationPeriodMaterial', '&List=' + _Data + '&HidOpType=add&PeriodId=' + $("#PeriodId").val(),
                        function Init() {
                        },
                        function callback(_Data1) {
                            var materId = _Data1.split(',');
                            for (var i = 0; i < rows.length; i++) {
                                if (CheckMaterial(rows[i].Id, materId)) {
                                    AddRows(rows[i]);
                                }
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });


                });
            }

            //选择物资后增加行
            function AddRows(row) {
                var _Data = $('#TableContainer').datagrid('getData');
                var row_index = _Data.rows.length;
                //var strGuid = Guid();
                //写入数据库
                $('#TableContainer').datagrid('insertRow', {
                    index: row_index,
                    row: {
                        Id: "",
                        MaterialId: row.Id,
                        PeriodId: $("#PeriodId").val(),
                        Name: row.Name,
                        Price: ToDecimal("1.00", decimalPos),
                        PricingNum: ToDecimal("1.00", 2),
                        Taxes: ToDecimal("0.01", 2),
                        NoTaxPrice: parseFloat(Taxes.TaxPrice(row.Price, row.Taxes)).toFixed(decimalPos)
                    }
                });
            }
            //检查重复的物资
            function CheckMaterial(Id, materId) {
                var bl = true;
                for (var i = 0; i < materId.length; i++) {
                    if (materId[i] == Id) {
                        bl = false;
                    }
                }
                return bl;
            }

            //loadList
            function LoadList(isChangeToolBar) {
                processToolbar = toolbarSel;//失效时只加载查询菜单
                if (isChangeToolBar == 0) {  //当此合作期间有效时加载所有操作菜单                  
                    processToolbar = toolbar;
                }
                if ($("#PeriodId").val() != "") {//筛选完时，根据合作期间再次判断是否加载所有操作菜单
                    if ($("#StaraValue").val() == 0) {
                        processToolbar = toolbar;
                    }
                }
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: processToolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onAfterEdit: function (rowIndex, rowData, changes) {//结束修改，提交数据
                        var TaxesStr = Taxes.TaxPrice(rowData["Price"], rowData["Taxes"]);
                      
                        rowData["NoTaxPrice"] = parseFloat(TaxesStr).toFixed(decimalPos);
                        $.tool.DataPost('MaterialSupplierInfo', 'AddSupplierCooperationPeriodMaterial', '&List=[' + JSON.stringify(rowData) + ']&HidOpType=edit&PeriodId=' + $("#PeriodId").val(),
                       function Init() {
                       },
                       function callback(_Data1) {
                           LoadList();
                       },
                       function completeCallback() {
                       },
                       function errorCallback() {
                       });


                    },
                    onDblClickCell: function (rowIndex, rowData) {//开始修改
                        if (editIndex != undefined) {
                            $(this).datagrid('endEdit', editIndex);
                        }
                        if ($("#StaraValue").val() == 0) {
                            $(this).datagrid('beginEdit', rowIndex);
                        }

                        var ed = $(this).datagrid('getEditor', { index: rowIndex, field: 'Price' });
                        $(ed.target).focus();
                        editIndex = rowIndex;
                    },
                    onClickRow: function (rowIndex, rowData)
                    {
                        $(this).datagrid('endEdit', editIndex);
                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("MaterialSupplierInfo", "SelSupplierCooperationPeriodMaterial", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg1").dialog("close");
                    }
                });
            }

            function AlertForMessage() {
                if ($("#SupplierId").val() == "") {
                   // HDialog.Info("请先选择供应商");
                }
            }

            LoadList();
            LoadListTop();
            //AlertForMessage();

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

            //变更记录
            function RecordList(str) {               
                HDialog.Open(900, 500, '../Mt/MtSupplierMaterialRecordList.aspx?Id='+str, '变更记录查询', true, function callback(_Data) {
                   
                });
            }



        </script>

    </form>
</body>
</html>
