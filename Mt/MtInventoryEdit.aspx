<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MtInventoryEdit.aspx.cs" Inherits="M_Main.Mt.MtInventoryEdit" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>盘点单详情</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../Jscript/Guid.js"></script>
    <script type="text/javascript" src="../Jscript/Taxes.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            font-size: 12px;
            overflow-y: auto;
        }

        .panel-header {
            background: #f5f5f5 none repeat scroll 0 0;
        }

        .panel-header, .panel-body {
            border-color: #cccccc;
        }

        .TopHead {
            background-color: #f5f5f5;
            width: 100%;
            height: 40px;
            font-size: 12px;
            border-bottom: 1px solid #cccccc;
        }

            .TopHead input {
                float: left;
                border: none;
                border-right: 1px solid #cccccc;
                text-align: center;
                width: 84px;
                height: 40px;
                line-height: 40px;
                background-color: #f5f5f5;
                cursor: pointer;
            }

                .TopHead input:hover {
                    background-color: #ffffff;
                }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <%--盘点IDeas--%>
        <input type="hidden" id="Id" name="Id" runat="server" value="" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />


        <input type="hidden" id="StorageId" name="StorageId" runat="server" />
        <%--盘点仓库--%>
        <input type="hidden" value="" runat="server" id="WareHouseId" name="WareHouseId" />
        <%--盘点部门--%>
        <input type="hidden" id="DepCode" name="DepCode" runat="server" />
        <%--盘点人--%>
        <input type="hidden" value="" runat="server" id="Inventoryer" name="Inventoryer" />
        <%--制单人--%>
        <input type="hidden" value="" runat="server" id="Originator" name="Originator" />
        <%--审核人--%>
        <input type="hidden" value="" runat="server" id="Checker" name="Checker" />
        <%--盘点单号--%>
        <input type="hidden" value="" runat="server" id="InventoryNum" name="InventoryNum"  />
         <%--小数位数--%>
    <input type="hidden" id="DecimalNum" name="DecimalNum" runat="server" value="4" />
        <input type="hidden" id="MoneyNum" name="MoneyNum" runat="server" value="2" />
        <input type="hidden" id="SearchResult" name="SearchResult" value="" runat="server" />
        <input type="hidden" id="CalResult" name="CalResult" runat="server" value="" />

        <input type="hidden" id="Ture_Purchase_UpdatePrice" name="Ture_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="Ture_Purchase_Check_UpdatePrice" name="Ture_Purchase_Check_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_UpdatePrice" name="False_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_Check_UpdatePrice" name="False_Purchase_Check_UpdatePrice" runat="server" />

        <input type="hidden" id="PlanState" name="PlanState" value="未启动" runat="server" />
        <input type="hidden" id="GridData" runat="server" />
        <input type="hidden" id="BussId" name="BussId" runat="server" />

        <div class="TopHead">
            <input type="button" id="BtnClose" value="关闭" />
            <input id="btnRemind" type="submit" onserverclick="btnRemind_ServerClick" value="催办" runat="server" />
            <input id="btnJump" type="submit" onserverclick="btnJump_ServerClick" value="跳过" runat="server" />
            <input id="BtnDealInfo" style="display: none;" onserverclick="BtnDealInfo_ServerClick" value="会签意见" type="submit" runat="server" />
            <input id="BtnCompleteCheckLevel" style="display: none;" onserverclick="BtnCompleteCheckLevel_ServerClick" value="批转结束" type="submit" runat="server" />
            <input id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
            <input id="BtnReturnPrevious" type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
            <input id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
            <input id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
            <input id="BtnIsPrint" type="button" value="打印" runat="server" />
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
        </div>
        <div style="height: 4px;"></div>
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">盘点单号：
                </td>
                <td class="DialogTdContent">
                    <%--<input type="text" class="easyui-validatebox" data-options="required:true" id="InventoryNumName" readonly name="InventoryNumName" runat="server" />--%>
                    <label  runat="server" id="InventoryNumName" ></label>
                </td>
                <td class="DialogTdTitle"></td>
                <td class="DialogTdContent"></td>
                <td class="DialogTdTitle"></td>
                <td class="DialogTdContent"></td>
                <td class="DialogTdTitle"></td>
                <td class="DialogTdContent"></td>
            </tr>
            <tr>
                <td class="DialogTdTitle">盘点仓库：
                </td>
                <td class="DialogTdContent">

                    <input id="WareHouseName" name="WareHouseName" onchange="LoadDetailView()" value="" class="easyui-validatebox" data-options="required:true" runat="server" />
                </td>
                <td class="DialogTdTitle">盘点类型：
                </td>
                <td class="DialogTdContent">
                    <select id="TypeCode" name="TypeCode" runat="server">
                        <option value="日盘" selected="selected">日 盘</option>
                        <option value="月盘" >月 盘</option>
                        <option value="季盘" >季 盘</option>
                    </select>
                </td>
                <td class="DialogTdTitle">盘点日期：
                </td>
                <td class="DialogTdContent">
                    <input id="InventoryDate" name="InventoryDate" class="easyui-validatebox" data-options="required:true" onclick="ClickData()" onchange="LoadDetailView()" runat="server" />
                </td>
                <td class="DialogTdTitle">盘点部门：
                </td>
                <td class="DialogTdContent">
                    <input id="DepCodeName" name="DepCodeName" value="" class="easyui-validatebox" runat="server" data-options="required:true" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">盘&nbsp;点&nbsp;人：
                </td>
                <td class="DialogTdContent">
                    <input id="InventoryerName" name="InventoryerName" readonly class="easyui-validatebox" value="" data-options="required:true"  runat="server" />
                </td>
                <td class="DialogTdTitle">监&nbsp;盘&nbsp;人：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox"  data-options="required:true" id="Prisoner" name="Prisoner" runat="server" />
                </td>
                <td class="DialogTdTitle">制&nbsp;单&nbsp;人：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" readonly data-options="required:true" id="OriginatorName" name="OriginatorName" runat="server" />
                </td>
                 <td class="DialogTdTitle">盘点单状态
                </td>
                <td class="DialogTdContent">
                    <input type="text" readonly id="State" name="State" value="未启动" runat="server" />
                </td>
            </tr>
            <tr>               
                <td class="DialogTdTitle">备&nbsp;&nbsp;注：
                </td>
                <td class="DialogTdMemoContent" colspan="7">
                    <input type="text" class="easyui-validatebox" id="Memo" name="Memo" runat="server" />
                </td>
            </tr>
        </table>
        <div id="Container" style="border: 1px solid #cccccc; height: auto; margin: 0px auto;">
            <div id="TableContainer" style="height: auto;"></div>
        </div>
        <div id="OAFlow" style="height: auto; margin: 0px auto;">
            <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
            <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
        </div>

        <script type="text/javascript">
            //计算小数位数
            var decimalPos = Number($("#DecimalNum").val());
            var moneyPos = Number($("#MoneyNum").val());
            //编辑的行号
            var editIndex = undefined;

            function InitPurchaseTableHeight() {
                var w = $(window).width();
                $("#Container").css("width", (w - 8) + "px");
                $("#OAFlow").css("width", (w - 8) + "px");
                $(".DialogTable").css("width", (w - 8) + "px");
            }
            InitPurchaseTableHeight();

            column = [[
                { field: 'Id', title: 'Id', width: 50, align: 'center', sortable: true, hidden: true },
                    { field: 'MaterialId', title: '物资ID', width: 50, align: 'center', sortable: true, hidden: true },
                    { field: 'Num', title: '物资编号', width: 50, align: 'center', sortable: true },
                    { field: 'MaterialName', title: '物资名称', width: 50, align: 'center', sortable: true },                    
                    { field: 'Property', title: '物资属性', width: 50, align: 'center', sortable: true },                    
                    { field: 'UnitName', title: '单位', width: 50, align: 'center', sortable: true },
                    { field: 'Brand', title: '品牌', width: 50, align: 'center', sortable: true },
                    { field: 'Specification', title: '规格型号', width: 50, align: 'center', sortable: true },
                    { field: 'ColorName', title: '颜色', width: 50, align: 'center', sortable: true },

                    {
                        field: 'BookQuantity', title: '账面数量', width: 50, align: 'center', sortable: true, formatter: function (value, row, index) {
                            return ToDecimal(row.BookQuantity, 2);
                        }
                    },
                    {
                        field: 'RealQuantity', title: '实盘数量', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                            return ToDecimal(row.RealQuantity, 2);
                        }
                    },
                    { field: 'Overage', title: '盘盈金额', align: 'center', width: 50, sortable: true, hidden: true },
                    { field: 'Loss', title: '盘亏金额', align: 'center', width: 50, sortable: true, hidden: true },
                    {
                        field: 'IsCompensate', title: '是否赔付', align: 'center', width: 50, sortable: true
                       
                    },
                    {
                        field: 'Compensater', title: '赔偿人', align: 'center', width: 50, sortable: true
                    },
                    {
                        field: 'DepositPlace', title: '存放位置', width: 50, align: 'left', sortable: true
                    },
                    {
                        field:'Memo',title:'备注',align:'center',width:50,sortable:true
                    }
            ]];
            var toolbar;
            var toolbar_Start = [
                 {
                     text: '新增',
                     iconCls: 'icon-add',
                     handler: function () {
                         MaterialChiose();
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

                         HDialog.Prompt("是否删除该项", function () {
                             $.tool.DataGet('MtInventory', 'DelDetail', 'Id=' + row["Id"],
                                 function Init() {
                                 },
                                 function callback(_Data) {
                                     var index = $("#TableContainer").datagrid("getRowIndex", row);
                                     $('#TableContainer').datagrid('deleteRow', index);
                                 },
                                 function completeCallback() {
                                 },
                                 function errorCallback() {
                                 });
                         });
                        
                     }
                 }
                 , '-',
                 {
                     text: '提交',
                     iconCls: 'icon-save',
                     handler: function () {
                         UpdateDateAll();
                     }
                 }
            ];
            var toolbar_Ing = [
             {
                 text: '提交',
                 iconCls: 'icon-save',
                 handler: function () {
                     UpdateDateAll();
                 }
             }
            ];
            if ($("#State").val() == "未启动") {
                toolbar = toolbar_Start;
            }
            else {
                if ($("#State").val() == "审核中") {
                    toolbar = toolbar_Ing;
                }
                if ($("#State").val() == "已审核") {
                    toolbar = "";
                }
            }
         

            function MaterialChiose() {
                if ($("#WareHouseId").val() == "") {
                    HDialog.Info("请选择盘点仓库");
                    return;
                }
                if ($("#DepCodeName").val()=="") {
                    HDialog.Info("请选择部门");
                    return;
                }
                if ($("#Prisoner").val()=="") {
                    HDialog.Info("请选择监盘人");
                    return;
                }
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../Mt/InventoryDialog/InventorySelFrame.aspx?WareHouseId=' + $("#WareHouseId").val(), '选择物资', true, function callback(_Data) {
                    
                        //将选择的物资添加到行
                    var rows = JSON.parse(_Data);                    
                        for (var i = 0; i < rows.length; i++) {
                           
                            if (CheckMaterial(rows[i]["Id"])) {
                                AddRows(rows[i],"");
                            }                            
                        }
                        //按照规则计算每一行的值
                        Calculation();
                    });               
            }

            //检查重复的物资
            function CheckMaterial(materId) {
                var bl = true;
                var _Data = $('#TableContainer').datagrid('getData');                
                for (var i = 0; i < _Data.rows.length; i++) {                    
                    if (materId == _Data.rows[i]["MaterialId"]) {
                        bl = false;
                    }
                }                
                return bl;
            }


            //选择物资后增加行
            function AddRows(row,type) {
                var _Data = $('#TableContainer').datagrid('getData');
                var row_index = _Data.rows.length;
                var detailIdStr = Guid();
                if (type != "") {//初始加载
                    $('#TableContainer').datagrid('insertRow', {
                        index: row_index,
                        row: {
                            Id: detailIdStr,
                            InventoryId: $("#Id").val(),
                            MaterialId: row.Id,
                            BookQuantity: row.Quantity,//区别在此
                            RealQuantity: row.Quantity,//区别在此
                            Overage: "0.0",
                            Loss: "0.0",
                            IsCompensate: "否",
                            Compensater: "",
                            InventoryNum: "",
                            MaterialName: row.Name,
                            Num: row.Num,
                            Property: row.Property,
                            UnitName: row.UnitName,
                            Brand: row.Brand,
                            Specification: row.Specification,
                            ColorName: row.ColorName,
                            DepositPlace:"",
                            Memo:""
                        }
                    });
                } else {//选择物资后加载
                    $('#TableContainer').datagrid('insertRow', {
                        index: row_index,
                        row: {
                            Id: detailIdStr,
                            InventoryId: $("#Id").val(),
                            MaterialId: row.Id,
                            BookQuantity: "",
                            RealQuantity: "0.00",
                            Overage: "0.0",
                            Loss: "0.0",
                            IsCompensate: "否",
                            Compensater: "",
                            InventoryNum: "",
                            MaterialName: row.Name,
                            Num:row.Num,
                            Property: row.Property,
                            UnitName: row.UnitName,
                            Brand: row.Brand,
                            Specification: row.Specification,
                            ColorName: row.ColorName,
                            DepositPlace:"",
                            Memo:""
                        }
                    });
                }
            }
           //批量写入
            function Calculation() {
                $("#CalResult").val("");
                var rows = $("#TableContainer").datagrid("getRows");
                $("#CalResult").val(JSON.stringify(rows));
                
                   // $("#OpType").val("add");                
                
                    $.tool.DataPost('MtInventory', 'Update', $("#frmForm").serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data.substring(0, 5) == "false") {
                            HDialog.Info(_Data.substring(6));

                        } else {
                            //计算完成
                            //重新更新列表里面的数据
                            //alert(JSON.stringify(_Data));
                            var Obj = JSON.parse(_Data);
                            for (var i = 0; i < Obj.length; i++) {
                                var index = $('#TableContainer').datagrid("getRowIndex", Obj[i].Id);

                                var rowData = $('#TableContainer').datagrid('getData').rows[index];
                                
                                $('#TableContainer').datagrid('endEdit', index);
                                $("#Id").val(Obj[i].InventoryId);
                                if (Obj[i].RealQuantity == 0) {//如果是新增加的数据
                                   
                                    $('#TableContainer').datagrid('updateRow',
                                    {
                                        index: index,
                                        row: {
                                            BookQuantity: Obj[i].BookQuantity,
                                            RealQuantity: Obj[i].BookQuantity,
                                            IsCompensate: Obj[i].IsCompensate,
                                            Compensater: Obj[i].Compensater,
                                            DepositPlace: Obj[i].DepositPlace,
                                            Memo:Obj[i].Memo
                                        }
                                    });
                                }                                
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }


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
            
           
            //初始化加载数据
            var Rows = JSON.parse($("#SearchResult").val());
            
            function LoadList(){
                $("#TableContainer").datagrid({
                    idField: "Id",
                    nowrap: true,
                    pageSize: 50,
                    pageList: [50, 150, 300],
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: false,
                    rownumbers: true,
                    border: false,
                    showFooter: true,
                    striped: true,
                    toolbar: toolbar,
                    remoteSort: false,                   
                    onLoadSuccess: function () {
                        if ($("#State").val() != "未启动") {//只有未提交审核时才能操作【是否赔偿】
                            $('#TableContainer input:checkbox').each(function (index, el) {
                                el.disabled = false;
                            });
                        }
                    },
                    onClickRow: function (rowIndex, rowData) {
                        if ($("#State").val() == "已审核") return;
                        $("#TableContainer").datagrid('acceptChanges', editIndex);
                        //更改当前行号
                        editIndex = rowIndex;
                        //去除编辑器                    
                        $("#TableContainer").datagrid('removeEditor', 'RealQuantity');
                        $("#TableContainer").datagrid('removeEditor', 'Compensater'); 
                        $("#TableContainer").datagrid('removeEditor', 'IsCompensate');
                        $("#TableContainer").datagrid('removeEditor', 'Memo');
                        //发起时允许编辑,审核中不允许编辑
                        if ($("#State").val() == "未启动") {
                            //实际数量可以编辑
                            $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                                {
                                    field: 'RealQuantity',
                                    editor: {
                                        type: 'numberbox',
                                        options: {
                                            precision: 2
                                        }
                                    }
                                },
                                {
                                    field: 'Compensater',
                                    editor: {
                                        type: 'text',
                                        options: {
                                            class: "easyui-validatebox"
                                        }
                                    }
                                },
                                {
                                    field: 'IsCompensate',
                                    editor: {
                                        type: 'combobox',
                                        options: {
                                            valueField: 'CompensateValue',
                                            textField: 'Compensate',
                                            method: 'get',
                                            url: 'IsCompensate.json',
                                            required: true,
                                            panelHeight: 'auto'
                                        }
                                    }
                                },
                                {
                                    field: 'Memo',
                                    editor: {
                                        type: 'text',
                                        options: {
                                            class: "easyui-validatebox"
                                        }
                                    }
                                }
                            ]);                           
                        }
                        //开始编辑
                        $("#TableContainer").datagrid('beginEdit', rowIndex);
                    }                   
                });
            }


            function UpdateDateAll()
            {
                $("#CalResult").val("");
                $("#TableContainer").datagrid('acceptChanges', editIndex);
                var rows = $("#TableContainer").datagrid("getRows");
                var bl = true;
                for (var i = 0; i < rows.length; i++) {
                    if (rows[i].RealQuantity < 0.0000)
                    {
                        HDialog.Info("实盘数量不能为空");
                        bl= false;
                    }
                    if (rows[i].IsCompensate=="是"&& rows[i].Compensater=="") {
                        HDialog.Info("赔偿人不能为空");
                        bl= false;
                    }
                }
                
                $("#CalResult").val(JSON.stringify(rows));
                return bl;
            }

            //加载数据
            LoadList();
            $('#TableContainer').datagrid('loadData', Rows);

            //获取盘点仓库
            $("#WareHouseName").click(function (e) {
                HDialog.Open('500', '500', '../DialogNew/SelWareHouse.aspx', '选择盘点仓库', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#WareHouseId").val(arrRet[0]);
                        $("#WareHouseName").val(arrRet[1]);
                        LoadDetailView();
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

            //盘点人、制单人、审核人
            function SelUserSer(str) {
                HDialog.Open('740', '450', '../DialogNew/SelUser.aspx', '选择人员', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        $("#" + str).val(varObjects.UserCode);
                        $("#" + str + "Name").val(varObjects.UserName);
                    }
                });
            }


            $("#BtnClose").click(function (e) {
                HDialog.Close('1');
            });
            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                if (!UpdateDateAll()) {
                    return false;
                }
                    if (IsSubmitFlag == false) {
                        HDialog.Info("10秒内不要重复点击");
                        return false;
                    }
                    IsSubmitFlag = false;
                    setTimeout('IsSubmitFlag=true', 10000);
                    if (checkSubmit() == false) return false;
                    var isValid = $("#frmForm").form('validate');
                    if (isValid == true) {
                        if (document.all.WorkFlowManage_WorkFlowType.value == "") {
                            HDialog.Info("请选择审批流程");
                            return false;
                        }
                        var trlength = $("#WorkFlowNodeList tr").length;
                        if (trlength < 2) {
                            HDialog.Info("请给该流程设置处理人");
                            return false;
                        }
                        var rows = $("#TableContainer").datagrid("getRows");
                        if (JSON.stringify(rows).length <= 2) {
                            HDialog.Info("请给选择要盘点的物资");
                            return false;
                        }
                        //if ($("#InfoId").val()=="") {
                        //    HDialog.Info("请给该流程设置处理人");
                        //    return false;
                        //}

                        //将列表数据保存到文本框中,提交
                        $("#GridData").val(JSON.stringify(rows));
                        return true;
                    }
                    else {
                        return false;
                    }
               
            });


            //采购申请单双击选择流程，如果有默认的绑定流程，则自动加载
            function SelWorkFlowType() {
               
                if ($("#WareHouseId").val() == "") {
                    HDialog.Info("请选择入库仓库");
                    return;
                }
                if ($("#State").val() == "未启动") {

                    var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=05&&random=" + Math.random();
                                HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                                    if (_Data != '') {
                                        var obj = JSON.parse(_Data);
                                        LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                                        document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                                        document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                                    }
                                });
                }
            }

            if ($("#State").val() == "已审核") {
                $("#BtnSaveStartWorkFlow").css("display", "none");
                $("#BtnSave").css("display", "none");
                $("input[type='text']").prop("disabled", "true");
                $("SELECT").prop("disabled", "true");
                $("BUTTON").prop("disabled", "true");
            }

            //打印
            $("#BtnIsPrint").click(function (e) {
                if ($("#OpType").val() == "add") return;
                var InstanceId = document.all.WorkFlowManage_InfoId.value;
                var Attribute = "<Attribute><Id>" + $("#Id").val() + "</Id><InstanceId>" + InstanceId + "</InstanceId></Attribute>";
                $.tool.Print("Inventory", Attribute);
            });
        

            //自动加载物资
            function LoadDetailView() {
                
                if ($("#WareHouseId").val() == "") {
                    HDialog.Info("请选择盘点仓库");
                    return;
                }
                if ($("#InventoryDate").val()=="") {
                    HDialog.Info("请选择盘点日期");
                    return;
                }

                $.tool.DataPost('MtInventory', 'GetMaterialList', $("#frmForm").serialize(),
                   function Init() {
                   },
                   function callback(_Data) {
                       //重新更新列表里面的数据
                       var Obj = JSON.parse(_Data);
                       if (Obj.Result == "True") {
                           for (var i = 0; i < Obj.RetDataSet.length; i++) {
                               if (CheckMaterial(Obj.RetDataSet[i]["Id"])) {
                                   AddRows(Obj.RetDataSet[i], "1");
                               }
                           }
                       } else {
                           $('#TableContainer').datagrid('loadData',[]);
                       }
                   },
                   function completeCallback() {
                   },
                   function errorCallback() {
                   });


                
            }

            $("#TypeCode").change(function () {
                LoadDetailView();
            });
           
            function ClickData() {
                if ($("#TypeCode").val()=="日盘") {
                    WdatePicker();
                }
                if ($("#TypeCode").val()=="月盘") {
                    WdatePicker({ dateFmt: 'yyyy-MM', isShowToday: false, isShowClear: false });
                }
                 if ($("#TypeCode").val() == "季度") {
                    WdatePicker({ dateFmt: 'yyyy-MM', isShowToday: false, isShowClear: false });
                }
            }


        </script>
    </form>
</body>
</html>
