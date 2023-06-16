<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MtWarehouseManagerSet.aspx.cs" Inherits="M_Main.Mt.MtWarehouseManagerSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
     <script src="../jscript/format.js" type="text/javascript"></script>
     <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../Jscript/Guid.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/Taxes.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            font-family: 微软雅黑;
            background-color: #ffffff;
            padding: 0px;
        }

        .Container {
            width: 100%;
            height: auto;
            margin-top: 5px;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .ContainerLeft {
            float: left;
            width: 20%;
            /*padding-right: 5px;*/
            overflow-y: auto;
            /*border-right: 1px solid #cccccc;*/
        }

        .ContainerRight {
            float: right;
            width: 79%;
        }

            .ContainerRight ul {
                margin: 0px auto;
                clear: both;
            }

                .ContainerRight ul .InputTitle {
                    list-style-type: none;
                    float: left;
                    text-align: right;
                    margin-bottom: 10px;
                    min-height: 20px;
                    line-height: 22px;
                }

                .ContainerRight ul .TextareaTitle {
                    list-style-type: none;
                    float: left;
                    text-align: right;
                    margin-bottom: 10px;
                }

                .ContainerRight ul .Content {
                    list-style-type: none;
                    float: left;
                    width: 80%;
                    text-align: left;
                    margin-bottom: 10px;
                }

                .ContainerRight ul .ContentBlank {
                    list-style-type: none;
                    float: left;
                    width: 80%;
                    text-align: left;
                    margin-bottom: 10px;
                }

                .ContainerRight ul .Submit {
                    list-style-type: none;
                    text-align: center;
                    padding-top: 4px;
                    width: 80%;
                    height: 40px;
                    text-align: center;
                }
        .Container .Content input {
            width: 99%;
            border: 1px solid #cccccc;
            height: 20px;
            padding-left: 2px;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
     <div id="ContainerLeft" class="ContainerLeft">
            <div id="wins" style="overflow: auto;">
                <div>
                  <%--  <div  style="margin-left:10PX; margin-top:8px;"> 
                    仓库名称:
                    <input type="hidden" id="WarehouseId" name="WarehouseId" />
                    <input name="WarehouseName" type="text" id="WarehouseName" class="easyui-searchbox" data-options="editable:false,panelHeight: &#39;auto&#39;" style="height:24px;" searcher="WarehouseChioce" />
                    </div>
                    <hr style=" border: 1px solid #cccccc;" />--%>
                </div>
                <ul id="treeDemo" class="easyui-tree">
                </ul>
                </div>
        </div>
        <div class="ContainerRight" style="border-left:1px solid #cccccc;border-right:1px solid #cccccc;">
            <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
            <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 75%; height: 195px; padding: 10px;">
                  <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                    <tr>
                       
                        <td class="TdTitle">物资编码:</td>
                        <td class="TdContent">
                            <input name="SelNum" type="text" id="SelNum" class="easyui-validatebox" />
                        </td>
                        <td class="TdTitle">物资名称:</td>
                        <td class="TdContent">
                            <input name="SelName" type="text" id="SelName" class="easyui-validatebox" />
                        </td>
                     <td class="TdTitle">物资简拼:</td>
                        <td class="TdContent">
                            <input name="SelSpell" type="text" id="SelSpell" class="easyui-validatebox" />
                        </td>
                        </tr>
                    <tr>
                        
                        <td class="TdTitle">物资属性:</td>
                        <td class="TdContent">
                            <select name="SelProperty" id="SelProperty">
	                            <option selected="selected" value="1">--请选择--</option>
	                            <option value="材料">材料</option>
	                            <option value="低值易耗品">低值易耗品</option>
	                            <option value="固定资产">固定资产</option>
                            </select>
                        </td>
                        <td class="TdTitle">物资单位:</td>
                        <td class="TdContent">
                            <input name="SelUnit" type="text" id="SelUnit" class="easyui-validatebox" />
                        </td>
                     <td class="TdTitle">物资品牌:</td>
                        <td class="TdContent">
                            <input name="SelBrand" type="text" id="SelBrand" class="easyui-validatebox" />
                        </td>
                       
                        </tr>
                    <tr>
                        
                        <td class="TdTitle">规格型号:</td>
                        <td class="TdContent">
                            <input name="SelSpecification" type="text" id="SelSpecification" class="easyui-validatebox" />
                        </td>
                        <td class="TdTitle">物资颜色:</td>
                        <td class="TdContent">
                            <input name="SelColor" type="text" id="SelColor" class="easyui-validatebox" />
                        </td>
                       <td class="TdTitle">物资产地:</td>
                        <td class="TdContent">
                            <input name="SelOriginPlace" type="text" id="SelOriginPlace" class="easyui-validatebox" />
                        </td>
                        </tr>
                    <tr>
                         
                        <td class="TdTitle">质保期限:</td>
                        <td class="TdContent">
                            <input name="SelWarrantyPeriod" type="text" id="SelWarrantyPeriod" class="easyui-validatebox" />
                        </td>
                         <td class="TdTitle"></td>
                        <td class="TdContent">
                          
                        </td>
                          <td class="TdTitle"></td>
                        <td class="TdContent">
                          
                        </td>
                    </tr>
                   
                    <tr>
                        <td colspan="12" align="center">
                            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="ClearWhere();">清除条件</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="MaterialJson" value="" />
        <input type="hidden" runat="server" id="hidWarehouseId" name="hidWarehouseId" value="" />
        <input type="hidden" id="hidTypeCode" name="hidTypeCode" value="" />
        <%--小数位数--%>
    <input type="hidden" id="DecimalNum" name="DecimalNum" runat="server" value="4" />
        <script type="text/javascript">

            //监听键盘回车事件
            document.onkeydown = function (event) {
                var e = event || window.event || arguments.callee.caller.arguments[0];
                if (e && e.keyCode == 13) { // enter 键
                    LoadList();
                }
            };

            //计算小数位数
            var decimalPos = Number($("#DecimalNum").val());
            //编辑的行号
            var editIndex = undefined;
            $(document).ready(function ()
            {
                InitFunction();
                InitTableHeight();
                InitLeftTree();
                LoadList();
            });
            //LeftHeight
            function InitFunction() {
                var h = $(window).height();
                $("#wins").css("height", h  + "px");
            }
            //LoadLeft
            function InitLeftTree() {
                $.tool.DataGet('MaterialTypeHandle', 'GetDepartmentTree', "",
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
            //LoadLeftTree
            function GetTree(obj) {
                $('#treeDemo').html("");
                $('#treeDemo').tree({
                    data: obj,
                    onClick: function (node) {
                        $("#hidTypeCode").val(node.id);
                        ClearWhere();
                        LoadList(node.attributes.SortCode);
                    }
                });
            }
            //clearWhere
            function ClearWhere() {
                $("#SelNum").val("");
                $("#SelName").val("");
                $("#SelSpell").val("");
                $("#SelProperty").val("1");
                $("#SelUnit").val("");
                $("#SelBrand").val("");
                $("#SelSpecification").val("");
                $("#SelColor").val("");
                $("#SelOriginPlace").val("");
                $("#SelWarrantyPeriod").val("");
                $("#WarehouseIdDlg").val("");
                $("#WarehouseNameDlg").searchbox("setValue", "");
                //$("#HidSelProperty").val("1");
            }
            //RightHeight
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            var frozenColumns = [[
                 //{ field: 'ck', checkbox: true},
                 
                 { field: 'Id', title: 'Id', width: 50, align: 'left', sortable: true, hidden: true },
                 { field: 'MaterialId', title: '档案Id', width: 50, align: 'left', sortable: true, hidden: true },
                    //{ field: 'TypeName', title: '物资类别', width: 80, align: 'left', sortable: true },
                    {
                        field: 'Num', title: '物资编码', width: 130, align: 'left', sortable: true
                        , formatter: function (value, row, index) {
                            return "<a class=\"HrefStyle\"  href='#' onclick=\"Detail('" + row.MaterialId + "','" + row.WareHouseId + "');\">" + row.Num + "</a>";
                        }
                    },
                    {
                        field: 'Name', title: '物资名称', width: 145, align: 'left', sortable: true, formatter: function (value, row, index) {
                            var na = row.Name;
                            if (na.length > 10)
                            {
                                na = na.substring(0, 10)+"...";
                            }
                            return na;
                        }
                    }
            ]];
            //column
            var column = [[
                    { field: 'Spell', title: '物资简拼', width: 80, align: 'left', sortable: true },
                    { field: 'Property', title: '物资属性', width: 80, align: 'left', sortable: true },
                    { field: 'Unit', title: 'Unit', width: 80, align: 'left', sortable: true, hidden: true },
                    { field: 'UnitName', title: '物资单位', width: 80, align: 'left', sortable: true },
                    { field: 'Brand', title: '物资品牌', width: 80, align: 'left', sortable: true },
                    {
                        field: 'Specification', title: '规格型号', width: 145, align: 'left', sortable: true
                        , formatter: function (value, row, index) {
                            var na = row.Name;
                            if (na.length > 10) {
                                na = na.substring(0, 10) + "...";
                            }
                            return na;
                        }
                    },
                    { field: 'Color', title: 'Color', width: 80, align: 'left', sortable: true, hidden: true },
                    { field: 'ColorName', title: '物资颜色', width: 80, align: 'left', sortable: true },
                    { field: 'OriginPlace', title: '物资产地', width: 80, align: 'left', sortable: true },
                    { field: 'WarrantyPeriod', title: '质保期限', width: 80, align: 'left', sortable: true },

                      
                    {
                          field: 'SafeCount', title: '安全库存', width: 100, align: 'left', sortable: true
                    },
                    {
                         field: 'BuyMethod', title: '采购方式', width: 100, align: 'left', sortable: true
                    },
                    {
                        field: 'Price', title: '含税单价', width: 80, align: 'left', sortable: true
                       
                    },
                    {
                        field: 'Taxes', title: '税率', width: 80, align: 'left', sortable: true
                      
                    },
                    {
                        field: 'NoTaxPrice', title: '不含税单价', width: 80, align: 'left', sortable: true
                       
                    },
                    {
                        field: 'DepositPlace', title: '存放位置', width: 120, align: 'left', sortable: true
                    }
            ]];
            //menu
            var toolbar = [
               //{
               //    text: '保存',
               //    iconCls: 'icon-save',
               //    handler: function () {
               //        Save("Ok");
               //    }
               //}, '-',
              {
                text: '筛选', 
                iconCls: 'icon-search',
                handler: function () {
                    var rows = $("#TableContainer").datagrid("getSelections");//                   
                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');
                }
               }
            ];
         
            function Save(str)
            {
                if ($("#hidWarehouseId").val() == "") {
                    HDialog.Info("未选择仓库");
                    return;
                }
                UpdateAmount();
               // if (editIndex == undefined) return;
                
                //var row = $("#TableContainer").datagrid("getChecked");
                //alert(row.length);
                var rows = $("#TableContainer").datagrid("getSelections");//
                //var row = $('#TableContainer').datagrid('getData').rows[editIndex];
                //if (row.length == 0) {
                //    HDialog.Info("请勾选档案资料！");
                //    return false;
                //}
                var strJson = "[";
                if ($("#MaterialJson").val() != "")
                {
                    strJson = strJson + $("#MaterialJson").val();
                }
                var hidWarehouseId = $("#hidWarehouseId").val();
                for (var j = 0; j < rows.length; j++)
                {
                    strJson += '{"WarehouseId":"' + hidWarehouseId + '","MaterialId":"' + rows[j].MaterialId + '","SafeCount":"' + rows[j].SafeCount + '","BuyMethod":"' + rows[j].BuyMethod + '","Price":"' + rows[j].Price + '","Taxes":"' + rows[j].Taxes + '","NoTaxPrice":"' + rows[j].NoTaxPrice + '","DepositPlace":"' + rows[j].DepositPlace + '"},';
                }
                if (strJson != "[")
                {
                    strJson = strJson.substring(0, strJson.length - 1);
                }
                strJson += ']';
                $.tool.DataPostAsync('MtWarehouseManager', 'WarehouseManagerSave', 'WareHouseId=' + $("#hidWarehouseId").val() + '&strJson=' + strJson,
                                                                   function Init() {
                                                                   },
                                                                   function callback(_Data) {
                                                                       if (_Data != '')
                                                                       {
                                                                           if (str!="")
                                                                           HDialog.Close($("#hidWarehouseId").val());
                                                                       }
                                                                   },
                                                                   function completeCallback() {
                                                                   },
                                                                   function errorCallback() {
                                                                   });
            }
            //重写DataGrid,支持更改页脚样式
            var myview = $.extend({}, $.fn.datagrid.defaults.view, {
                renderFooter: function (target, container, frozen) {
                    var opts = $.data(target, 'datagrid').options;
                    var rows = $.data(target, 'datagrid').footer || [];
                    var fields = $(target).datagrid('getColumnFields', frozen);
                    var table = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'];

                    for (var i = 0; i < rows.length; i++) {
                        var styleValue = opts.rowStyler ? opts.rowStyler.call(target, i, rows[i]) : '';
                        var style = styleValue ? 'style="' + styleValue + '"' : '';
                        table.push('<tr class="datagrid-row" datagrid-row-index="' + i + '"' + style + '>');
                        table.push(this.renderRow.call(this, target, fields, frozen, i, rows[i]));
                        table.push('</tr>');
                    }
                    table.push('</tbody></table>');
                    $(container).html(table.join(''));
                }
            });
            //计算合计金额及页脚合计金额,不含税单价及含税单价
            function UpdateAmount() {
                if (editIndex != undefined) {
                    $("#TableContainer").datagrid('acceptChanges', editIndex);
                    var index = editIndex;
                    var rowData = $('#TableContainer').datagrid('getData').rows[index];
                    //检查申购价格是否允许调低及调高价格,如果违反规则,则申购价置为参考价
                    if (rowData == undefined || rowData.Price == undefined || rowData.Price == "") return;
                    var Price = parseFloat(rowData.Price);
                    $('#TableContainer').datagrid('updateRow',
                       {
                           index: index,
                           row: {
                               Price: Price,
                               NoTaxPrice: ToDecimal(Taxes.TaxPrice(Price, rowData.Taxes), decimalPos)
                               }                         
                       });
                 
                }
            };
            //给datagrid扩展方法
            $.extend($.fn.datagrid.methods, {
                addEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item.field);
                            e.editor = item.editor;
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param.field);
                        e.editor = param.editor;
                    }
                },
                removeEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item);
                            e.editor = {};
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param);
                        e.editor = {};
                    }
                }
            });
            function onBeforeLoadSave() {
                var rows = $("#TableContainer").datagrid("getSelections");
                var hidStr = $("#MaterialJson").val();
                var strJson = "";
                var hidWarehouseId = $("#hidWarehouseId").val();
                //strJson += '{"WarehouseId":"' + row.WarehouseId + '","MaterialId":"' + row.MaterialId + '","SafeCount":"' + row.SafeCount + '","BuyMethod":"' + row.BuyMethod + '","Price":"' + row.Price + '","Taxes":"' + row.Taxes + '","NoTaxPrice":"' + row.NoTaxPrice + '","DepositPlace":"' + row.DepositPlace + '"}';
                for (var j = 0; j < rows.length; j++) {
                    if (hidStr.indexOf(rows[j].MaterialId) < 0)
                        strJson += '{"WarehouseId":"' + hidWarehouseId + '","MaterialId":"' + rows[j].MaterialId + '","SafeCount":"' + rows[j].SafeCount + '","BuyMethod":"' + rows[j].BuyMethod + '","Price":"' + rows[j].Price + '","Taxes":"' + rows[j].Taxes + '","NoTaxPrice":"' + rows[j].NoTaxPrice + '","DepositPlace":"' + rows[j].DepositPlace + '"},';
                }
                if ($("#MaterialJson").val() != "") {
                    strJson = hidStr + strJson;
                }
                $("#MaterialJson").val(strJson);
            }
            function onLoadSuccessSel()
            {

                var rows = $('#TableContainer').datagrid('getRows');
                var str = $("#MaterialJson").val();
                for (var i = 0; i < rows.length; i++) {
                    if (str.indexOf(rows[i].MaterialId) >= 0) {
                        var RI = $("#TableContainer").datagrid("getRowIndex", rows[i]);
                        $("#TableContainer").datagrid("selectRow", RI);
                    }
                }
            }
            //LoadList
            function LoadList(WareHouseId) {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=MtWarehouseManager&Command=GetMtMaterialMessageList&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    columns: column,
                    fitColumns: false,
                    remoteSort: false,                    
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",                   
                    singleSelect: false,
                    selectOnCheck: true,
                    checkOnSelect: true,
                    rownumbers: true,
                    border: false,
                    striped: true,
                    idField: "MaterialId",
                    view: myview,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onAfterEdit: function (rowIndex, rowData, changes) {//结束修改，提交数据
                        var TaxesStr = Taxes.TaxPrice(rowData["Price"], rowData["Taxes"]);
                        rowData["NoTaxPrice"] = parseFloat(TaxesStr).toFixed(2);
                        $.tool.DataPost('MtWarehouseManager', 'UpdateMaterialForWarehouse', '&List=[' + JSON.stringify(rowData) + ']',
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
                    onClickRow: function (rowIndex, rowData) {
                        //更改当前行号
                        UpdateAmount();
                        editIndex = rowIndex;
                        //去除编辑器
                        $("#TableContainer").datagrid('removeEditor', 'SafeCount');
                        $("#TableContainer").datagrid('removeEditor', 'BuyMethod');
                        $("#TableContainer").datagrid('removeEditor', 'Price');
                        $("#TableContainer").datagrid('removeEditor', 'Taxes');
                        $("#TableContainer").datagrid('removeEditor', 'DepositPlace');
                        $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                       {
                           field: 'SafeCount',
                           editor: {
                               type: 'numberbox'
                           }
                       }]);
                        //采购方式可以编辑
                        $("#TableContainer").datagrid('addEditor', {
                            field: 'BuyMethod',
                            editor: {
                                type: 'combobox',
                                options: {
                                    valueField: 'BuyMethod',
                                    textField: 'BuyMethodName',
                                    data: [{ 'BuyMethod': '统购', 'BuyMethodName': '统购' }, { 'BuyMethod': '自购', 'BuyMethodName': '自购' }]
                                     , panelHeight: 'auto'
                                      , editable: false
                                }
                            }
                        });
                       
                        $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                         {
                             field: 'Price',
                             editor: {
                                 type: 'numberbox',
                                 options: {
                                     precision: decimalPos
                                 }
                             }
                         }]);
                        $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                       {
                           field: 'Taxes',
                           editor: {
                               type: 'numberbox',
                               options: {
                                   precision: decimalPos,
                                   min: 0,
                                   max: 1
                               }
                           }
                       }]);
                        $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                         {
                             field: 'DepositPlace',
                             editor: {
                                 type: 'validatebox'
                             }
                         }]);
                        //开始编辑
                        $("#TableContainer").datagrid('beginEdit', rowIndex);
                        //$(this).datagrid("checkRow", rowIndex);
                    },
                    onBeforeLoad: function (param) {
                       // onBeforeLoadSave();
                    },
                    onLoadSuccess: function (data)
                    {
                        onLoadSuccessSel();
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
        </script>
    </form>
</body>
</html>