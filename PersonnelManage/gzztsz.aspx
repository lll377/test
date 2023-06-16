<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gzztsz.aspx.cs" Inherits="M_Main.PersonnelManage.gzztsz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <style type="text/css">
        #LeftPanel {
            float: left;
        }

        #RightPanel {
            float: left;
        }
    </style>
</head>
<body style="margin: 0px; margin-top: 0px; overflow: hidden;">
    <form id="gzztsz" runat="server">
        <div style="width: 100%; height: 25px; background-color: #E0ECFF; border-bottom: 1px solid #95B8E7; font-size: 12px; font-family; 微软雅黑; color: #E2D5F; line-height: 25px; font-weight: bold;">
            &nbsp;&nbsp;工资账套设置
        </div>
        <div style="height: 2px;">
        </div>
        <div style="width: 260px; background-color: #ffffff; float: left; border: 1px solid #95B8E7; margin-right: 1px; margin-left: 1px;"
            id="LeftPanel">
            <div id="LeftTop1" style="overflow-y: scroll; padding: 0px 5px">

                <ul class="easyui-tree" id="tt">
                </ul>

            </div>
            <div id="LeftTop2" style="width: 100%;">
                <ul style="margin: auto 0px; padding-left: 0px; width: 100%; height: 35px; padding-top: 5px; background-color: #f5f5f5;">
                    <li style="float: left; list-style-type: none; width: 33%; text-align: center;"><a
                        href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" style="width: 80px"
                        onclick="EditSalaryTemplate('insert');">新增</a> </li>
                    <li style="float: left; list-style-type: none; width: 0.5%;"></li>
                    <li style="float: left; list-style-type: none; width: 33%; text-align: center;"><a
                        href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="width: 80px"
                        onclick="EditSalaryTemplate('edit');">编辑</a> </li>
                    <li style="float: left; list-style-type: none; width: 0.5%;"></li>
                    <li style="float: left; list-style-type: none; width: 33%; text-align: center;"><a
                        href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" style="width: 80px"
                        onclick="DelSalaryTemplate();">删除</a> </li>
                </ul>
            </div>
        </div>
        <div id="RightPanel" class="easyui-tabs">
            <div title="工资账套明细" style="padding-left: 2px; padding-right: 2px; padding-top: 2px;">
                <div style="width: 100%;" id="TableContainer">
                </div>
            </div>
        </div>
        <input type="hidden" id="SalaryItemId" name="SalaryItemId" />
        <input type="hidden" id="SalaryTemplateId" name="SalaryTemplateId" />
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="hidden" id="Sort" name="Sort" />
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height() - 30;
                var h1 = $(window).height() - 28;
                var h2 = h - 35;
                var h3 = h - 34;
                $("#LeftPanel").css("height", h + "px");
                $("#LeftTop1").css("height", h2 - 4 + "px");
                $("#RightPanel").css("height", h1 + "px");


                var w = $(window).width();
                var w1 = $("#LeftPanel").width();
                w = w - w1 - 5;
                $("#RightPanel").css("width", w);

                $("#TableContainer").css("height", h3);
            }
            InitTableHeight();

            var column = [[

                { checkbox: true },
                { field: 'Id', title: 'Id', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'Sort', title: '序号', width: 25, align: 'left', sortable: true },
                {
                    field: 'Name', title: '工资项目', width: 25, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue;\" href='#' onclick=\"EditSalaryTemplateItem('" + row.Id + "');\">" + row.Name + "</a>";
                        return str;
                    }
                },
                { field: 'ItemType', title: '应发应扣', width: 25, align: 'left', sortable: true },
                {
                    field: 'CalRule', title: '取值规则', width: 25, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = row.CalRule == "固定金额" ? "人工设置/输入" : row.CalRule;
                        if (row.CalRule == "固定金额") {
                            str = "人工设置/输入";
                        }
                        else if (row.CalRule == "职级薪级") {
                            str = "职级薪级取数";
                        }
                        else if (row.CalRule == "社保导入") {
                            str = "社保回盘取数";
                        }
                        else if (row.CalRule == "绩效考评") {
                            str = "绩效考评取数";
                        }
                        else if (row.CalRule == "公式计算") {
                            str = "按照公式计算";
                        }
                        else if (row.CalRule == "工龄计算") {
                            str = "按照工龄计算";
                        }
                        else if (row.CalRule == "个税计算") {
                            str = "按照个税计算";
                        }
                        return str;
                    }
                },
                { field: 'Formula', title: '计算公式', width: 95, align: 'left', sortable: true },
                { field: 'BaseValue', title: '基数值', width: 25, align: 'left', sortable: true }
            ]];

            function EditSalaryTemplateItem(Id) {

                var Pid = $("#SalaryTemplateId").val();
                HDialog.Open('300', '200', "../PersonnelManage/gzztxmxx.aspx?Id=" + Id + "&SalaryTemplateId=" + Pid + "&OpType=edit&Ram=" + Math.random(), '选择', false, function callback(_Data) {
                    // $.tool.dialog("gzztxmxx.aspx?Id=" + Id + "&SalaryTemplateId=" + Id + "&OpType=edit&Ram=" + Math.random(), '800', '250', '', function _callBack(_Data) {
                    LoadList();
                });
            }


            function ImportSalaryTemplate() {

                var Id = $("#SalaryTemplateId").val();
                HDialog.Open('800', '500', "../PersonnelManage/gzztxz.aspx?Id=" + Id + "&SalaryTemplateId=" + Id + "&OpType=edit&Ram=" + Math.random(), '选择', false, function callback(_Data) {

                    //$.tool.dialog("gzztxz.aspx?Id=" + Id + "&SalaryTemplateId=" + Id + "&OpType=edit&Ram=" + Math.random(), '800', '250', '', function _callBack(_Data) {
                    LoadList();
                });
            }

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        var Id = $("#SalaryTemplateId").val();
                        if (Id == '') {
                            $.messager.alert('错误', '请选择一个账套', 'error');
                        }
                        HDialog.Open('300', '200', "../PersonnelManage/gzztxmxx.aspx?SalaryTemplateId=" + Id + "&OpType=insert&Ram=" + Math.random(), '选择', false, function callback(_Data) {

                            //$.tool.dialog("gzztxmxx.aspx?SalaryTemplateId=" + Id + "&OpType=insert&Ram=" + Math.random(), '800', '250', '', function _callBack(_Data) {
                            LoadList();
                        });
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $.messager.confirm('确定', '是否删除该项', function (r) {
                            if (r) {
                                var row = $("#TableContainer").datagrid("getSelections");

                                for (var i = 0; i < row.length; i++) {
                                    $.tool.DataGet('CSPerson', 'DelSalaryTemplateItem', 'Id=' + row[i].Id,
                                        function Init() {
                                        },
                                        function callback(_Data) {

                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                }
                                LoadList();
                            }
                        });

                    }
                }, '-',
                //{
                //    text: '刷新',
                //    iconCls: 'icon-filter',
                //    handler: function () {
                //        LoadList();
                //    }
                //}, '-',
                {
                    text: '引用账套',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var Id = $("#SalaryTemplateId").val();
                        if (Id == '') {
                            $.messager.alert('错误', '请选择一个账套', 'error');
                        }
                        HDialog.Open('800', '600', "../PersonnelManage/gzztxz.aspx?SalaryTemplateId=" + Id + "&Ram=" + Math.random(), '选择', false, function callback(_Data) {
                            //$.tool.dialog("gzztxz.aspx?SalaryTemplateId=" + Id + "&Ram=" + Math.random(), '800', '600', '', function _callBack(_Data) {
                            LoadList();
                        });
                    }
                }, '-', {
                    text: '更新账套',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var Id = $("#SalaryTemplateId").val();
                        if (Id == '') {
                            $.messager.alert('错误', '请选择一个账套', 'error');
                        }
                        $.tool.DataGet('CSPerson', 'SelectPersonSalaryTemplate', 'SalaryTemplateId=' + $("#SalaryTemplateId").val(),
                                   function Init() {
                                   },
                                   function callback(_Data) {
                                       $.messager.confirm('确定', '将对 '+_Data + ' 人造成影响,是否更新账套', function (r) {
                                           if (r) {
                                               $.tool.DataGet('CSPerson', 'UpdatePersonSalaryTemplate', 'SalaryTemplateId=' + $("#SalaryTemplateId").val(),
                                                   function Init() {
                                                   },
                                                   function callback(_Data) {
                                                   },
                                                   function completeCallback() {
                                                   },
                                                   function errorCallback() {
                                                   });
                                           }
                                       });
                                   },
                                   function completeCallback() {
                                   },
                                   function errorCallback() {
                                   });
                       
                    }
                }
                , '-',
                {
                    text: '打印设置',
                    iconCls: 'icon-print',
                    handler: function () {
                        var Id = $("#SalaryTemplateId").val();
                        if (Id == '') {
                            $.messager.alert('错误', '请选择一个账套', 'error');
                        }
                        HDialog.Open('800', '600', "../PersonnelManage/gzztszPrintSet.aspx?SalaryTemplateId=" + Id + "&Ram=" + Math.random(), '选择', false, function callback(_Data) {
                            //$.tool.dialog("gzztxz.aspx?SalaryTemplateId=" + Id + "&Ram=" + Math.random(), '800', '600', '', function _callBack(_Data) {
                            LoadList();
                        });
                    }
                }
            ];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSPerson&Command=SelectSalaryTemplateItem&' + $('#gzztsz').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: 50,
                    pageList: [20, 50, 100],
                    columns: column,
                    fitColumns: true,
                    singleSelect: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc"
                });
            }



            function EditSalaryTemplate(OpType) {
                var Id = $("#SalaryTemplateId").val();
                HDialog.Open('800', '150', "../PersonnelManage/gzztxx.aspx?Id=" + Id + "&OpType=" + OpType + "&Ram=" + Math.random(), '选择', false, function callback(_Data) {

                    // $.tool.dialog("gzztxx.aspx?Id=" + Id + "&OpType=" + OpType + "&Ram=" + Math.random(), '800', '100', '', function _callBack(_Data) {
                    LoadSalaryTemplate();
                });
            }
            function DelSalaryTemplate() {
                var Id = $("#SalaryTemplateId").val();
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('CSPerson', 'DelSalaryTemplate', 'Id=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                LoadSalaryTemplate();
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function LoadSalaryTemplate() {
                $("#tt").html("");
                var treeId = "";
                $.tool.DataGet('CSPerson', 'SelectSalaryTemplate', '',
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        var root = [];
                        var node = { "text": "所有账套", "state": "open" };
                        var Child = [];
                        if (varObjects.length > 0) {
                            for (var i = 0; i < varObjects.length; i++) {
                                if (treeId == "") {
                                    document.getElementById("SalaryTemplateId").value = varObjects[i].Id;
                                    treeId = "IsLoad";
                                }
                                var nodes = {
                                    "id": varObjects[i].Id,
                                    "text": varObjects[i].Name
                                };
                                Child.push(nodes);
                            }
                            if (document.getElementById("SalaryTemplateId").value != "") {
                                LoadList();
                            }
                            node.children = Child;
                            root.push(node);
                            //2017-06-14优化
                            var LastSelectedNode = null;
                            $('#tt').tree({
                                data: root,
                                onClick: function (node) {
                                    if (node.id != undefined) {
                                        $("#SalaryTemplateId").val(node.id);
                                        LastSelectedNode = node;
                                        LoadList();
                                    } else {
                                        $.messager.alert('错误', '不允许选择"所有账套"', 'error');
                                        $('#tt').tree('select', LastSelectedNode.target);
                                    }
                                }, onLoadSuccess: function (node, data) {
                                    //加载成功就选择第一个节点
                                    var firstNode = $('#tt').tree("find", $('#SalaryTemplateId').val());
                                    $('#tt').tree('select', firstNode.target);
                                    LastSelectedNode = firstNode;
                                }
                            });
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            LoadSalaryTemplate();
        </script>
    </form>
</body>
</html>
