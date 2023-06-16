<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GeneralStandardSetting.aspx.cs" Inherits="M_Main.ComprehensivePatrols.GeneralStandardSetting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>通用标准设置</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 800px;
            height: 160px;
        }

        .SearchTable {
            width: 800px;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

            .SearchTable tr td {
                color: #666;
                padding: 5px;
                background: #F8F8F8;
                border-right: 1px solid #E7EAEC;
                border-bottom: 1px solid #E7EAEC;
            }

            .SearchTable tr .TdTitle {
                width: 13%;
                text-align: right;
                background: #F8F8F8;
            }

            .SearchTable tr .TdContentSearch {
                width: 15%;
                text-align: left;
                background: #fff;
            }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }
    </style>

</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmForm" runat="server">
        <div id="DivContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">通用点位</td>
                    <td class="TdContentSearch">
                        <input type="text" id="SysPointName" class="easyui-textbox" readonly name="SysPointName" />
                        <input type="hidden" name="SysPointId" id="SysPointId" />
                    </td>
                    <td class="TdTitle">通用对象</td>
                    <td class="TdContentSearch">
                        <input type="text" id="SysObjName" class="easyui-textbox" readonly name="SysObjName" />
                        <input type="hidden" name="SysObjId" id="SysObjId" />
                    </td>
                    <td class="TdTitle">标准代码</td>
                    <td class="TdContentSearch">
                        <input type="text" id="Code" name="Code" class="easyui-textbox">
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">适用项目类型</td>
                    <td class="TdContentSearch">
                        <select id="CommType" runat="server" name="CommType" class="easyui-combobox" data-options="editable:false,multiple: true,panelHeight:'auto'" style="width: 98%;">
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
                    <td class="TdTitle">任务类型</td>
                    <td class="TdContentSearch">
                        <select id="TaskType" runat="server" name="TaskType" class="easyui-combobox" data-options="editable:false,multiple: true,panelHeight:'auto'" style="width: 98%;">
                        </select>
                    </td>
                    <td class="TdTitle">是否启用</td>
                    <td class="TdContentSearch">
                        <select id="IsUse" name="IsUse" class="easyui-combobox" data-options="editable:false,panelHeight:'auto',width:60" runat="server">
                            <option value=""></option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="btnSearch();">确定筛选</a>
                        <%--<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="btnClear();">清空</a>--%>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmForm').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript">
            //清空
            function btnClear() {
                $("#SysPointId").val("");
                $('#SysPointName').textbox('setValue', "");
                $("#SysObjId").val("");
                $('#SysObjName').textbox('setValue', "");
                $("#Code").textbox('setValue', "");
                $("#Professional").combobox('clear');
                $("#CommType").combobox('clear');
                $("#DType").combobox('clear');
                $("#IsUse").combobox('clear');
                $("#TaskType").combobox('clear');

            }
            //筛选
            function btnSearch() {
                LoadBind();
            }
            //初始化页面高度
            function InitTableHeight() {
                var h = $(window).height();
                $("#DivContainer").css("height", h + "px");
            }
            var column = [[
               { field: 'ck', checkbox: true },
               { field: 'Sort', title: '序号', width: 10, align: 'left', sortable: true },
               { field: 'TaskTypeName', title: '任务类型', width: 20, align: 'left', sortable: true },
               { field: 'PointName', title: '通用点位', width: 25, align: 'left', sortable: true },
               { field: 'ObjName', title: '通用对象', width: 25, align: 'left', sortable: true },
               { field: 'Code', title: '标准代码', width: 25, align: 'left', sortable: true },
               { field: 'ProfessionalName', title: '所属专业', width: 20, align: 'left', sortable: true },
               { field: 'DTypeName', title: '所属类别', width: 20, align: 'left', sortable: true },
               { field: 'Score', title: '所占分值', width: 15, align: 'left', sortable: true },
               { field: 'MaximumRiskLevelName', title: '最高风险等级', width: 20, align: 'left', sortable: true },
               { field: 'CommTypeName', title: '适用项目类型', width: 20, align: 'left', sortable: true },
               { field: 'IsUse', title: '是否启用', width: 15, align: 'left', sortable: true }
            ]];

            var toolbar =
               [
                      {
                          text: '新增',
                          iconCls: 'icon-add',
                          handler: function () {
                              HDialog.OpenWin('1200', '650', '../ComprehensivePatrols/GeneralStandardSettingEdit.aspx?OpType=insert', '新增通用标准', false, function callback(_Data) {
                                  if (_Data != "") {//**获得返回的参数信息
                                      LoadBind();
                                  }
                              });
                          }
                      }, '-',
                      {
                          text: '修改',
                          iconCls: 'icon-edit',
                          handler: function () {
                              var row = $("#DivContainer").datagrid("getSelected");
                              if (row == null) {
                                  HDialog.Info("请选择需要修改的数据!");
                                  return;
                              }
                              HDialog.OpenWin('1200', '650', '../ComprehensivePatrols/GeneralStandardSettingEdit.aspx?OpType=Edit&SysStandId=' + row.SysStandId, '修改通用标准', false, function callback(_Data) {
                                  if (_Data != "") {//**获得返回的参数信息
                                      LoadBind();
                                  }
                              });
                          }
                      }, '-',
                       {
                           text: '删除',
                           iconCls: 'icon-cancel',
                           handler: function () {
                               var rows = $("#DivContainer").datagrid("getChecked");
                               if (rows.length == 0) {
                                   HDialog.Info("请勾选需要删除的数据!");
                                   return false;
                               }
                               var IdList = "";
                               //获取id集合
                               for (var i = 0; i < rows.length; i++) {
                                   IdList += "‘" + rows[i].SysStandId + "’,";
                               }
                               if (IdList.length > 0) {
                                   IdList = IdList.substring(0, IdList.length - 1);
                               }
                               //删除标准
                               DelRecord(IdList);
                           }
                       }, '-',
                      {
                          text: '停用/启用',
                          iconCls: 'icon-no',
                          handler: function () {
                              var rows = $("#DivContainer").datagrid("getChecked");
                              if (rows.length == 0) {
                                  HDialog.Info("请勾选需要停用/启用的数据！");
                                  return false;
                              }
                              HDialog.Prompt('是否更改!', function () {
                                  var IdList = "";
                                  //获取id集合
                                  for (var i = 0; i < rows.length; i++) {
                                      IdList += "‘" + rows[i].SysStandId + "’,";
                                  }
                                  if (IdList.length > 0) {
                                      IdList = IdList.substring(0, IdList.length - 1);
                                  }
                                  $.tool.DataGet('CpComPatrols', 'updateIsUse', 'SysStandId=' + IdList,
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            if (_Data != "") {
                                                HDialog.Info(_Data);
                                            } else {
                                                HDialog.Info("停用/启用成功！");
                                                LoadBind();
                                            }
                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                              });
                          }
                      }, '-',
                      {
                          text: '导入标准',
                          iconCls: 'icon-page_white_excel',
                          handler: function () {
                              HDialog.OpenWin('900', '490', "../ComprehensivePatrols/GeneralStandardSettingImport.aspx?Ram=" + Math.random(), '导入标准', false, function callback(_Data) {
                                  if (_Data != "") {//**获得返回的参数信息
                                      LoadBind();
                                  }
                              });
                          }
                      }, '-',
                      {
                          text: '导出标准',
                          iconCls: 'icon-page_white_excel',
                          handler: function () {
                              var Rows = $("#DivContainer").datagrid("getRows");
                              if (Rows.length == 0) {
                                  HDialog.Info("没有通用标准数据导出!");
                                  return;
                              }
                              var parameterStr = "&SysPointId=" + $("#SysPointId").val() + "&SysObjId=" + $("#SysObjId").val() + "&Code=" + $("#Code").val() +
                                  "&CommType=" + $("#CommType").combobox("getValues") + "&Professional=" + $("#Professional").combobox("getValues") +
                                  "&DType=" + $("#DType").combobox("getValues") + "&TaskType=" + $("#TaskType").combobox("getValues") + "&IsUse=" + $('#IsUse').combobox("getValue");
                              window.open("GeneralStandardSettingOutPut.aspx?random=" + Math.random() + parameterStr);
                          }
                      }, '-',
                        {
                            text: '筛选',
                            iconCls: 'icon-search',
                            handler: function () {
                                $('#SearchDlg').parent().appendTo($("form:first"))
                                $('#SearchDlg').dialog('open');
                            }
                        }
               ];

            //加载数据 加载点位数据
            function LoadBind() {
                $("#DivContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: 50,
                    pageList: [50, 100, 300],
                    singleSelect: true,
                    checkOnSelect: true,
                    selectOnCheck: false,
                    remoteSort: false,
                    columns: column,
                    fitColumns: true,
                    rownumbers: true,
                    pagination: true,
                    toolbar: toolbar,
                    border: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CpComPatrols", "GetGeneralStandardSettingEditList", "DivContainer", param);
                    }
                });
                $("#SearchDlg").dialog("close");
            }


            //删除通用标准
            function DelRecord(SysStandId) {
                $.messager.confirm('确定', '是否确认删除勾选的通用标准?', function (r) {
                    if (r) {
                        $.tool.DataGet('CpComPatrols', 'DelGeneralStandardSettingEdit', 'SysStandId=' + SysStandId,
                         function Init() {
                         },
                         function callback(_Data) {
                             if (_Data != "") {
                                 HDialog.Info(_Data);
                             } else {
                                 HDialog.Info("删除成功！");
                                 LoadBind();
                             }
                         },
                         function completeCallback() {
                         },
                         function errorCallback() {
                         });
                    }
                });
            }
            //页面初始化
            $(function () {
                InitTableHeight();
                btnClear();
                LoadBind();
                //选择通用点位 
                $("#SysPointName").textbox('textbox').bind("click", function () {
                    HDialog.Open('600', '450', '../ComprehensivePatrols/MultiselectDialogNewSysPoint.aspx', '选择通用点位', true, function callback(_Data) {
                        if (_Data != "") {
                            var varObjects = _Data.split('◆');
                            $("#SysPointId").val(varObjects[0]);
                            $('#SysPointName').textbox('setValue', varObjects[1]);

                            //修改通用对象为空
                            $("#SysObjId").val("");
                            $('#SysObjName').textbox('setValue', "");
                        }
                    });
                });
                //选择通用对象
                $("#SysObjName").textbox('textbox').bind("click", function () {
                    if ($("#SysPointId").val() == "") {
                        HDialog.Info("请先选择通用点位");
                        return;
                    }
                    HDialog.Open('600', '450', '../ComprehensivePatrols/MultiselectDialogNewSysObj.aspx?SysPointId=' + $("#SysPointId").val(), '选择通用对象', true, function callback(_Data) {
                        if (_Data != "") {
                            var varObjects = _Data.split('◆');
                            $("#SysObjId").val(varObjects[0]);
                            $('#SysObjName').textbox('setValue', varObjects[1]);

                        }
                    });
                });
            });
        </script>
    </form>
</body>
</html>

