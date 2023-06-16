<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialTypeManage.aspx.cs" Inherits="M_Main.MaterielNew.MaterialTypeManage" %>

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
            padding: 0px;
        }

        .Container {
            width: 100%;
            height: auto;
            margin-top: 0px;            
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
            padding-top:5px;
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
            <div id="ContainerLeft" class="ContainerLeft">
                <div id="wins" style="overflow: auto;">
                    <ul id="treeDemo" class="easyui-tree">
                    </ul>
                </div>
            </div>
            <div class="ContainerRight">
                
                <ul>
                    <li class="InputTitle" style=" width:84px;">类别名称：</li>
                    <li class="Content">
                        <input id="Name" name="Name" runat="server" class="easyui-validatebox " data-options="required:true">
                    </li>
                </ul>
                <ul>
                    <li class="InputTitle" style=" width:84px;">类别序号：</li>
                    <li class="Content">
                        <input id="Sort" name="Sort" runat="server" class="easyui-validatebox " data-options="required:true">
                    </li>
                </ul>
                <ul>
                    <li class="TextareaTitle" style=" width:84px;"><span style="color: #ffffff;"></span>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</li>
                    <li class="Content">
                        <textarea id="Memo" name="Memo" class="easyui-validatebox"></textarea>
                    </li>
                </ul>

                <ul>
                    <li class="InputTitle" style=" width:84px;">成本科目编码：</li>
                    <li class="Content">
                        <input id="CostCode" name="CostCode" style=" width:95%" runat="server" class="easyui-validatebox ">
                    </li>
                </ul>
                <ul>
                    <li class="InputTitle" style=" width:84px;">上级位置：</li>
                    <li class="ContentBlank">
                        <input id="SortDepName" name="SortDepName" runat="server" class="easyui-searchbox " searcher="SelLastDep" />
                        &nbsp;<span style="color: #cccccc;">备注：需调整类别所在位置填取</span>
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
        <input type="hidden" id="Code" name="Code" runat="server" value="" />
        <script type="text/javascript">

            function AddItemView() {
                $("input[butttonGroup='1']").css("display", "none");
                $("input[butttonGroup='2']").css("display", "");
                $("input[butttonGroup='3']").css("display", "none");
                InitInputValue();
            }

            function CancelClick()
            {
                $("input[butttonGroup='1']").css("display", "");
                $("input[butttonGroup='2']").css("display", "none");
                $("input[butttonGroup='3']").css("display", "");
                //加载选择的部门
                NodeItemClick($("#SortDepCode").val());
            }
            //初始化表单
            function InitInputValue()
            {
               
                $("#Name").val("");
                $("#Sort").val("");
                $("#Memo").val("");
                $("#CostCode").val("");
                $("#SortDepName").val("");
                $("#LastSortCode").val("");      
            }
            //上级位置
            function SelLastDep() {
                HDialog.Open('500', '500', '../DialogNew/MaterialTypeDepart.aspx?SortDepCode=' + $("#SortDepCode").val(), '选择上级类别', true, function callback(_Data) {
                    var arrRet = _Data.split(',');
                    $("#LastSortCode").val(arrRet[0]);
                    $("#SortDepName").searchbox("setValue", arrRet[1]);
                });

            }
            //选中树节点
            function Travel(DepCode) {//参数为树的ID，注意不要添加#
                var roots = $('#treeDemo').tree('getRoots'), children, i, j;
                for (i = 0; i < roots.length; i++) {
                    if (roots[i].attributes.Id == DepCode) {
                        $('#treeDemo').tree('select', roots[i].target);
                    }
                    children = $('#treeDemo').tree('getChildren', roots[i].target);
                    for (j = 0; j < children.length; j++) {
                        if (children[j].attributes.Id == DepCode) {
                            $('#treeDemo').tree('select', children[j].target);
                        }
                    }
                }
            }
            //加载信息
            function NodeItemClick(strData) {
                $.tool.DataGet('MaterialTypeHandle', 'SelDepartment', "SortDepCode=" + strData,
                                                    function Init() {
                                                    },
                                                    function callback(_Data) {
                                                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                                        for (var i = 0; i < varObjects.length; i++) {
                                                            $("#Code").val(varObjects[i].Id);
                                                            $("#SortDepCode").val(varObjects[i].SortCode);
                                                            $("#Name").val(varObjects[i].Name);
                                                            $("#Sort").val(varObjects[i].Sort);
                                                            $("#Memo").val(varObjects[i].Memo);
                                                            $("#CostCode").val(varObjects[i].CostCode);
                                                            $("#LastSortCode").val("");
                                                            $("#SortDepName").searchbox("setValue", varObjects[i].ShangJiName);
                                                            

                                                        }
                                                    },
                                                    function completeCallback() {
                                                    },
                                                    function errorCallback() {
                                                    });
            }
            //确定添加
            function AddItemClick() {
                $.tool.DataPostChk('frmForm', 'MaterialTypeHandle', 'AddDepartment', $('#frmForm').serialize(),
                                                    function Init() {
                                                    },
                                                    function callback(_Data) {
                                                        $("#treeDemo").html("");
                                                        if (_Data != '') {
                                                            //初始化数据
                                                            $("#Name").val("");
                                                            $("#Sort").val("");
                                                            $("#Memo").val("");
                                                            $("#SortDepName").val("");
                                                            $("#LastSortCode").val("");
                                                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                                            GetTree(varObjects);
                                                            //通地DepCode来查找上次点击的节点
                                                            Travel($("#Code").val());
                                                        }
                                                    },
                                                    function completeCallback() {
                                                    },
                                                    function errorCallback() {
                                                    });
            }
            //确定修改
            function UpdateItemClick() {
                $.tool.DataPostChk('frmForm', 'MaterialTypeHandle', 'SaveDepartment', $('#frmForm').serialize(),
                                                    function Init() {
                                                    },
                                                    function callback(_Data)
                                                    {
                                                        $("#treeDemo").html("");
                                                        console.log(_Data);
                                                        if (_Data != '') {
                                                            HDialog.Info("修改成功!");
                                                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                                            GetTree(varObjects);
                                                            var node = $('#treeDemo').tree('find', $("#SortDepCode").val());
                                                            if (node != null) $('#treeDemo').tree('select', node.target);
                                                            else {
                                                                //通地DepCode来查找上次点击的节点
                                                                Travel($("#Code").val());
                                                            }
                                                        }
                                                    },
                                                    function completeCallback() {
                                                    },
                                                    function errorCallback() {
                                                    });
            }
            //确定删除
            function DeleteItemClick()
            {
                $.messager.confirm('确认', '是否确定删除?', function (r) {
                    if (r) {
                        $.tool.DataPostChk('frmForm', 'MaterialTypeHandle', 'DelDepartment', $('#frmForm').serialize(),
                                function Init() {
                                },
                            function callback(_Data)
                            {

                                    $("#treeDemo").html("");
                                    $("#Code").val("");
                                    $("#SortDepCode").val("");
                                    $("#Name").val("");                                   
                                    $("#Sort").val("");
                                    $("#Memo").val("");
                                    $("#CostCode").val("");
                                   
                                    if (_Data != '')
                                    {
                                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                        GetTree(varObjects);
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {                                   
                                });
                    }
                });
            }


            //加载左侧树
            function InitLeftTree() {
                $.tool.DataGet('MaterialTypeHandle', 'GetDepartmentTree', "",
                                                        function Init() {
                                                        },
                                                        function callback(_Data) {
                                                            if (_Data != '') {
                                                                varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                                                GetTree(varObjects);
                                                            }
                                                        },
                                                        function completeCallback() {
                                                        },
                                                        function errorCallback() {
                                                        });
            }
            //加载树【含点击】
            function GetTree(obj) {
                $('#treeDemo').html("");
                $('#treeDemo').tree({
                    data: obj,
                    onClick: function (node) {
                        NodeItemClick(node.id);
                    }
                });
            }
            InitLeftTree();
            //调整左侧界面高度
            function InitFunction() {
                var h = $(window).height();
                $("#ContainerLeft").css("height", h  + "px");
            }
            InitFunction();
        </script>
    </form>
</body>
</html>
