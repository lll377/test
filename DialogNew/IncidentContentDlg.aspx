<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentContentDlg.aspx.cs" Inherits="M_Main.DialogNew.IncidentContentDlg" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 500px;
            height: 120px;
        }

        .SearchTable {
            width: 500px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }
    </style>
</head>
<body>
    <form id="frmForm">
        <input type="hidden" id="PhTypeID" name="PhTypeID" runat="server">
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">常用信息</td>
                    <td class="TdContent">
                        <input id="PhrasesCom" name="PhrasesCom" runat="server" maxlength="100">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">
        function InitFunction() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        }
        InitFunction();
        var column;
        column = [[
                { field: 'PhrasesCom', title: '常用信息', width: 100, align: 'left', sortable: true }
        ]];

        var toolbar = [
              {
                  text: '确定选择',
                  iconCls: 'icon-save',
                  handler: function () {
                      var row = $("#TableContainer").datagrid("getSelected");
                      if (row != null) {
                          HDialog.Close(row.PhrasesCom);
                      }
                  }
              }, {
                  text: '筛选',
                  iconCls: 'icon-search',
                  handler: function () {
                      $('#SearchDlg').parent().appendTo($("form:first"));
                      $('#SearchDlg').dialog('open');
                  }
              }, {
                  text: '新增',
                  iconCls: 'icon-add',
                  handler: function () {
                      HDialog.Open('650', '430', '../DialogNew/IncidentContentAdd.aspx?PhTypeID=' + $("#PhTypeID").val(), '新增报事内容', false, function callback(_Data) {
                          if (_Data == "1") {
                              $('#SearchDlg').parent().appendTo($("form:first"));
                              LoadList();
                          }
                      });
                  }
              }, {
                  text: '删除',
                  iconCls: 'icon-remove',
                  handler: function () {
                      var row = $("#TableContainer").datagrid("getSelected");
                      if (row != null) {
                          HDialog.Prompt('请确认是否删除该记录', function (r) {
                              $.tool.DataGet('IncidentUnit', 'IncidentContentDelete', "IncidentContentID=" + row.PhID,
                                  function Init() {
                                  },
                                function callback(_Data) {
                                    if (_Data == "true") {
                                        parent.layer.alert('删除成功');
                                        $('#SearchDlg').parent().appendTo($("form:first"));
                                        LoadList();
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {

                                })
                          });
                      }
                  }
              }
        ];

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Choose&Command=IncidentContent&' + $('#frmForm').serialize(),
                method: "get",
                title: '',
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                columns: column,
                fitColumns: true,
                remoteSort: false,
                singleSelect: true,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                rownumbers: true,
                sortOrder: "asc",
                border: false,
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: false,
                onLoadSuccess: function (data) {
                    $('#SearchDlg').dialog('close');
                }
            });
        }
        LoadList();

    </script>
</body>
</html>
