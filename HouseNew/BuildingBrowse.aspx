<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuildingBrowse.aspx.cs" Inherits="M_Main.HouseNew.BuildingBrowse" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.8.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />

</head>
<body>
    <form id="frmForm" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 400px; height: 100px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td width="25%">楼宇名称
                    </td>
                    <td width="75%">
                        <input id="BuildName" style="width: 136px" size="17" name="BuildName" maxlength="50" />
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'BuildID', title: 'BuildID', width: 50, align: 'left', sortable: true, hidden: true },

                {
                    field: 'BuildName', title: '楼宇名称', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = value;
                        if (row.IsLock == 0) {
                            str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改楼宇','update'," + row.BuildID + ");\">" + row.BuildName + "</a>";
                        }
                        return str;
                    }
                },
                { field: 'RegionName', title: '组团区域', width: 100, align: 'left', sortable: true },
                { field: 'FloorsNum', title: '总层数', width: 100, align: 'left', sortable: true },
                { field: 'UnitNum', title: '单元数', width: 100, align: 'left', sortable: true },
                { field: 'PerFloorNum', title: '每层每单元户数', width: 100, align: 'left', sortable: true },
                { field: 'V_HouseholdsNum', title: '总户数', width: 100, align: 'left', sortable: true },
                { field: 'V_BuildArea', title: '总建筑面积', width: 100, align: 'left', sortable: true },
                { field: 'V_PropertyRights', title: '产权性质', width: 100, align: 'left', sortable: true },
                { field: 'V_PropertyUses', title: '使用性质', width: 100, align: 'left', sortable: true },
                { field: 'BuildUserName', title: '楼栋管家', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'AppUserName', title: '楼栋管家', width: 100, align: 'left', sortable: true },
                { field: 'Tel', title: '管家电话', width: 100, align: 'left', sortable: true },
                {
                    field: 'IsLock', title: '是否锁定', width: 50, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "否";
                        if (value == 1) {
                            str = "是";
                        }
                        return str;
                    }
                }
            ]];


            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var toolbar = [
                {
                    text: '新增楼宇',
                    iconCls: 'icon-add',
                    handler: function () {
                        ViewDetail("新增楼宇信息", 'add', 0);
                    }
                }, '-',
                {
                    text: '删除楼宇',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid('getChecked');
                        if (rows == "") {
                            HDialog.Info('请勾选需要删除的楼宇!');
                            return;
                        }
                        else {
                            var SelBuildID = "";
                            $.each(rows, function (key, val) {
                                SelBuildID += rows[key]["BuildID"] + ",";
                            });
                            SelBuildID = SelBuildID.substr(0, SelBuildID.length - 1);
                            $.tool.DataPostChk('frmForm', 'ResourceBaseAuditing', 'CheckLock', '&KeyIDValues=' + SelBuildID + '&CheckType=Building',
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data == "true") {
                                        HDialog.Info('包含已被锁定的记录不能删除楼宇!');
                                    } else {
                                        DelRecord(SelBuildID);
                                    }
                                }
                            );
                        }
                    }
                }, '-',
                {
                    text: '设置管家',
                    iconCls: 'icon-save',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid('getChecked');
                        if (rows == "") {
                            HDialog.Info('请勾选要设置管家的楼宇!');
                            return;
                        }
                        else {
                            var SelBuildSNum = "";
                            var SelBuildName = "";
                            var SelBuildID = "";
                            $.each(rows, function (key, val) {
                                SelBuildSNum += rows[key]["BuildSNum"] + ",";
                                SelBuildName += rows[key]["BuildName"] + ",";
                                SelBuildID += rows[key]["BuildID"] + ",";
                            });
                            SelBuildSNum = SelBuildSNum.substr(0, SelBuildSNum.length - 1);
                            SelBuildName = SelBuildName.substr(0, SelBuildName.length - 1);
                            SelBuildID = SelBuildID.substr(0, SelBuildID.length - 1);
                            $.tool.DataPostChk('frmForm', 'ResourceBaseAuditing', 'CheckLock', '&KeyIDValues=' + SelBuildID + '&CheckType=Building',
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data == "true") {
                                        HDialog.Info('包含已被锁定的记录不能设置管家!');
                                    } else {
                                        ViewDetail2("设置管家", 'add', SelBuildSNum, SelBuildName);
                                    }
                                }
                            );
                        }
                    }
                }, '-',
                {
                    text: '删除管家',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid('getChecked');
                        if (rows == "") {
                            HDialog.Info('请勾选需要删除的管家!');
                            return;
                        }
                        else {
                            var SelIID = "";
                            var SelBuildID = "";
                            $.each(rows, function (key, val) {
                                SelIID += rows[key]["IID"] + ",";
                                SelBuildID += rows[key]["BuildID"] + ",";
                            });
                            SelIID = SelIID.substr(0, SelIID.length - 1);
                            SelBuildID = SelBuildID.substr(0, SelBuildID.length - 1);
                            $.tool.DataPostChk('frmForm', 'ResourceBaseAuditing', 'CheckLock', '&KeyIDValues=' + SelBuildID + '&CheckType=Building',
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data == "true") {
                                        HDialog.Info('包含已被锁定的记录不能删除管家!');
                                    } else {
                                        DelRecord2(SelIID);
                                    }
                                }
                            );
                        }
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                        $("#BuildName").val("");
                    }
                }, '-',
                {
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        window.location.href = "../HouseNew/BuildingBrowseCreExcel.aspx";
                    }
                }
            ];


            function DelRecord(Id) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('Building', 'delete', 'BuildID=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {

                                if (_Data != "true") {
                                    if (_Data != "false") {
                                        HDialog.Info(_Data);
                                    }
                                    else { HDialog.Info('删除失败!'); }

                                }
                                else {
                                    HDialog.Info('删除成功!');
                                }
                                LoadList();

                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function DelRecord2(Id) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('HouseKeeper', 'DelBuild', 'IID=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                var data = _Data.split('|');
                                if (data[0] == "true") {
                                    HDialog.Info('删除成功');
                                    LoadList();
                                }
                                else { HDialog.Info('删除失败'); }

                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Building&Command=search&' + $("#frmForm").serialize(),
                    method: "get",
                    title: '',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
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
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                        if (data.rows.length > 0) {
                            //循环判断操作为新增的不能选择
                            for (var i = 0; i < data.rows.length; i++) {
                                //根据operate让某些行不可选
                                if (data.rows[i].IsLock == "1") {
                                    $("input[type='checkbox']")[i + 1].disabled = true;
                                }
                            }
                        }
                    }
                });

            }

            LoadList();

            function ViewDetail(title, OpType, ID) {


                HDialog.Open('850', '300', '../HouseNew/BuildingManage.aspx?BuildID=' + ID + '&OpType=' + OpType, title, false, function callback(_Data) {
                    LoadList();
                });
            }

            function ViewDetail2(title, OpType, ID, BuildName) {

                HDialog.Open('620', '250', '../HouseNew/BuildHouseKeeperManage.aspx?BuildSNum=' + ID + '&BuildName=' + BuildName + '&OpType=' + OpType, title, false, function callback(_Data) {
                    LoadList();
                });
            }

        </script>
    </form>
</body>
</html>
