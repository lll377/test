<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.Renting.Programming.BusinessPlaning.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-经营规划编辑页面</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
    <style type="text/css">
        #mainForm .form-control {
            height: 30px;
            padding-left: 4px;
            padding-right: 4px;
            font-size: 12px;
        }

        #mainForm .form-horizontal {
            padding: 0px;
        }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <input type="hidden" id="OpType" name="OpType" />
    <input type="hidden" name="ID" id="ID" />
    <form id="mainForm" class="form-horizontal" role="form" style="overflow-y: auto;">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">经营规划</legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">考核年度</label>
                <div class="col-sm-4 col-xs-4">
                    <%-- <div class="input-group date form_datetime" data-link-field="AssessmentYear">
                        <input class="form-control" type="text" value="" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                    </div>--%>
                    <span class="textbox" style="width: 100%;">
                        <input type="text" id="AssessmentYear" name="AssessmentYear" class="textbox-text" style="width: 100%;" readonly="readonly" runat="server" />
                    </span>
                </div>
                <label class="col-sm-2 col-xs-2 control-label">合约类型数量</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="TreatyPlaningTypeCount" name="TreatyPlaningTypeCount" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">房屋数量(套)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="RoomCount" name="RoomCount" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">建筑面积(平米)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="BuildAreaCount" name="BuildAreaCount" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">考核费项</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="AssessmentCostItemNames" name="AssessmentCostItemNames" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:true,width:'99%',height:'50px',
                            buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelAssessmentCostItemNames();},
                            icons:[{
                                iconCls:'icon-clear',
                                handler: function(e){
                                $(e.data.target).textbox('clear');
                                $('#AssessmentCostItemIDs').val('');
                                }}] " />
                    <input type="hidden" id="AssessmentCostItemIDs" name="AssessmentCostItemIDs" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">保底收入合计(元)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="GuaranteedIncomeTotal" name="GuaranteedIncomeTotal" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">目标收入合计(元)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="TargetIncomeTotal" name="TargetIncomeTotal" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'100%',disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">备注</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="Remark" name="Remark" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'100%',height:'50px',multiline:true" />
                </div>
            </div>
        </fieldset>
        <div style="height: 300px;">
            <div id="TableContainer" style="background-color: #cccccc; height: 100%; width: 100%;"></div>
        </div>
    </form>
    <div class="form-group" id="BtnDiv">
        <div class="col-sm-12 col-xs-12 fixed-tool-search" style="width: 100%;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:100" onclick="PageClose();">关闭返回</a>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            //设置高度
            let h = $(window).height();
            $('#mainForm').css("height", h - 60 + "px");

            //初始化时间空间
            $('#AssessmentYear').datetimepicker({
                language: "zh-CN",
                weekStart: 0, //一周从哪一天开始
                todayBtn: 0, // 今日按钮
                autoclose: 1, //选完时间自动关闭
                todayHighlight: 1,//当天时间高亮
                startView: 4,//从月视图开始，选天
                showMeridian: 0,//此选项将为日视图和小时视图启用子午线视图。
                //minuteStep: 2,//此数值被当做步进值用于构建小时视图。对于每个 minuteStep 都会生成一组预设时间（分钟）用于选择。
                maxView: 4, //日期时间选择器最高能展示的选择范围视图。 1为只能选择小时分钟
                minView: 4,
                format: "yyyy",
                linkFormat: "yyyy"
            });
            InitPage();
        });

        function InitPage() {
            let param = $.getUrlParam();
            if (!!param.ID) {
                $("#ID").val(param.ID);
            }
            if (!!param.OpType) {
                $("#OpType").val(param.OpType);
            }
            let OpType = $("#OpType").val();
            if (OpType == "edit") {
                InitData();
            } else {
                //初始化考核年度
                $('#AssessmentYear').datetimepicker("update", $.dateFormat(new Date(), 'yyyy'));
            }
            InitDataGrid();//加载列表
        }

        //多选本项目费项
        function SelAssessmentCostItemNames() {
            LayerDialog.OpenWin('700', '400', '/HM/M_Main/DialogNew/MultiCorpCommCostDlg.aspx', "选择费用项目", false, function callback(data) {
                if (isValueNull(data)) {
                    var varObjects = data.split("\t");
                    $('#AssessmentCostItemIDs').val(varObjects[0]);
                    $('#AssessmentCostItemNames').searchbox('setValue', varObjects[1]);
                }
            });
        }

        let column = [[
            { field: 'ck', checkbox: true },
            { field: 'TreatyPlaningType', title: '合约类型', width: 140, align: 'center' },
            { field: 'RoomCount', title: '房屋数量(套)', width: 100, align: 'center' },
            { field: 'BuildAreaCount', title: '建筑面积(平米)', width: 100, align: 'center' },
            { field: 'ChargeStandard', title: '计费标准', width: 100, align: 'center' },
            { field: 'ChargeUnit', title: '计费标准单位', width: 100, align: 'center' },
            { field: 'GuaranteedIncome', title: '保底收入(元)', width: 100, align: 'center' },
            { field: 'TargetIncome', title: '目标收入(元)', width: 100, align: 'center' }
        ]];

        let toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    var guid = new GUID();
                    TreatyPlaningEdit({ ID: guid.newGUID() });
                }
            }, '-',
            {
                text: '修改',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row) {
                        TreatyPlaningEdit(row);
                    } else {
                        $.messager.alert("温馨提示", '请选择一行需要编辑的数据!');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    let rows = $("#TableContainer").datagrid("getChecked");
                    if (rows.length > 0) {
                        rows.forEach((ItemRow) => {
                            let RowIndex = $("#TableContainer").datagrid("getRowIndex", ItemRow);
                            $("#TableContainer").datagrid("deleteRow", RowIndex);
                        });
                        CalcTreatyPlaning();
                    }
                    else {
                        $.messager.alert("温馨提示", '请勾选需要删除的数据!');
                    }
                }
            }
        ];

        //添加合约
        function TreatyPlaningEdit(row) {
            LayerDialog.OpenWin('600', '320', '/HM/M_Main/Renting/Programming/BusinessPlaning/AddTreatyPlaning.aspx?' + $.param(row), "合约类型编辑", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    let data = $.parseJSON(_Data);
                    let RowIndex = -1;
                    let DataGridRows = $("#TableContainer").datagrid("getRows");
                    if (DataGridRows) {
                        let Node = DataGridRows.filter(function (e) {
                            return e.TreatyPlaningID == data.TreatyPlaningID;
                        });
                        if (Node != null && Node.length > 0) {
                            RowIndex = $("#TableContainer").datagrid("getRowIndex", Node[0]);
                        }
                    }
                    //判断是新增还是修改
                    if (RowIndex < 0) {
                        $('#TableContainer').datagrid('insertRow', {
                            index: 0,
                            row: {
                                ID: data.ID,
                                TreatyPlaningType: data.TreatyPlaningType,
                                TreatyPlaningID: data.TreatyPlaningID,
                                RoomCount: data.RoomCount,
                                BuildAreaCount: data.BuildAreaCount,
                                ChargeStandard: data.ChargeStandard,
                                ChargeUnit: data.ChargeUnit,
                                GuaranteedIncome: data.GuaranteedIncome,
                                TargetIncome: data.TargetIncome
                            }
                        });
                    } else {
                        $('#TableContainer').datagrid('updateRow', {
                            index: RowIndex,
                            row: {
                                ID: data.ID,
                                TreatyPlaningType: data.TreatyPlaningType,
                                TreatyPlaningID: data.TreatyPlaningID,
                                RoomCount: data.RoomCount,
                                BuildAreaCount: data.BuildAreaCount,
                                ChargeStandard: data.ChargeStandard,
                                ChargeUnit: data.ChargeUnit,
                                GuaranteedIncome: data.GuaranteedIncome,
                                TargetIncome: data.TargetIncome
                            }
                        });
                    }
                    //计算合计信息
                    CalcTreatyPlaning();
                }
            });
        }

        //计算合约统计信息
        function CalcTreatyPlaning() {
            let DataGridRows = $('#TableContainer').datagrid("getRows");
            $('#TreatyPlaningTypeCount').textbox("setValue", DataGridRows.length);
            let RoomCount = 0;
            let BuildAreaCount = 0.00;
            let GuaranteedIncomeTotal = 0.00;
            let TargetIncomeTotal = 0.00
            DataGridRows.forEach((itemRow) => {
                if (isValueNull(itemRow.RoomCount)) {
                    RoomCount = RoomCount + parseInt(itemRow.RoomCount);
                }
                if (isValueNull(itemRow.BuildAreaCount)) {
                    BuildAreaCount = BuildAreaCount + parseFloat(itemRow.BuildAreaCount);
                }
                if (isValueNull(itemRow.GuaranteedIncome)) {
                    GuaranteedIncomeTotal = GuaranteedIncomeTotal + parseFloat(itemRow.GuaranteedIncome);
                }
                if (isValueNull(itemRow.TargetIncome)) {
                    TargetIncomeTotal = TargetIncomeTotal + parseFloat(itemRow.TargetIncome);
                }
            });
            $('#RoomCount').textbox("setValue", RoomCount);
            $('#BuildAreaCount').textbox("setValue", BuildAreaCount);
            $('#GuaranteedIncomeTotal').textbox("setValue", GuaranteedIncomeTotal);
            $('#TargetIncomeTotal').textbox("setValue", TargetIncomeTotal);
        }

        //加载列表
        function InitDataGrid() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
                fit: true,
                columns: column,
                rownumbers: true,
                checkOnSelect: true,
                selectOnCheck: false,
                singleSelect: true,
                border: true,
                pagination: false,
                width: "100%",
                toolbar: toolbar,
                onBeforeLoad: function (param) {
                    param.BusinessPlaningID = $('#ID').val();
                    param = $.getDataGridParam("Renting_BusinessPlaning", "GetTreatyPlaningList", param);
                },
                onLoadSuccess: function (data) {
                }
            });
        }
        //初始化页面数据
        function InitData() {
            $.dataPostJson("Renting_BusinessPlaning", 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    if (data) {
                        $('#mainForm').form('load', data);
                        //加载年度
                        $('#AssessmentYear').datetimepicker("update", new Date(data.AssessmentYear + '-01-01'));
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        //保存页面数据
        function Save() {
            if ($('#mainForm').form("validate")) {
                let Rows = $("#TableContainer").datagrid("getRows");
                if (Rows.length == 0) {
                    $.messager.alert('温馨提示', "请最少添加一条合约类型数据");
                    return;
                }
                //验证当前选择年度是否小于本年
                var date = new Date;
                var year = date.getFullYear();
                if ($('#OpType').val() == "add") {
                    if (parseInt($('#AssessmentYear').val()) < year) {
                        $.messager.alert('温馨提示', "请选择当年及以后年度");
                        return;
                    }
                }
                let param = $.getParam();
                param.TreatyPlaningResult = JSON.stringify(Rows);
                $.dataPostJson("Renting_BusinessPlaning", 'Save', param, true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            LayerDialog.Close("true");
                        } else { $.messager.alert('温馨提示', data.msg); }
                    },
                    function completeCallback() {

                    }, function errorCallback() {
                    });
            }
        }

        function PageClose() {
            LayerDialog.Close("");
        }
    </script>
</body>
</html>
