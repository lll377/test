<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MtSupplierInfoList.aspx.cs" Inherits="M_Main.Mt.MtSupplierInfoList" %>

<!DOCTYPE html>

<html xmlns="">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script src="../jscript/MapData/CityJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/ProJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/DistrictJson.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/moment.min.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/Authority.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <input type="hidden" id="HidCorpID" name="HidCorpID" runat="server" />
    <form id="formMaterialBaseList" runat="server">
        <input type="hidden" id="InitDType" name="InitDType" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 950px; height: 300px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">管理单位：</td>
                    <td class="TdContent">
                        <input id="SelOrganCode" name="SelOrganCode" style="width: 120px;" runat="server" class="easyui-searchbox " searcher="SelLastDep" />
                    </td>
                    <td class="TdTitle">供方类别：</td>
                    <td class="TdContent">
                        <select runat="server" id="SupplierType" name="SupplierType">
                        </select>
                    </td>
                </tr>


                <tr>
                    <td class="TdTitle">合作级别：</td>
                    <td class="TdContent">
                        <select runat="server" id="CooperationLevel" name="CooperationLevel">
                        </select>
                    </td>

                    <td class="TdTitle">供方名称：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="SupplierName" value="" name="SupplierName" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">注册资本：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" style="width: 80%;" id="Capital" value="" name="Capital" />(万元)
                    </td>
                    <td class="TdTitle">成立日期：</td>
                    <td class="TdContent">
                        <input id="CreateDate" runat="server" name="CreateDate" value="" type="text" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">所在省市：</td>
                    <td class="TdContent">

                        <select id="Province" name="Province" class="easyui-validatebox " data-options="required:true" runat="server">
                            <option value="">请选择</option>
                        </select><select id="City" name="City" class="easyui-validatebox " data-options="required:true" runat="server"><option value="">请选择</option>
                        </select><select id="Area" name="Area" class="easyui-validatebox " data-options="required:true" runat="server"><option value="">请选择</option>
                        </select>
                    </td>

                    <td class="TdTitle">办公地址：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="WorkAddress" value="" name="WorkAddress" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">联&nbsp;系&nbsp;人：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="Contacts" value="" name="Contacts" />
                    </td>


                    <td class="TdTitle">联系电话：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="ContactTel" value="" name="ContactTel" />
                    </td>
                </tr>
                <tr>

                    <td class="TdTitle">供方编号：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="SupplierNum" value="" name="SupplierNum" />
                    </td>
                    <td class="TdTitle">合作期限：</td>
                    <td class="TdContent" colspan="2">
                        <input id="CooperateStartDate" runat="server" value="" name="CooperateStartDate" type="text" style="width: 43%" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
                        &nbsp;至&nbsp;<input id="CooperateEndDate" runat="server" value="" name="CooperateEndDate" type="text" style="width: 43%" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">当前状态：</td>
                    <td class="TdContent">
                        <select id="State" name="State" class="easyui-validatebox " runat="server">
                            <option selected="selected" value=""></option>
                            <option value="有效">有效</option>
                            <option value="无效">无效</option>
                        </select>
                        <%--<input />--%>
                        <%--  <label>
                            <input type="radio" style="width: 20px;" checked="checked" id="yes" name="State" value="0" />有效</label>&nbsp;
                        <label>
                            <input type="radio" id="no" name="State" style="width: 20px;" value="1" />无效</label>--%>

                    </td>
                </tr>

                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="ClearWhere();">清&nbsp;除</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="hidden" id="OrganCode" name="OrganCode" value="" />
        <input type="hidden" id="ProvinceName" name="ProvinceName" runat="server" />
        <input type="hidden" id="CityName" name="CityName" runat="server" />
        <input type="hidden" id="AreaName" name="AreaName" runat="server" />
        <input type="hidden" id="Address" name="Address" runat="server" value="" />
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">


            //监听键盘回车事件
            document.onkeydown = function (event) {
                var e = event || window.event || arguments.callee.caller.arguments[0];
                if (e && e.keyCode == 13) { // enter 键
                    LoadList();
                }
            };
            var toolbar = "";
            //省市区绑定联动
            $(function ()
            {
                if ($("#HidCorpID").val() == "1528")
                {
                    toolbar = toolbarNew;
                }
                else
                {
                    toolbar = toolbarold;
                }
                $.each(province, function (k, p) {
                    var option = "<option value='" + p.ProID + "'>" + p.ProName + "</option>";
                    $("#Province").append(option);
                });

                $("#Province").change(function () {
                    var selValue = $(this).val();
                    $("#City option:gt(0)").remove();
                    $.each(city, function (k, p) {
                        if (p.ProID == selValue) {
                            var option = "<option value='" + p.CityID + "'>" + p.CityName + "</option>";
                            $("#City").append(option);
                        }
                    });
                });
                $("#City").change(function () {
                    var selValue = $(this).val();
                    $("#Area option:gt(0)").remove();
                    $.each(District, function (k, p) {
                        if (p.CityID == selValue) {
                            var option = "<option value='" + p.DisID + "'>" + p.DisName + "</option>";
                            $("#Area").append(option);
                        }
                    });
                });
                LoadList();

            });


            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            InitTableHeight();
            var column = [[
                { field: 'OrganCodeName', title: '管理单位', width: 210, align: 'left', sortable: true },
                { field: 'SupplierTypeName', title: '供方类别', width: 100, align: 'left', sortable: true },
                { field: 'CooperationLevelName', title: '合作级别', width: 100, align: 'left', sortable: true },
                {
                    field: 'SupplierName', title: '供方名称', width: 180, align: 'left', sortable: true, formatter: function (value, row, index) {
                        return "<a class=\"HrefStyle\"  href='#' onclick=\"Detail('" + row.Id + "','edit');\">" + row.SupplierName + "</a>";
                    }
                },
                { field: 'Capital', title: '注册资本（万元）', width: 150, align: 'left', sortable: true },
                {
                    field: 'CreateDate', title: '成立日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.CreateDate != "") {
                            return moment(row.CreateDate).format('YYYY-MM-DD');
                        } else {
                            return "";
                        }

                    }
                },
                {
                    field: 'Address', title: '所在省市', width: 290, align: 'left', sortable: true, formatter: function (value, row, index) {
                        return row.Address.replace(new RegExp(',', 'gm'), '');
                    }
                },
                { field: 'WorkAddress', title: '办公地址', width: 280, align: 'left', sortable: true },
                { field: 'Contacts', title: '联系人', width: 100, align: 'left', sortable: true },
                { field: 'ContactTel', title: '联系电话', width: 120, align: 'left', sortable: true },
                { field: 'SupplierNum', title: '供方编号', width: 150, align: 'left', sortable: true },
                {
                    field: 'CooperateStartDate', title: '合作开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.CooperateStartDate != "") {
                            return moment(row.CooperateStartDate).format('YYYY-MM-DD');
                        } else {
                            return "";
                        }

                    }
                },
                {
                    field: 'CooperateEndDate', title: '合作结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.CooperateEndDate != "") {
                            return moment(row.CooperateEndDate).format('YYYY-MM-DD');
                        } else {
                            return "";
                        }
                    }
                },
                {
                    field: 'SupplierInspectionDate', title: '供应商考察时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.SupplierInspectionDate != "") {
                            return moment(row.SupplierInspectionDate).format('YYYY-MM-DD');
                        } else {
                            return "";
                        }
                    }
                },
                {
                    field: 'SupplierWarehousingDate', title: '供应商入库时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.SupplierWarehousingDate != "") {
                            return moment(row.SupplierWarehousingDate).format('YYYY-MM-DD');
                        } else {
                            return "";
                        }
                    }
                },
                {
                    field: 'SupplierReviewDate', title: '供应商评审时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.SupplierReviewDate != "") {
                            return moment(row.SupplierReviewDate).format('YYYY-MM-DD');
                        } else {
                            return "";
                        }
                    }
                },
                {
                    field: 'StateName', title: '当前状态', width: 80, align: 'left', sortable: true
                },
                {
                    field: 'ExamineState', title: '审核状态', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (row.ExamineState != "0") {
                            return "未审核";
                        } else {
                            return "已审核";
                        }
                    }
                }
            ]];

            var toolbarold = [
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
                            HDialog.Info("请选择要编辑的数据");
                            return;
                        }
                        Detail(row["Id"].toString(), 'edit');
                    }
                }, '-',
                {
                    text: '确认审核',
                    iconCls: 'icon-lock',
                    handler: function () {
                        CheckAuthority('1021', function callback(_Data) {
                            if (_Data == "true") {
                                var row = $("#TableContainer").datagrid("getSelected");
                                if (row == null) {
                                    HDialog.Info("请选择要审核的数据");
                                    return;
                                }
                                $.messager.confirm('确定', '是否确认审核', function (r) {
                                    if (r) {
                                        $.tool.DataGet('MaterialSupplierInfo', 'ExamineState', 'Id=' + row["Id"].toString() + '&ExamineState=0' + '&HidCorpID=' + $("#HidCorpID").val(),
                                            function Init() {
                                            },
                                            function callback(_Data) {
                                                LoadList();
                                            });
                                    }
                                    else {
                                        LoadList();
                                    }
                                });
                            }
                            else {
                                HDialog.Info('无此权限');
                            }
                        });
                    }
                }, '-',
                {
                    text: '取消审核',
                    iconCls: 'icon-mini-refresh',
                    handler: function () {
                        CheckAuthority('1021', function callback(_Data) {
                            if (_Data == "true") {
                                var row = $("#TableContainer").datagrid("getSelected");
                                if (row == null) {
                                    HDialog.Info("请选择要审核的数据");
                                    return;
                                }
                                $.messager.confirm('确定', '是否取消审核', function (r) {
                                    if (r) {
                                        $.tool.DataGet('MaterialSupplierInfo', 'ExamineState', 'Id=' + row["Id"].toString() + '&ExamineState=1'+'&HidCorpID=' + $("#HidCorpID").val(),
                                            function Init() {
                                            },
                                            function callback(_Data) {
                                                LoadList();
                                            });
                                    }
                                    else {
                                        LoadList();
                                    }
                                });
                                //$.messager.confirm('取消', '是否取消审核', function (r) {
                                //    LoadList();
                                //});
                            }
                            else {
                                HDialog.Info('无此权限');
                            }
                        });
                    }
                }, '-',
                {
                    text: '批量审核',
                    iconCls: 'icon-lock',
                    handler: function () {
                        CheckAuthority('1022', function callback(_Data) {
                            if (_Data == "true") {
                                $.messager.confirm('确定', '是否要执行批量审核', function (r) {
                                    if (r == "true") {
                                        $.tool.DataGet('MaterialSupplierInfo', 'Examine', 'ExamineState=1',
                                            function Init() {
                                            },
                                            function callback(_Data) {
                                                LoadList();
                                            });
                                    }
                                    else {
                                        LoadList();
                                    }

                                });
                            }
                            else {
                                HDialog.Info('无此权限');
                            }
                        });
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
                        DelRecord(row["Id"].toString());
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: 'EXCEL导入',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        HDialog.Open('900', '500', "../Mt/SupplierInfoImportExcel.aspx", '选择', false, function callback(_Data) {
                            LoadList();
                        });
                    }
                }
            ];

            var toolbarNew = [
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
                            HDialog.Info("请选择要编辑的数据");
                            return;
                        }
                        Detail(row["Id"].toString(), 'edit');
                    }
                }, '-',
                {
                    text: '确认审核',
                    iconCls: 'icon-lock',
                    handler: function () {
                        CheckAuthority('1021', function callback(_Data) {
                            if (_Data == "true") {
                                var row = $("#TableContainer").datagrid("getSelected");
                                if (row == null) {
                                    HDialog.Info("请选择要审核的数据");
                                    return;
                                }
                                $.messager.confirm('确定', '是否确认审核', function (r) {
                                    if (r) {
                                        $.tool.DataGet('MaterialSupplierInfo', 'ExamineState', 'Id=' + row["Id"].toString() + '&ExamineState=0',
                                            function Init() {
                                            },
                                            function callback(_Data) {
                                                LoadList();
                                            });
                                    }
                                    else {
                                        LoadList();
                                    }
                                });
                            }
                            else {
                                HDialog.Info('无此权限');
                            }
                        });
                    }
                }, '-',
                {
                    text: '取消审核',
                    iconCls: 'icon-mini-refresh',
                    handler: function () {
                        CheckAuthority('1021', function callback(_Data) {
                            if (_Data == "true") {
                                var row = $("#TableContainer").datagrid("getSelected");
                                if (row == null) {
                                    HDialog.Info("请选择要审核的数据");
                                    return;
                                }
                                $.messager.confirm('确定', '是否取消审核', function (r) {
                                    if (r) {
                                        $.tool.DataGet('MaterialSupplierInfo', 'ExamineState', 'Id=' + row["Id"].toString() + '&ExamineState=1',
                                            function Init() {
                                            },
                                            function callback(_Data) {
                                                LoadList();
                                            });
                                    }
                                    else {
                                        LoadList();
                                    }
                                });
                                //$.messager.confirm('取消', '是否取消审核', function (r) {
                                //    LoadList();
                                //});
                            }
                            else {
                                HDialog.Info('无此权限');
                            }
                        });
                    }
                }, '-',
                {
                    text: '批量审核',
                    iconCls: 'icon-lock',
                    handler: function () {
                        CheckAuthority('1022', function callback(_Data) {
                            if (_Data == "true") {
                                $.messager.confirm('确定', '是否要执行批量审核', function (r) {
                                    if (r == "true") {
                                        $.tool.DataGet('MaterialSupplierInfo', 'Examine', 'ExamineState=1',
                                            function Init() {
                                            },
                                            function callback(_Data) {
                                                LoadList();
                                            });
                                    }
                                    else {
                                        LoadList();
                                    }

                                });
                            }
                            else {
                                HDialog.Info('无此权限');
                            }
                        });
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
                        DelRecord(row["Id"].toString());
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: 'EXCEL导入',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        HDialog.Open('900', '500', "../Mt/SupplierInfoImportExcel.aspx", '选择', false, function callback(_Data) {
                            LoadList();
                        });
                    }
                }
                , '-',
                {
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        window.open("../Mt/MtReport/MtSupplierInfoListExcel.aspx?random=" + Math.random());
                    }
                }
            ];

            function DelRecord(Id) {
                HDialog.Prompt("是否删除该项", function () {
                    $.tool.DataGet('MaterialSupplierInfo', 'DelSupplierInfo', 'Id=' + Id,
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

            function Detail(RowId, OpType) {//Id、操作类型
                var w = top.$(window).width();
                var h = parent.$(window).height();
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open(w, h, '../Mt/MtSupplierFrame.aspx?&Id=' + RowId + '&OpType=' + OpType, '供方档案', false, function callback(_Data) {
                    if (_Data == 1) {
                        LoadList();
                    }
                });
            }

            function LoadList() {

                $("#ProvinceName").val($("#Province").find("option:selected").text());
                $("#CityName").val($("#City").find("option:selected").text());
                $("#AreaName").val($("#Area").find("option:selected").text());
                var AddStr = "";
                if ($("#ProvinceName").val() != "" && $("#ProvinceName").val() != "请选择") {
                    AddStr += $("#ProvinceName").val();
                }
                if ($("#CityName").val() != "" && $("#CityName").val() != "请选择") {
                    AddStr += "," + $("#CityName").val();
                }
                if ($("#AreaName").val() != "" && $("#AreaName").val() != "请选择") {
                    AddStr += "," + $("#AreaName").val();
                }
                $("#Address").val(AddStr);

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
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
                        param = $.JQForm.GetParam("MaterialSupplierInfo", "SelSupplierInfo", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });
            }

            if ($("#InitDType").val() != "") {
                $("#DType").val($("#InitDType").val());
            }

            LoadList();

            //管理单位
            function SelLastDep() {
                HDialog.Open('400', '600', '../DialogNew/SelOrganTree.aspx', '选择管理单位', false, function callback(_Data) {
                    var arrRet = _Data.split(',');
                    $("#OrganCode").val(arrRet[0]);
                    $("#SelOrganCode").searchbox("setValue", arrRet[1]);
                });
            }

            function ClearWhere() {
                $("#SelOrganCode").searchbox("setValue", "");
                $("#OrganCode").val("");
                $("#SupplierType").val("");
                $("#CooperationLevel").val("");
                $("#SupplierName").val("");
                $("#CreateDate").val("");
                $("#Address").val("");
                $("#WorkAddress").val("");
                $("#Contacts").val("");
                $("#ContactTel").val("");
                $("#Capital").val("");
                $("#SupplierNum").val("");
                $("#ContactTel").val("");
                $("#ContactTel").val("");

                $("#CityName").val("");
                $("#ProvinceName").val("");
                $("#AreaName").val("");
                $("#Province").val("");
                $("#City").val("");
                $("#Area").val("");
            }




        </script>
    </form>
</body>
</html>
