<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PointList.aspx.cs" Inherits="M_Main.ComprehensivePatrols.PointList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>项目点位</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <style type="text/css">
        select {
            min-width: 50px;
        }
    </style>
</head>
<body>
    <input type="hidden" id="HidLoginCorpID" name="HidLoginCorpID" runat="server" />
    <input type="hidden" name="LoginRoleCode" id="LoginRoleCode" runat="server" />
    <input type="hidden" name="CommID" id="CommID" value="-1" />
    <input type="hidden" name="PointID" id="PointID" value="-1" />
    <input type="hidden" name="SelectSysPointId" id="SelectSysPointId" value="-1" />
    <input type="hidden" name="CommName" id="CommName" />
    <input type="hidden" name="CommType" id="CommType" value="00000000-0000-0000-0000-000000000000" />
    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',border:true,width:300,title:'项目列表'">
            <ul id="treeOrgan" class="easyui-tree"></ul>
        </div>
        <div id="layout_center" data-options="region:'center',border:true,title:'点位列表-请选择项目!',">
            <table id="tgPoint" border="0" cellspacing="0" cellpadding="0"></table>
            <table id="tgObject" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
    </div>
    <div id="dlg_search_point" class="easyui-dialog" title="筛选" style="width: 800px; height: 180px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frmPoint">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>点位编号</span></td>
                    <td class="text">
                        <input id="PointCode" name="PointCode" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>点位名称</span></td>
                    <td class="text">
                        <input id="PointName" name="PointName" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>点位地址</span></td>
                    <td class="text">
                        <input id="Addr" name="Addr" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>任务类型</span></td>
                    <td class="text">
                        <input id="TaskType" name="TaskType" class="easyui-combobox" tasktypedictionary="true" bindid="ID" bindname="Name" typename="任务类型" data-options="required:false,multiple: true,editable:false,validType:['comboBoxValidMultiple[\'#TaskType\']'],
                        icons:[{iconCls:'icon-clear',
                        handler: function(e){
                            $(e.data.target).combobox('clear');
                        }}]" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>通用点位</span></td>
                    <td class="text" colspan="3">
                        <input id="SysPointId" name="SysPointId" class="easyui-textbox" data-options="prompt:'请单击右侧\'请选择\'按钮进行操作!',editable:false,tipPosition:'top',required:false,multiline:false,width:'98%',
                        buttonText:'请选择',buttonIcon:'icon-add',onClickButton:function(){GetSysPointId();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmPoint').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dlg_search_object" class="easyui-dialog" title="筛选" style="width: 300px; height: 130px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frmObject">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>对象名称</span></td>
                    <td class="text">
                        <input id="ObjName" name="ObjName" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="$('#tgObject').datagrid('reload'); $('#dlg_search_object').dialog('close');">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmObject').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script language="javascript" type="text/javascript">

        //通用点位
        function GetSysPointId() {
            HDialog.Open('600', '450', '../ComprehensivePatrols/DialogNewSysPoint.aspx?Single=false', '选择通用点位', true, function callback(data) {
                var model = data.split('|');
                $("#SysPointId").textbox('setValue', model[0]);
                $("#SysPointId").textbox('setText', model[1]);
            });
        }

        $(function () {
            InitTableHeight();
            LoadOrganTree();

        });
        function InitDataGrid() {
            LoadListPoint();
            $("#PointID").val('-1');
            LoadListObject('请选择点位!');
        };
        function InitTableHeight() {
            var h = $('#layout_center').height();
            $("#tgPoint").css("height", h * 5 / 9 + "px");
            $("#tgObject").css("height", h * 4 / 9 + "px");
        }

        //机构
        function LoadOrganTree() {
            $("#treeOrgan").tree({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                treeField: 'text',
                idField: 'id',
                lines: true,
                animate: true,
                border: false,
                loadMsg: '加载中,请稍侯...',
                onLoadSuccess: function (node, data) {
                    if (data.length > 0) {
                        var dataJson = $("#treeOrgan").tree("getChildren");
                        $.each(dataJson, function (i, itemNode) {
                            if ($("#treeOrgan").tree("isLeaf", itemNode.target)) {
                                //默认选中第一个节点
                                $("#treeOrgan").tree('select', itemNode.target);
                                return false;
                            }
                        });
                    } else {
                        InitDataGrid();
                    }
                },
                onLoadError: function () {
                    InitDataGrid();
                },
                onBeforeLoad: function (row, param) {
                    param.Method = "DataPost";
                    param.Class = "CpComPatrols";
                    param.Command = "DepMenuList";
                    //控制用户权限
                    param.SelRoleCode = $("#LoginRoleCode").val();

                },
                onBeforeSelect: function (node) {
                    if (!$(this).tree('isLeaf', node.target) || node.attributes.CommID == 0) {
                        return false;
                    }
                },
                onSelect: function (row) {
                    $('#layout_center').panel('setTitle', '点位列表-' + row.text);
                    $("#CommID").val(row.attributes.CommID);
                    $("#CommName").val(row.text);
                    if (isValueNull(row.attributes.CommType)) {
                        $("#CommType").val(row.attributes.CommType);
                    } else {
                        $("#CommType").val("00000000-0000-0000-0000-000000000000");
                    }

                    $('#frmPoint').form('clear');
                    $('#frmObject').form('clear');
                    InitDataGrid();
                }
            });
        }




        //--------------------------------------------------------------- 通用点位---------------------------------------------------
        var toolbarPoint = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    if ($("#CommID").val() == "-1") {
                        $.messager.alert('温馨提示', '请选择项目!');
                        return;
                    }
                    EditPoint("新增", '');
                }
            }, '-',
            {
                text: '编辑',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#tgPoint").datagrid("getSelected");
                    if (row) {
                        EditPoint('编辑', row.PointId);
                    } else {
                        $.messager.alert("温馨提示", '请选择一行需要编辑的数据!');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var rows = $("#tgPoint").datagrid("getChecked");
                    if (rows.length > 0) {
                        var idList = "";
                        for (var i = 0; i < rows.length; i++) {
                            idList += rows[i].PointId + ',';
                        }
                        idList = idList.substr(0, idList.length - 1);
                        DelPoint(idList);
                    } else {
                        $.messager.alert("温馨提示", '请选择需要删除的数据!');
                    }
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search_point').dialog('open');
                }
            }, '-',
            {
                text: '导入点位',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    if ($("#CommID").val() == "-1") {
                        $.messager.alert('温馨提示', '请选择项目!');
                        return;
                    }
                    HDialog.OpenWin('1024', '500', "../ComprehensivePatrols/PointObjectExcel.aspx?Ram=" + Math.random() + "&CommID=" + $("#CommID").val(), '导入点位数据', false, function callback(_Data) {
                        InitDataGrid();
                    });
                }
            }, '-',
            {
                text: '打印二维码(未勾选时默认打印全部二维码)',
                iconCls: 'icon-print',
                handler: function () {
                    if ($("#CommID").val() == "-1") {
                        $.messager.alert('温馨提示', '请选择项目!');
                        return;
                    }
                    var idList = "";
                    var rows = $("#tgPoint").datagrid("getChecked");
                    if (rows.length > 0) {
                        for (var i = 0; i < rows.length; i++) {
                            idList += rows[i].PointId + ',';
                        }
                    }
                    Cache.SetData("PointIdList", idList);
                    Cache.SetData("PointCommID", $("#CommID").val());

                    var LoginCorpID = $("#HidLoginCorpID").val();
                    if (LoginCorpID == "1906") {
                        var formData = new FormData();
                        formData.append("LoginCorpID", LoginCorpID);
                        formData.append("IdList", idList);
                        formData.append("OpType", 3);
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
                        // window.open("../QrCodeManage/WrCodeObj.aspx?IdList=" + idList + "&LoginCorpID=" + LoginCorpID + "&OpType=3");
                    } else {
                        window.open("../ComprehensivePatrols/QRPrint.aspx");
                    }
                }
            }, '-', {
                text: '导出点位',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    if ($("#CommID").val() == "-1") {
                        $.messager.alert('温馨提示', '请选择项目!');
                        return;
                    }
                    window.open("PointListExcel.aspx?random=" + Math.random());
                }
            },
        ];
        /**
 *
 * @param url 请求地址
 * @param postData 请求参数
 */
        function openNewWindow(url, postData) {
            var winWidth = $(window).width() * 0.8;
            var winHeight = $(window).height() * 0.9;
            var winLeft = $(window).width() * 0.1;
            var newWin = window.open("about:blank", "_blank", "width=" + winWidth + ",height=" + winHeight + ",top=10,left=" + winLeft + ",menubar=no,resizable=no,location=no,status=no");

            // 组装form表单
            var html = "<form action='" + url + "' method='post'>";
            jQuery.each(postData, function (i, obj) {
                html += "<input type='text' name='" + i + "' value='" + obj + "' style='display: none'>";
            });
            html += "</form>";
            newWin.document.body.innerHTML = html;
            newWin.document.forms[0].submit();

            // 监听窗口关闭事件
            var loop = setInterval(function () {
                if (newWin.closed) {
                    clearInterval(loop);
                }
            }, 500);
        }

        var columnPoint = [[
            { field: 'ck', checkbox: true },
            {
                field: 'Sort', title: '序号', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                field: 'PointCode', title: '编号', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                field: 'PointName', title: '名称', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                field: 'Addr', title: '地址', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                field: 'SysPointIdName', title: '通用点位', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                field: 'TaskTypeName', title: '任务类型', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            },
            {
                field: 'Map', title: '地图', width: 50, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (isValueNull(value)) { value = "<a  onclick=\"ShowMap('" + row.Map + "');\"  href=\"javascript:void(0);\">地图</a>"; }
                    return value;
                }
            }, {
                field: 'QRCodesPath', title: '二维码', width: 70, align: 'center', sortable: false, formatter: function (value, row, index) {
                    value = "<a  onclick=\"ShowQRCode('" + row.PointId + "','" + row.PointCode + "','" + row.PointName + "','" + row.Addr + "');\" href=\"javascript:void(0);\">二维码</a>";
                    return value;
                }
            }, {
                field: 'Remark', title: '备注', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }
        ]];
        function LoadListPoint() {
            $("#tgPoint").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "PointId",
                columns: columnPoint,
                rownumbers: true,
                fitColumns: false,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbarPoint,
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onSelect: function (index, row) {
                    $("#PointID").val(row.PointId);
                    $("#SelectSysPointId").val(row.SysPointId);
                    LoadListObject(row.PointName);
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("CpComPatrols", "GetListProjectPoint", "tgPoint", param);
                },
                onLoadSuccess: function (data) {
                    if (data.total > 0) {

                        // $('#tgPoint').datagrid('selectRow', 0);
                    }
                },
                onLoadError: function (data) {

                }
            });
            //$('#tgPoint').datagrid('clearSelections');
            //$('#tgPoint').datagrid('clearChecked');
            $("#dlg_search_point").dialog("close");
        }
        //查看二维码
        function ShowQRCode(pointId, pointCode, pointName, addr) {
            HDialog.Open('360', '400', '../ComprehensivePatrols/PointShowQrCode.aspx?PointId=' + pointId + "&PointCode=" + escape(pointCode) + "&PointName=" + escape(pointName) + "&Addr=" + escape(addr), '查看二维码', true, function callback(_Data) {
            });
        }
        //查看地图
        function ShowMap(longitude) {
            HDialog.Open('1024', '500', '../ComprehensivePatrols/PointShowMap.aspx?longitude=' + longitude, '查看地图', true, function callback(_Data) {
            });
        }
        function EditPoint(title, id, row) {
            HDialog.OpenWin('1024', '620', '../ComprehensivePatrols/PointEdit.aspx?ID=' + id + "&CommID=" + $("#CommID").val() + "&CommName=" + escape($("#CommName").val()), title, true, function callback(_Data) {
                InitDataGrid();
            });
        }
        function DelPoint(idList) {
            $.messager.confirm('确定', '是否删除?', function (r) {
                if (r) {
                    $.tool.DataPostJson('CpComPatrols', 'DelProjectPoint', "idList=" + idList,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                InitDataGrid();
                            } else { $.messager.alert("温馨提示", data.msg); }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            });
        }

        //--------------------------------------------------------------- 通用对象---------------------------------------------------
        var toolbarObject = [
            {
                text: '新增对象',
                iconCls: 'icon-add',
                handler: function () {
                    if ($("#PointID").val() == "-1") {
                        $.messager.alert('温馨提示', '请选择点位!');
                        return;
                    }
                    if ($("#CommType").val() == "00000000-0000-0000-0000-000000000000") {
                        $.messager.alert('温馨提示', $("#CommName").val() + '未设置项目类型!');
                        return;
                    }
                    EditObject("新增");
                }
            }, '-',
            {
                text: '删除对象',
                iconCls: 'icon-cancel',
                handler: function () {
                    var rows = $("#tgObject").datagrid("getChecked");
                    if (rows.length > 0) {
                        var idList = "";
                        for (var i = 0; i < rows.length; i++) {
                            idList += rows[i].ObjId + ',';
                        }
                        idList = idList.substr(0, idList.length - 1);
                        DelObject(idList);
                    } else {
                        $.messager.alert("温馨提示", '请选择需要删除的数据!');
                    }
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $("#dlg_search_object").dialog("open");
                }
            }
        ];
        var columnObject = [[
            { field: 'ck', checkbox: true },
            {
                field: 'Sort', title: '序号', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                field: 'ObjName', title: '对象名称', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                field: 'StandardCount', title: '通用标准', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                    if (value > 0) { value = "<a  onclick=\"ShowStandardList('" + row.SysObjId + "');\"  href=\"javascript:void(0);\">通用标准(" + value + ")</a>"; } else { value = "" }
                    return value;
                }
            }, {
                field: 'Remark', title: '备注', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }
        ]];
        function LoadListObject(pointName) {
            $("#tgObject").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                title: '对象列表-' + pointName,
                nowrap: false,
                //pageSize: top.ListPageSize,
                //pageList: top.ListPageList,
                idField: "ObjId",
                columns: columnObject,
                rownumbers: true,
                fitColumns: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: true,
                pagination: false,
                width: "100%",
                toolbar: toolbarObject,
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onDblClickRow: function (index, row) {
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParamNoPage("CpComPatrols", "GetListProjectPointObject", "tgObject", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {
                }
            });
            $('#tgObject').datagrid('clearSelections');
            $('#tgObject').datagrid('clearChecked');
            $("#dlg_search_object").dialog("close");
        }

        function EditObject(title) {
            HDialog.OpenWin('600', '500', '../ComprehensivePatrols/PointSysObjectList.aspx?SysPointId=' + $("#SelectSysPointId").val() + "&CommID=" + $("#CommID").val() + "&PointID=" + $("#PointID").val() + "&StandardCount=1" + "&CommType=" + $("#CommType").val(), title, true, function callback(_Data) {
                $('#tgObject').datagrid('reload');
            });
        }
        function ShowStandardList(sysObjId) {
            HDialog.OpenWin('1024', '600', '../ComprehensivePatrols/StandardList.aspx?CommType=' + $("#CommType").val() + '&SysObjId=' + sysObjId, "通用标准", true, function callback(_Data) {
            });
        }
        function DelObject(idList) {
            $.messager.confirm('确定', '是否删除?', function (r) {
                if (r) {
                    $.tool.DataPostJson('CpComPatrols', 'DelProjectPointObject', "idList=" + idList,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                $('#tgObject').datagrid('reload');
                            } else { $.messager.alert("温馨提示", data.msg); }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            });
        }
    </script>
</body>
</html>
