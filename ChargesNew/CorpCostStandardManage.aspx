<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorpCostStandardManage.aspx.cs" Inherits="M_Main.ChargesNew.CorpCostStandardManage" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framedialog_fourcol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js"></script>
   
    <style type="text/css">

        .panel-header {
            background: #f5f5f5 none repeat scroll 0 0;
        }
        .panel-header, .panel-body {
            border-color: #cccccc;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
    <table class="DialogTable">
        <tr>
            <td class="DialogTdTitle">
                费用项目
            </td>
            <td class="DialogTdContent" colspan="3">
                <span id="CostName" runat="server"></span>
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                标准名称
            </td>
            <td class="DialogTdContent">
                <input type="text" class="easyui-validatebox" data-options="required:true"  id="StanName" name="StanName" runat="server" />
            </td>
            <td class="DialogTdTitle">
                标准编号
            </td>
            <td class="DialogTdContent">
                <input type="text" class="easyui-validatebox" data-options="required:true"  id="StanSign" name="StanSign" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                标准说明</td>
            <td class="DialogTdContent">
                <input type="text" class="easyui-validatebox"  id="StanExplain" name="StanExplain" runat="server" />
            </td>
            <td class="DialogTdTitle">
                允许项目修改单价
            </td>
            <td class="DialogTdContent">
                <select id="IsCanUpdate" name="IsCanUpdate" runat="server" class="easyui-validatebox">
                    <option value="0">否</option>
                    <option value="1">是</option>
                </select>
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                计算方式
            </td>
            <td class="DialogTdContent">
                <select id="StanFormula" name="StanFormula" runat="server" class="easyui-validatebox" data-options="required:true"></select>
            </td>
            <td class="DialogTdTitle">
                通用收费标准
            </td>
            <td class="DialogTdContent">
                <input type="text" class="easyui-validatebox" data-options="prompt:'请输入大于等于0的数字',required:true,validType:'positiveint'" id="StanAmount" name="StanAmount" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                计费周期
            </td>
            <td class="DialogTdContent">
                <select id="ChargeCycle" name="ChargeCycle" runat="server"><option selected></option></select>
            </td>
            <td class="DialogTdTitle">
                数量取整方式
            </td>
            <td class="DialogTdContent"><select id="AmountRounded" name="AmountRounded" runat="server"><option selected></option></select>
                <select id="EndRounded" name="EndRounded" runat="server">
                    <option value=""></option>
                    <option value="12.00">按年收费取整到元,调整末期费用</option>
                </select>
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                合同违约金延期
            </td>
            <td class="DialogTdContent">
                
                <div style="height:30px;"><input id="DelinType1" name="DelinType" value="0" CHECKED type="radio" runat="server">
                按 <input  id="DelinDelay"  name="DelinDelay" style="width:28px;"  onblur = 'valuevalidatebox(this.id)'  runat="server" /> 天之后
                </div>
                <div><input id="DelinType2" name="DelinType" value="1" type="radio" runat="server"> 推迟 <input id="DelinMonth" class="Control_ItemInput" style="WIDTH: 28px;"  onblur = 'valuevalidatebox(this.id)'  name="DelinMonth" runat="server"> 月按 <INPUT style="WIDTH: 28px;" id="DelinDay"  onblur = 'valuevalidatebox(this.id)' class="Control_ItemInput"
								name="DelinDay" runat="server"> 号开始(日期超过的,从次月计算)
                </div>

            </td>
            <td class="DialogTdTitle">
                合同违约金比率
            </td>
            <td class="DialogTdContent">
                <input type="text" class="easyui-validatebox" value="0" data-options="prompt:'请输入大于等于0的数字',required:true,validType:'positiveint'"
                    id="DelinRates" name="DelinRates" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                启用日期
            </td>
            <td class="DialogTdDateContent">
                <input type="text" class="Wdate" style="width: 163px;" onclick="WdatePicker({dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" id="StanStartDate" name="StanStartDate" runat="server" />
            </td>
            <td class="DialogTdTitle">
                停用日期
            </td>
            <td class="DialogTdDateContent">
                <input type="text" class="Wdate" style="width: 163px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" id="StanEndDate" name="StanEndDate" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                标准系数
            </td>
            <td class="DialogTdContent">
                <input type="text" class="easyui-validatebox"  data-options="prompt:'请输入大于等于0的数字',required:true,validType:'positiveint'"
                    id="Modulus" name="Modulus" value="1" runat="server" />
            </td>
            <td class="DialogTdTitle">
                是否按条件计算
            </td>
            <td class="DialogTdContent">
                <select id="IsCondition" name="IsCondition" runat="server" onchange="javascript:showCondition();"><option selected></option></select></td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                计算条件
            </td>
            <td class="DialogTdContent">
                <select id="ConditionField" name="ConditionField" runat="server">
													<option selected></option>
												</select>
            </td>
            <td class="DialogTdTitle">
                按条件计算方式
            </td>
            <td class="DialogTdContent">
                <select id="IsStanRange" name="IsStanRange" runat="server"><option selected></option></select>
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                计费条件列表<br /></td>
            <td class="DialogTdContent_2Col" colspan="3" id="Tbl">
                <div id="Container" style="border:1px solid #cccccc;height:170px;">
                    <div id="TableContainer"></div>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align:center;padding-top:10px;">
                <input type="button" class="button" value="保存" id="BtnSave" runat="server" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
            </td>
        </tr>
    </table>

        <input id="OpType"  type="hidden" name="OpType" runat="server" />
        <input id="CorpStanID" type="hidden" name="CorpStanID" runat="server" />
        <input id="CostCode" type="hidden" name="CostCode" runat="server" />
        <input id="CorpCostID" type="hidden" name="CorpCostID" runat="server" />
        <input id="StanCondition" type="hidden" name="StanCondition" runat="server" />
        <script  src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function onChargeCycle() {
                var opt = $("#ChargeCycle").val();

                if (opt == "12") {
                    $("#EndRounded").css("display", "block");
                }
                else {
                    $("#EndRounded").css("display", "none");
                    $("#EndRounded").val("");
                }
            }

            $("#ChargeCycle").change(function () {
                onChargeCycle();
            });

            function valuevalidatebox(obj) {

                if (isNaN($('#' + obj).val())) {
                    HDialog.Info("请输入数字");
                    $('#' + obj).val('');
                    return false;
                }
                else {
                    if (parseFloat($('#' + obj).val()) < 0) {
                        HDialog.Info("请输入大于等于0的数字");
                        $('#' + obj).val('');
                        return false;
                    }
                }
            }

            function InitSize() {
                var w = $("#Tbl").width();
                var pw = w * 0.94;
                $("#Container").css("width", pw + "px");

                onChargeCycle();
            }
            InitSize();

            $("#BtnSave").click(function () {
                var row = $("#TableContainer").datagrid("getRows");
                var strStanCondition = JSON.stringify(row);
                $("#StanCondition").val(strStanCondition);

                $.tool.DataPostChk('frmForm', 'CostStan', 'Save', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data.substring(0,5) == "false") {
                            
                            HDialog.Info(_Data.substring(6));
                        }
                        else {
                            
                            HDialog.Close('1');
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            });

            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });
            
            column = [[
                { field: 'StartCondition', title: '开始条件大于等于', align: 'left', sortable: false },
                { field: 'EndCondition', title: '结束条件小于', align: 'left', sortable: false },
                { field: 'CondStanAmount', title: '收费标准(元)', align: 'left', sortable: false },
                { field: 'IsFix', title: '标准性质', align: 'left', sortable: false, hidden: true },
                { field: 'IsFixName', title: '标准性质', align: 'left', sortable: false }
            ]];

            var toolbar = [
             {
                 text: '新增',
                 iconCls: 'icon-add',
                 handler: function () {
                     HDialog.Open('600', '250', '../ChargesNew/CorpCostStandardCondition.aspx', '标准条件详细', true, function callback(_Data) {
                         var Obj = JSON.parse(_Data);
                         $('#TableContainer').datagrid('insertRow', {
                             index: 0,
                             row: {IID:0,CorpStanID:$("#CorpStanID").val(),StartCondition: Obj.StartCondition, EndCondition: Obj.EndCondition, CondStanAmount: Obj.CondStanAmount, IsFixName: Obj.IsFixName,IsFix:Obj.IsFix,IsDelete:0}
                         });
                     });
                 }
             }, '-',
             {
                 text: '删除',
                 iconCls: 'icon-cancel',
                 handler: function () {
                     var row = $("#TableContainer").datagrid("getSelected");
                     var index = $("#TableContainer").datagrid("getRowIndex", row);
                     $('#TableContainer').datagrid('deleteRow', index);
                 }
             }
            ];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CostStan&Command=ConditionListStandard&CorpStanID=' + $("#CorpStanID").val(),
                    method: "get",
                    nowrap: true,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: false,
                    height:170,
                    border:false,
                    toolbar: toolbar,
                    sortOrder: "asc"
                });
            }
            LoadList();

        </script>

    </form>
</body>
</html>