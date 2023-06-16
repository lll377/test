<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskExec.aspx.cs" Inherits="M_Main.HouseInspect.TaskExec" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>查验任务执行</title>
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
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 600px;
            height: 150px;
        }

        .SearchTable {
            width: 600px;
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
    <form id="frmFrom" runat="server">
        <div id="layout" class="easyui-layout" data-options="fit:true">
            <div id="commTree" data-options="region:'west',border:true,width:300,title:'项目'">
                <ul id="treeOrgan" class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true,lines:true"></ul>
            </div>
            <div id="layout_center" data-options="region:'center',border:true" style="overflow: hidden;">
                <div style="width: 100%; background-color: #cccccc;" id="DivContainer">
                </div>
                <div style="width: 100%; background-color: #cccccc;" id="DivContainerDetail">
                </div>
            </div>

        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1200px; height: 150px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                  <%--  <td class="TdTitle">项目名称</td>
                    <td class="TdContent">
                        <input id="CommName" name="CommName" type="text" class="easyui-validatebox" onclick="SelComm();" style="width: 95%" />
                        <input type="hidden" name="CommId" id="CommId" value="" />
                    </td>--%>
                    <td class="TdTitle">查验批次</td>
                    <td class="TdContent">
                        <select id="Batch" name="Batch" onchange="FrequencyChange(this)" isdctype='true' dctype="查验批次" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 97%">
                        </select>
                    </td>
                    <td class="TdTitle">查验模板</td>
                    <td class="TdContent">
                        <input id="TemplateName" name="TemplateName" class="easyui-validatebox" onclick="SelTemplate();" style="border: 1px #cccccc solid; width: 95%" />
                        <input type="hidden" name="TemplateId" id="TemplateId" value="" />
                    </td>
                    <td class="TdTitle">所属专业</td>
                    <td class="TdContent">
                        <select id="Profession" name="Profession" onchange="FrequencyChange(this)" isdctype='true' dctype="所属专业" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 97%">
                        </select>
                    </td>
                      <td class="TdTitle">查验岗位</td>
                    <td class="TdContent">
                        <input type="text" id="RoleName" name="RoleName" class="easyui-validatebox" onclick="SelRole()" readonly="readonly" style="width: 95%; border: 1px solid #cccccc;" />
                        <input type="hidden" id="RoleCode" name="RoleCode" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td class="TdTitle">任务状态</td>
                    <td class="TdContent">
                        <select id="TaskStatus" name="TaskStatus" class="easyui-validatebox" style="width: 97%; border: 1px solid #cccccc;">
                            <option value=""></option>
                            <option value="未开始">未开始</option>
                            <option value="执行中">执行中</option>
                            <option value="已完成">已完成</option>
                        </select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadBind();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="btnClear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>

          <input id="HiCommID" type="hidden" name="HiCommID" runat="server" />
        <input id="LoginRoleCode" type="hidden" name="LoginRoleCode" runat="server" />
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height() / 5;

                $("#commTree").css("height", h * 5 + "px");
                $("#layout").css("height", h * 5 + "px");
                $("#layout_center").css("height", h * 5 + "px");
                $("#DivContainer").css("height", h * 2 + "px");
                $("#DivContainerDetail").css("height", h * 3 + "px");
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
                $("#TaskStatus").val("");
            }

            //选择项目
            function SelComm() {
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

            var toolbar =
                [
                    {
                        text: '筛选任务',
                        iconCls: 'icon-search',
                        handler: function () {
                            $('#SearchDlg').parent().appendTo($("form:first"))
                            $('#SearchDlg').dialog('open');
                        }
                    }
                ];

            var column = [[
                { field: 'TaskId', title: 'TaskId', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'CommId', title: 'CommId', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'CommName', title: '项目名称', width: 150, align: 'left', sortable: true },
                { field: 'Batch', title: '查验批次', width: 20, align: 'left', sortable: true, hidden: true },
                { field: 'BatchName', title: '查验批次', width: 100, align: 'left', sortable: true },
                { field: 'TaskNo', title: '任务编码', width: 130, align: 'left', sortable: true },
                {
                    field: 'HouseNum', title: '房屋/公区数量', width: 100, align: 'center', halign: 'left', sortable: true
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
                { field: 'BeginTime', title: '开始时间', width: 120, align: 'left', sortable: true },
                { field: 'EndTime', title: '结束时间', width: 120, align: 'left', sortable: true },
                { field: 'TaskStatus', title: '任务状态', width: 100, align: 'left', sortable: true },
                { field: 'AddPid', title: '生成人id', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'AddPName', title: '生成人', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'AddDate', title: '生成时间', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'CompleteHouseNum', title: '完成房屋', width: 40, align: 'left', sortable: true, hidden: true }
            ]];

            var columnDetail = [[
                { field: 'Id', title: 'Id', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'TaskId', title: 'TaskId', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'HouseId', title: 'HouseId', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'HouseCode', title: '房屋/公区编码', width: 100, align: 'left', sortable: true },
                { field: 'RegionSNum', title: '组团区域', width: 80, align: 'left', sortable: true, hidden: true },

                {
                    field: 'IsComplete', title: '是否完成', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var result = "否";
                        if (row.IsComplete == "1") {
                            result = "是";
                        }
                        return result;
                    }
                },
                { field: 'CompletePid', title: '完成人id', width: 40, align: 'left', sortable: true, hidden: true },
                { field: 'CompletePName', title: '完成人', width: 80, align: 'left', sortable: true },
                { field: 'CompleteDate', title: '完成时间', width: 140, align: 'left', sortable: true },
                {
                    field: 'TaskNum', title: '全部标准数量', width: 100, align: 'center', halign: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href=\"#\" onclick=\"TaskDetail('" + row.TaskId + "','" + row.HouseId + "','')\">" + row.TaskNum + "</a>";
                        return str;
                    }
                },
                {
                    field: 'QualifiedTaskNum', title: '合格标准数量', width: 100, align: 'center', halign: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href=\"#\" onclick=\"TaskDetail('" + row.TaskId + "','" + row.HouseId + "','Qualified')\">" + row.QualifiedTaskNum + "</a>";
                        return str;
                    }
                },
                {
                    field: 'ProblemTaskNum', title: '问题标准数量', width: 100, align: 'center', halign: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href=\"#\" onclick=\"TaskDetail('" + row.TaskId + "','" + row.HouseId + "','Problem')\">" + row.ProblemTaskNum + "</a>";
                        return str;
                    }
                },
                {
                    field: 'RejectionNum', title: '甩项标准数量', width: 100, align: 'center', halign: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href=\"#\" onclick=\"TaskDetail('" + row.TaskId + "','" + row.HouseId + "','Rejection')\">" + row.RejectionNum + "</a>";
                        return str;
                    }
                },
                {
                    field: 'CheckTaskNum', title: '验收标准数量', width: 100, align: 'center', halign: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href=\"#\" onclick=\"TaskDetail('" + row.TaskId + "','" + row.HouseId + "','Check')\">" + row.CheckTaskNum + "</a>";
                        return str;
                    }
                },
                {
                    field: 'ProblemPic', title: '查验图纸', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" onclick=\"DrawingInfo('" + row.HouseId + "','" + row.CommID + "');\" href=\"#\">查看</a>";
                        return str;
                    }
                }
            ]];

            //查看图纸详情
            function DrawingInfo(RoomID, CommID) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '600', '../HouseInspect/DrawingInfo.aspx?RoomID=' + RoomID + '&CommID=' + CommID, '查验图纸详情', false, function callback(_Data) {
                });
            }

            function TaskDetail(TaskId, HouseId, OpType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '570', '../HouseInspect/TaskStandardList.aspx?TaskId=' + TaskId + '&HouseId=' + HouseId + '&OpType=' + OpType +
                    '&HiCommID=' + $("#HiCommID").val(), '标准详情', false, function callback(_Data) {
                });
            }

            function HouseDetail(TaskId) {
                HDialog.Open('1000', '570', '../HouseInspect/TaskGenerationHousesInfo.aspx?TaskId=' + TaskId, '查看房屋详情', true, function callback(_Data) {
                    //LoadList();
                });
            }

            function PicDetail(Id) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open(600, 450, '../HouseInspect/FileList.aspx?PkId=' + Id, '问题图片', false, function callback(_Data) {
                });
            }

            function LoadBind() {
                $("#DivContainer").datagrid({
                    //url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetTaskList&' + $('#frmFrom').serialize(),
                    //method: "get",
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
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
                        param = $.JQForm.GetParam("CsHouseInspect", "GetTaskList", "DivContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    },
                    onClickRow: function (rowIndex, rowData) {
                        LoadBindDetail(rowData.TaskId, rowData.range);
                    }
                });
            }

            function LoadBindDetail(Id, range) {
                var url = null;
                if (Id != "" && Id != null && Id != undefined) {
                    url = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetTaskHouseList&TaskId=' + Id + "&RangeType=" + range +
                        "&HiCommID=" + $("#HiCommID").val();;
                }
                $("#DivContainerDetail").datagrid({
                    url: url,
                    method: "get",
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    nowrap: false,
                    rownumbers: true,
                    columns: columnDetail,
                    fitColumns: false,
                    singleSelect: true,
                    border: false,
                    pagination: true,
                    width: "100%",
                    toolbar: null,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });
            }

            $(function () {
                InitTableHeight();
                LoadBind();
                LoadBindDetail("", "");
            });
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
                         LoadBind();
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
