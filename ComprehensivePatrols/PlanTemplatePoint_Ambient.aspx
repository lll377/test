<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanTemplatePoint_Ambient.aspx.cs" Inherits="M_Main.ComprehensivePatrols.PlanTemplatePoint_Ambient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <title>模板点位</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/PinYin.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/PatrolDictionariesCanNull.js" type="text/javascript"></script>
    <style type="text/css">
        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            /*width: 180px;*/
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 88%;
            height: 46px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            /*width: 180px;*/
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable .TdTitle {
            width: 180px;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: auto;
            text-align: left;
            background: #fff;
        }

        .TdContentSearchDisable {
            background-color: #ccc;
        }

        .tabs-container .tab-content {
            padding: 0px;
        }

        .tabs-container .tab-pane {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .tabs-container .nav-tabs {
            background-color: #f5f5f5;
        }

        .SearchTable .InputColspan3 {
            width: 88%;
        }
    </style>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmFrom" runat="server">
        <input type="hidden" id="Type" name="Type" runat="server" />
        <div id="tb">
             <a href="#" class="easyui-linkbutton" onclick="RefreshPoint();" data-options="iconCls:'icon-add',plain:true">加载全部点位</a>
            <a href="#" class="easyui-linkbutton" onclick="getSearch();" data-options="iconCls:'icon-search',plain:true">筛选点位</a>
            <a href="#" class="easyui-linkbutton" onclick="DelPoint();" data-options="iconCls:'icon-cancel',plain:true">删除点位</a>
            <a href="#" class="easyui-linkbutton" onclick="SavePoint();" data-options="iconCls:'icon-edit',plain:true">必查/非必查切换</a>
            <a href="#" class="easyui-linkbutton" onclick="SaveSort();" data-options="iconCls:'icon-save',plain:true">保存序号</a>
            <a href="#" class="easyui-linkbutton" onclick="getExcel();" data-options="iconCls:'icon-page_white_excel',plain:true">导出点位</a>
            &nbsp;
      抽查点位覆盖率:<input type="text" id="OtherPointPercentage" name="OtherPointPercentage" runat="server" style="width: 110px;" placeholder="抽查点位覆盖率"
          onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'');if(this.value>100){this.value=100}}else{this.value=this.value.replace(/\D/g,'');if(this.value>100){this.value=100}}"
          onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'');if(this.value>100){this.value=100}}else{this.value=this.value.replace(/\D/g,'');if(this.value>100){this.value=100}}" maxlength="3" class="easyui-validatebox" />%
    <a href="#" class="easyui-linkbutton" onclick="SavePercentage();" data-options="iconCls:'icon-save',plain:true">保存覆盖率</a>
        </div>
        <div id="tbNoEdit">
            <a href="#" class="easyui-linkbutton" onclick="getSearch();" data-options="iconCls:'icon-search',plain:true">筛选</a>
            <a href="#" class="easyui-linkbutton" onclick="getExcel();" data-options="iconCls:'icon-page_white_excel',plain:true">导出</a>
        </div>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 160px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;" class="SearchTable">
                <tr>
                    <td class="TdTitle">通用点位</td>
                    <td class="TdContentSearch">
                        <input type="hidden" id="SysPointId" name="SysPointId" runat="server" />
                        <input type="text" id="SysPointName" name="SysPointName" class="easyui-validatebox" onclick="SelSysPoint()" readonly="readonly" />
                    </td>
                    <td class="TdTitle">点位编号</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PointCode" name="PointCode" class="easyui-validatebox" />
                    </td>
                    <td class="TdTitle">点位名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PointName" name="PointName" class="easyui-validatebox" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">任务类型</td>
                    <td class="TdContentSearch">
                        <select id="TaskType" name="TaskType" isdctype='true' dctype="任务类型" dcname="环境保洁,绿化养护,四害消杀,垃圾清运" class="easyui-validatebox" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 99%">
                        </select>
                    </td>
                    <td class="TdTitle">所属专业</td>
                    <td class="TdContentSearch">
                        <select id="Professional" runat="server" name="Professional" class="easyui-combobox" data-options="editable:false,multiple: true,panelHeight:'auto'" style="width: 98%;">
                        </select>
                    </td>
                    <td class="TdTitle">所属类别</td>
                    <td class="TdContentSearch">
                        <select id="DType" runat="server" name="DType" class="easyui-combobox" data-options="editable:false,multiple: true,panelHeight:'auto'" style="width: 98%;">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdContentSearch" colspan="6" style="text-align: center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',width:80" onclick="btnClear();">重置</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="PlanId" name="PlanId" runat="server" />
        <input type="hidden" id="CanEdit" name="CanEdit" runat="server" />
        <script type="text/javascript">
            var editIndex = undefined;
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'Id', title: 'ID', width: 25, align: 'left', hidden: true },
                { field: 'PlanPointId', title: 'PlanPointId', width: 25, align: 'left', hidden: true },
                { field: 'Sort', title: '序号', width: 10, align: 'left', sortOrder: true, sortable: true },
                { field: 'PointCode', title: '点位编号', width: 25, align: 'left', sortable: true },
                { field: 'PointName', title: '点位名称', width: 25, align: 'left', sortable: true },
                {
                    field: 'IsMustCheck', title: '是否必查', width: 10, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.IsMustCheck == '1') {
                            str = '是';
                        }
                        else {
                            str = '否';
                        }
                        return str;
                    }
                }
            ]];

            function btnClear() {
                $("#SysPointId").val('');
                $("#SysPointName").val('');
                $("#PointCode").val('');
                $("#PointName").val('');
                $("#TaskType").val('');
                $("#Professional").combobox('clear');
                $("#DType").combobox('clear');
            }

            //通用点位
            function SelSysPoint() {
                HDialog.Open('600', '450', '../ComprehensivePatrols/DialogNewSysPoint.aspx?Single=false&Type=Ambient&PlanId=' + $("#PlanId").val(), '选择通用点位', true, function callback(data) {
                    var model = data.split('|');
                    $("#SysPointId").val(model[0]);
                    $("#SysPointName").val(model[1]);
                });
            }

            function getSearch() {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }

            function getExcel() {
                //window.open("CpReportExcel.aspx?PlanId=" + $('#PlanId').val() + '&SysPointId=' + $('#SysPointId').val() + '&PointCode=' + $('#PointCode').val() + '&PointName=' + $('#PointName').val() + '&TaskType=' + $('#TaskType').val() + '&Professional=' + $("#Professional").combobox('getValues') + '&DType=' + $("#DType").combobox('getValues') + '&TaskName=环境点位');
                var formData = new FormData();
                formData.append("PlanId", $('#PlanId').val());
                formData.append("SysPointId", $('#SysPointId').val());
                formData.append("PointCode", $('#PointCode').val());
                formData.append("PointName", $('#PointName').val());
                formData.append("TaskType", $('#TaskType').val());
                formData.append("Professional", $("#Professional").combobox('getValues'));
                formData.append("DType", $("#DType").combobox('getValues'));
                formData.append("TaskName", '环境点位');
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/ComprehensivePatrols/CpReportExcel.aspx",
                    data: formData,
                    async: false,
                    cache: false,
                    dataType: 'text',
                    contentType: false,
                    processData: false,
                    error: function (request) {
                    },
                    success: function (data) {
                    }
                }).done(function (data) {
                    window.open("CpReportExcelOutput.aspx");
                });
            }

            //删除点位
            function DelPoint() {
                var row = $("#TableContainer").datagrid("getSelections");
                if (row != null && row != undefined && row != "") {
                    //判断该点位下是否存在对象，如果存在先删除该点位下对象
                    HDialog.Prompt('是否删除选中项', function () {
                        var ids = "";
                        for (var i = 0; i < row.length; i++) {
                            ids += row[i].PlanPointId + ',';
                        }
                        ids = ids.substr(0, ids.length - 1);
                        DelRecord(ids);
                    });
                } else {
                    HDialog.Info("请选择至少一行数据进行操作！");
                }
            }

            function DelRecord(Ids) {
                $.tool.DataPost('CpComPatrols', 'DelPlanPoint_Ambient', 'Ids=' + Ids + '&PlanId=' + $("#PlanId").val(),
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

            //保存可选点位率
            function SavePercentage() {
                $.tool.DataPost('CpComPatrols', 'SavePercentage_Ambient', 'PlanId=' + $("#PlanId").val() + '&OtherPointPercentage=' + $("#OtherPointPercentage").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info("保存成功！");
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //刷新点位
            function RefreshPoint() {
                $.tool.DataPost('CpComPatrols', 'RefreshPoint_Ambient', 'PlanId=' + $("#PlanId").val(),
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

            //设置必查点位
            function SavePoint() {
                //var row = $("#TableContainer").datagrid("getSelections");
                var row = $("#TableContainer").datagrid("getChecked");
                if (row != null && row != undefined && row != "") {
                    var ids = '';
                    for (var i = 0; i < row.length; i++)
                        ids = ids + row[i].PlanPointId + ',';
                    ids = ids.substring(0, ids.length - 1);
                    $.tool.DataPost('CpComPatrols', 'SetPlanPointGo_Ambient', 'Ids=' + ids + '&PlanId=' + $("#PlanId").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            LoadList();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                } else {
                    HDialog.Info("请勾选至少一行数据进行操作！");
                }
            }

            //修改序号
            function SaveSort() {
                $("#TableContainer").datagrid('acceptChanges', editIndex);
                var rows = $("#TableContainer").datagrid("getRows");
                if (rows != null && rows != undefined && rows != "") {
                    var Json = '';
                    for (var i = 0; i < rows.length; i++) {
                        Json += "{\"PlanPointId\":\"" + rows[i].PlanPointId + "\",\"Sort\":\"" + rows[i].Sort + "\"},";
                    }
                    Json = Json.substring(0, Json.length - 1);
                    Json = '[' + Json + ']';
                    $.tool.DataPost('CpComPatrols', 'SetSortGo_Ambient', 'PlanId=' + $("#PlanId").val() + '&Json=' + Json,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data > '')
                                HDialog.Info(_Data);
                            else {
                                HDialog.Info('保存成功');
                                LoadList();
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }

            //读取可选点位覆盖率
            function LoadOtherPointPercentage() {
                if ($("#PlanId").val() > '') {
                    $.tool.DataPost('CpComPatrols', 'GetOtherPointPercentageByPlanId_Ambient', 'PlanId=' + $("#PlanId").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            $("#OtherPointPercentage").val(_Data);
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
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

            /** 
            * 格式化数字，小数点后是0不表示 
            * @param value 
            * @param fixed 小数位数 
            */
            function formatNumber(value, fixed) {
                var number = Number(value);
                if (isNaN(number)) {
                    return '';
                } else {
                    if (fixed == 2) {
                        return number.toFixed(2) * 100 / 100;
                    } else if (fixed == 6) {
                        return number.toFixed(6) * 1000000 / 1000000;
                    }
                }
            }

            function LoadList() {
                var toolbar = "";
                if ($("#CanEdit").val() == "false") {
                    $("#tb").hide();
                    $("#tbNoEdit").show();
                    toolbar = "#tbNoEdit";
                } else {
                    $("#tb").show();
                    $("#tbNoEdit").hide();
                    toolbar = "#tb";
                }
                $("#TableContainer").datagrid({
                    //url: '/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=CpComPatrols&Command=GetPlanTemplatePoint&' + $('#frmFrom').serialize(),
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: false,
                    border: false,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onClickRow: function (rowIndex, rowData) {
                        if ($("#CanEdit").val() != "false") {
                            $("#TableContainer").datagrid('acceptChanges', editIndex);
                            //更改当前行号
                            editIndex = rowIndex;
                            //去除编辑器                    
                            $("#TableContainer").datagrid('removeEditor', 'Sort');
                            //console.log(rowData);
                            //序号可以编辑
                            $("#TableContainer").datagrid('addEditor', [
                                {
                                    field: 'Sort', editor: { type: 'numberbox', options: { precision: 0 } }
                                }]);
                            //开始编辑
                            $("#TableContainer").datagrid('beginEdit', rowIndex);
                        }
                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CpComPatrols", "GetPlanTemplatePoint_Ambient", "TableContainer", param);
                    }
                });
                $("#SearchDlg").dialog("close");
            }

            $(document).ready(function () { Load(); });

            function Load() {
                InitTableHeight();
                btnClear();
                $("#PlanId").val(localStorage.getItem('CpPlanId'));
                $("#CanEdit").val(localStorage.getItem('CpPlanCanEdit'));
                LoadOtherPointPercentage();
                LoadList();
            }
        </script>
    </form>
</body>
</html>
