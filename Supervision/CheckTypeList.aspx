<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckTypeList.aspx.cs" Inherits="M_Main.Supervision.CheckTypeList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>检查类型</title>
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
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1000px; height: 225px; padding: 10px; overflow: hidden;">
            <table class="dlg_table">
                <tr>
                    <td class="title">所属单位:</td>
                    <td class="text" colspan="7">
                        <input id="OrganCode" name="OrganCode" class="easyui-textbox" data-options="
                            prompt: '请单击\'放大镜\'按钮进行操作!',
                            editable: false,
                            width:'863px',
                            tipPosition: 'bottom',
                            required: false,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelOrgan(); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).textbox('clear');
                                }
                            }]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">检查级别:</td>
                    <td class="text">
                        <input id="LevelId" name="LevelId" class="easyui-combobox" />
                    </td>
                    <td class="title">检查性质:</td>
                    <td class="text">
                        <input id="Nature" name="Nature" class="easyui-combobox" data-options="
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
                                {id: '1',text: '综合检查'},
                                {id: '2',text: '专项检查'},
                                {id: '3',text: '临时检查'}
                            ]" />
                    </td>
                    <td class="title">是否自检:</td>
                    <td class="text">
                        <input id="IsSelfChecking" name="IsSelfChecking" class="easyui-combobox" data-options="
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
                    <td class="title">检查类型:</td>
                    <td class="text">
                        <input type="text" id="TypeName" name="TypeName" class="easyui-textbox colspan" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">最低检查频次:</td>
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
                    <td class="title">检查是否评分:</td>
                    <td class="text">
                        <input id="IsScore" name="IsScore" class="easyui-combobox" data-options="
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
                    <td class="title">检查评分方式:</td>
                    <td class="text">
                        <input id="ScoreType" name="ScoreType" class="easyui-combobox" data-options="
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
                                {id: '1',text: '按标准得失分'},
                                {id: '2',text: '按样本加扣分'}
                            ]" />
                    </td>
                    <td class="title">是否允许甩项:</td>
                    <td class="text">
                        <input id="IsDiscard" name="IsDiscard" class="easyui-combobox" data-options="
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
                    <td colspan="8" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmForm').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript">
              //选择所属单位
              function SelOrgan() {
                  HDialog.Open('400', '350', '../Supervision/SelOrgan.aspx?IsCheck=1', "选择所属单位", false, function callback(_Data) {
                      if (_Data > '') {
                          var varObjects = _Data.split('◆');
                          $("#OrganCode").textbox('setValue', varObjects[0]);
                          $("#OrganCode").textbox('setText', varObjects[1]);
                      }
                  });
              }

              function LoadLevelId() {
                  $('#LevelId').combobox({
                      required: false,
                      panelHeight: '200',
                      validType: ['comboBoxValid[\'#LevelId\']'],
                      icons: [{
                          iconCls: 'icon-clear',
                          handler: function (e) {
                              $(e.data.target).combobox('clear');
                          }
                      }],
                      url: '/HM/M_Main/HC/DataGetControl.aspx',
                      method: 'get',
                      valueField: 'Id',
                      textField: 'Name',
                      onBeforeLoad: function (param) {
                          param.Method = 'DataGet';
                          param.Class = 'CSSupervision';
                          param.Command = 'GetDictionaryByDType';
                          param.DType = '检查级别';
                      },
                      onLoadSuccess: function () {
                          LoadList();
                      }
                  });
              }

              function InitTableHeight() {
                  var h = $(window).height();
                  $("#TableContainer").css("height", h + "px");
              }


              var column = [[
                  { field: 'Id', title: 'ID', width: 25, align: 'left', sortable: true, hidden: true },
                  { field: 'OrganName', title: '所属单位', width: 15, align: 'left', sortable: true },
                  { field: 'LevelName', title: '检查级别', width: 10, align: 'left', sortable: true },
                  { field: 'NatureName', title: '检查性质', width: 10, align: 'left', sortable: true },
                  { field: 'IsSelfCheckingName', title: '是否自检', width: 10, align: 'left', sortable: true },
                  {
                      field: 'TypeName', title: '检查类型', width: 50, align: 'left', sortable: true, formatter: function (value, row, index) {
                          var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Edit('" + row.Id + "')\">" + row.TypeName + "</a>";
                          return str;
                      }
                  },
                  { field: 'Frequency', title: '最低检查频次', width: 10, align: 'left', sortable: true },
                  { field: 'IsScoreName', title: '检查是否评分', width: 10, align: 'left', sortable: true },
                  { field: 'ScoreTypeName', title: '检查评分方式', width: 10, align: 'left', sortable: true },
                  { field: 'IsDiscardName', title: '是否允许甩项', width: 10, align: 'left', sortable: true }
              ]];

              function Edit(id) {
                  HDialog.Open('800', '600', '../Supervision/CheckTypeEdit.aspx?OpType=edit&Id=' + id, '编辑检查类型', true, function callback(_Data) {
                      LoadList();
                  });
              }

              var toolbar = [
                  {
                      text: '新增',
                      iconCls: 'icon-add',
                      handler: function () {
                          HDialog.Open('800', '600', '../Supervision/CheckTypeEdit.aspx?OpType=insert', '新增检查类型', true, function callback(_Data) {
                              LoadList();
                          });
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
                          $.tool.DataGet('CSSupervision', 'CheckTypeCanEdit', 'Id=' + row.Id,
                              function Init() {
                              },
                              function callback(_Data) {
                                  if (_Data == "0") {
                                      HDialog.Info("选中数据已设置检查标准，无法修改");
                                      return;
                                  }
                                  Edit(row.Id);
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
                          $.tool.DataGet('CSSupervision', 'CheckTypeCanEdit', 'Id=' + row.Id,
                              function Init() {
                              },
                              function callback(_Data) {
                                  if (_Data == "0") {
                                      HDialog.Info("选中数据已被模板引用或没有操作权限，无法删除");
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
                      text: '筛选',
                      iconCls: 'icon-search',
                      handler: function () {
                          $('#SearchDlg').parent().appendTo($("form:first"))
                          $('#SearchDlg').dialog('open');
                      }
                  }
              ];

              function DelRecord(Id) {
                  HDialog.Prompt('是否删除选中的数据!', function () {
                      $.tool.DataGet('CSSupervision', 'Del', 'TableName=Tb_Supervision_CheckType&Id=' + Id,
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
                      url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=GetCheckTypeList&' + $('#frmForm').serialize(),
                      method: "get",
                      loadMsg: '数据加载中,请稍候...',
                      nowrap: false,
                      pageSize: top.ListPageSize,
                      pageList: top.ListPageList,
                      columns: column,
                      fitColumns: true,
                      singleSelect: true,
                      pagination: true,
                      remoteSort: false,
                      rownumbers: true,
                      width: "100%",
                      toolbar: toolbar,
                      sortOrder: "asc",
                      border: 0
                  });
                  $("#SearchDlg").dialog("close");
              }

              $(function () {
                  InitTableHeight();
                  $('#SearchDlg').parent().appendTo($("form:first"))
                  $('#SearchDlg').dialog('open');
                  LoadLevelId();
              });
        </script>
    </form>
</body>
</html>
