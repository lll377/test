<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanList.aspx.cs" Inherits="M_Main.Supervision.PlanList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划列表</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <style type="text/css">
        td {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="width: 100%">
            <div style="float: left; width: 20%; border-right: 1px solid #cccccc;" class="menuDiv">
                <div style="background-color: #cccccc;" id="TreeGrid"></div>
            </div>
            <div style="float: left; width: 80%">
                <div style="background-color: #cccccc;" id="TableContainer"></div>
            </div>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 510px; height: 225px; padding: 10px; overflow: hidden;">
            <table class="dlg_table">
                <tr>
                    <td class="title">检查类型:</td>
                    <td class="text">
                        <input id="CheckTypeId" name="CheckTypeId" class="easyui-combobox" />
                    </td>
                    <td class="title">计划名称:</td>
                    <td class="text">
                        <input type="text" id="PlanName" name="PlanName" class="easyui-textbox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">检查频次:</td>
                    <td class="text">
                        <input id="Frequency" name="Frequency" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:false,
                            panelHeight:'200',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '1次/半小时',text: '1次/半小时'},
                                {id: '1次/1小时',text: '1次/1小时'},
                                {id: '1次/2小时',text: '1次/2小时'},
                                {id: '1次/3小时',text: '1次/3小时'},
                                {id: '1次/4小时',text: '1次/4小时'},
                                {id: '1次/6小时',text: '1次/6小时'},
                                {id: '1次/8小时',text: '1次/8小时'},
                                {id: '1次/12小时',text: '1次/12小时'},
                                {id: '1次/天',text: '1次/天'},
                                {id: '1次/周',text: '1次/周'},
                                {id: '2次/周',text: '2次/周'},
                                {id: '3次/周',text: '3次/周'},
                                {id: '1次/10天',text: '1次/10天'},
                                {id: '1次/15天',text: '1次/15天'},
                                {id: '1次/月',text: '1次/月'},
                                {id: '1次/2月',text: '1次/2月'},
                                {id: '1次/季',text: '1次/季'},
                                {id: '1次/半年',text: '1次/半年'},
                                {id: '1次/年',text: '1次/年'}
                            ]" />
                    </td>
                    <td class="title">审核状态:</td>
                    <td class="text">
                        <input id="EntrustState" name="EntrustState" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:false,
                            panelHeight:'auto',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '0',text: '未送审'},
                                {id: '1',text: '审核中'},
                                {id: '2',text: '审核通过'},
                                {id: '3',text: '审核不通过'}
                            ]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">任务生成方式:</td>
                    <td class="text">
                        <input id="GenerateType" name="GenerateType" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:false,
                            panelHeight:'auto',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '1',text: '自动生成'},
                                {id: '2',text: '手动生成'}
                            ]" />
                    </td>
                    <td class="title">计划是否启用:</td>
                    <td class="text">
                        <input id="IsEnable" name="IsEnable" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:false,
                            panelHeight:'auto',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '1',text: '是'},
                                {id: '0',text: '否'}
                            ]" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="Clear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="OrganCode" name="OrganCode" />
        <input type="hidden" id="CommId" name="CommId" />
        <input type="hidden" id="CommName" name="CommName" />
        <script type="text/javascript">
            function Clear() {
                var OrganCode = $("#OrganCode").val();
                var CommId = $("#CommId").val();
                var CommName = $("#CommName").val();
                $('#frmForm').form('clear');
                $("#OrganCode").val(OrganCode);
                $("#CommId").val(CommId);
                $("#CommName").val(CommName);
            }

            var h = $(window).height();
            var w = $(window).width();

            function InitTableHeight() {
                $("#TreeGrid").css("height", h + "px");
                $("#TableContainer").css("height", h + "px");
            }

            //加载检查类型
            function LoadCheckTypeId() {
                $('#CheckTypeId').combobox({
                    required: false,
                    panelHeight: '150',
                    validType: ['comboBoxValid[\'#CheckTypeId\']'],
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function (e) {
                            $(e.data.target).combobox('clear');
                        }
                    }],
                    url: '/HM/M_Main/HC/DataGetControl.aspx',
                    method: 'get',
                    valueField: 'Id',
                    textField: 'TypeName',
                    onBeforeLoad: function (param) {
                        param.Method = 'DataGet';
                        param.Class = 'CSSupervision';
                        param.Command = 'BindCheckType';
                    }
                });
            }

            var column = [[
                { field: 'OrganName', title: '所属单位', width: 200, align: 'left', sortable: true },
                { field: 'CommName', title: '项目名称', width: 200, align: 'left', sortable: true },
                { field: 'TypeName', title: '检查类型', width: 300, align: 'left', sortable: true },
                {
                    field: 'PlanName', title: '计划名称', width: 300, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"EditPlan('" + row.Id + "','" + row.Frequency + "')\">" + row.PlanName + "</a>";
                        return str;
                    }
                },
                { field: 'Frequency', title: '检查频次', width: 100, align: 'left', sortable: true },
                {
                    field: 'EntrustState', title: '审核流程', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"ExamineInfo('" + row.Id + "')\">查看</a>";
                        return str;
                    }
                },
                { field: 'EntrustStateName', title: '审核状态', width: 100, align: 'left', sortable: true },
                { field: 'GenerateTypeName', title: '任务生成方式', width: 100, align: 'left', sortable: true },
                { field: 'IsEnableName', title: '计划是否启用', width: 100, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($("#CommId").val() > '') {
                            HDialog.Open('1000', '700', '../Supervision/PlanFrame.aspx?OpType=insert&CommId=' + $("#CommId").val() + '&CommName=' + encodeURI(encodeURI($("#CommName").val())), '新增检查计划', true, function callback(_Data) {
                                LoadList();
                            });
                        }
                        else
                            HDialog.Info('请选择项目');
                    }
                }
                , '-',
                {
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择修改数据");
                            return;
                        }
                        $.tool.DataGet('CSSupervision', 'CheckPlanCanEdit', 'Id=' + row.Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "0") {
                                    HDialog.Info("选中计划审核中或已审核或没有计划编制权限，无法修改");
                                    return;
                                }
                                EditPlan(row.Id, row.Frequency);
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                }
                , '-',
                {
                    text: '送审',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择送审数据");
                            return;
                        }
                        $.tool.DataGet('CSSupervision', 'CheckPlanCanEdit', 'Id=' + row.Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "0") {
                                    HDialog.Info("选中计划审核中或已审核或没有计划编制权限，无法送审");
                                    return;
                                }
                                ExaminePlan(row.Id);
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                }
                , '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择删除数据");
                            return;
                        }
                        $.tool.DataGet('CSSupervision', 'CheckPlanCanEdit', 'Id=' + row.Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "0") {
                                    HDialog.Info("选中计划审核中或已审核或没有计划编制权限，无法删除");
                                    return;
                                }
                                DelRecord(row.Id);
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                }
                , '-',
                {
                    text: '启/停用计划',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择修改数据");
                            return;
                        }
                        $.tool.DataGet('CSSupervision', 'CheckPlanCanEditCheck', 'Id=' + row.Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "0") {
                                    HDialog.Info("选中计划没有计划编制权限，无法启/停用");
                                    return;
                                }
                                $.tool.DataPost('CSSupervision', 'EnablePlan', 'Id=' + row.Id,
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        HDialog.Info('启/停用成功');
                                        LoadList();
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                }
                , '-',
                {
                    text: '修改检查岗位/人',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择修改数据");
                            return;
                        }
                        $.tool.DataGet('CSSupervision', 'CheckPlanCanEditCheck', 'Id=' + row.Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "0") {
                                    HDialog.Info("选中计划没有计划编制权限，无法修改");
                                    return;
                                }
                                HDialog.Open('700', '500', '../Supervision/SelRoleOrUser.aspx?IsCheck=1&RoleOrUser=ExecutionCheck' + '&CommId=' + row.CommId, "选择通用岗位或人员", false, function callback(_Data) {
                                    if (_Data > '') {
                                        $.tool.DataPost('CSSupervision', 'UpdatePlanCheck', 'Id=' + row.Id + '&Code=' + _Data.split('|')[0] + '&Name=' + _Data.split('|')[1] + '&Type=' + _Data.split('|')[2],
                                            function Init() {
                                            },
                                            function callback(_Data) {
                                                HDialog.Info('修改成功');
                                                LoadList();
                                            },
                                            function completeCallback() {
                                            },
                                            function errorCallback() {
                                            });
                                    }
                                });
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                }
                , '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
                , '-',
                {
                    text: '导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        Export();
                    }
                }
                , '-',
                {
                    text: '复制',
                    iconCls: 'icon-save',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择需要复制的数据");
                            return;
                        }
                        HDialog.Open('800', '600', '../Supervision/SelComm.aspx?IsCheck=1', "复制计划", false, function callback(_Data) {
                            if (_Data > '') {
                                $.tool.DataPost('CSSupervision', 'CopyPlan', 'Id=' + row.Id + '&CommId=' + JSON.parse(_Data).id,
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        HDialog.Info('复制成功');
                                        LoadList();
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                            }
                        });
                    }
                }
            ];

            function EditPlan(Id, Frequency) {
                HDialog.Open('1000', '700', '../Supervision/PlanFrame.aspx?OpType=edit&Id=' + Id + '&Frequency=' + encodeURI(encodeURI(Frequency)), '编辑检查计划', true, function callback(_Data) {
                    LoadList();
                });
            }

            function ExamineInfo(Id) {
                HDialog.Open('800', '400', '../Supervision/PlanExamineInfo.aspx?Id=' + Id, '查看审核流程', true, function callback(_Data) {

                });
            }

            function ExaminePlan(Id) {
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'Plan_SubmitExamine', 'Id=' + Id,
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info(_Data);
                        LoadList();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function DelRecord(Id) {
                HDialog.Prompt('是否删除选中的数据!', function () {
                    $.tool.DataGet('CSSupervision', 'Del', 'TableName=Tb_Supervision_Plan&Id=' + Id,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data != "") {
                                HDialog.Info(_Data);
                                return;
                            }
                            LoadList();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=GetPlanList&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    rownumbers: true,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    border: 0
                });
                $("#SearchDlg").dialog("close");
            }

            function LoadTree() {
                $("#TreeGrid").treegrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=DepMenuList&' + $('#frmForm').serialize(),
                    treeField: 'text',
                    idField: 'id',
                    method: "get",
                    nowrap: false,
                    animate: false,
                    columns: [[{ title: '项目名称', field: 'text', width: 400 }]],
                    fitColumns: false,
                    singleSelect: true,
                    pagination: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: null,
                    border: false,
                    sortOrder: "asc",
                    onClickRow: function (rowData) {
                        if (rowData.children == undefined) {
                            $("#OrganCode").val('');
                            $("#CommId").val(rowData.attributes.CommID);
                            $("#CommName").val(rowData.text);
                        } else {
                            $("#OrganCode").val(rowData.id);
                            $("#CommId").val('');
                            $("#CommName").val('');
                        }
                        LoadList();
                    }
                });
            }

            $(function () {
                InitTableHeight();
                LoadCheckTypeId();
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
                LoadTree();
                LoadList();
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

            //导出Excel
            function Export() {
                var rows = $('#TableContainer').datagrid("getRows");
                if (rows.length == 0) {
                    HDialog.Info("无数据需要导出");
                    return;
                }
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'GetPlanList', $('#frmForm').serialize() + '&page=1&rows=999999999',
                    function Init() {
                    },
                    function callback(_Data) {
                        var tableString = '<table cellspacing="0" class="pb">';

                        // 载入title
                        tableString += '\n<tr>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">所属单位</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">项目名称</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">检查类型</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">计划名称</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">检查频次</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">审核状态</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">任务生成方式</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">计划是否启用</th>';
                        tableString += '\n</tr>';
                        // 载入内容
                        var rows = eval("(" + _Data.replace(/\\/g, "/") + ")").rows; //转换为json对象
                        for (var i = 0; i < rows.length; i++) {
                            tableString += '\n<tr>';
                            tableString += '\n<td>' + rows[i]["OrganName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["CommName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["TypeName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["PlanName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["Frequency"] + '</td>';
                            tableString += '\n<td>' + rows[i]["EntrustStateName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["GenerateTypeName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["IsEnableName"] + '</td>';
                            tableString += '\n</tr>';
                        }

                        //导出
                        var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                        var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                        var l = $('<input type="hidden" id="txtName" name="txtName" />');
                        i.val(tableString);
                        i.appendTo(f);
                        var date = new Date();
                        l.val('检查计划-' + dateFormat("YYYY-mm-dd", date));
                        l.appendTo(f);
                        f.appendTo(document.body).submit();
                        $('#SearchDlg').dialog('close');
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function dateFormat(fmt, date) {
                let ret;
                let opt = {
                    "Y+": date.getFullYear().toString(),        // 年
                    "m+": (date.getMonth() + 1).toString(),     // 月
                    "d+": date.getDate().toString(),            // 日
                    "H+": date.getHours().toString(),           // 时
                    "M+": date.getMinutes().toString(),         // 分
                    "S+": date.getSeconds().toString()          // 秒
                    // 有其他格式化字符需求可以继续添加，必须转化成字符串
                };
                for (let k in opt) {
                    ret = new RegExp("(" + k + ")").exec(fmt);
                    if (ret) {
                        fmt = fmt.replace(ret[1], (ret[1].length == 1) ? (opt[k]) : (opt[k].padStart(ret[1].length, "0")))
                    };
                };
                return fmt;
            }
        </script>
    </form>
</body>
</html>
