<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EquipmentExternalMaintenanceEdit.aspx.cs" Inherits="M_Main.EquipmentNew.EquipmentExternalMaintenanceEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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
    <script src="../jscript/Guid.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
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
            width: 120px;
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
<body>
    <form id="frmFrom" runat="server">
        <table class="SearchTable" style="width: 100%; line-height: 25px;">
            <tr>
                <td class="TdTitle">维保单位</td>
                <td class="TdContentSearch">
                    <input id="MaintenanceUnit" name="MaintenanceUnit" type="text" class="easyui-validatebox" data-options="required:true" style="height: 21px;" />
                </td>
                <td class="TdTitle">维保性质</td>
                <td class="TdContentSearch">
                    <select id="MaintenanceNature" name="MaintenanceNature" style="width: 145px; border: 1px #cccccc solid; height: 22px;" class="easyui-validatebox" data-options="required:true">
                        <option value=""></option>
                        <option value="全包">全包</option>
                        <option value="半包">半包</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">联系人</td>
                <td class="TdContentSearch">
                    <input id="Contacts" name="Contacts" type="text" class="easyui-validatebox" data-options="required:true" style="height: 21px;" />
                </td>
                <td class="TdTitle">联系电话</td>
                <td class="TdContentSearch">
                    <input id="ContactTel" name="ContactTel" type="text" class="easyui-validatebox" data-options="required:true" style="height: 21px;" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">合同编号</td>
                <td class="TdContentSearch">
                    <input id="ContractNo" name="ContractNo" type="text" class="easyui-validatebox" data-options="required:true" style="height: 21px;" />
                </td>
                <td class="TdTitle">合同名称</td>
                <td class="TdContentSearch">
                    <input id="ContractName" name="ContractName" type="text" class="easyui-validatebox" data-options="required:true" style="height: 21px;" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">合同开始时间</td>
                <td class="TdContentSearch">
                    <input type="text" id="ContractBegin" name="ContractBegin" style="border: 1px solid #cccccc; width: 140px; height: 18px;" data-options="required:true" class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" />
                </td>
                <td class="TdTitle">合同结束时间</td>
                <td class="TdContentSearch">
                    <input type="text" id="ContractEnd" name="ContractEnd" style="border: 1px solid #cccccc; width: 140px; height: 18px;" data-options="required:true" class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">签约类型</td>
                <td class="TdContentSearch">
                    <select id="SignedType" name="SignedType" style="width: 145px; border: 1px #cccccc solid; height: 22px;" data-options="required:true" class="easyui-validatebox">
                        <option value=""></option>
                        <option value="新签">新签</option>
                        <option value="续签">续签</option>
                        <option value="终止">终止</option>
                    </select>
                </td>
                <td class="TdTitle"></td>
                <td class="TdContentSearch"></td>
            </tr>
            <tr>
                <td class="TdTitle">合同内容:</td>
                <td class="TdContentSearch" colspan="3">
                    <input id="ContractContent" name="ContractContent" type="text" class="easyui-validatebox" style="width: 600px; height: 40px;" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">备注:</td>
                <td class="TdContentSearch" colspan="3">
                    <input id="Remark" name="Remark" type="text" class="easyui-validatebox" style="width: 600px; height: 40px;" />
                </td>
            </tr>
        </table>
        <div style="width: 100%; height: 190px; background-color: #cccccc;" id="TableContainer"></div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
            <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" runat="server" />
            <input type="button" class="button" value="放弃返回" id="BtnClose" onclick="Close();" />
        </div>
        <input type="hidden" id="OpType" name="OpType" />
        <input type="hidden" id="CommID" name="CommID" />
        <input type="hidden" id="ExternalMaintenanceId" name="ExternalMaintenanceId" />
        <input type="hidden" id="Id" name="Id" />
        <script type="text/javascript">
            function Close() {
                HDialog.Close("");
            }

            //保存
            function Save() {
                if ($('#frmFrom').form('validate')) {
                    var data = $('#TableContainer').datagrid('getRows');
                    var EquipmentIds = $("#Id").val();
                    for (var j = 0; j < data.length; j++) {
                        EquipmentIds += ',' + data[j].EquipmentId;
                    }
                    $.tool.DataPost('CsEquipment', 'SaveEquipmentExternalMaintenance', $('#frmFrom').serialize() + '&EquipmentId=' + EquipmentIds,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data > '')
                                HDialog.Info(_Data);
                            else {
                                HDialog.Info('保存成功');
                                Close();
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }

            var column = [[
                { field: 'EquipmentId', title: 'EquipmentId', width: 1, align: 'left', hidden: true },
                { field: 'EquipmentName', title: '设备名称', width: 10, align: 'left', sortable: true },
                { field: 'EquipmentNO', title: '设备编码', width: 10, align: 'left', sortable: true },
            ]];

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        HDialog.Open('600', '450', '../EquipmentNew/SelEquipmentByComm.aspx?CommID=' + $("#CommID").val(), '选择设备', true, function callback(_Data) {
                            var str = _Data.split('|');
                            var data = $('#TableContainer').datagrid('getRows');
                            var IsHave = false;
                            for (var i = 0; i < str.length; i++) {
                                IsHave = false;
                                for (var j = 0; j < data.length; j++) {
                                    if (str[i].split(',')[0] == data[j].EquipmentId || str[i].split(',')[0] == $("#EquipmentId").val()) {
                                        IsHave = true;
                                    }
                                }
                                if (!IsHave) {
                                    $('#TableContainer').datagrid('appendRow', {
                                        EquipmentId: str[i].split(',')[0],
                                        EquipmentName: str[i].split(',')[1],
                                        EquipmentNO: str[i].split(',')[2]
                                    });
                                }
                            }
                        });
                    }
                }
                , '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        var rowindex = $("#TableContainer").datagrid("getRowIndex", row);
                        $("#TableContainer").datagrid("deleteRow", rowindex);
                    }
                }
            ];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetEquipmentJoinExternalMaintenance&ExternalMaintenanceId=' + $('#ExternalMaintenanceId').val() + '&EquipmentId=' + $('#Id').val(),
                    method: "get",
                    title: "关联其它设备(不会展示当前修改设备)",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    border: false,
                    pagination: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc"
                });
                $("#SearchDlg").dialog("close");
            }

            function LoadData() {
                $.tool.DataGet('CsEquipment', 'GetEquipmentExternalMaintenance', "page=1&Rows=10&ExternalMaintenanceId=" + $("#ExternalMaintenanceId").val() + "&EquipmentId=" + $("#Id").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        $.JQForm._Data = JSON.stringify(JSON.parse(_Data).rows[0]);
                        $.JQForm.FillForm();
                        $("#frmFrom").form('validate');
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            $(function () {
                $("#OpType").val(GetQueryString("OpType"));
                $("#Id").val(GetQueryString("EquipmentId"));
                $("#ExternalMaintenanceId").val(GetQueryString("ExternalMaintenanceId"));
                $("#CommID").val(GetQueryString("CommID"));
                if ($("#OpType").val() == 'edit') {
                    LoadData();
                }
                LoadList();
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
