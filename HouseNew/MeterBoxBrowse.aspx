<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeterBoxBrowse.aspx.cs" Inherits="M_Main.HouseNew.MeterBoxBrowse" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">

        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 400px; height: 130px;">
            <%--<input class="button" id="btngenerate"  type="button" value="生成二维码" name="btngenerate" runat="server" />--%>

            <table class="DialogTable">



                <%--     <tr>
                <td class="TdTitle">序号</td>
                <td class="TdContent">
                    <input id="MeterBoxNum"   maxlength="20"  size="10" name="MeterBoxNum" runat="server" /> 
                </td> 
            </tr>--%>
                <tr>
                    <td class="TdTitle">表箱名称</td>
                    <td class="TdContentSearch">
                        <input id="MeterBoxName" type="text" size="17" name="MeterBoxName" runat="server" /></td>
                </tr>

                <tr>
                    <td class="TdTitle">表箱类型</td>
                    <td class="TdContentSearch">
                        <select id="MeterBoxType" runat="server" style="width: 50%" name="MeterBoxType"></select>
                    </td>
                </tr>

                <tr>
                    <td align="center" colspan="2">
                        <input class="button" id="btnSave"
                            type="button" value="查询" name="btnSave" runat="server" />
                    </td>

                </tr>
            </table>
        </div>
        <div id="SearchDlg2" title=""
            style="width: 640px; height: 150px;">
        </div>

        <input type="hidden" name="EQC" id="EQC" value="" runat="server" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#SelectRoomID').css("width", 150 + 'px');
            }
            InitFunction();
            var column = [[
                { field: 'MeterBoxID', title: 'MeterBoxID', align: 'left', sortable: true, hidden: true },
                { field: 'ck', checkbox: true },
                { field: 'MeterBoxNum', title: '序号', width: 20, align: 'center', sortable: true },
                {
                    field: 'MeterBoxName', title: '表箱名称', width: 100, align: 'left', sortable: true
                    , formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改表箱','edit','" + row.MeterBoxID + "');\">" + row.MeterBoxName + "</a>";
                        return str;
                    }
                },
                { field: 'MeterBoxAddress', title: '表箱位置', width: 100, align: 'left', sortable: true },
                { field: 'MeterBoxTypeName', title: '表箱类型', width: 100, align: 'left', sortable: true },
                {
                    field: 'MeterBoxEQCodesPath', title: '', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        //     var strTitle = (row.EQCodesPath == undefined) ? "生成二维码" : "查看二维码";
                        if (row.MeterBoxEQCodesPath == "" && row.MeterBoxEQCodesPath == "") {
                            str = "<a class=\"HrefStyle\"  href='javascript:void(0);' onclick=\"QrSave('" + row.MeterBoxID + "');\">生成二维码</a>";
                        } else {
                            str = "<a class=\"HrefStyle\"  href='javascript:void(0);' onclick=\"QrImages('" + row.MeterBoxEQCodesPath + "');\">查看二维码</a>";

                        }
                        return str;
                    }
                },
                {
                    field: '查看表记', title: '查看表计', width: 50, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        str = "<a class=\"HrefStyle\"  href='javascript:void(0);' onclick=\"LookAtTheForm('" + row.MeterBoxID + "');\">查看表计</a>";
                        return str;
                    }
                }
            ]];

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        ViewDetail('新增表箱', "Insert", 0);
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var IdList = GetDateGridCheckId();
                        DelRecord(IdList);
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
                    text: '生成二维码',
                    iconCls: 'icon-save',
                    handler: function () {


                        var rows = $('#TableContainer').datagrid('getChecked');
                        if (rows == "") {
                            HDialog.Info('请选择要生成的二维码!');
                        } else {
                            QrSaveS();
                        }
                    }
                }, '-', {
                    text: '打印二维码',
                    iconCls: 'icon-print',
                    handler: function () {
                        var IdList = GetDateGridCheckId();
                        window.open("../HouseNew/MeterBoxBrowseQRCodeList.aspx?IdList=" + IdList);
                    }
                }
            ];
            //获取单选或者批量的ID
            function GetDateGridCheckId() {
                var str = "";
                var row = $("#TableContainer").datagrid("getChecked");
                if (row.length > 0) {
                    for (var i = 0; i < row.length; i++) {
                        str += "," + row[i].MeterBoxID;
                    }
                    if (str.length > 0)
                        str = str.substr(1, str.length - 1);
                }
                else {
                    var rows = $("#TableContainer").datagrid("getSelected");
                    str = rows.MeterBoxID;
                }
                return str;
            }


            function LoadList() {

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
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
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("Meter", "MeterBox", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    }
                });

            }
            LoadList();

            function DelRecord(Id) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('Meter', 'MeterBoxDelete', 'MeterBoxID=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {

                                if (_Data != "true") {

                                    HDialog.Info('删除失败!' + _Data);
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
            $('#btnSave').click(function () {
                LoadList();
            });

            //新增
            function ViewDetail(title, OpType, MeterBoxID) {
                //var w = $(window).width();
                //var h = $(window).height(); 
                var w = 550;
                var h = 300;
                HDialog.Open(w, h, '../HouseNew/MeterBoxManage.aspx?OpType=' + OpType + '&MeterBoxID=' + MeterBoxID, title, false, function callback(_Data) {
                    LoadList();
                });
            }

            //批量保存二维码
            function QrSaveS() {

                var ids = [];

                var rows = $('#TableContainer').datagrid('getChecked');



                var names = [];
                var strmids = "";
                $.each(rows, function (index, item) {

                    names.push(item.MeterBoxID);
                    //strmids = strmids + item.MeterBoxID+',' 
                });

                $.ajax({
                    url: 'MeterBoxHelp.aspx',
                    type: 'POST',
                    async: true,
                    data: {
                        mid: names.toString(), stype: "2"
                    },
                    timeout: 5000,
                    dataType: 'text',
                    success: function (result) {

                        if (result != "" && result != null) {
                            HDialog.Info("二维码生成成功");
                        } else {
                            HDialog.Info("二维码生成失败");
                        }
                    }

                })

                LoadList();
            }

            //二维码
            function QrSave(smid) {

                $.ajax({
                    url: 'MeterBoxHelp.aspx',
                    type: 'POST',
                    async: true,
                    data: {
                        mid: smid, stype: "1"
                    },
                    timeout: 5000,
                    dataType: 'text',
                    success: function (result) {

                        if (result != "" && result != null) {
                            HDialog.Info("二维码生成成功");
                        } else {
                            HDialog.Info("二维码生成失败");
                        }
                    }

                })

                LoadList();
            }
            //查看二维码
            function QrImages(imgUrl) {
                if (imgUrl == "" || imgUrl == null || imgUrl == undefined) {
                    HDialog.Info("请先生成二维码");
                    return;
                }
                HDialog.Open('500', '390', '../EquipmentNew/QrImgMeterBox.aspx?QrImg=' + imgUrl, '查看二维码', true, function callback(_Data) {
                });
            }

            //
            function LookAtTheForm(MeterBoxName) {
                HDialog.Open('700', '450', '../HouseNew/MeterBoxBrowse_xxx.aspx?MeterBoxName=' + MeterBoxName, '查看表计', true, function callback(_Data) {
                });
            }
        </script>
    </form>
</body>
</html>

