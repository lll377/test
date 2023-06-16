<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelTaskGeneration.aspx.cs" Inherits="M_Main.HouseInspect.SelTaskGeneration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <title>查验任务</title>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmForm" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1050px; height: 150px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                   <%-- <td class="TdTitle">项目名称</td>
                    <td class="TdContent">
                        <input id="CommName" name="CommName" type="text" class="easyui-validatebox" onclick="SelItem();" style="width: 95%" />
                        <input type="hidden" name="CommId" id="CommId" value="" />
                    </td>--%>
                    <td class="TdTitle">查验批次</td>
                    <td class="TdContent">
                        <select id="Batch" name="Batch" onchange="FrequencyChange(this)" isdctype='true' dctype="查验批次" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 97%">
                        </select>
                    </td>
                    <td class="TdTitle">查验模板</td>
                    <td class="TdContent">
                        <input id="TemplateName" name="TemplateName" class="easyui-validatebox" onclick="SelTemplate();" style="width: 95%" />
                        <input type="hidden" name="TemplateId" id="TemplateId" value="" />
                    </td>
                    <td class="TdTitle">所属专业</td>
                    <td class="TdContent">
                        <select id="Profession" name="Profession" onchange="FrequencyChange(this)" isdctype='true' dctype="所属专业" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 97%">
                        </select>
                    </td>
                     <td class="TdTitle">查验岗位</td>
                    <td class="TdContent">
                        <input type="text" id="RoleName" name="RoleName" class="easyui-validatebox" onclick="SelRole()" readonly="readonly" style="width: 95%" />
                        <input type="hidden" id="RoleCode" name="RoleCode" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                   
                    <td class="TdTitle">生成人</td>
                    <td class="TdContent">
                        <input type="text" id="AddPName" name="AddPName" class="easyui-validatebox" style="width: 95%" />
                    </td>
                    <td class="TdTitle">生成时间</td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="AddDateBg" name="AddDateBg" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" readonly="readonly" style="width: 95%" />
                    </td>
                    <td class="TdTitle">至</td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="AddDateEnd" name="AddDateEnd" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" readonly="readonly" style="width: 95%" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="btnClear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>
         <input type="hidden" name="TaskStatus" id="TaskStatus" value="已完成" />
        <input type="hidden" name="Range" id="Range" />
        <input type="hidden" name="HiCommID" id="HiCommID" />
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            //选择项目
            function SelItem() {
                HDialog.Open(410, 360, '../HouseInspect/SelComm.aspx?IsCheck=1', "选择项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommId").val(arrRet.id);
                    $("#CommName").val(arrRet.name);
                });
            }

            //选择模板
            function SelTemplate() {
                HDialog.Open('800', '600', '../HouseInspect/SelTemplateList.aspx', '选择查验模板', true, function callback(_Data) {
                    if (_Data != "") {
                        var varObjects = _Data.split('◆');
                        $("#TemplateId").val(varObjects[0]);
                        $('#TemplateName').val(varObjects[1]);


                    }
                });
            }

            //选择岗位
            function SelRole() {
                HDialog.Open('650', '600', '../HouseInspect/RightFrameCommunityRightManage.aspx?DepCode=&returnValue=', '选择岗位', false, function callback(_Data) {
                    if (_Data) {
                        _Data = _Data.substring(1, _Data.length);
                        var strs = new Array();
                        strs = _Data.split(',');
                        var code = "";
                        var name = "";
                        var all = "";
                        for (var i = 0; i < strs.length; i++) {
                            all = strs[i].trim().split(/\s+/);
                            code = code + all[0] + ",";
                            name = name + all[1] + ",";
                        }
                        code = code.substring(0, code.length - 1);
                        name = name.substring(0, name.length - 1);
                        $("#RoleName").val(name);
                        $("#RoleCode").val(code);
                    };
                })
            }

            function btnClear() {
                $("#CommId").val("");
                $("#CommName").val("");
                $("#TemplateId").val("");
                $("#TemplateName").val("");
                $("#RoleName").val("");
                $("#RoleCode").val("");
                $("#Batch").val("");
                $("#Profession").val("");
                $("#AddPName").val("");
                $("#AddDateBg").val("");
                $("#AddDateEnd").val("");
            }

            var column = [[
                { field: 'TaskId', title: 'TaskId', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'CommId', title: 'CommId', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'CommName', title: '项目名称', width: 150, align: 'left', sortable: true },
                { field: 'Batch', title: '查验批次', width: 20, align: 'left', sortable: true, hidden: true },
                { field: 'BatchName', title: '查验批次', width: 100, align: 'left', sortable: true },
                { field: 'TaskNo', title: '任务编码', width: 130, align: 'left', sortable: true },
                {
                    field: 'HouseNum', title: '房屋/公区数量', width: 70, align: 'center', halign: 'left', sortable: true
                },
                { field: 'TemplateId', title: '模板Id', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'TemplateName', title: '查验模板', width: 220, align: 'left', sortable: true },
                { field: 'Profession', title: '所属专业', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'ProfessionName', title: '所属专业', width: 100, align: 'left', sortable: true },
                { field: 'RoleCode', title: '查验岗位编码', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'RoleName', title: '查验岗位', width: 180, align: 'left', sortable: true },
                { field: 'BeginTime', title: '开始时间', width: 90, align: 'left', sortable: true },
                { field: 'EndTime', title: '结束时间', width: 90, align: 'left', sortable: true },
                { field: 'TaskStatus', title: '任务状态', width: 70, align: 'left', sortable: true },
                { field: 'AddPid', title: '生成人id', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'AddPName', title: '生成人', width: 150, align: 'left', sortable: true },
                { field: 'AddDate', title: '生成时间', width: 150, align: 'left', sortable: true },
                { field: 'ReasonName', title: '修改原因', width: 150, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '确认选择',
                    iconCls: 'icon-add',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row==null) {
                            HDialog.Info('请选择任务');
                            return false;
                        }
                        HDialog.Close(JSON.stringify(row));
                    }
                }, '-',
                {
                    text: '筛选任务',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function DelTask(TaskId, msg) {
                $.messager.confirm('确定', msg, function (r) {
                    if (r) {
                        $.tool.DataGet('CsHouseInspect', 'DelTask', 'TaskId=' + TaskId,
                            function Init() {
                            },
                            function callback(_Data) {
                                LoadList();
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }


            function LoadList() {
                var Range = GetQueryString("Range")
                $("#Range").val(Range)
                $("#HiCommID").val(GetQueryString("HiCommID"))
                $("#TableContainer").datagrid({
                    //url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetTaskList&' + $('#frmForm').serialize(),
                    //method: "get",
                    url: '/HM/M_Main/HC/DataPostControl.aspx?Range=' + Range,
                    method: "Post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    rownumbers: true,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
                    border: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CsHouseInspect", "GetTaskList", "TableContainer", param);
                    }
                });
                $("#SearchDlg").dialog("close");
            }

            LoadList();

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

        </script>
    </form>
</body>
</html>
