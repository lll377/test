<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HouseKeeper.aspx.cs" Inherits="M_Main.DialogNew.HouseKeeper" %>

<!DOCTYPE html>
<html>
<head>
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
            height: 240px;
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
    <form id="frmForm" runat="server">
        <input type="hidden" id="TypeID" name="TypeID" runat="server" />
        <input id="AllCheck" size="1" type="hidden" name="AllCheck" runat="server" />
        <input type="hidden" id="pdlist" name="pdlist" value="" />
        <div id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">岗位
                    </td>
                    <td class="TdContent">
                        <input type="text" id="RoleName" name="RoleName" />
                    </td>

                </tr>

                <tr>
                    <td colspan="2" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();
            var column;
            column = [[
                    { field: 'ck', checkbox: true },
                    { field: 'RoleName', title: '岗位名称', width: 100, align: 'left', sortable: true },
                    { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true, hidden: true },
                    { field: 'UserNames', title: '员工姓名', width: 100, align: 'left', sortable: true },
            ]];

            var toolbar = [
                  {
                      text: '确定选择',
                      iconCls: 'icon-save',
                      handler: function () {
                          var value = $('#AllCheck').val();
                          if (value == "") {
                              HDialog.Info('请选择');
                          }
                          else {

                              var UserInfo = value.split('|');
                              if (UserInfo.length > 0) {
                                  var mRoleCode = "", mRoleName = "", mUserNames = "";

                                  for (var i = 0; i < UserInfo.length; i++) {
                                      var User = UserInfo[i].split("•");

                                      if (User[0] != "") {
                                          mRoleCode = mRoleCode + "," + User[0].toString();
                                          mRoleName = mRoleName + "," + User[1].toString();
                                          mUserNames = mUserNames + "," + User[2].toString();
                                      }
                                  }
                                  mRoleCode = mRoleCode.substring(1, mRoleCode.length);
                                  mRoleName = mRoleName.substring(1, mRoleName.length);
                                  mUserNames = mUserNames.substring(1, mUserNames.length);

                                  var strRe = mRoleCode + "\t" + mRoleName + "\t" + mUserNames;

                                  HDialog.Close(strRe);
                              }


                          }
                      }

                  }, {
                      text: '筛选',
                      iconCls: 'icon-search',
                      handler: function () {
                          $('#SearchDlg').parent().appendTo($("form:first"));
                          $('#SearchDlg').dialog('open');
                      }
                  }
            ];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Choose&Command=HouseKeeper&' + $('#frmForm').serialize(),
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

                    },
                    onCheck: function (rowIndex, rowData) {
                        var dd = $('#AllCheck').val() + "|" + rowData.RoleCode + "•" + rowData.RoleName + "•" + rowData.UserNames;
                        $('#AllCheck').val(dd);

                    },
                    onUncheck: function (rowIndex, rowData) {
                        var ss = $('#AllCheck').val().split('|');
                        for (var i = 0; i < ss.length; i++) {
                            if (ss[i].indexOf(rowData.RoleCode) >= 0) {
                                ss.splice(i, 1);
                            }
                        }
                        valu = "";
                        for (var i = 0; i < ss.length; i++) {
                            valu += "|" + ss[i];
                        }
                        $('#AllCheck').val(valu.substr(1, valu.length));

                    },
                    onCheckAll: function (rows) {
                      
                        for (var i = 0; i < rows.length; i++) {
                            var data = "|" + rows[i].RoleCode + "•" + rows[i].RoleName + "•" + rows.UserNames;
                            var ss = $('#AllCheck').val();
                            if (ss.indexOf(data) < 0) {
                                var dd = $('#AllCheck').val() + "|" + data;
                                $('#AllCheck').val(dd);
                            }
                        }

                    },
                    onUncheckAll: function (rows) {
                        for (var i = 0; i < rows.length; i++) {

                            var ss = $('#AllCheck').val().split('|');
                            for (var i = 0; i < ss.length; i++) {


                                if (ss[i].indexOf(rows[i].RoleCode) >= 0) {
                                    ss.splice(i, 1);
                                }
                            }
                            valu = "";
                            for (var i = 0; i < ss.length; i++) {
                                valu += "|" + ss[i];
                            }
                            $('#AllCheck').val(valu.substr(1, valu.length));

                        }

                    }
                });
                $('#SearchDlg').dialog('close');
            }
            LoadList();

        </script>
    </form>
</body>
</html>

