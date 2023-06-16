<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MtWarehouseAllManager.aspx.cs" Inherits="M_Main.Mt.MtWarehouseAllManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../Jscript/Guid.js"></script>
    <script src="../jscript/Taxes.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
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

        .Container textarea {
            width: 99%;
            height: 100px;
            overflow-y: scroll;
            resize: none;
            border: 1px solid #cccccc;
            padding-left: 2px;
            font-size: 12px;
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
                </div>
                <ul id="treeDemo" class="easyui-tree">
                </ul>
            </div>
        </div>
        <div class="ContainerRight" style="border-left: 1px solid #cccccc; border-right: 1px solid #cccccc;">
            <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
            <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 60%; height: 195px; padding: 10px;">
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
                        <td class="TdTitle">物资类别:</td>
                        <td class="TdContent">
                            <input type="hidden" id="TypeCode" name="TypeCode" />
                            <input name="TypeName" type="text" id="TypeName" onclick="TypeCodeChoose();" readonly="readonly" class="easyui-validatebox" />
                        </td>
                        <td class="TdTitle">规格型号:</td>
                        <td class="TdContent">
                            <input name="SelSpecification" type="text" id="SelSpecification" class="easyui-validatebox" />
                        </td>
                        <td class="TdTitle">物资颜色:</td>
                        <td class="TdContent">
                            <input name="SelColor" type="text" id="SelColor" class="easyui-validatebox" />
                        </td>

                    </tr>
                    <tr>
                        <td class="TdTitle">物资产地:</td>
                        <td class="TdContent">
                            <input name="SelOriginPlace" type="text" id="SelOriginPlace" class="easyui-validatebox" />
                        </td>

                        <td class="TdTitle">质保期限:</td>
                        <td class="TdContent">
                            <input name="SelWarrantyPeriod" type="text" id="SelWarrantyPeriod" class="easyui-validatebox" />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContent"></td>

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

        <input type="hidden" id="hidTypeCode" name="hidTypeCode" value="" />
        <input type="hidden" runat="server" id="hidWarehouseId" name="hidWarehouseId" value="" />
        <input type="hidden" runat="server" id="LoginCommid" name="LoginCommid" value="" />
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
            $(document).ready(function () {
                InitFunction();
                InitTableHeight();
                InitLeftTree();
                LoadList();
            });

            //筛选条件物资类别
            function TypeCodeChoose() {
                //TypeCode
                //TypeName
                HDialog.Open('300', '400', '../Mt/MtTypeCodeDialog.aspx', '选择类别', true, function callback(_Data) {
                    var arrRet = _Data.split(',');
                    $("#TypeCode").val(arrRet[1]);
                    $("#TypeName").val(arrRet[0]);
                });
            }
            function InitFunction() {
                var h = $(window).height();
                $("#wins").css("height", h + "px");
            }
            //LoadLeft
            function InitLeftTree() {
                $.tool.DataGet('MaterialBaseHandle', 'GetMtWarehouseTree', "type=address",
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
                        if (node.attributes.Id != "") {
                            $("#hidWarehouseId").val(node.attributes.Id);
                        } else {
                            $("#hidWarehouseId").val("");
                        }
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
                $("#TypeCode").val("");
                $("#TypeName").val("");
                $("#WarehouseNameDlg").searchbox("setValue", "");

            }
            //RightHeight
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            var frozenColumns = [[
                 //{ field: 'ck', checkbox: true },
                 { field: 'Color', title: 'Color', width: 80, align: 'left', sortable: true, hidden: true },
                 { field: 'Id', title: 'Id', width: 50, align: 'left', sortable: true, hidden: true },
                 { field: 'MaterialId', title: '档案Id', width: 50, align: 'left', sortable: true, hidden: true },
                 { field: 'WareHouseId', title: '', width: 50, align: 'left', sortable: true, hidden: true },
                    { field: 'WareHouseName', title: '仓库名称', width: 90, align: 'left', sortable: true },
                   
                    {
                        field: 'Name', title: '物资名称', width: 145, align: 'left', sortable: true, formatter: function (value, row, index) {
                            var na = row.Name;
                            if (na.length > 10) {
                                na = na.substring(0, 10) + "...";
                            }
                            return na;
                        }
                    }
            ]];
            //column
            var column = [[
                 { field: 'TypeName', title: '物资类别', width: 80, align: 'left', sortable: true },
                    {
                        field: 'Num', title: '物资编码', width: 130, align: 'left', sortable: true

                    },
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

                    { field: 'ColorName', title: '物资颜色', width: 80, align: 'left', sortable: true },
                    { field: 'OriginPlace', title: '物资产地', width: 80, align: 'left', sortable: true },
                    { field: 'WarrantyPeriod', title: '质保期限', width: 80, align: 'left', sortable: true },
                    { field: 'SafeCount', title: '安全库存', width: 100, align: 'left', sortable: true },
                    { field: 'BuyMethod', title: '采购方式', width: 100, align: 'left', sortable: true },
                    { field: 'Price', title: '含税单价', width: 80, align: 'left', sortable: true },
                    { field: 'Taxes', title: '税率', width: 80, align: 'left', sortable: true },
                    { field: 'NoTaxPrice', title: '不含税单价', width: 80, align: 'left', sortable: true },
                    { field: 'DepositPlace', title: '存放位置', width: 120, align: 'left', sortable: true }
                    
            ]];
            //menu
            var toolbar = [
            {
                text: '单个添加仓库物资',
                iconCls: 'icon-add',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    addSingle();
                }
            }, '-', {
                text: '批量添加仓库物资',
                iconCls: 'icon-edit',
                handler: function () {
                    add();
                }
            }, '-', {
                text: '批量设置物资参数',
                iconCls: 'icon-edit',
                handler: function () {
                    SetAllWarehouse();
                }
            }, '-',
             {
                 text: '删除',
                 iconCls: 'icon-cancel',
                 handler: function () {
                     Del();
                 }
             }, '-',
               {
                   text: '保存',
                   iconCls: 'icon-save',
                   handler: function () {
                       Save("ok");
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
            //删除
            function Del() {
                var row = $("#TableContainer").datagrid("getChecked");
                var rows = $("#TableContainer").datagrid("getSelections");
                if (row.length == 0 && rows.length == 0) {
                    HDialog.Info("请选择删除的档案数据！");
                    return false;
                }
                var strJson = "[";
                if (row.length > 0) {
                    for (var j = 0; j < row.length; j++) {
                        if (j == 0) {
                            strJson += '{"Id":"' + row[j].Id + '"}';
                        }
                        else {
                            strJson += ',{"Id":"' + row[j].Id + '"}';
                        }
                    }
                }
                else {
                    for (var j = 0; j < rows.length; j++) {
                        if (j == 0) {
                            strJson += '{"Id":"' + rows[j].Id + '"}';
                        }
                        else {
                            strJson += ',{"Id":"' + rows[j].Id + '"}';
                        }
                    }
                }
                strJson += ']';
                $.tool.DataPostAsync('MtWarehouseManager', 'WarehouseManagerDel', 'type=del&strJson=' + strJson,
                                                                function Init() {
                                                                },
                                                                function callback(_Data) {
                                                                    if (_Data != '') {
                                                                        LoadList('');
                                                                    }
                                                                },
                                                                function completeCallback() {
                                                                },
                                                                function errorCallback() {
                                                                });
            }
            //保存
            function Save(str) {
                if ($("#hidWarehouseId").val() == "") {
                    HDialog.Info("请选择仓库!");
                    return;
                }
                UpdateAmount();
                if (editIndex == undefined) return;

                var row = $('#TableContainer').datagrid('getData').rows[editIndex];
                if (row==null) {
                    return;
                }
                var strJson = "[";
                strJson += '{"Id":"' + row.Id + '","WarehouseId":"' + row.WarehouseId + '","MaterialId":"' + row.MaterialId + '","SafeCount":"' + row.SafeCount + '","BuyMethod":"' + row.BuyMethod + '","Price":"' + row.Price + '","Taxes":"' + row.Taxes + '","NoTaxPrice":"' + row.NoTaxPrice + '","DepositPlace":"' + row.DepositPlace + '"}'; 

                strJson += ']';
                console.log(strJson);
                $.tool.DataPostAsync('MtWarehouseManager', 'WarehouseManagerSave', 'type=update&WareHouseId=' + $("#hidWarehouseId").val() + '&strJson=' + strJson, function Init() { },
                           function callback(_Data) {
                               if (_Data != '') {
                                   if (str != "")
                                       LoadList("");
                               }
                           },
                                                                   function completeCallback() {
                                                                   },
                                                                   function errorCallback() {
                                                                   });
            }
            //公共数据批量设置
            function add() {                               
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open(700, 300, '../Mt/MtWarehouseDialog/MtWarehouseAllBaseSet.aspx', '批量添加仓库物资', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList(_Data);
                    }
                });
            }
            //批量仓库设置
            function SetAllWarehouse() {
               
                var w = top.$(window).width();
                var h = parent.$(window).height();
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open(w, (h - 15), '../Mt/MtWarehouseDialog/MtWarehouseAllManagerSet.aspx?&WareHouseId=' + $("#hidWarehouseId").val(), '批量设置物资参数', false, function callback(_Data) {
                    if (_Data != '') {
                        //$("#hidWarehouseId").val(_Data);
                        LoadList(_Data);
                    }
                });
            }
            //档案新增
            function addSingle() {
                if ($("#hidWarehouseId").val() == "") {
                    HDialog.Info("请选择仓库!");
                    return;
                }
                var w = top.$(window).width();
                var h = parent.$(window).height();
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open(w, (h - 15), '../Mt/MtWarehouseManagerSet.aspx?&WareHouseId=' + $("#hidWarehouseId").val(), '单个添加仓库物资', false, function callback(_Data) {
                    if (_Data != '') {
                        $("#hidWarehouseId").val(_Data);
                        LoadList(_Data);
                    }
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
            //
            function UpdateAmount() {
                if (editIndex != undefined) {
                    $("#TableContainer").datagrid('acceptChanges', editIndex);
                    var index = editIndex;
                    var rowData = $('#TableContainer').datagrid('getData').rows[index];
                    //含税单价检测
                    if (rowData == undefined || rowData.Price == undefined || rowData.Price == "") return;
                    if (rowData.BuyMethod == undefined || rowData.BuyMethod == "") {
                        HDialog.Info("采购方式不能为空!");
                        return;
                    }
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
            //LoadList
            function LoadList(WareHouseId) {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=MtWarehouseManager&Command=GetMtWarehouseManagerList&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    frozenColumns: frozenColumns,
                    columns: column,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    checkOnSelect: false,
                    selectOnCheck: false,
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onClickRow: function (rowIndex, rowData) {
                        //更改当前行号
                        UpdateAmount();
                        Save("");
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
                               type: 'numberbox',
                               options: {
                                   precision: 2
                               }
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
                        $(this).datagrid("checkRow", rowIndex);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
        </script>
    </form>
</body>
</html>
