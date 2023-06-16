<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisitPlanQuestionnaireDetail.aspx.cs" Inherits="M_Main.Visit.VisitPlanQuestionnaireDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>拜访计划问题详情</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <link href="../css/basebootstrap.css" rel="stylesheet" />

    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>

    <style type="text/css">
        .divPrint {
            width: 100%;
            text-align: right;
            padding-right: 46px;
            height: 40px;
        }

        .bootstrap_table tr td.title {
            width: 10%;
            text-align: center;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            width: 40%;
            text-align: left;
        }
    </style>
</head>
<body>
    <input type="hidden" id="OpType" name="OpType" runat="server" />
    <input type="hidden" id="ID" name="ID" runat="server" />
    <input type="hidden" id="IsScore" name="IsScore" runat="server" />
    <input type="hidden" id="VisitCategoryID" name="VisitCategoryID" runat="server" />
    <input type="hidden" id="QuestionnaireCategoryID" name="QuestionnaireCategoryID" runat="server" />
    <input type="hidden" id="OptionJson" name="OptionJson" runat="server" />
    <input type="hidden" id="PlanID" name="PlanID" runat="server" />

    <form id="mainForm" runat="server">
        <div style="padding: 5px;">
            <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>问题类别</span></td>
                    <td class="text">
                        <input id="IssueType" name="IssueType" class="easyui-combobox" />
                    </td>
                    <td class="title"><span>问题名称</span></td>
                    <td class="text">
                        <input id="IssueName" name="IssueName" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'260px'" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>问题属性</span></td>
                    <td class="text">
                        <input class="easyui-radiobutton" id="IssuePropertyYes" name="IssueProperty" data-options="value:'单选题',label:'单选题',labelWidth:45,labelAlign:'right',checked:true" />
                        <input class="easyui-radiobutton" id="IssuePropertyDX" name="IssueProperty" data-options="value:'多选题',label:'多选题',labelWidth:45,labelAlign:'right'" />
                        <input class="easyui-radiobutton" id="IssuePropertyNo" name="IssueProperty" data-options="value:'问答题',label:'问答题',labelWidth:45,labelAlign:'right'" />
                    </td>
                    <td class="title"><span>问题标准分</span></td>
                    <td class="text">
                        <input id="IssueStandardScore" name="IssueStandardScore" class="easyui-numberbox" data-options="required:true,editable:true,tipPosition:'bottom',min:0,max:1000,precision:2,value:'0'" />
                    </td>

                </tr>
                <tr class="choicequestion">
                    <td colspan="4" style="width: 300px; height: 250px;">
                        <table id="dg_VisitOptionSet" border="0" cellspacing="0" style="overflow-x: auto; overflow-y: auto; width: 100%; height: 100%;" cellpadding="0">
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>项目是否必选</span></td>
                    <td class="text">
                        <input class="easyui-radiobutton" id="IsProjectRequiredYes" name="IsProjectRequired" data-options="value:'1',label:'是',labelWidth:42,labelAlign:'right'" />
                        <input class="easyui-radiobutton" id="IsProjectRequiredNo" name="IsProjectRequired" data-options="value:'0',label:'否',labelWidth:60,labelAlign:'right',checked:true" />
                    </td>
                    <td class="title"><span>排序序号</span></td>
                    <td class="text">
                        <input id="Sort" name="Sort" class="easyui-numberbox" data-options="tipPosition:'bottom',min:0,value:'0'" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>备注</span></td>
                    <td class="text" colspan="3">
                        <input id="Remark" name="Remark" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:true,width:'660',height:'40px'" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>
    </form>
    <script type="text/javascript">
        function InitControl() {
            $('#IssueType').combobox({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: 'post',
                queryParams: {
                    "Method": "DataPost",
                    "Class": "Visit",
                    "Command": "GetListDataTableDictionary",
                    "DType": "问题类别",
                },
                valueField: 'ID',
                textField: 'Name',
                required: true,
                editable: false,
                tipPosition: 'bottom',
                width: '260px',
                panelHeight: 194,
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                    }
                }]
            });

            $('#Option_3,#Option_4,#Option_5').textbox({
                required: false,
                tipPosition: 'bottom',
                width: '300px',
                onChange: function (newValue, oldValue) {
                    ChangeOption();
                }
            });

            $('#OptionStandardScore_1,#OptionStandardScore_2,#OptionStandardScore_3,#OptionStandardScore_4,#OptionStandardScore_5').numberbox({
                required: true,
                editable: true,
                tipPosition: 'bottom',
                min: 0,
                max: 1000,
                precision: 2,
                onChange: function (newValue, oldValue) {
                    GetMaxScore();
                }
            });
            $("#IssuePropertyYes").radiobutton({
                onChange: function (checked) {
                    ChangeIssueProperty(checked);
                }
            });
            $("#IssuePropertyDX").radiobutton({
                onChange: function (checked) {
                    ChangeIssueProperty(checked);
                }
            });

            $('#Sort').numberbox('textbox').attr('maxlength', 6);
        }

        function ChangeOption() {
            if ($('#OpType').val() == "edit") {
                toolbarShow = [];
            } else {
                toolbarShow = toolbar;
            }
            if ($("#IsScore").val() == "1") {
                columnShow = column[0];

            } else {
                columnShow = column[1];
            }

            InitDataGrid();
            return;
            //var optionValue = "";
            //for (var i = 1; i <= 5; i++) {
            //    $("#Option_" + i).textbox("enableValidation").textbox("enable");
            //    $("#OptionStandardScore_" + i).numberbox("enableValidation").numberbox("enable");
            //    if (i > 2) {
            //        optionValue = $('#Option_' + i).textbox("getValue");
            //        console.log("optionValue:" + optionValue);
            //        if (!isValueNull(optionValue)) {
            //            $('#OptionStandardScore_' + i).numberbox("disableValidation").numberbox("disable").numberbox("clear");
            //        }
            //    }
            //}
            ////不评分的时候 禁用选项标准分 
            //if ($("#IsScore").val() == "0") {
            //    $("#OptionStandardScore_1").numberbox("disableValidation").numberbox("disable");
            //    $("#OptionStandardScore_2").numberbox("disableValidation").numberbox("disable");
            //    $("#OptionStandardScore_3").numberbox("disableValidation").numberbox("disable");
            //    $("#OptionStandardScore_4").numberbox("disableValidation").numberbox("disable");
            //    $("#OptionStandardScore_5").numberbox("disableValidation").numberbox("disable");
            //    $("#IssueStandardScore").numberbox("disableValidation").numberbox("disable");
            //}
        }
        function ChangeIssueProperty(checked) {
            if (checked) {
                $('#IssueStandardScore').numberbox("disable").numberbox("clear");
                $(".choicequestion").show();
                ChangeOption();
            } else {
                $('#IssueStandardScore').numberbox("enable").numberbox("clear");
                $(".choicequestion").hide();
                if ($("#IsScore").val() == "0") {
                    $("#IssueStandardScore").numberbox("disableValidation").numberbox("disable");
                } else {
                    $("#IssueStandardScore").numberbox("enableValidation").numberbox("enable");
                }

            }

        }
        //获取最高分
        function GetMaxScore() {
            var maxScore = -1, valueScore = -1;
            for (var i = 1; i <= 5; i++) {
                valueScore = $("#OptionStandardScore_" + i).numberbox("getValue");
                if (isValueNull(valueScore)) {
                    if (parseFloat(valueScore) > parseFloat(maxScore)) {
                        maxScore = valueScore;
                    }
                }
            }
            $("#IssueStandardScore").numberbox("setValue", maxScore);
        }

        $(function () {
            InitControl();
            InitPage();

        });
        function InitPage() {
            if ($('#OpType').val() == "edit") {
                InitData();
            } else {
                $("#IssueStandardScore").numberbox("disableValidation").numberbox("disable");
                $("#IsProjectRequiredYes").radiobutton("disable");
                $("#IsProjectRequiredNo").radiobutton("disable");
                ChangeOption();
            }
        }
        function ControlDisable(id) {
            $(id).each(function () {
                var key = $(this).attr("id");
                if (isValueNull(key) && key.indexOf("_easyui") == -1) {
                    if ($(this).hasClass("easyui-datebox")) {
                        $(this).datebox("disable");
                    } else if ($(this).hasClass("easyui-textbox")) {
                        var value = $(this).textbox("getValue");
                        var text = $(this).textbox("getText");
                        $(this).textbox("disable");
                        $(this).textbox("setValue", value);
                        $(this).textbox("setText", text);
                    } else if ($(this).hasClass("easyui-numberbox")) {
                        $(this).numberbox("disable");
                    } else if ($(this).hasClass("easyui-combobox")) {
                        $(this).combobox("disable");
                    } else if ($(this).hasClass("easyui-radiobutton")) {
                        $(this).radiobutton("disable");
                    }
                }
            });
        }

        function InitData() {
            $.tool.DataPostJson('Visit', 'GetVisitPlanQuestionnaireByID', $.JQForm.GetStrParam(),
                function Init() {
                },
                function callback(data) {
                    if (data != "") {
                        data = data[0];
                        $('#mainForm').form('load', data);
                        ChangeIssueProperty(data.IssueProperty == "单选题" || data.IssueProperty == "多选题");
                        $('#IssueStandardScore').numberbox("setValue", data.IssueStandardScore);
                    }
                    //修改的情况禁用所有控件 不允许修改 只允许删除
                    //禁用页面所有控件
                    ControlDisable(".bootstrap_table input");
                    $('#btnSave').hide();
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function Save() {
            if ($('#mainForm').form("validate")) {
                var VisitOption = $("#dg_VisitOptionSet").datagrid('getRows');
                var IssueProperty = $("input[name='IssueProperty']:checked").val();
                if ((IssueProperty == "单选题" || IssueProperty == "多选题") && VisitOption.length == 0)
                {
                    HDialog.Info("请填写选项");
                    return;
                }
                var OptionJson = JSON.stringify(VisitOption)
                $('#OptionJson').val(OptionJson);
                $.tool.DataPostChk('mainForm', 'Visit', 'SaveVisitPlanQuestionnaire', $.JQForm.GetStrParam(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            HDialog.Info("新增成功");
                            HDialog.Close("true");
                        } else {
                            HDialog.Info(_Data);
                        }
                    },
                    function completeCallback() {

                    }, function errorCallback() {

                    });
            }
        }
        function Close() {
            HDialog.Close("");
        }

        ///
        var toolbar = [//选项
            {
                text: '添加选项',
                iconCls: 'icon-add',
                handler: function () {
                    if (endEditing()) {
                        //增加行
                        var addRow = {
                            Option: "",
                            OptionStandardScore: ""
                        };
                        var rowIndexMax = 0;
                        var rowList = $('#dg_VisitOptionSet').datagrid('getRows');
                        if (rowList.length > 0) {
                            rowIndexMax = rowList.length;
                        }
                        $('#dg_VisitOptionSet').datagrid('insertRow', {
                            index: rowIndexMax,
                            row: addRow
                        });
                        $('#dg_VisitOptionSet').datagrid('selectRow', rowIndexMax);
                        $('#dg_VisitOptionSet').datagrid('beginEdit', rowIndexMax);
                        $('#dg_VisitOptionSet').datagrid('acceptChanges', rowIndexMax);
                        editIndex = rowIndexMax;
                    } else {
                        $('#dg_VisitOptionSet').datagrid('selectRow', editIndex);
                        $('#dg_VisitOptionSet').datagrid('beginEdit', editIndex);
                    }

                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#dg_VisitOptionSet").datagrid("getSelected");
                    var rowIndex = $("#dg_VisitOptionSet").datagrid("getRowIndex", row);
                    $("#dg_VisitOptionSet").datagrid("deleteRow", rowIndex);
                    $('#dg_VisitOptionSet').datagrid('acceptChanges');
                    $('#dg_VisitOptionSet').datagrid('selectRow', 0);
                }
            }
        ];
        var column = [[[//选项
            { field: 'ID', title: 'ID', width: 100, align: 'left', hidden: true },
            {
                field: 'Option', title: '选项', width: 100, align: 'left', editor: {
                    type: 'textbox', options: {
                        required: true
                    }
                }
            },
            {
                field: 'OptionStandardScore', title: '选项标准分', width: 100, align: 'left', editor: {
                    type: 'numberbox',
                    options: {
                        min: 0,
                        precision: 2,
                        required: true
                    }
                }
            }
        ]],
        [[//选项
            { field: 'ID', title: 'ID', width: 100, align: 'left', hidden: true },
            {
                field: 'Option', title: '选项', width: 100, align: 'left', editor: {
                    type: 'textbox', options: {
                        required: true
                    }
                }
            }
        ]]
        ];

        $("#mainForm").click(function () {
            if (editIndex != undefined && $('#dg_VisitOptionSet').datagrid('validateRow', editIndex)) {
                $('#dg_VisitOptionSet').datagrid('endEdit', editIndex);
                $('#dg_VisitOptionSet').datagrid('selectRow', editIndex);
                $("#dg_VisitOptionSet").datagrid('acceptChanges');
                GetIssueStandardScore();
            }
        });

        var editIndex = undefined;
        function endEditing() {
            if (editIndex == undefined) { return true }
            if ($('#dg_VisitOptionSet').datagrid('validateRow', editIndex)) {
                var ed = $('#dg_VisitOptionSet').datagrid('getEditor', { index: editIndex, field: 'ID' });
                $('#dg_VisitOptionSet').datagrid('endEdit', editIndex);
                editIndex = undefined;
                return true;
            } else {
                return false;
            }
        }
        function onClickRow(index) {
            if (isEdit()) { return; }
            if (editIndex != index) {
                if (endEditing()) {
                    $('#dg_VisitOptionSet').datagrid('selectRow', index)
                        .datagrid('beginEdit', index);
                    //获取编辑行
                    var editors = $('#dg_VisitOptionSet').datagrid('getEditors', index);
                    var sfgzEditor = editors[0];
                    //绑定失焦事件并取消可编辑状态
                    sfgzEditor.target.bind('blur', function () {
                        $('#dg_VisitOptionSet').datagrid('selectRow', index)
                            .datagrid('endEdit', index);
                        editIndex = undefined;
                    });
                    editIndex = index;
                } else {
                    $('#dg_VisitOptionSet').datagrid('selectRow', editIndex);
                }
            }
        }
        var datas = {
            "total": 28, "rows": [
                { "ID": "FI-SW-01", "Option": "Koi_1", "OptionStandardScore": 10.00 },
                { "ID": "K9-DL-01", "Option": "Dalmation_2", "OptionStandardScore": 12.00 },
                { "ID": "RP-SN-01", "Option": "Rattlesnake_3", "OptionStandardScore": 12.00 },
                { "ID": "RP-LI-02", "Option": "Iguana_4", "OptionStandardScore": 12.00 },
                { "ID": "FL-DSH-01", "Option": "Manx_5", "OptionStandardScore": 12.00 },
                { "ID": "AV-CB-01", "Option": "Amazon Parrot_6", "OptionStandardScore": 92.00 },
            ]
        };
        var columnShow = column[1];
        var toolbarShow = toolbar;
        var lastIndex;
        function InitDataGrid() {
            $("#dg_VisitOptionSet").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=Visit&Command=GetListVisitPlanQuestionnaireOption',
                queryParams: {
                    "QuestionID": $("#ID").val()
                },
                method: "post",
                data: datas,
                nowrap: false,
                columns: columnShow,
                fitColumns: true,
                singleSelect: true,
                border: false,
                pagination: false,
                toolbar: toolbarShow,
                rownumbers: true,
                autoRowHeight: true,
                remoteSort: false,
                onDblClickRow: onClickRow,
                onDblClickCell: onClickCellFoLeaseRoom,
                onAfterEdit: onAfterEditForLeaseRoom,
                onClickCell: function (rowIndex, rowData) {
                    if (isEdit()) { return; }
                    if ($('#dg_VisitOptionSet').datagrid('validateRow', editIndex)) {
                        $('#dg_VisitOptionSet').datagrid('endEdit', editIndex);
                        $('#dg_VisitOptionSet').datagrid('selectRow', rowIndex);
                        $("#dg_VisitOptionSet").datagrid('acceptChanges');
                        GetIssueStandardScore();
                        editIndex = undefined;
                    } else {
                        $('#dg_VisitOptionSet').datagrid('endEdit', editIndex);
                        $('#dg_VisitOptionSet').datagrid('selectRow', editIndex);
                    }
                }, onBeforeDrag: function (row) {
                    return false;
                },
                onLoadSuccess: function () {
                    // $(this).datagrid('enableDnd');
                }
            });
            $("#dlg_search_VisitOption").dialog("close");
        }
        function isEdit() {
            if ($('#OpType').val() == "edit") { return true; }
            return false;
        }

        function GetIssueStandardScore() {
            var IssueStandardScore = 0.00;
            var IssueProperty = $("input[name='IssueProperty']:checked").val();
            if ($("#IsScore").val() == "1" && (IssueProperty == "单选题" || IssueProperty == "多选题")) {
                var RowList = $("#dg_VisitOptionSet").datagrid('getRows');
                if (RowList.length > 0) {
                    for (var i = 0; i < RowList.length; i++) {
                        if (parseFloat(IssueStandardScore) <= parseFloat(RowList[i].OptionStandardScore)) {
                            IssueStandardScore = parseFloat(RowList[i].OptionStandardScore);
                        }
                    }
                }
            }
            $("#IssueStandardScore").numberbox("setValue", IssueStandardScore);
        }

        //编辑的行号
        var editIndexForLeaseRoom = undefined;
        //*****编辑
        function endEditionForLeaseRoom() {
            if (editIndexForLeaseRoom == undefined) {
                return true
            }
            if ($('#dg_VisitOptionSet').datagrid('validateRow', editIndexForLeaseRoom)) {
                $('#dg_VisitOptionSet').datagrid('endEdit', editIndexForLeaseRoom);
                editIndexForLeaseRoom = undefined;
                return true;
            } else {
                return false;
            }
        }
        function onClickCellFoLeaseRoom(Rowindex, field, value) {
            if (isEdit()) { return; }
            $('#dg_VisitOptionSet').datagrid('selectRow', Rowindex);
            var SelecteRow = $('#dg_VisitOptionSet').datagrid("getSelected");
            if (endEditionForLeaseRoom()) {
                $('#dg_VisitOptionSet').datagrid('beginEdit', Rowindex);
                editIndexForLeaseRoom = Rowindex;
            }
            GetIssueStandardScore();
        }
        function onAfterEditForLeaseRoom(rowIndex, row, changes) {
            if (isEdit()) { return; }
            var updated = $('#dg_VisitOptionSet').datagrid('getChanges', 'updated');
            if (updated.length < 1) {
                $('#dg_VisitOptionSet').datagrid('unselectAll');
                return;
            } else {
                if (editIndexForLeaseRoom != undefined) {
                    $("#dg_VisitOptionSet").datagrid('acceptChanges', editIndexForLeaseRoom);
                    $('#dg_VisitOptionSet').datagrid('endEdit', editIndexForLeaseRoom);
                }
            }
            GetIssueStandardScore();
        }
    </script>
</body>
</html>
