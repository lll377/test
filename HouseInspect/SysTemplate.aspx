<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysTemplate.aspx.cs" Inherits="M_Main.HouseInspect.SysTemplate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>查验模板</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
    <style type="text/css">
        #CreateDlg {
            padding: 10px;
            width: 900px;
            height: 110px;
        }

        .CreateTable {
            width: 900px;
            height: auto;
        }

            .CreateTable .TdTitle {
                width: 8%;
            }

            .CreateTable .TdContent {
                width: 18%;
            }

        #SearchDlg {
            padding: 10px;
            width: 800px;
            height: 90px;
        }

        .SearchTable {
            width: 800px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 11%;
            }

            .SearchTable .TdContent {
                width: 22%;
            }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="DivContainer">
        </div>
        <div style="width: 100%; background-color: #cccccc;" id="DivContainerDetail">
        </div>
        <div id="CreateDlg" class="easyui-dialog" title="模板生成" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="CreateTable" style="padding: 10px">
                <tr>
                    <%--<td class="TdTitle">模板名称</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="TemplateName" name="TemplateName" style="width: 197px; border: 1px solid #cccccc;" />
                    </td>--%>
                    <td class="TdTitle">查验范围</td>
                    <td class="TdContent">
                        <select id="InspectionRange" name="InspectionRange" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 150px;height: 24px;" data-options="required:true">
                            <option value=""></option>
                            <option value="户内">户内</option>
                            <option value="公区">公区</option>
                        </select>
                    </td>
                    <td class="TdTitle">产品形态</td>
                    <td class="TdContent">
                        <select id="Form" name="Form" onchange="FrequencyChange(this)" isdctype='true' dctype="产品形态" class="easyui-validatebox" 
                            style="border: 1px #cccccc solid; width: 150px;height: 24px;" data-options="required:true">
                        </select>
                    </td>
                    <td class="TdTitle">装修属性</td>
                    <td class="TdContent">
                        <select id="Decoration" name="Decoration" onchange="FrequencyChange(this)" isdctype='true' dctype="装修属性" class="easyui-validatebox" 
                            style="border: 1px #cccccc solid; width: 150px;height: 24px;" data-options="required:true">
                        </select>
                    </td>
                    <td class="TdTitle">查验批次</td>
                    <td class="TdContent" colspan="3">
                        <select id="Batch" name="Batch" onchange="FrequencyChange(this)" isdctype='true' dctype="查验批次" class="easyui-validatebox" 
                            style="border: 1px #cccccc solid; width: 150px;height: 24px;" data-options="required:true">
                        </select>
                    </td>
                </tr>

                <tr style="height: 20px">
                </tr>
                <tr>
                    <td colspan="8" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" onclick="Save();">确定生成</a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">查验对象</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="ObjectName" name="ObjectName" runat="server" onclick="SelObject();" readonly="readonly" style="width: 95%; border: 1px solid #cccccc;" />
                        <input id="ObjectId" name="ObjectId" type="hidden" runat="server" />
                    </td>
                    <td class="TdTitle">所属专业</td>
                    <td class="TdContent">
                        <select id="Profession" name="Profession" onchange="FrequencyChange(this)" isdctype='true' dctype="所属专业" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 74%">
                        </select>
                    </td>
                    <td class="TdTitle">重要程度</td>
                    <td class="TdContent">
                        <select id="Importance" name="Importance" onchange="FrequencyChange(this)" isdctype='true' dctype="重要程度" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 74%">
                        </select>
                    </td>
                </tr>
                <tr style="height: 20px">
                </tr>
                <tr>
                    <td colspan="6" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadBindDetail();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="Clear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="TemplateId" name="TemplateId" />
        <input type="hidden" id="TemplateName" name="TemplateName" />
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height() / 5;
                $("#DivContainer").css("height", h * 2 + "px");
                $("#DivContainerDetail").css("height", h * 3 + "px");
            }

            function Clear() {
                $("#ObjectId").val('');
                $("#ObjectName").val('');
                $("#Profession").val('');
                $("#Importance").val('');
            }

            //选择查验对象
            function SelObject() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open(600, 450, '../HouseInspect/SelObject.aspx', '选择查验对象', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#ObjectId").val(arrRet.id);
                    $("#ObjectName").val(arrRet.name);
                });
            }

            //模板生成
            function Save() {
                //if ($("#TemplateName").val() == "") {
                //    HDialog.Info("请先填写模板名称!");
                //    return false;
                //}
                var TemplateName = $("#InspectionRange option:selected").text() + "-" + $("#Form option:selected").text() + "-" + $("#Decoration option:selected").text() + "-" + $("#Batch option:selected").text();

                $("#TemplateName").val(TemplateName);
                $.tool.DataPostChk('frmForm', 'CsHouseInspect', 'SaveTemplate', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info("生成成功");
                        LoadBind();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            var toolbar =
                [
                    {
                        text: '生成',
                        iconCls: 'icon-add',
                        handler: function () {
                            $('#CreateDlg').parent().appendTo($("form:first"));
                            $('#CreateDlg').dialog('open');
                        }
                    }, '-',
                    {
                        text: '删除',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            var row = $("#DivContainer").datagrid("getSelected");
                            if (row == null) {
                                HDialog.Info("请选择需要删除的选项!");
                                return false;
                            }
                            DelTemplate(row);
                        }
                    }
                ];

            var toolbarDetail =
                [
                    {
                        text: '删除',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            var row = $("#DivContainerDetail").datagrid("getSelected");
                            if (row == null) {
                                HDialog.Info("请选择需要删除的选项!");
                                return false;
                            }
                            DelTemplateStandard(row);
                        }
                    }, '-',
                    {
                        text: '筛选',
                        iconCls: 'icon-filter',
                        handler: function () {
                            $('#SearchDlg').parent().appendTo($("form:first"));
                            $('#SearchDlg').dialog('open');
                        }
                    }
                ];

            var column = [[
                { field: 'TemplateId', title: '模板Id', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'Form', title: '产品形态', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'Decoration', title: '装修属性', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'Batch', title: '查验批次', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'TemplateName', title: '模板名称', width: 40, align: 'left', sortable: true },
                { field: 'InspectionRange', title: '查验范围', width: 40, align: 'left', sortable: true },
                { field: 'FormName', title: '产品形态', width: 40, align: 'left', sortable: true },
                { field: 'DecorationName', title: '装修属性', width: 40, align: 'left', sortable: true },
                { field: 'BatchName', title: '查验批次', width: 40, align: 'left', sortable: true }
            ]];

            var columnDetail = [[
                { field: 'Id', title: 'ID', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'TemplateId', title: 'TemplateId', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'ObjectName', title: '查验对象', width: 10, align: 'left', sortable: true },
                {
                    field: 'StandardCode', title: '标准编码', width: 30, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.StandardId + "','See');\">" + row.StandardCode + "</a>";
                        return str;
                    }
                },
                { field: 'Content', title: '标准内容', width: 100, align: 'left', sortable: true },
                { field: 'InspectionRange', title: '查验范围', width: 30, align: 'left', sortable: true },
                { field: 'RoomTypeName', title: '房间类型', width: 30, align: 'left', sortable: true },
                { field: 'PublicAreaTypeName', title: '公区类型', width: 30, align: 'left', sortable: true },
                { field: 'Profession', title: '所属专业', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'Importance', title: '重要程度', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'ProfessionName', title: '所属专业', width: 40, align: 'left', sortable: true },
                { field: 'ImportanceName', title: '重要程度', width: 40, align: 'left', sortable: true }
            ]];

            function Detail(StandardId, OpType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('740', '520', '../HouseInspect/SysStandardEdit.aspx?StandardId=' + StandardId + '&OpType=' + OpType, '标准详细', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }

            function DelTemplate(row) {
                $.messager.confirm('确定', '是否删除该查验模板（对应模板标准也将删除）', function (r) {
                    if (r) {
                        $.tool.DataGet('CsHouseInspect', 'DelTemplate', 'TemplateId=' + row.TemplateId,
                            function Init() {
                            },
                            function callback(_Data) {
                                $('#CreateDlg').parent().appendTo($("form:first"));
                                $('#TemplateId').val("");
                                LoadBind();
                                LoadBindDetail('');
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function DelTemplateStandard(row) {
                $.messager.confirm('确定', '是否删除该模板标准', function (r) {
                    if (r) {
                        $.tool.DataGet('CsHouseInspect', 'DelTemplateStandard', 'Id=' + row.Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                $('#CreateDlg').parent().appendTo($("form:first"));
                                LoadBindDetail(row.TemplateId);
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function LoadBind() {
                $("#DivContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetTemplateList&' + $('#frmForm').serialize(),
                    method: "get",
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    nowrap: false,
                    rownumbers: true,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    border: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#CreateDlg").dialog("close");
                        $("#SearchDlg").dialog("close");
                    },
                    onClickRow: function (rowIndex, rowData) {
                        $('#TemplateId').val(rowData.TemplateId);
                        LoadBindDetail();
                    }
                });
            }

            function LoadBindDetail() {
                $("#DivContainerDetail").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetTemplateStandardList&' + $('#frmForm').serialize(),
                    method: "get",
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    nowrap: false,
                    rownumbers: true,
                    columns: columnDetail,
                    fitColumns: true,
                    singleSelect: true,
                    border: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbarDetail,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#CreateDlg").dialog("close");
                        $("#SearchDlg").dialog("close");
                    }
                });
            }

            $(function () {
                InitTableHeight();
                LoadBind();
                LoadBindDetail("");
            });
        </script>

    </form>

</body>
</html>
