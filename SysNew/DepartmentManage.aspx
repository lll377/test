<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepartmentManage.aspx.cs" Inherits="M_Main.SysNew.DepartmentManage" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            font-family: 微软雅黑;
            background-color: #ffffff;
            padding: 5px;
        }

        .Container {
            width: 100%;
            height: auto;
            margin-top: 5px;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .ContainerLeft {
            float: left;
            width: 25%;
            padding-right: 5px;
            overflow-y: auto;
            border-right: 1px solid #cccccc;
        }

        .ContainerRight {
            float: left;
            width: 73%;
        }

            .ContainerRight ul {
                margin: 0px auto;
                clear: both;
            }

                .ContainerRight ul .InputTitle {
                    list-style-type: none;
                    float: left;
                    text-align: right;
                    margin-bottom: 10px;
                    min-height: 20px;
                    line-height: 22px;
                }

                .ContainerRight ul .TextareaTitle {
                    list-style-type: none;
                    float: left;
                    text-align: right;
                    margin-bottom: 10px;
                }

                .ContainerRight ul .Content {
                    list-style-type: none;
                    float: left;
                    width: 80%;
                    text-align: left;
                    margin-bottom: 10px;
                }

                .ContainerRight ul .ContentBlank {
                    list-style-type: none;
                    float: left;
                    width: 80%;
                    text-align: left;
                    margin-bottom: 10px;
                }

                .ContainerRight ul .Submit {
                    list-style-type: none;
                    text-align: center;
                    padding-top: 4px;
                    width: 80%;
                    height: 40px;
                    text-align: center;
                }

        .Container textarea {
            width: 99%;
            height: 100px;
            overflow-y: scroll;
            resize: none;
            border: 1px solid #cccccc;
            padding-left: 2px;
            font-size: 12px;
        }

        .Container .Content input {
            width: 99%;
            border: 1px solid #cccccc;
            height: 20px;
            padding-left: 2px;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div class="Container">
            <div id="ContainerLeft" class="ContainerLeft" style="height: 500px;">
                <div id="wins" style="overflow: auto;">
                    <ul id="treeDemo" class="easyui-tree">
                    </ul>
                </div>
            </div>
            <div class="ContainerRight">
                <ul>
                    <li class="InputTitle">部门名称：</li>
                    <li class="Content">
                        <input id="DepName" name="DepName" runat="server" class="easyui-validatebox " data-options="required:true">
                    </li>
                </ul>
                <ul>
                    <li class="InputTitle">部门序号：</li>
                    <li class="Content">
                        <input id="Sort" name="Sort" runat="server" style="width: 140px;" class="easyui-validatebox " data-options="required:false">
                        &nbsp;<span style="color: #555555;">备注：需要调整部门所在位置时填写</span>
                    </li>
                </ul>
                <ul>
                    <li class="InputTitle">部门编码：</li>
                    <li class="Content">
                        <input id="DepNum" name="DepNum" runat="server" class="easyui-validatebox " data-options="required:false">
                    </li>
                </ul>
                <ul>
                    <li class="InputTitle">部门类别：</li>
                    <li class="Content">
                        <select id="OrganType" name="OrganType" class="easyui-validatebox" data-options="required:false">
                            <option value="通用" selected="selected">通用</option>
                            <option value="地产">地产</option>
                            <option value="物业">物业</option>
                        </select>
                    </li>
                </ul>
                <ul>
                    <li class="InputTitle">部门类别：</li>
                    <li class="Content">
                        <select id="DepType" name="DepType" required="required">
                            <option value="总部级" selected="selected">总部级</option>
                            <option value="片区级">片区级</option>
                            <option value="区域级">区域级</option>
                            <option value="公司级">公司级</option>
                            <option value="项目级">项目级</option>
                        </select>
                    </li>
                </ul>
                <ul>
                    <li class="InputTitle">上级部门：</li>
                    <li class="ContentBlank">
                        <input id="SortDepName" name="SortDepName" runat="server" class="easyui-searchbox " searcher="SelLastDep" />
                        &nbsp;<span style="color: #555555;">备注：需调整部门所在位置时填取，确定修改生效，刷新浏览</span>
                    </li>

                </ul>
                <ul style="display: none;">
                    <li class="InputTitle" style="clear: both;">组织类型：</li>
                    <li class="Content">
                        <input id="orgTypeName" name="orgTypeName" runat="server" class="easyui-validatebox" style="width: 140px;" disabled="disabled" />
                    </li>
                </ul>
                <ul>
                    <li class="InputTitle">是否隐藏：</li>
                    <li class="Content">
                        <select id="IsHide" name="IsHide">
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </li>
                </ul>
                <ul>
                    <li class="TextareaTitle"><span style="color: #ffffff;">空空</span>备注：</li>
                    <li class="Content">
                        <textarea id="Memo" name="Memo" class="easyui-validatebox"></textarea>
                    </li>
                </ul>

                <ul>
                    <li class="Submit">
                        <table style="margin: auto;">
                            <tr>
                                <td style="height: 25px;">
                                    <input type="checkbox" id="IsRoot" name="IsRoot" value="1" style="width: auto; line-height: 20px;"></td>
                                <td style="height: 25px; line-height: 25px;">是否根目录</td>
                                <td>
                                    <input type="button" butttongroup="1" class="button" value="新增" id="BtnAdd" onclick="AddItemView()" />
                                    <input type="button" butttongroup="2" class="button" style="display: none;" value="确定添加" id="BtnSave" onclick="AddItemClick();" />
                                    <input type="button" butttongroup="2" class="button" style="display: none;" value="返回" id="BtnCancel" onclick="CancelClick();" />
                                </td>
                                <td>
                                    <input type="button" butttongroup="3" class="button" value="确定修改" id="BtnUpdate" onclick="UpdateItemClick();" />
                                </td>
                                <td>
                                    <input type="button" butttongroup="3" class="button" value="确定删除" id="BtnDelete" onclick="DeleteItemClick();" />
                                </td>
                            </tr>
                        </table>
                    </li>
                </ul>
            </div>
        </div>
        <input type="hidden" id="SortDepCode" name="SortDepCode" runat="server" value="" />
        <input type="hidden" id="LastSortCode" name="LastSortCode" runat="server" value="" />
        <input type="hidden" id="DepCode" name="DepCode" runat="server" value="" />
        <input type="hidden" id="Principal" name="Principal" runat="server" value="" />
        <script type="text/javascript">

            var IsRefresh = true;

            function AddItemView() {
                $("input[butttonGroup='1']").css("display", "none");
                $("input[butttonGroup='2']").css("display", "");
                $("input[butttonGroup='3']").css("display", "none");
                InitInputValue();
            }

            function CancelClick() {
                $("input[butttonGroup='1']").css("display", "");
                $("input[butttonGroup='2']").css("display", "none");
                $("input[butttonGroup='3']").css("display", "");
                //加载选择的部门
                NodeItemClick($("#SortDepCode").val());
            }

            function InitInputValue() {
                $("#DepName").val("");
                $("#Sort").val("");
                $("#Principal").val("");
                $("#Memo").val("");
                $("#SortDepName").val("");
                $("#LastSortCode").val("");
                $('#orgTypeName').val("");
                $('#DepType').val('总部级');
            }

            function SelLastDep() {
                HDialog.Open('500', '500', '../DialogNew/SelLastDepart.aspx?SortDepCode=' + $("#SortDepCode").val(), '选择上级部门', true, function callback(_Data) {
                    var arrRet = _Data.split(',');
                    $("#LastSortCode").val(arrRet[0]);
                    $("#SortDepName").searchbox("setValue", arrRet[1]);
                });

            }
            function Travel(DepCode) {//参数为树的ID，注意不要添加#
                var roots = $('#treeDemo').tree('getRoots'), children, i, j;
                for (i = 0; i < roots.length; i++) {
                    if (roots[i].attributes.DepCode == DepCode) {
                        $('#treeDemo').tree('select', roots[i].target);
                    }
                    children = $('#treeDemo').tree('getChildren', roots[i].target);
                    for (j = 0; j < children.length; j++) {
                        if (children[j].attributes.DepCode == DepCode) {
                            $('#treeDemo').tree('select', children[j].target);
                        }
                    }
                }
            }
            //加载信息
            function NodeItemClick(strData) {
                $.tool.DataGet('Department', 'SelDepartment', "SortDepCode=" + strData,
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        for (var i = 0; i < varObjects.length; i++) {
                            $("#DepCode").val(varObjects[i].DepCode);
                            $("#SortDepCode").val(varObjects[i].SortDepCode);
                            $("#DepName").val(varObjects[i].DepName);
                            $("#Sort").val(varObjects[i].Sort);
                            $("#Principal").val(varObjects[i].Principal);
                            $("#Memo").val(varObjects[i].Memo);
                            $("#IsHide").val(varObjects[i].IsHide);
                            //机构类别
                            $("#OrganType").val(varObjects[i].OrganType);
                            $("#LastSortCode").val("");
                            $("#SortDepName").searchbox("setValue", "");
                            $('#orgTypeName').val(varObjects[i].orgTypeName);
                            $("#DepType").val(varObjects[i].DepType);
                            $("#DepNum").val(varObjects[i].DepNum);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            function AddItemClick() {
                $.tool.DataPostChk('frmForm', 'Department', 'AddDepartment', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != '') {
                            if (document.getElementById("IsRoot").checked) {
                                InitTree('');
                            } else {
                                var node = $('#treeDemo').tree('getSelected');
                                if (node) {
                                    $('#treeDemo').tree('append', {
                                        parent: node.target,
                                        data: {
                                            id: _Data,
                                            text: $("#DepName").val()
                                        }
                                    });
                                }
                            }

                            //初始化数据
                            $("#DepName").val("");
                            $("#Sort").val("");
                            $("#Principal").val("");
                            $("#Memo").val("");
                            $("#SortDepName").val("");
                            $('#orgTypeName').val("");
                            $("#LastSortCode").val("");
                            $("#Principal").val("");
                            $("#DepNum").val("");
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }


            function UpdateItemClick() {
                $.tool.DataPostChk('frmForm', 'Department', 'SaveDepartment', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {

                        var node = $('#treeDemo').tree('getSelected');

                        if ($("#SortDepName").val() != '') {
                            $('#treeDemo').tree('remove', node.target);
                        }
                        else {
                            if (node) {
                                $('#treeDemo').tree('update', {
                                    target: node.target,
                                    text: $("#DepName").val()
                                });
                            }
                        }

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            function DeleteItemClick() {
                $.messager.confirm('确认', '是否确定删除?', function (r) {
                    if (r) {
                        $.tool.DataPostChk('frmForm', 'Department', 'DelDepartment', $('#frmForm').serialize(),
                            function Init() {
                            },
                            function callback(_Data) {

                                var node = $('#treeDemo').tree('find', $("#SortDepCode").val());
                                $('#treeDemo').tree('remove', node.target);

                                $("#DepCode").val("");
                                $("#SortDepCode").val("");
                                $("#DepName").val("");
                                $("#Principal").val("");
                                $("#Sort").val("");
                                $("#Memo").val("");
                                $("#IsHide").val("0");
                                //机构类别
                                $("#OrganType").val("通用");
                                $("#DepType").val("总部级");
                                $("#DepNum").val("");

                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function InitTree(Pid) {
                $('#treeDemo').html("");
                $('#treeDemo').tree({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Department&LoadPid=&DepName=' + $("#DepName").val() + '&Command=GetDepartmentTree&' + $('#frmForm').serialize(),
                    onClick: function (node) {
                        NodeItemClick(node.id);
                    },
                    onBeforeExpand: function (row) {
                        if (row) {

                            $("#treeDemo").tree('options').url = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Department&LoadPid=' + row.id + '&Command=GetDepartmentTree&' + $('#frmForm').serialize();
                        }

                    }
                });
            }
            $(function () {
                //初始化树
                InitTree('');
            });


            function InitFunction() {
                var h = $(window).height();
                $("#ContainerLeft").css("height", h - 18 + "px");

            }
            InitFunction();
        </script>
    </form>
</body>
</html>
