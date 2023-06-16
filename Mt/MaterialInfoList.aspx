<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialInfoList.aspx.cs" Inherits="M_Main.Mt.MaterialInfoList" %>

<!DOCTYPE html>

<html xmlns="">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>

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
            padding-right: 5px;
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
    <form id="form1" runat="server">
        <div id="ContainerLeft" class="ContainerLeft">
            <div id="wins" style="overflow: auto;">
                <ul id="treeDemo" class="easyui-tree">
                </ul>
            </div>
        </div>
        <div class="ContainerRight" style="border-left:1px solid #cccccc;border-right:1px solid #cccccc;">
            <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
            <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 70%; height: 245px; padding: 10px;">
                <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                    <tr>
                        <td class="TdTitle">物资编码:</td>
                        <td class="TdContent">
                            <input type="text" class="easyui-validatebox" runat="server" id="SelNum" value="" name="SelNum" />
                        </td>
                        <td class="TdTitle">物资名称:</td>
                        <td class="TdContent">
                            <input type="text" class="easyui-validatebox" runat="server" id="SelName" value="" name="SelName" />
                        </td>
                        <td class="TdTitle">物资简拼:</td>
                        <td class="TdContent">
                            <input type="text" class="easyui-validatebox" runat="server" id="SelSpell" value="" name="SelSpell" />
                        </td>
                        </tr>
                    <tr>
                        <td class="TdTitle">物资属性:</td>
                        <td class="TdContent">
                            <%--<input type="text" class="easyui-validatebox" runat="server" id="SelProperty" value="" name="SelProperty" />--%>
                            <select runat="server" id="SelProperty" name="SelProperty">
                                <option value="1" selected="selected">--请选择--</option>
                                <option value="材料">材料</option>
                                <option value="低值易耗品">低值易耗品</option>
                                <option value="固定资产">固定资产</option>
                            </select>
                        </td>
                        <td class="TdTitle">物资单位:</td>
                        <td class="TdContent">                            
                            <select runat="server" id="SelUnit" style="border: 1px solid #cccccc;" name="SelUnit">
                        </select>
                        </td>
                    
                        <td class="TdTitle">物资品牌:</td>
                        <td class="TdContent">
                            <input type="text" class="easyui-validatebox" runat="server" id="SelBrand" value="" name="SelBrand" />
                        </td>
                        </tr>
                    <tr>
                        <td class="TdTitle">规格型号:</td>
                        <td class="TdContent">
                            <input type="text" class="easyui-validatebox" runat="server" id="SelSpecification" value="" name="SelSpecification" />
                        </td>
                        <td class="TdTitle">物资颜色:</td>
                        <td class="TdContent">                            
                            <select runat="server" id="SelColor" style="border: 1px solid #cccccc;" name="SelColor">
                        </select>
                        </td>
                        <td class="TdTitle">物资产地:</td>
                        <td class="TdContent">
                            <input type="text" class="easyui-validatebox" runat="server" id="SelOriginPlace" value="" name="SelOriginPlace" />
                        </td>
                        </tr>
                    <tr>
                        <td class="TdTitle">质保期限:</td>
                        <td class="TdContent">
                            <input type="text" class="easyui-validatebox" runat="server" id="SelWarrantyPeriod" value="" name="SelWarrantyPeriod" />
                        </td>
                    </tr>
                     <tr>
                        <td class="TdTitle">是否作废:</td>
                        <td class="TdContent">
                              <select runat="server" id="IsDelete" style="border: 1px solid #cccccc;" name="IsDelete">
                                <option value="" selected="selected">--请选择--</option>
                                <option value="0">否</option>
                                <option value="1">是</option>
                              </select>
                         <%--   <input type="radio" class="easyui-validatebox" runat="server" id="Radio1" value="" name="IsInvalid" />否--%>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
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

        <input type="hidden" runat="server" id="HidTypeId" name="HidTypeId" value="" />
        <input type="hidden" runat="server" id="HidSelProperty" value="" name="HidSelProperty" />


        <script type="text/javascript">
            $(document).ready(function () {
                InitFunction();
                InitTableHeight();
                InitLeftTree();
                LoadList();
            });

            //监听键盘回车事件
            document.onkeydown = function (event) {
                var e = event || window.event || arguments.callee.caller.arguments[0];
                if (e && e.keyCode == 13) { // enter 键
                    LoadList();
                }
            };

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
                        if (node.attributes.ParentSortCode != "") {
                            
                            $("#HidTypeId").val(node.attributes.Id);
                        } else {
                            $("#HidTypeId").val("");
                        }
                        ClearWhere();
                        LoadList();
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
                
                $("#HidSelProperty").val("1");
            }

            //RightHeight
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            //column
            var column = [[
                    //{ field: 'TypeName', title: '物资类别', width: 90, align: 'left', sortable: true },
                    //{ field: 'Num', title: '物资编码', width: 130, align: 'left', sortable: true },
                    //{
                    //    field: 'Name', title: '物资名称', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                    //        return "<a class=\"HrefStyle\"  href='#' onclick=\"Detail('" + row.Id + "','edit');\">" + row.Name + "</a>";
                    //    }
                    //},
                    { field: 'Spell', title: '物资简拼',  align: 'left', sortable: true },
                    { field: 'Property', title: '物资属性',  align: 'left', sortable: true },
                    { field: 'UnitName', title: '物资单位',  align: 'center', sortable: true },
                    { field: 'Brand', title: '物资品牌', align: 'left', sortable: true },
                    { field: 'Specification', title: '规格型号',  align: 'left', sortable: true },
                    { field: 'ColorName', title: '物资颜色',  align: 'left', sortable: true },
                    { field: 'OriginPlace', title: '物资产地',  align: 'left', sortable: true },
                    { field: 'WarrantyPeriod', title: '质保期限', align: 'left', sortable: true },
                    {
                        field: 'IsVoid', title: '是否作废', align: 'left', sortable: true, formatter: function(value, row, index) {

                            if (row.IsVoid == "True")
                            {
                                return "是";
                            }
                            else
                            {
                                return "否";
                            }
                        }
                    }
            ]];

            var frozenColumns = [[
                    { field: '批量', title: '批量', checkbox: true },
                    { field: 'MaterialTypeName', title: '物资类别', width: 100, align: 'left', sortable: true },
                    { field: 'Num', title: '物资编码', width: 100, align: 'left', sortable: true },
                    {
                        field: 'Name', title: '物资名称', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                            return "<a class=\"HrefStyle\"  href='#' onclick=\"Detail('" + row.Id + "','edit');\">" + row.Name + "</a>";
                        }
                    }
            ]];

            //menu
         var toolbar = [
         {
             text: '新增',
             iconCls: 'icon-add',
             handler: function () {
                 Detail('', 'add');
             }
         }, '-',
         {
             text: '修改',
             iconCls: 'icon-edit',
             handler: function () {
                 var row = $("#TableContainer").datagrid("getSelected");
                 if (row == null) {
                     HDialog.Info("请选择编辑数据");
                     return;
                 }
                 Detail(row["Id"], 'edit');
             }
         }, '-',
             {
                 text: '删除',
                 iconCls: 'icon-cancel',
                 handler: function () {
                     var rows = $("#TableContainer").datagrid("getChecked");
                     if (rows == null || rows == "") {
                         HDialog.Info("请选择删除数据");
                         return false;
                     }
                     else {
                         var SelMaterialIDs = "";
                         $.each(rows, function (key, val) {
                            SelMaterialIDs += rows[key]["Id"] + ",";
                         });
                         SelMaterialIDs = SelMaterialIDs.substr(0, SelMaterialIDs.length - 1);
                         //alert(SelMaterialIDs);
                         DelRecord(SelMaterialIDs);
                     }
                     
                 }
             }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {                    
                    $("#SelProperty").val($("#HidSelProperty").val());
                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');
                }
            }, '-',
                {
                    text: '导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        window.open("MaterialInfoListExcel.aspx?random=" + Math.random() + GetParam());
                    }
            }
              ,'-',
                {
                    text: 'EXCEL导入',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        HDialog.Open('900', '500', "../Mt/MaterialInfoImportExcel.aspx", '选择', false, function callback(_Data) {
                            LoadList();
                        });
                    }
                }
            ];

            function GetParam() {
                var str = '';

                str += '&SelNum=' + $("#SelNum").val();
                str += '&SelName=' + $('#SelName').val();
                str += '&SelSpell=' + $('#SelSpell').val();
                str += '&SelProperty=' + $('#SelProperty').val();
                str += '&SelUnit=' + $('#SelUnit').val();
                str += '&SelBrand=' + $('#SelBrand').val().trim();
                str += '&SelSpecification=' + $('#SelSpecification').val();
                str += '&SelColor=' + $('#SelColor').val();
                str += '&SelOriginPlace=' + $('#SelOriginPlace').val().trim();
                str += '&HidTypeId=' + $('#HidTypeId').val().trim();
                str += '&SelWarrantyPeriod=' + $('#SelWarrantyPeriod').val().trim();
                str += '&HidSelProperty=' + $('#HidSelProperty').val().trim();
                return encodeURI(str);

            }

            //Del
            function DelRecord(Ids) {
                HDialog.Prompt("是否删除该项", function () {
                    $.tool.DataGet('MaterialInfoHandle', 'DelDictionary', 'MaterialID=' + Ids,
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

            //Add/Edit
            function Detail(RowId, OpType) {//Id、操作类型
                if ($("#HidTypeId").val()==""&&OpType=="add") {
                    HDialog.Info("未选择物资类型");
                    return;
                }
                var w = top.$(window).width()*0.8;
                var h = parent.$(window).height()*0.9;
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open(w, h, '../Mt/MaterialInfoEdit.aspx?&TypeId='+$("#HidTypeId").val()+'&Id=' + RowId + '&OpType=' + OpType, '物资档案', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }

            //LoadList
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns:frozenColumns,
                    fitColumns: false,
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
                        
                        $("#HidSelProperty").val($("#SelProperty").val());
                        param = $.JQForm.GetParam("MaterialInfoHandle", "GetInfoList", "TableContainer", param);
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
