<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Renovation.aspx.cs" Inherits="M_Main.RenovationNew.Renovation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>装修登记列表</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
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
    <script src="../jscript/uuid.js" type="text/javascript"></script>
    <style type="text/css">
      
    </style>
</head>
<body>

    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 800px; height: 294px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frmPoint">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="CustName" name="CustName" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSign" name="RoomSign" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>房屋名称</span></td>
                    <td class="text">
                        <input id="RoomName" name="RoomName" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>许可证编号</span></td>
                    <td class="text">
                        <input id="LicenceNum" name="LicenceNum" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>施工单位</span></td>
                    <td class="text">
                        <input id="BuildCompany" name="BuildCompany" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>收费金额</span></td>
                    <td class="text">
                        <input id="StartCostTotalSum" name="StartCostTotalSum" class="easyui-numberbox" data-options="width:100" />&nbsp;-
                        <input id="EndCostTotalSum" name="EndCostTotalSum" class="easyui-numberbox" data-options="width:100" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>装修状态</span></td>
                    <td class="text">
                        <input id="RenovationState" name="RenovationState" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto', icons: [{
                            iconCls: 'icon-clear',
                            handler: function (e) {
                                $(e.data.target).combobox('clear');
                            }
                        }],
                         valueField:'id',textField:'text',data: [{id: '装修',text: '装修'},{id: '停工',text: '停工'},{id: '完工',text: '完工'}]" />
                    </td>
                    <td class="title"><span>审核状态</span></td>
                    <td class="text">
                        <input id="AuditState" name="AuditState" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto', icons: [{
                            iconCls: 'icon-clear',
                            handler: function (e) {
                                $(e.data.target).combobox('clear');
                            }
                        }],
                        valueField:'id',textField:'text',data: [{id: '未送审',text: '未送审'},{id: '审核中',text: '审核中'},{id: '审核不通过',text: '审核不通过'},{id: '已审核',text: '已审核'}]" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>装修开工时间</span></td>
                    <td class="text">
                        <input id="StartStartDate" name="StartStartDate" class="easyui-datebox" data-options="editable:false,width:100" />&nbsp;-
                        <input id="EndStartDate" name="EndStartDate" class="easyui-datebox" data-options="editable:false,width:100" />
                    </td>
                    <td class="title"><span>实际完工时间</span></td>
                    <td class="text">
                        <input id="StartActualCompleteDate" name="StartActualCompleteDate" class="easyui-datebox" data-options="editable:false,width:100" />&nbsp;-
                        <input id="EndActualCompleteDate" name="EndActualCompleteDate" class="easyui-datebox" data-options="editable:false,width:100" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#dlg_search').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dlg_QRCode" class="easyui-dialog" data-options="modal:true,title:'二维码',closed:true" style="width: 165px; height: 192px; padding: 1px">
        <img id="img_QRCode" width="150" height="150" />
    </div>
    <div id="dlg_print" class="easyui-dialog" title="施工时间设定" style="width: 600px; height: 172px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-edit',modal:true,closed:true">
        <form id="frmPrint">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>周一至周五：每天&nbsp;<input id="dt1" class="easyui-timespinner" value="08:30" data-options="required:true,tipPosition:'bottom',width:'70px'" />&nbsp;至&nbsp;<input id="dt2" class="easyui-timespinner" value="12:00" data-options="required:true,tipPosition:'bottom',width:'70px'" />&nbsp;和&nbsp;<input id="dt3" class="easyui-timespinner" value="14:00" data-options="required:true,tipPosition:'bottom',width:'70px'" />&nbsp;至&nbsp;<input id="dt4" class="easyui-timespinner" value="18:00" data-options="required:true,tipPosition:'bottom',width:'70px'" />&nbsp;(非法定节日)
                    </td>
                </tr>
                <tr>
                    <td>周六至周日：每天&nbsp;<input id="dt5" class="easyui-timespinner" value="9:30" data-options="required:true,tipPosition:'bottom',width:'70px'" />&nbsp;至&nbsp;<input id="dt6" class="easyui-timespinner" value="12:30" data-options="required:true,tipPosition:'bottom',width:'70px'" />&nbsp;和&nbsp;<input id="dt7" class="easyui-timespinner" value="14:30" data-options="required:true,tipPosition:'bottom',width:'70px'" />&nbsp;至&nbsp;<input id="dt8" class="easyui-timespinner" value="18:30" data-options="required:true,tipPosition:'bottom',width:'70px'" />&nbsp;(非法定节日)
                    </td>
                </tr>
                <tr>
                    <td class="btn">
                        <a id="btnSavePrintDate" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="SavePrintDate();">保存</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script language="javascript" type="text/javascript">

        $(function () {
            InitTableHeight();
            InitDataGrid();
        });
        function InitTableHeight() {
            var h = $(window).height();
            $("#dg").css("height", h + "px");
        }
        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    Edit("新增", "Add", Math.uuid(), '未审核', '');
                }
            }, '-',
            {
                text: '编辑',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#dg").datagrid("getSelected");
                    if (row) {
                        if (row.AuditState == "审核中" || row.AuditState == "审核不通过") {
                            $.messager.alert("温馨提示", '当前装修数据' + row.AuditState + ',禁止编辑!');
                        } else if (row.RenovationState == "完工") {
                            $.messager.alert("温馨提示", '当前装修已完工,禁止编辑!');
                        } else {
                            Edit('编辑', "Edit", row.ID, row.AuditState, row.LicenceNum);
                        }
                    } else {
                        $.messager.alert("温馨提示", '请选择一行需要编辑的数据!');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#dg").datagrid("getSelected");
                    if (row) {
                        if (row.AuditState == "审核中" || row.AuditState == "已审核") {
                            $.messager.alert("温馨提示", "当前装修数据" + row.AuditState + ",禁止删除!");
                        } else {
                            Del(row.ID);
                        }
                    } else {
                        $.messager.alert("温馨提示", '请选择需要删除的数据!');
                    }
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search').dialog('open');
                }
            }, '-', {
                text: 'Excel导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    window.open("RenovationExcel.aspx?random=" + Math.random() + "&Type=RenovationAlready");
                }
            }, '-', {
                text: '施工时间设定',
                iconCls: 'icon-cog',
                handler: function () {
                    $('#dlg_print').dialog('open');
                    InitDataPrintDate();
                }
            }, '-', {
                text: '临时出入证模版设定',
                iconCls: 'icon-cog',
                handler: function () {
                    HDialog.OpenWin('1024', '620', '../RenovationNew/HandleCertificateTemplate.aspx?', '临时出入证模版设定', true, function callback(data) { });
                }
            }
            //, '-', {
            //    text: '安保(申明/规定)设定',
            //    iconCls: 'icon-cog',
            //    handler: function () {
            //        HDialog.OpenWin('1024', '620', '../RenovationNew/SecurityTemplate.aspx?', '安保(申明/规定)设定', true, function callback(data) { });
            //    }
            //}
        ];

        var column = [[
            { field: 'CustName', title: '客户名称', width: 150, align: 'left', sortable: true },
            { field: 'RoomSign', title: '房屋编号', width: 300, align: 'left', sortable: true },
            { field: 'RoomName', title: '房屋名称', width: 250, align: 'left', sortable: true },
            {
                field: 'StartDate', title: '装修开工时间', width: 90, align: 'left', sortable: false, formatter: function (value, row, index) {

                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            {
                field: 'EstimateEndDate', title: '预计完工时间', width: 90, align: 'left', sortable: false, formatter: function (value, row, index) {

                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            { field: 'BuildCompany', title: '施工单位', width: 150, align: 'left', sortable: false },
            { field: 'AuditState', title: '审核状态', width: 70, align: 'left', sortable: false },
            { field: 'FeesRoleNames', title: '未审岗位', width: 300, align: 'left', sortable: false },
            {
                field: 'QRCode', title: '二维码', width: 60, align: 'left', sortable: false, formatter: function (value, row, index) {
                    if (isValueNull(value)) {
                        value = "<a  onclick=\"ShowQRCode('" + value + "');\" href=\"javascript:void(0)\">二维码</a>";
                    }
                    return value;
                }
            },
            { field: 'HandleCertificateCount', title: '出入证数量', width: 80, align: 'left', sortable: false },
            { field: 'CostTotalSum', title: '收费金额', width: 80, align: 'left', sortable: false },
            { field: 'PatrolCount', title: '整改单数量', width: 80, align: 'left', sortable: false },
            {
                field: 'RenovationState', title: '装修状态', width: 80, align: 'left', sortable: false, formatter: function (value, row, index) {
                    if (value == "停工" && !row.MinStoppageBeginTime) {
                        value = "装修";
                    }
                    return value;
                }
            },
            {
                field: 'Opt', title: '操作', width: 80, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return "<a onclick=\"Edit('详情', 'Detailed','" + row.ID + "','" + row.AuditState + "')\" href=\"javascript:void(0)\">查看详情</a>";
                }
            },

        ]];
        //查看二维码
        function ShowQRCode(value) {
            $("#img_QRCode").attr("src", value);
            $("#dlg_QRCode").dialog("open");
        }
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "ID",
                columns: column,
                rownumbers: true,
                fitColumns: false,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onSelect: function (index, row) {

                },
                onDblClickRow: function (index, row) {
                    Edit("详情", "Detailed", row.ID, row.AuditState);
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("Renovation", "GetListRenovation", "dg", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {

                }
            });
            //$('#dg').datagrid('clearSelections');
            //$('#dg').datagrid('clearChecked');
            $("#dlg_search").dialog("close");
        }

        function Edit(title, OpType, ID, AuditState, LicenceNum) {
            var urlParam = $.param({ "OpType": OpType, "ID": ID, "AuditState": AuditState, "LicenceNum": LicenceNum });
            HDialog.OpenWin('1224', '620', '../RenovationNew/RenovationMainTab.aspx?' + urlParam, title, true, function callback(data) {
                //if (isValueNull(data)) {
                InitDataGrid();
                //}
            });
        }
        function Del(idList) {
            $.messager.confirm('温馨提示', '确定删除?', function (r) {
                if (r) {
                    $.tool.DataPostJson('Renovation', 'DelRenovation', "idList=" + idList,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                InitDataGrid();
                            } else { $.messager.alert("温馨提示", data.msg); }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            });
        }

        function InitDataPrintDate() {
            $.tool.DataPostJson('Renovation', 'GetModelPrintDate', $.JQForm.GetStrParam(),
                function Init() {
                },
                function callback(data) {
                    if (!!data) {
                        $("#dt1").timespinner('setValue', data.dt1);
                        $("#dt2").timespinner('setValue', data.dt2);
                        $("#dt3").timespinner('setValue', data.dt3);
                        $("#dt4").timespinner('setValue', data.dt4);
                        $("#dt5").timespinner('setValue', data.dt5);
                        $("#dt6").timespinner('setValue', data.dt6);
                        $("#dt7").timespinner('setValue', data.dt7);
                        $("#dt8").timespinner('setValue', data.dt8);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function SavePrintDate() {
            if ($('#frmPrint').form("validate")) {
                $.tool.DataPostJson('Renovation', 'SavePrintDate', $.JQForm.GetStrParam(),
                    function Init() {
                        $("#btnSavePrintDate").attr("disabled", "disabled");
                    },
                    function callback(data) {
                        if (data.result) {
                            $.messager.alert('温馨提示', "施工时间设定成功!");
                            $('#dlg_print').dialog('close');
                        } else { $.messager.alert('温馨提示', data.msg); }
                    },
                    function completeCallback() {
                        $("#btnSavePrintDate").removeAttr("disabled");
                    }, function errorCallback() {
                        $("#btnSavePrintDate").removeAttr("disabled");
                    });
            }
        }

    </script>
</body>
</html>
