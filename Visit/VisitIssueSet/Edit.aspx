<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.Visit.VisitIssueSet.Edit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>拜访问题编辑</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link href="../../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/datagrid-dnd.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <link href="../../css/basebootstrap.css" rel="stylesheet" />

    <script src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.form.js"></script>

    <style type="text/css">
        .divPrint {
            width: 100%;
            text-align: right;
            padding-right: 46px;
            height: 40px;
        }

        .datagrid-btable tr {
            height: 15px;
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
    <input type="hidden" id="OpType" name="OpType" />
    <form id="mainForm" runat="server">
        <input type="hidden" id="LongTimeStamp" name="LongTimeStamp" />
        <input type="hidden" id="IsScore" name="IsScore" />

        <div id="dlg_search_VisitOption" class="easyui-dialog" title="筛选" style="width: 600px; height: 243px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>选项</span></td>
                    <td class="text">
                        <input id="OptionName" name="OptionName" class="easyui-combobox" />
                    </td>
                    <td class="title"><span></span></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#dlg_search_VisitOption').dialog('close')">关闭</a>
                    </td>
                </tr>
            </table>
        </div>

        <div id="dlg_search_VisitOptionSet" class="easyui-dialog" title="编辑" style="width: 600px; height: 200px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>选项</span></td>
                    <td class="text">
                        <input id="SetOptionName" name="SetOptionName" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>选项标准分</span></td>
                    <td class="text">
                        <input id="SetOptionStandardScore" name="SetOptionStandardScore" class="easyui-numberbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>选项备注</span></td>
                    <td class="text">
                        <input id="SetRemarks" name="SetRemarks" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>选项序号</span></td>
                    <td class="text">
                        <input id="SetSort" name="SetSort" class="easyui-numberbox" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="Edit('','AddConfirm','');">添加</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#dlg_search_VisitOptionSet').dialog('close')">关闭</a>
                    </td>
                </tr>
            </table>
        </div>
        <div style="padding: 20px 5px;">
            <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">
                        <span>拜访类别</span>
                    </td>
                    <td class="text">
                        <input id="VisitCategoryID" name="VisitCategoryID" class="easyui-textbox" data-options="prompt: '请单击右侧\'放大镜\'按钮进行操作!', editable: false, tipPosition: 'bottom', required: true, multiline: false, width: '300px',
                        buttonText: '', buttonIcon: 'icon-search', onClickButton: function () { SelVisitCategory(); },
                        icons: [{
                            iconCls: 'icon-clear',
                            handler: function (e) {
                                $(e.data.target).textbox('clear');
                            }
                        }]" />
                    </td>
                    <td class="title"><span>问卷类别</span></td>
                    <td class="text">
                        <input id="QuestionnaireCategoryID" name="QuestionnaireCategoryID" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'300px',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelQuestionnaireCategory();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>问题类别</span></td>
                    <td class="text">
                        <input id="IssueType" name="IssueType" class="easyui-combobox" />
                    </td>
                    <td class="title"><span>是否评分</span></td>
                    <td class="text">
                        <label id="IsScoreName"></label>
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>问题名称</span></td>
                    <td class="text" colspan="3">
                        <input id="IssueName" name="IssueName" class="easyui-textbox" data-options="required:true,tipPosition:'bottom',width:'745px'" />
                    </td>

                </tr>
                <tr>
                    <td class="title"><span>问题属性</span></td>
                    <td class="text">
                        <input class="easyui-radiobutton" id="IssuePropertyYes"name="IssueProperty" data-options="value:'单选题',label:'单选题',labelWidth:42,labelAlign:'right',checked:true"/>
                        <input class="easyui-radiobutton" id="IssuePropertyDX" name="IssueProperty" data-options="value:'多选题',label:'多选题',labelWidth:42,labelAlign:'right'"/>
                        <input class="easyui-radiobutton" id="IssuePropertyNo" name="IssueProperty" data-options="value:'问答题',label:'问答题',labelWidth:42,labelAlign:'right'"/>
                    </td>
                    <td class="title IsScoreNo"><span>问题标准分</span></td>
                    <td class="text IsScoreNo">
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
                        <input id="Remark" name="Remark" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:true,width:'745',height:'40px'" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="hidden" name="ID" id="ID" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>
    </form>
    <script type="text/javascript">
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

                        //$('#dg_VisitOptionSet').datagrid('appendRow', addRow);
                        //rowIndexMax = $('#dg_VisitOptionSet').datagrid('getRowIndex', addRow);

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
            //, '-',
            //{
            //    text: '筛选',
            //    iconCls: 'icon-search',
            //    handler: function () {
            //        $('#dlg_search_VisitOption').dialog('open');
            //    }
            //}
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
                        //update();
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
        var lastIndex;
        function InitDataGrid() {

            $("#dg_VisitOptionSet").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=Visit&Command=GetListVisitIssueSetOption',
                queryParams: {
                    "QuestionID": $("#ID").val()
                },
                method: "post",
                nowrap: false,
                columns: columnShow,
                fitColumns: true,
                singleSelect: true,
                border: false,
                pagination: false,
                toolbar: toolbar,
                rownumbers: true,
                autoRowHeight: true,
                remoteSort: false,
                onDblClickRow: onClickRow,
                onDblClickCell: onClickCellFoLeaseRoom,
                onAfterEdit: onAfterEditForLeaseRoom,
                onClickCell: function (rowIndex, rowData) {
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

        function GetIssueStandardScore() {
            var IssueStandardScore = 0.00;
            var IssueProperty = $("input[name='IssueProperty']:checked").val();
            if ($("#IsScoreName").text() == "是" && (IssueProperty == "单选题" || IssueProperty == "多选题")) {
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
            $('#dg_VisitOptionSet').datagrid('selectRow', Rowindex);
            var SelecteRow = $('#dg_VisitOptionSet').datagrid("getSelected");
            if (endEditionForLeaseRoom()) {
                //if (field == "RoomRentalArea" || field == "LeaseBeginTime" || field == "LeaseEndTime" || field == "RentFreeEndTime" || field == "PostPoneBeginTime") {
                $('#dg_VisitOptionSet').datagrid('beginEdit', Rowindex);
                //}
                editIndexForLeaseRoom = Rowindex;
            }
            GetIssueStandardScore();
        }
        function onAfterEditForLeaseRoom(rowIndex, row, changes) {
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


        //
        function SelVisitCategory() {
            HDialog.OpenWin('650', '450', '../Visit/Dialog/VisitCategory.aspx', '选择拜访类别', true, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#VisitCategoryID").textbox('setValue', data.ID);
                    $("#VisitCategoryID").textbox('setText', data.VisitCategory);
                    $("#QuestionnaireCategoryID").textbox('clear');
                }
            });
        }

        function SelQuestionnaireCategory() {
            var VisitCategoryID = $("#VisitCategoryID").textbox("getValue");
            if (!isValueNull(VisitCategoryID)) {
                $.messager.alert('温馨提示', "请先选择拜访类别!");
                return;
            }
            HDialog.Open('650', '450', '../Visit/Dialog/QuestionnaireCategory.aspx?VisitCategoryID=' + VisitCategoryID, '选择问卷类别', true, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#QuestionnaireCategoryID").textbox('setValue', data.ID);
                    $("#QuestionnaireCategoryID").textbox('setText', data.QuestionnaireCategory);
                    $("#IsScore").val(data.IsScore);
                    $("#IsScoreName").text(data.IsScore == 0 ? "否" : "是");
                    EnableDisableControl();

                }
            });
        }

        function EnableDisableControl() {
            var IsScore = $("#IsScoreName").text() == "是", optionValue = "", isDisable;
            var IssueProperty = $("input[name='IssueProperty']:checked").val();
            if (IsScore) {
                //是否评分:是
                $(".IsScoreNo").show();
            } else {
                //是否评分:否
                $(".IsScoreNo").hide();
            }
            //问题标准分
            isDisable = $("#IssueStandardScore").textbox("options").disabled;
            if ((IssueProperty == "单选题" || IssueProperty == "多选题")) {
                //选择题
                $(".choicequestion").show();
                if (!isDisable && IsScore) {
                    $('#IssueStandardScore').numberbox("disableValidation").numberbox("disable").numberbox("setValue", 0);
                }
            } else {
                //问答题
                $(".choicequestion").hide();
                if (isDisable && IsScore) {
                    $('#IssueStandardScore').numberbox("enableValidation").numberbox("enable").numberbox("setValue", 0);
                } else {
                    $('#IssueStandardScore').numberbox("disableValidation").numberbox("disable").numberbox("clear");
                }
            }
            if ($("#IsScoreName").text() == "是") {
                //是否评分:是
                columnShow = column[0];
            } else {
                //是否评分:否
                columnShow = column[1];
            }
            InitDataGrid();
        }

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
                width: '300px',
                panelHeight: 194,
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                    }
                }]
            });

            $("#IssuePropertyYes").radiobutton({
                onChange: function (checked) {
                    EnableDisableControl();
                }
            });
           $("#IssuePropertyDX").radiobutton({
                onChange: function (checked) {
                    EnableDisableControl();
                }
            });
            $('#Sort').numberbox('textbox').attr('maxlength', 6);
        }

        $(function () {
            InitControl();
            InitPage();
            InitDataGrid();
        });
        var OpType;
        function InitPage() {
            var OpType = $.getUrlParam("OpType");
            var ID = $.getUrlParam("ID");
            $("#OpType").val(OpType);
            if (OpType == "Edit") {
                $("#ID").val(ID);
                InitData();
            } else {
                EnableDisableControl();
            }
        }
        function InitData() {
            $.tool.DataPostJson('Visit', 'GetModelVisitIssueSet', $.JQForm.GetStrParam(),
                function Init() {
                },
                function callback(data) {
                    data = data[0];
                    $('#mainForm').form('load', data);
                    $('#VisitCategoryID').textbox("setValue", data.VisitCategoryID);
                    $('#VisitCategoryID').textbox("setText", data.VisitCategory);
                    $('#QuestionnaireCategoryID').textbox("setValue", data.QuestionnaireCategoryID);
                    $('#QuestionnaireCategoryID').textbox("setText", data.QuestionnaireCategory);
                    $("#IsScoreName").text(data.IsScoreName);
                    EnableDisableControl();
                    $('#IssueStandardScore').numberbox("setValue", data.IssueStandardScore);
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
                $.tool.DataPostJson('Visit', 'SaveVisitIssueSet', $.JQForm.GetStrParam() + '&OptionJson=' + OptionJson,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            $('#mainForm').form('clear');
                            Close();
                        } else { $.messager.alert('温馨提示', data.msg); }
                    },
                    function completeCallback() {

                    }, function errorCallback() {

                    });
            }
        }
        function Close() {
            HDialog.Close();
        }
    </script>
</body>
</html>
