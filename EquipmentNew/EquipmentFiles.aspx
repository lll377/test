<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EquipmentFiles.aspx.cs" Inherits="M_Main.EquipmentNew.EquipmentFiles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>设备档案登记</title>
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
        .SearchTable {
            width: 1000px;
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
                width: 8%;
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
    <input type="hidden" id="HidLoginCorpID" name="HidLoginCorpID" runat="server" />
    <div class="easyui-layout" id="Layout" data-options="fit:true">
        <div data-options="region:'west',border:true,width:300">
            <ul id="treeDemo" class="easyui-tree">
            </ul>
        </div>
        <div data-options="region:'center',border:true">
            <div style="width: 100%; height: 100%; background-color: #cccccc;" id="TableContainer">
            </div>
        </div>
    </div>
    <div id="dlg_search_point" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true">
        <form id="frmEq">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">设备系统</td>
                    <td class="TdContentSearch">
                        <select id="SystemId" runat="server" name="SystemId" data-options="editable:false,panelHeight:'auto',multiple:true" class="easyui-combobox">
                        </select>
                    </td>
                    <td class="TdTitle">设备级别</td>
                    <td class="TdContentSearch">
                        <input id="RankName" name="RankName" type="text" class="easyui-textbox" readonly />
                        <input type="hidden" name="RankId" id="RankId" />
                    </td>
                    <td class="TdTitle">设备空间</td>
                    <td class="TdContentSearch">
                        <input id="SpaceName" name="SpaceName" type="text" class="easyui-textbox" readonly />
                        <input type="hidden" id="SpaceId" name="SpaceId" />
                    </td>
                    <td class="TdTitle">设备名称</td>
                    <td class="TdContentSearch">
                        <input id="EquipmentName" name="EquipmentName" type="text" class="easyui-textbox" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">设备编号</td>
                    <td class="TdContentSearch">
                        <input id="EquipmentNO" name="EquipmentNO" type="text" class="easyui-textbox" /></td>
                    <td class="TdTitle">设备品牌</td>
                    <td class="TdContentSearch">
                        <input id="EBrand" name="EBrand" type="text" class="easyui-textbox" /></td>
                    <td class="TdTitle">设备型号</td>
                    <td class="TdContentSearch">
                        <input id="EModel" name="EModel" type="text" class="easyui-textbox" /></td>
                    <td class="TdTitle">安装位置</td>
                    <td class="TdContentSearch">
                        <input id="InstallPosition" name="InstallPosition" type="text" class="easyui-textbox" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">质保期限（年）</td>
                    <td class="TdContentSearch">
                        <input id="WarrantyPeriod" name="WarrantyPeriod" type="text" class="easyui-textbox" /></td>
                    <td class="TdTitle">安装单位</td>
                    <td class="TdContentSearch">
                        <input id="InstallCompany" name="InstallCompany" type="text" class="easyui-textbox" /></td>
                    <td class="TdTitle">厂家联系人</td>
                    <td class="TdContentSearch">
                        <input id="ManufacturersPerson" name="ManufacturersPerson" type="text" class="easyui-textbox" /></td>
                    <td class="TdTitle">厂家联系电话</td>
                    <td class="TdContentSearch">
                        <input id="ManufacturersTel" name="ManufacturersTel" type="text" class="easyui-textbox" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">投运日期</td>
                    <td class="TdContentSearch">
                        <input id="RunDate" name="RunDate" type="text" class="easyui-datebox" data-options="editable:false" /></td>
                    <td class="TdTitle">设备状态</td>
                    <td class="TdContentSearch">
                        <select id="Statue" name="Statue" class="easyui-combobox" data-options="editable:false,panelHeight:'auto'">
                            <option value="启用">启用</option>
                            <option value="停用">停用</option>
                            <option value="封存">封存</option>
                            <option value="报废">报废</option>
                        </select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmEq').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="LoginRoleCode" id="LoginRoleCode" runat="server" />
            <input type="hidden" name="CommID" id="CommID" runat="server" />
        </form>
    </div>
    <script language="javascript" type="text/javascript">

        //页面初始化
        $(function () {
            $('#SystemId').combobox('clear');
            $('#Statue').combobox('clear');
            InitTableHeight();
            LoadTree();
            //设备级别
            $('#RankName').textbox('textbox').bind("click", function () {
                if ($('#SystemId').combobox("getValues") == "") {
                    HDialog.Info("请先选择设备系统");
                    return;
                }
                var parameterStr = "?SystemID=" + $('#SystemId').combobox("getValues");
                HDialog.OpenWin('500', '450', '../EquipmentNew/SelRank.aspx' + parameterStr, '选择设备级别', false, function callback(_Data) {
                    if (_Data != "") {
                        var arrRet = JSON.parse(_Data);
                        $("#RankId").val(arrRet.id);
                        $("#RankName").textbox("setValue", arrRet.name);
                    }
                });
            });

            //设备空间名称
            $('#SpaceName').textbox('textbox').bind("click", function () {
                var SelectComm = $('#treeDemo').tree("getSelected");
                if (SelectComm == null) {
                    HDialog.Info("请选择项目");
                    return;
                }
                if ($('#SystemId').combobox("getValues") == "") {
                    HDialog.Info("请先选择设备系统");
                    return;
                }
                var parameterStr = "?SystemId=" + $('#SystemId').combobox("getValues") + "&CommId=" + SelectComm.attributes.CommID;

                HDialog.OpenWin('500', '450', '../EquipmentNew/SelSpace.aspx' + parameterStr, '选择设备空间', false, function callback(_Data) {
                    if (_Data != "") {
                        var arrRet = JSON.parse(_Data);
                        $("#SpaceId").val(arrRet.SpaceId);
                        $("#SpaceName").textbox("setValue", arrRet.SpaceName);
                    }
                });
            });
        });
        //初始化页面高度
        function InitTableHeight() {
            var h = $(window).height();
            var w = $(window).width();
            $('#Layout').height(h);
            $("#Layout").layout('resize', {
                height: h,
                width: w
            });
        }

        //加载树
        function LoadTree() {
            $("#treeDemo").tree({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                treeField: 'text',
                idField: 'id',
                lines: true,
                animate: true,
                border: false,
                loadMsg: '加载中,请稍侯...',
                onLoadError: function () {
                    LoadList();
                },
                onLoadSuccess: function (node, data) {
                    //默认选中第一个节点
                    if (data.length > 0) {
                        var node = $('#treeDemo').tree('find', data[0].id);
                        var firstnode = SelectFirsLeafNode(node)
                        if (firstnode) {
                            $('#treeDemo').tree('select', firstnode.target);
                        } else {
                            LoadList();
                        }
                    }
                },
                onBeforeLoad: function (row, param) {
                    param.Method = "DataPost";
                    param.Class = "CsEquipment";
                    param.Command = "DepMenuList";
                    //控制用户权限
                    param.SelRoleCode = $("#LoginRoleCode").val();
                },
                onBeforeSelect: function (node) {
                    if (!$(this).tree('isLeaf', node.target) || node.attributes.CommID == 0) {
                        return false;
                    }
                },
                onSelect: function (node) {
                    $('#frmEq').form('clear');
                    $('#CommID').val(node.attributes.CommID);
                    LoadList();
                }
            });
        }

        //递归 获取第一个子节点
        function SelectFirsLeafNode(FirstNode) {
            var ItemFirstNode = null;
            function dd(node) {
                if (!$('#treeDemo').tree("isLeaf", node.target)) {
                    var Children = $('#treeDemo').tree("getChildren", node.target);
                    dd(Children[0]);
                } else {
                    ItemFirstNode = node;
                }
            }
            var i = 9999;
            while (1 < i) {
                if (ItemFirstNode == null) {
                    dd(FirstNode);
                } else {
                    break;
                }
                i = i - 1;
            }
            return ItemFirstNode;
        }

        var column = [[
            { field: 'ck', checkbox: true },
            { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true },
            { field: 'SystemName', title: '设备系统', width: 100, align: 'left', sortable: true },
            { field: 'SpaceName', title: '设备空间名称', width: 100, align: 'left', sortable: true },
            { field: 'RankName', title: '设备级别', width: 100, align: 'left', sortable: true },
            { field: 'EquipmentName', title: '设备名称', width: 100, align: 'left', sortable: true },
            { field: 'EquipmentNO', title: '设备编号', width: 60, align: 'left', sortable: true },
            //{ field: 'EBrand', title: '设备品牌', width: 100, align: 'left', sortable: true, hidden: true },
            //{ field: 'EModel', title: '设备型号', width: 60, align: 'left', sortable: true, hidden: true },
            //{ field: 'InstallPosition', title: '安装位置', width: 100, align: 'left', sortable: true, hidden: true },
            //{ field: 'WarrantyPeriod', title: '质保期限（年）', width: 80, align: 'left', sortable: true, hidden: true },
            //{ field: 'InstallCompany', title: '安装单位', width: 100, align: 'left', sortable: true, hidden: true },
            //{ field: 'ManufacturersPerson', title: '联系人', width: 60, align: 'left', sortable: true, hidden: true },
            //{ field: 'ManufacturersTel', title: '联系电话', width: 100, align: 'left', sortable: true, hidden: true },
            //{
            //    field: 'RunDate', title: '投运日期', width: 80, align: 'left', sortable: true, hidden: true, formatter: function (value, row, index) {
            //        var str = formatDate(row.RunDate, 'yyyy-MM-dd');
            //        return str;
            //    }
            //},
            { field: 'Statue', title: '异动状态', width: 50, align: 'left', sortable: true },
            { field: 'MaintenanceStatus', title: '维保状态', width: 50, align: 'left', sortable: true },
            {
                field: 'QrImg', title: '查看二维码', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<a class=\"\" onclick=\"QrImgView('" + row.EquipmentId + "','" + row.CommName + "','" + row.EquipmentName + "');\" href=\"javascript:void(0)\">查看二维码</a>";
                    return str;
                }
            },
            {
                field: 'FileCount', title: '照片', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<a class=\"\" onclick=\"btnUpdateFile('" + row.EquipmentId + "')\" href=\"javascript:void(0)\">" + value + "</a>";
                    return str;
                }
            }
        ]];

        //查看二维码
        function QrImgView(id, CommName, EquipmentName) {
            var param = $.param({ "KeyId": id, "CommName": CommName, "EquipmentName": EquipmentName });
            HDialog.OpenWin('360', '360', '../EquipmentNew/QrImg.aspx?' + param, '查看二维码', false, function callback(_Data) {
            });
            //HDialog.OpenWin('360', '400', '../EquipmentNew/SpaceShowQrCode.aspx?SpaceId=' + id + "&SpaceName=" + escape(spaceName) + "&SystemIdName=" + escape(systemIdName) + "&SpaceAddress=" + escape(spaceAddress), '查看二维码', true, function callback(_Data) {
            //});
        }
        //查看附件  只查看设备的附件 不查看相关资料附件
        function btnUpdateFile(Id) {
            HDialog.OpenWin('600', '340', '../EquipmentNew/EquipmentUploadView.aspx?KeyId=' + Id + "&changBS=view", '设备照片', false, function callback(_Data) {
            });

        }
        var toolbar = [
            {
                text: '新增设备',
                iconCls: 'icon-add',
                handler: function () {
                    var SelectComm = $('#treeDemo').tree("getSelected");
                    if (SelectComm == null) {
                        HDialog.Info("请选择管理项目");
                        return;
                    }
                    EditEquipmentFiles("insert", "", SelectComm.attributes.CommID, '新增设备档案', '');
                }
            }, '-', {
                text: '复制设备',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row == null) {
                        HDialog.Info("请选择需要复制的设备数据");
                    }
                    EditEquipmentFiles("copy", '', row.CommID, '复制设备', row.EquipmentId);
                }
            }, '-', {
                text: '修改设备',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row == null) {
                        HDialog.Info("请选择需要修改的设备数据");
                    }
                    EditEquipmentFiles("edit", row.EquipmentId, row.CommID, '修改设备档案', '');
                }
            }, '-', {
                text: '删除设备',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getChecked");
                    if (row.length == 0) {
                        HDialog.Info("请勾选至少一条设备数据！");
                        return;
                    }
                    var IdList = "";
                    for (var i = 0; i < row.length; i++) {
                        IdList += '‘' + row[i].EquipmentId + '’,';
                    }
                    if (IdList.length > 0) {
                        IdList = IdList.substring(IdList, IdList.length - 1);
                    }
                    DelRecord(IdList);
                }
            }, '-', {
                text: '导出设备',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var Rows = $("#TableContainer").datagrid("getRows");
                    if (Rows.length == 0) {
                        HDialog.Info("没有需要导出的设备数据");
                        return;
                    }
                    window.open("EquipmentFilesoutput.aspx?random=" + Math.random() + $('#frmEq').serialize());
                }
            }, '-', {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search_point').dialog('open');
                }
            }, '-', {
                text: '打印二维码',
                iconCls: 'icon-print',
                handler: function () {
                    var rows = $("#TableContainer").datagrid("getChecked");
                    if (rows.length == 0) {
                        HDialog.Info("请勾选至少一条设备数据！");
                        return;
                    }
                    var IdList = "";
                    for (var i = 0; i < rows.length; i++) {
                        IdList += "'" + rows[i].EquipmentId + "',";
                    }
                    if (IdList.length > 0) {
                        IdList = IdList.substring(IdList, IdList.length - 1);
                    }

                    var LoginCorpID = $("#HidLoginCorpID").val();
                    if (LoginCorpID == "1906") {
                           var formData = new FormData();
                        formData.append("LoginCorpID", LoginCorpID);
                        formData.append("IdList", IdList);
                        formData.append("OpType", 1);
                         $.ajax({
                             type: "POST",
                             url: "/HM/M_Main/QrCodeManage/WrCodeObj.aspx",
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
                          });
                        //window.open("../QrCodeManage/WrCodeObj.aspx?IdList=" + IdList + "&LoginCorpID=" + LoginCorpID + "&OpType=1");
                    } else {
                        window.open("../QrCodeManage/QrCodeModel.aspx?IdList=" + IdList + "&LoginCorpID=" + LoginCorpID);
                    }

                }
            }
        ];
        //编辑设备档案
        function EditEquipmentFiles(OpType, id, CommID, title, CopyId) {
            var h = $(window).height() + 100;
            var w = $(window).width() + 150;
            var parameterStr = "?OpType=" + OpType + "&EquipmentId=" + id + "&CommID=" + CommID + "&changBS=" + OpType + "&CopyId=" + CopyId;
            HDialog.OpenWin(w, h, '../EquipmentNew/EquipmentFromTabs.aspx' + parameterStr, title, false, function callback(_Data) {
                LoadList();
            });
        }
        //删除设备
        function DelRecord(Ids) {
            $.messager.confirm('确定', '是否删除该设备数据?', function (r) {
                if (r) {
                    $.tool.DataGet('CsEquipment', 'DelEquipmentInformation', 'Ids=' + Ids,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                HDialog.Info("删除成功");
                                LoadList();
                            } else {
                                HDialog.Info(_Data);
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            });
        }
        //加载页面列表
        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetEquipmentList&' + $('#frmEq').serialize(),
                method: "get",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                pageSize: 50,
                pageList: [50, 100, 300],
                columns: column,
                fitColumns: true,
                pagination: true,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: false,
                rownumbers: true,
                border: false,
                width: "100%",
                toolbar: toolbar,
                remoteSort: false,
                rowStyler: function (index, row) {
                    if (row.RunDate == '' || row.RunDate == undefined || row.RunDate == null || row.ServiceYear == '' || row.ServiceYear == undefined || row.ServiceYear == null) {
                        return;
                    }
                    //RunDate:投运日期；ServiceYear:使用年限
                    var date = new Date(row.RunDate);
                    var RunDate = date.setFullYear(date.getFullYear() + row.ServiceYear);
                    var day = new Date();
                    day.setTime(day.getTime());
                    var s2 = new Date(day);
                    if (s2 < RunDate) {
                        return 'color:red;';
                    }
                }
            });
            $("#dlg_search_point").dialog("close");
        }
    </script>
</body>
</html>

