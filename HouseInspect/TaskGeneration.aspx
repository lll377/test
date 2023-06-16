<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskGeneration.aspx.cs" Inherits="M_Main.HouseInspect.TaskGeneration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <title>查验任务</title>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmForm" runat="server">
        <div id="layout" class="easyui-layout" data-options="fit:true">
            <div id="commTree" data-options="region:'west',border:true,width:300,title:'项目'">
                <ul id="treeOrgan" class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true,lines:true"></ul>
            </div>
              <div id="layout_center" data-options="region:'center',border:true" style="overflow: hidden;">
                <div style="width: 100%; background-color: #cccccc;"  id="TableContainer"></div>
            </div>
            
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1050px; height: 150px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                   <%-- <td class="TdTitle">项目名称</td>
                    <td class="TdContent">
                        <input id="CommName" name="CommName" type="text" class="easyui-validatebox" onclick="SelItem();" style="width: 95%" />
                        <input type="hidden" name="CommId" id="CommId" value="" />
                    </td>--%>
                    <td class="TdTitle">查验批次</td>
                    <td class="TdContent">
                        <select id="Batch" name="Batch" onchange="FrequencyChange(this)" isdctype='true' dctype="查验批次" class="easyui-validatebox" style="border: 1px #cccccc solid;height:22px; width: 97%">
                        </select>
                    </td>
                    <td class="TdTitle">查验模板</td>
                    <td class="TdContent">
                        <input id="TemplateName" name="TemplateName" class="easyui-validatebox" onclick="SelTemplate();" style="width: 95%;height:20px;" />
                        <input type="hidden" name="TemplateId" id="TemplateId" value="" />
                    </td>
                    <td class="TdTitle">所属专业</td>
                    <td class="TdContent">
                        <select id="Profession" name="Profession" onchange="FrequencyChange(this)" isdctype='true' dctype="所属专业" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 97%;height:22px;">
                        </select>
                    </td>
                     <td class="TdTitle">查验岗位</td>
                    <td class="TdContent">
                        <input type="text" id="RoleName" name="RoleName" class="easyui-validatebox" onclick="SelRole()" readonly="readonly" style="height:20px;width: 95%" />
                        <input type="hidden" id="RoleCode" name="RoleCode" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td class="TdTitle">生成人</td>
                    <td class="TdContent">
                        <input type="text" id="AddPName" name="AddPName" class="easyui-validatebox" style="width: 95%" />
                    </td>
                    <td class="TdTitle">生成时间</td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="AddDateBg" name="AddDateBg" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" readonly="readonly" style="width: 95%;height:20px;" />
                    </td>
                    <td class="TdTitle">至</td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="AddDateEnd" name="AddDateEnd" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" readonly="readonly" style="width: 95%;height:20px;" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="btnClear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input id="HiCommID" type="hidden" name="HiCommID" runat="server" />
        <input id="LoginRoleCode" type="hidden" name="LoginRoleCode" runat="server" />
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#layout").css("height", h + "px");
                $("#TableContainer").css("height", h + "px");
                $("#layout_center").css("height", h + "px");
            }
            InitTableHeight();

            //选择项目
            function SelItem() {
                HDialog.Open(410, 360, '../HouseInspect/SelComm.aspx?IsCheck=1', "选择项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommId").val(arrRet.id);
                    $("#CommName").val(arrRet.name);
                });
            }

            //选择模板
            function SelTemplate() {
                HDialog.Open('800', '600', '../HouseInspect/SelTemplateList.aspx', '选择查验模板', true, function callback(_Data) {
                    if (_Data != "") {
                        var varObjects = _Data.split('◆');
                        $("#TemplateId").val(varObjects[0]);
                        $('#TemplateName').val(varObjects[1]);


                    }
                });
            }

            //选择岗位
            function SelRole() {
                HDialog.Open('650', '600', '../HouseInspect/RightFrameCommunityRightManage.aspx?DepCode=&returnValue=', '选择岗位', false, function callback(_Data) {
                    if (_Data) {
                        _Data = _Data.substring(1, _Data.length);
                        var strs = new Array();
                        strs = _Data.split(',');
                        var code = "";
                        var name = "";
                        var all = "";
                        for (var i = 0; i < strs.length; i++) {
                            all = strs[i].trim().split(/\s+/);
                            code = code + all[0] + ",";
                            name = name + all[1] + ",";
                        }
                        code = code.substring(0, code.length - 1);
                        name = name.substring(0, name.length - 1);
                        $("#RoleName").val(name);
                        $("#RoleCode").val(code);
                    };
                })
            }

            function btnClear() {
                $("#CommId").val("");
                $("#CommName").val("");
                $("#TemplateId").val("");
                $("#TemplateName").val("");
                $("#RoleName").val("");
                $("#RoleCode").val("");
                $("#Batch").val("");
                $("#Profession").val("");
                $("#AddPName").val("");
                $("#AddDateBg").val("");
                $("#AddDateEnd").val("");
            }

            var column = [[
                { field: 'TaskId', title: 'TaskId', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'CommId', title: 'CommId', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'CommName', title: '项目名称', width: 150, align: 'left', sortable: true },
                { field: 'Batch', title: '查验批次', width: 20, align: 'left', sortable: true, hidden: true },
                { field: 'BatchName', title: '查验批次', width: 100, align: 'left', sortable: true },
                { field: 'TaskNo', title: '任务编码', width: 130, align: 'left', sortable: true },
                {
                    field: 'HouseNum', title: '房屋/公区数量', width: 85, align: 'center', halign: 'left', sortable: true
                    //, formatter: function (value, row, index) {
                    //    var str = "<a class=\"HrefStyle\"  href=\"#\" onclick=\"HouseDetail('" + row.TaskId + "')\">" + row.HouseNum + "</a>";
                    //    return str;
                    //}
                },
                { field: 'TemplateId', title: '模板Id', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'TemplateName', title: '查验模板', width: 220, align: 'left', sortable: true },
                { field: 'Profession', title: '所属专业', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'ProfessionName', title: '所属专业', width: 100, align: 'left', sortable: true },
                { field: 'RoleCode', title: '查验岗位编码', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'RoleName', title: '查验岗位', width: 180, align: 'left', sortable: true },
                { field: 'BeginTime', title: '开始时间', width: 90, align: 'left', sortable: true },
                { field: 'EndTime', title: '结束时间', width: 90, align: 'left', sortable: true },
                { field: 'TaskStatus', title: '任务状态', width: 70, align: 'left', sortable: true },
                { field: 'AddPid', title: '生成人id', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'AddPName', title: '生成人', width: 150, align: 'left', sortable: true },
                { field: 'AddDate', title: '生成时间', width: 150, align: 'left', sortable: true },
                { field: 'ReasonName', title: '修改原因', width: 150, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '生成任务',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($("#HiCommID").val() == "") {
                            $.messager.alert("提示", "请选择项目");
                            return;
                        }
                        HDialog.Open('800', '585', '../HouseInspect/TaskGenerationSetingFrame.aspx?HiCommID=' + $("#HiCommID").val(), '查验任务生成', true, function callback(_Data) {
                            LoadList();
                        });
                    }
                }, '-',
                {
                    text: '附加任务',
                    iconCls: 'icon-add',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            $.messager.alert("提示", "请选择数据");
                            return;
                        }
                        if (row["TaskStatus"].toString() != "已完成") {
                            $.messager.alert("提示", "当前任务未完成，不能附加任务");
                            return;
                        }
                        HDialog.Open('900', '600', '../HouseInspect/TaskGenerationAddSetting.aspx?CommId=' + row["CommId"] + "&TaskId=" + row["TaskId"] + "&Range=" + row["range"], '附加任务', true, function callback(_Data) {
                            LoadList();
                        });


                    }
                }, '-',
                {
                    text: '修改任务',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            $.messager.alert("提示", "请选择修改数据");
                            return;
                        }
                        if (row["TaskStatus"].toString() == "已完成") {
                            $.messager.alert("提示", "无法修改已完成的任务");
                            return;
                        }
                        HDialog.Open('700', '200', '../HouseInspect/TaskGenerationEdit.aspx?TaskId=' + row["TaskId"].toString() + '&HiCommID=' + $("#HiCommID").val(),
                            '查验任务修改', true, function callback(_Data) {
                            LoadList();
                        });
                    }
                }, '-',
                {
                    text: '删除任务',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            $.messager.alert("提示", "请选择删除数据");
                            return;
                        }
                        if (row["TaskStatus"].toString() == "已完成") {
                            $.messager.alert("提示", "无法删除已完成的任务");
                            return;
                        }
                        var msg = "是否删除此任务";
                        if (row["TaskStatus"].toString() == "执行中") {
                            msg = "该任务正在执行中，是否删除此任务";
                        }
                        DelTask(row["TaskId"].toString(), msg);
                    }
                }, '-',
                //{
                //    text: '推送业主',
                //    iconCls: 'icon-cancel',
                //    handler: function () {

                //    }
                //}, '-',
                {
                    text: '筛选任务',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function DelTask(TaskId, msg) {
                $.messager.confirm('确定', msg, function (r) {
                    if (r) {
                        $.tool.DataGet('CsHouseInspect', 'DelTask', 'TaskId=' + TaskId + '&HiCommID=' + $("#HiCommID").val(),
                            function Init() {
                            },
                            function callback(_Data) {
                                LoadList();
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function HouseDetail(TaskId) {
                HDialog.Open('1000', '570', '../HouseInspect/TaskGenerationHousesInfo.aspx?TaskId=' + TaskId, '查看房屋详情', true, function callback(_Data) {
                    //LoadList();
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    //url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetTaskList&' + $('#frmForm').serialize(),
                    //method: "get",
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    nowrap: false,
                    rownumbers: true,
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
                    border: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CsHouseInspect", "GetTaskList", "TableContainer", param);
                    }
                });
                $("#SearchDlg").dialog("close");
            }

            LoadList();
        </script>
        <script>
            function LoadOrganTree() {
                $("#treeOrgan").tree({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    treeField: 'text',
                    idField: 'id',
                    lines: true,
                    border: false,
                    loadMsg: '加载中,请稍侯...',
                    onLoadSuccess: function (node, data) {
                        //LoadList();
                        //默认选中第一个节点
                        if (data.length > 0) {
                            var commid = GetQueryString('CommID');
                            var node = $('#treeOrgan').tree('find', data[0].id);
                            var firstnode = null;
                            if (commid == '' && commid == '0') {
                                firstnode = SelectFirsLeafNode(node);
                            }
                            else {
                                var str = JSON.stringify(data);
                                str = str.substr(0, str.indexOf(commid));
                                str = str.substr(str.lastIndexOf("OrganCode") + 12, 30);
                                str = str.substr(0, str.indexOf('\"'));
                                firstnode = $('#treeOrgan').tree('find', str);

                            }
                            if (firstnode) {
                                $('#treeOrgan').tree('select', firstnode.target);
                            } else {
                                //LoadList();
                            }
                        }
                    },
                    onBeforeSelect: function (node) {
                        if (!$(this).tree('isLeaf', node.target) || node.attributes.CommID == 0) {
                            return false;
                        }
                    },
                    onBeforeLoad: function (row, param) {
                        localStorage.removeItem('CpCommId');
                        param.Method = "DataPost";
                        //param.Class = "CsHouseInspect";
                        param.Class = "CpComPatrols";
                        param.Command = "DepMenuList";
                        //控制用户权限
                        param.SelRoleCode = $("#LoginRoleCode").val();

                    },
                    onSelect: function (row) {
                        $("#HiCommID").val(row.attributes.CommID);
                        LoadList();
                    }
                });
            }


            //递归 获取第一个子节点
            function SelectFirsLeafNode(FirstNode) {
                var ItemFirstNode = null;
                function dd(node) {
                    if (!$('#treeOrgan').tree("isLeaf", node.target)) {
                        var Children = $('#treeOrgan').tree("getChildren", node.target);
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

            $(".tabs-container li").click(function () {
                var refpage = $(this).attr("refpage");
                var refsel = $(this).attr("refsel");
                if (refsel == 0) {
                    var SelecteTreeNode = $('#treeOrgan').tree("getSelected");
                    if (SelecteTreeNode != null) {
                        localStorage.setItem("CpCommId", SelecteTreeNode.attributes.CommID);
                        $("#" + refpage).attr("src", refpage + ".aspx?CommID=" + SelecteTreeNode.attributes.CommID);
                        $(this).attr("refsel", "1");
                    }
                }
            });
            LoadOrganTree();
        </script>
    </form>
</body>
</html>
