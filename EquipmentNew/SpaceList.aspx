<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpaceList.aspx.cs" Inherits="M_Main.EquipmentNew.SpaceList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>设备空间</title>
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
    <input type="hidden" id="hLoginCorpID" name="hLoginCorpID" runat="server"/>
    <input type="hidden" name="LoginRoleCode" id="LoginRoleCode" runat="server" />
    <input type="hidden" name="CommID" id="CommID" value="-1" />
    <input type="hidden" name="PointID" id="PointID" value="-1" />
    <input type="hidden" name="SysPointId" id="SysPointId" value="-1" />
    <input type="hidden" name="CommName" id="CommName" />
    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',border:true,width:300,title:'项目列表'">
            <ul id="treeOrgan" class="easyui-tree"></ul>
        </div>
        <div id="layout_center" data-options="region:'center',border:true,title:'设备空间列表-请选择项目!',">
            <table id="tgSpace" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
    </div>


    <%--<div id="tbObject" class="easyui-panel">
        <table cellspacing="0" cellpadding="0">
            <tr>


                <td>
                    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="LoadListSpace();" data-options="iconCls:'icon-remove',plain:true">删除对象</a>
                </td>
                <td>
                    <div class="datagrid-btn-separator"></div>
                </td>
                <td>
                    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg_search_object').dialog('open');" data-options="iconCls:'icon-search',plain:true">筛选</a>
                </td>
                <td>
                    <div class="datagrid-btn-separator"></div>
                </td>
                <td>
                    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="LoadListSpace();" data-options="iconCls:'icon-add',plain:true">新增对象</a>
                </td>
            </tr>
        </table>
    </div>--%>

    <div id="dlg_search_space" class="easyui-dialog" title="筛选" style="width: 800px; height: 200px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frmPoint">

            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>机房名称</span></td>
                    <td class="text">
                        <input id="SpaceName" name="SpaceName" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>所属设备系统</span></td>
                    <td class="text">
                        <input id="SystemId" name="SystemId" class="easyui-textbox" data-options="prompt:'请单击右侧\'请选择\'按钮进行操作!',editable:false,tipPosition:'top',required:false,multiline:false,width:'98%',
                        buttonText:'请选择',buttonIcon:'icon-add',onClickButton:function(){GetSystem();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>机房地址</span></td>
                    <td class="text">
                        <input id="SpaceAddress" name="SpaceAddress" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>对应报事系统公区</span></td>
                    <td class="text">
                        <input id="IncidentArea" name="IncidentArea" class="easyui-combobox" />
                    </td>

                </tr>
                <tr>
                    <td class="title"><span>机房编码</span></td>
                    <td class="text">
                        <input id="SpaceNo" name="SpaceNo" class="easyui-textbox" />
                    </td>
                    <td class="title"><span></span></td>
                    <td class="text">
                    </td>

                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadListSpace()">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',width:80" onclick="$('#frmPoint').form('clear')">重置</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script language="javascript" type="text/javascript">
        $(function () {
            PageInit();
            LoadOrganTree();
            LoadListSpace();
        });

        function GetSystem() {
            HDialog.Open('700', '450', '../EquipmentNew/SelSystem.aspx?type=more', '选择设备系统', true, function callback(data) {
                var array = data.split('|');
                $('#SystemId').textbox('setValue', array[0]);
                $('#SystemId').textbox('setText', array[1]);
            });
        }

        function PageInit() {
            $('#IncidentArea').combobox({
                required: false,
                validType: ['comboBoxValid[\'#IncidentArea\']'],
                width: '98%',
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                    }
                }],
                url: '/HM/M_Main/HC/DataGetControl.aspx',
                method: 'get',
                valueField: 'RegionalID',
                textField: 'RegionalPlace',
                onBeforeLoad: function (param) {
                    param.Method = 'DataGet';
                    param.Class = 'CsEquipment';
                    param.Command = 'GetIncidentArea';
                    param.CommID = $("#CommID").val();;
                }
            });
        }

        function InitTableHeight() {
            var h = $(window).height();
            var w = $(window).width();
            //$("#layout").layout('resize', {
            //    height: h,
            //    width: w
            //});
            //var ch = $('#layout').layout('panel', 'center').panel('panel').outerHeight();
            //$("#tgSpace").css("height", ch / 2 - 14 + "px");
            //$("#tgObject").css("height", ch / 2 - 15 + "px");
            $("#tgSpace").datagrid('resize', {
                height: h - 29,
            });
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
                    //console.log(node, data);
                    //LoadList();
                    InitTableHeight();
                },
                onBeforeLoad: function (row, param) {
                    param.Method = "DataPost";
                    param.Class = "CsEquipment";
                    param.Command = "DepMenuList";
                    //控制用户权限
                    param.SelRoleCode = $("#LoginRoleCode").val();

                },
                onSelect: function (row) {
                    var isLeaf = $("#treeOrgan").tree('isLeaf', row.target);
                    if (isLeaf) {
                        $('#layout_center').panel('setTitle', '设备空间列表-' + row.text);
                        $("#CommID").val(row.attributes.CommID);
                        $("#CommName").val(row.text);
                    } else {
                        //HDialog.Info("请选择项目!");
                        $('#layout_center').panel('setTitle', '设备空间列表-请选择项目!');
                        $("#CommID").val('-1');
                    }
                    LoadListSpace();
                }
            });
        }



        //--------------------------------------------------------------- 通用点位---------------------------------------------------
        var toolbarSpace = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    if ($("#CommID").val() == "-1") {
                        $.messager.alert('温馨提示', '请选择项目!');
                        return;
                    }
                    EditSpace("新增", '');
                }
            }, '-',
            {
                text: '编辑',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#tgSpace").datagrid("getSelected");
                    if (row) {
                        EditSpace('编辑', row.SpaceId);
                    } else {
                        $.messager.alert("温馨提示", '请选择一行需要编辑的数据!');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var rows = $("#tgSpace").datagrid("getChecked");
                    if (rows.length > 0) {
                        var idList = "";
                        for (var i = 0; i < rows.length; i++) {
                            idList += rows[i].SpaceId + ',';
                        }
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
                    $('#dlg_search_space').dialog('open');
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
                    var hLoginCorpID = $("#hLoginCorpID").val();
                    var idList = "";
                    console.log(idList);
                    var rows = $("#tgSpace").datagrid("getChecked");
                    if (rows.length > 0) {
                        for (var i = 0; i < rows.length; i++) {
                            idList += rows[i].SpaceId + ',';
                        }
                    }
                    idList = idList.substr(0, idList.length - 1);
                    console.log(idList);
                    Cache.SetData("SpaceSpaceId", idList);
                    Cache.SetData("SpaceCommID", $("#CommID").val());
                    //平安是用的插件打印
                    if (hLoginCorpID == "1906") {
                          var formData = new FormData();
                        formData.append("LoginCorpID", hLoginCorpID);
                        formData.append("IdList", idList);
                        formData.append("OpType", 2);
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
                        //window.open("../QrCodeManage/WrCodeObj.aspx?IdList=" + idList+'&OpType=2&LoginCorpID='+hLoginCorpID);

                    } else {
                        window.open("../EquipmentNew/SpaceQRPrint.aspx");
                    }


                }
            }, '-', {
                text: '导出设备空间',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    if ($("#CommID").val() == "-1") {
                        $.messager.alert('温馨提示', '请选择项目!');
                        return;
                    }
                    window.open("EqSpaceListoutput.aspx?random=" + Math.random() + '&CommId=' + $("#CommID").val());
                }
            },
        ];

        var columnSpace = [[
            { field: 'ck', checkbox: true },
            {
                field: 'Sort', title: '序号', width:80, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                field: 'SpaceName', title: '机房名称', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                field: 'SpaceNo', title: '机房编码', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                field: 'SystemIdName', title: '所属设备系统', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                field: 'SpaceAddress', title: '机房地址', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                field: 'RegionalPlace', title: '报事公区', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            },
            {
                field: 'SpaceMap', title: '机房坐标', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                    if (isValueNull(value)) { value = "<a  onclick=\"ShowMap('" + row.SpaceMap + "');\"  href=\"javascript:void(0);\">机房坐标</a>"; }
                    return value;
                }
            }, {
                field: 'EqCodesPath', title: '二维码', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                    value = "<a  onclick=\"ShowQRCode('" + row.SpaceId + "','" + row.SpaceName + "','" + row.SystemIdName + "','" + row.SpaceAddress + "');\" href=\"javascript:void(0);\">二维码</a>";
                    return value;
                }
            }, {
                field: 'Remark', title: '备注', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }
        ]];
        function LoadListSpace() {
            $("#tgSpace").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "SpaceId",
                columns: columnSpace,
                rownumbers: true,
                fitColumns: false,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbarSpace,
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onClickRow: function (index, row) {
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("CsEquipment", "GetListToDataGridSpace", "tgSpace", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {
                }
            });
            $('#tgSpace').datagrid('clearSelections');
            $("#dlg_search_space").dialog("close");
        }
        //查看二维码
        function ShowQRCode(SpaceId, spaceName, systemIdName, spaceAddress) {
            HDialog.Open('360', '400', '../EquipmentNew/SpaceShowQrCode.aspx?SpaceId=' + SpaceId + "&SpaceName=" + escape(spaceName) + "&SystemIdName=" + escape(systemIdName) + "&SpaceAddress=" + escape(spaceAddress), '查看二维码', true, function callback(_Data) {
            });
        }
        //查看地图
        function ShowMap(longitude) {
            HDialog.Open('1024', '500', '../EquipmentNew/SpaceShowMap.aspx?longitude=' + longitude, '查看地图', true, function callback(_Data) {
            });
        }
        function EditSpace(title, id) {
            HDialog.OpenWin('1024', '650', '../EquipmentNew/SpaceEdit.aspx?ID=' + id + "&CommID=" + $("#CommID").val() + "&CommName=" + escape($("#CommName").val()), title, true, function callback(_Data) {
                LoadListSpace();
                if (title == "新增") {

                } else {
                    $('#tgObject').datagrid('reload');
                }

            });
        }
        function DelPoint(idList) {
            $.tool.DataPostJson('CsEquipment', 'CanDelSpace', "idList=" + idList,
                function Init() {
                },
                function callback(data) {
                    var info = "";
                    if (data[0].num > 0 || data[1].num > 0 || data[2].num > 0) {
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].num > 0) {
                                info += "," + data[i].typename;
                            }
                        }
                        info = "选中机房中有关联" + info.substr(1, info.length) + "无法删除";
                        $.messager.alert("温馨提示", info);
                        return;
                    }
                    $.messager.confirm('确定', '是否删除?', function (r) {
                        if (r) {
                            $.tool.DataPostJson('CsEquipment', 'DelSpace', "idList=" + idList,
                                function Init() {
                                },
                                function callback(data) {
                                    if (data.result) {

                                        LoadListSpace();
                                    } else { $.messager.alert("温馨提示", data.msg); }
                                },
                                function completeCallback() {
                                }, function errorCallback() {
                                });
                        }
                    });
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

    </script>
</body>
</html>
