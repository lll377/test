<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MtWarehourseAuthorityFrame.aspx.cs" Inherits="M_Main.Mt.MtWarehourseAuthorityFrame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>仓库权限设置</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script language="javascript" src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/Cache.js" type="text/javascript"></script>
    <link href="../css/editcss.css" type="text/css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
        }

        .ContainerLeft {
            float: left;
            overflow-y: auto;
        }

        .Container {
            width: 100%;
            height: auto;
            margin-top: 5px;
            font-size: 12px;
            font-family: 微软雅黑;
        }

            .Container ul {
                margin: 0px auto;
                clear: both;
            }

                .Container ul .InputTitle {
                    list-style-type: none;
                    float: left;
                    text-align: center;
                    margin-bottom: 10px;
                    min-height: 22px;
                    line-height: 22px;
                    width: 90px;
                    text-align: right;
                }

                .Container ul .Content {
                    list-style-type: none;
                    float: left;
                    text-align: left;
                    margin-bottom: 10px;
                    width: 80%;
                }

                .Container ul .Title {
                    list-style-type: none;
                    float: left;
                    text-align: left;
                    margin-bottom: 10px;
                    width: 100%;
                }

                .Container ul .ContentBlank {
                    list-style-type: none;
                    float: left;
                    width: 80%;
                    text-align: left;
                    margin-bottom: 10px;
                }

                .Container ul .Submit {
                    list-style-type: none;
                    text-align: center;
                    padding-top: 4px;
                    width: 80%;
                    height: 40px;
                }

            .Container .Content input {
                width: 99%;
                border: 1px solid #cccccc;
                height: 22px;
                padding-left: 2px;
            }

            .Container .Content select {
                height: 22px;
            }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" value="" id="LoadPid" name="LoadPid" />
        <div class="ContainerLeft" id="divTree" style="width: 20%; overflow-x: hidden; float: left; height: 535px;">
            <div style="margin-top: 6px;"></div>
            <%--            <div style="text-align:left; margin-left:10px; height:21px;"><a class="HrefStyle" style="font-size:14px;" onclick="GetAll();" href="#">全部岗位(<%=totalCount %>)</a></div>--%>
            <ul id="treeDemo" style="margin-left: 6px;" class="easyui-tree">
            </ul>
        </div>

        <div style="width: 79%; overflow-x: hidden; float: right;">

            <div style="border-left: 1px solid #95B8E7; border-right: 1px solid #95B8E7;">
                <div style="width: 100%; background-color: #cccccc;" id="DivContainer">
                </div>
            </div>
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow-x: hidden; overflow-y: auto; width: 500px; height: 400px;" data-options="iconCls:'icon-search',closed: false,modal:true">
            <table class="SearchTable" style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td>
                        <table id="DList" cellspacing="0" border="0" style="border-collapse: collapse;">
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center; padding-top: 10px; padding-bottom: 10px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadBind('Ok');">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="hidden" id="SelReturn" name="SelReturn" />
        <input type="hidden" id="SelRoleCode" name="SelRoleCode" runat="server" />
    </form>
    <script type="text/javascript">

      
        function checkFormAll(chk) {
            var val = $("#SelReturn").val();
            var form = $("#SearchDlg input[type='checkbox']");
            var chkval = "";
            for (var i = 0; i < form.length; i++) {
                //赋值
                if (form[i].value != "on") {
                    chkval = "," + form[i].value
                    if (chk.checked) {
                        if (val.indexOf(chkval) < 0) {
                            val = val + chkval
                        }
                    }
                    else {
                        val = val.replace(chkval, "")
                    }
                    form[i].checked = chk.checked
                }
            }
            $("#SelReturn").val(val);
        }
        function checkFormOne(chk) {
            var val = $("#SelReturn").val();
            var chkval = "";
            chkval = "," + chk.value
            if (chk.checked) {
                if (val.indexOf(chkval) < 0) {
                    val = val + chkval
                }
            }
            else {
                val = val.replace(chkval, "")

            }
            $("#SelReturn").val(val);
        }
        function InitLeftTree() {
            //$.tool.DataPost('Department', 'GetDepartmentTree', "LoadPid=",
            //                                        function Init() {
            //                                        },
            //                                        function callback(_Data) {
            //                                            if (_Data != '') {
            //                                                varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
            //                                                GetTree(varObjects);
            //                                            }
            //                                        },
            //                                        function completeCallback() {
            //                                        },
            //                                        function errorCallback() {
            //                                        });

            $("#treeDemo").tree({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                treeField: 'text',
                idField: 'id',
                lines: true,
                animate: true,
                border: false,
                loadMsg: '加载中,请稍侯...',
                onLoadSuccess: function (node, data) {
                    if (data.length == 1) {
                        //默认展开第一个节点
                        $("#tree").tree("expand", $("#tree").tree("getChildren")[0].target)
                    }
                },
                onBeforeLoad: function (row, param) {
                    param.Class = "Empower_Utils";
                    param.Method = "GetTreeDepartment";
                },
                onBeforeSelect: function (node) {
                    //if (!$(this).tree('isLeaf', node.target) || node.attributes.CommID == 0) {
                    //    return false;
                    //}
                },
                onClick: function (node) {
                    Column = eval("[[]]");
                    LoadRoleDataDlg(node.id);
                    $("#SearchDlg input[type='checkbox']").each(function (i) {
                        $(this).attr("checked", false);
                    });
                    LoadBind(node.id);
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    $('#SearchDlg').dialog('open');
                },
                onSelect: function (row) {

                    $('#frm').form('clear');
                    //InitDataGrid();
                }
            });

        }

        var toolbar = [
            {
                text: '筛选岗位',
                iconCls: 'icon-filter',
                handler: function () {
                    if ($("#DList").html().trim() == "") {
                        HDialog.Info("无岗位信息请重新选择部门!");
                        return;
                    }
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    $('#SearchDlg').dialog('open');
                }
            }, '-',
            {
                text: '保存权限',
                iconCls: 'icon-save',
                handler: function () {
                    HDialog.Prompt("确认保存吗?", function a() {
                        Save();
                    })

                }
            }
        ];

        var frozenColumns = [[
            { field: 'text', title: '仓库', width: 220, align: 'left', sortable: false }
        ]];
        var Column;
        function InitRightChk() {
            $("input[type='checkbox']").each(function (i) {
                if ($(this).val() == '1') {
                    $(this).prop("checked", true);
                }
            });
        }
        function Search() {
            $("#SearchDlg").dialog("close");
            LoadList();
        }
        function Save() {
            var v = '';
            $("input[issubmit='1']").each(function (i) {

                if ($(this).is(':checked') == true) {
                    v = v + "," + $(this).prop("id") + "_1";
                }
                else {
                    v = v + "," + $(this).prop("id") + "_0";
                }

            });
            if (v != '') v = v.substr(1);
            //alert(v);
            ////提交保存结果
            $.tool.DataPostChk('frmForm', 'MaterialBaseHandle', 'SaveMtWarehouseAuthority', 'SelRoleMenuList=' + v,
                function Init() {
                },
                function callback(_Data) {
                    if (_Data.substring(0, 5) == "false") {
                        HDialog.Info(_Data.substring(6));
                    }
                    else {
                        if (_Data == "true")
                            HDialog.Info("保存成功");
                        else
                            HDialog.Info(_Data);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }

        function SelCheck(o) {
            var v = o.id;
            $("input[id*='" + v + "']").each(function (i) {
                if ($(o).is(':checked') == true) {
                    $(this).prop("checked", true);
                }
                else {
                    $(this).prop("checked", false);
                }
            });
        }
        function LoadRoleCol() {
            var selAll = "{field: \'Op1\', title: \"<input id=\'0\' type=\'checkbox\' onclick=\'SelCheck(this);\'>全选\", width: 55,align: \'center\', formatter: function (value, row, rowIndex){return \"<input id=\'\"+row.id+\"\' type=\'checkbox\' onclick=\'SelCheck(this);\'>\";}}";
            var col = '';
            $("#SearchDlg input[type='checkbox']").each(function (i) {
                if (this.value != 'on') {
                    if ($(this).is(':checked') == true) {
                        var varObjects = this.value.split(",");
                        col = col + "," + "{ field: \'" + varObjects[0] + "\',title: \"<input  type=\'checkbox\'  id=\'" + varObjects[0] + "\'  onclick='SelCheck(this);'>" + varObjects[1] + "\", width:80, align: \'center\',formatter: function (value, row, rowIndex){return \"<input type=\'checkbox\'  issubmit='1'   id=\'" + varObjects[0] + "_\"+row.id+\"\' onclick='SelCheck(this);' value=\'\"+row.attributes[\"" + varObjects[0] + "\"]+\"\'>\";}}";
                    }
                }
            });
            col = "[[" + selAll + col + "]]";
            col = eval(col);
            Column = col;
        }
        //加载数据
        function LoadBind(Id) {
            $('#DivContainer').html("");
            if (Id != "") {
                if (Id == "Ok")
                    Id = "";
                LoadRoleCol();
            }
            $("#DivContainer").treegrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                treeField: 'text',
                idField: 'id',
                rownumbers: true,
                nowrap: false,
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: false,
                fitColumns: false,
                IsCustomHead: true,
                cascadeCheck: true,
                toolbar: toolbar,
                border: false,
                loadMsg: '加载中,请稍侯&nbsp;',
                frozenColumns: frozenColumns,
                columns: Column,
                onLoadSuccess: function (data) {
                    InitRightChk();
                    $('#SearchDlg').parent().appendTo($("form:first"));
                },
                onBeforeLoad: function (row, param) {
                    param.Method = "DataPost";
                    param.Class = "MaterialBaseHandle";
                    param.Command = "BindMtWarehouseAuthority";
                    var R = $("#SelReturn").val().substr(1);
                    $("#SelRoleCode").val(R);
                    param["SelRoleCode"] = $("#SelRoleCode").val();
                    param["DepCode"] = Id;
                    return param;
                }
            });
            $("#SearchDlg").dialog("close");
        }
        function GetAll() {
            Column = eval("[[]]");
            LoadRoleDataDlg('');
            $("#SearchDlg input[type='checkbox']").each(function (i) {
                $(this).attr("checked", false);
            });
            LoadBind('');
            $('#SearchDlg').parent().appendTo($("form:first"));
            $('#SearchDlg').dialog('open');
        }
        function GetTree(obj) {
            $('#treeDemo').html("");
            $('#treeDemo').tree({
                data: obj,
                onClick: function (node) {
                    Column = eval("[[]]");
                    LoadRoleDataDlg(node.id);
                    $("#SearchDlg input[type='checkbox']").each(function (i) {
                        $(this).attr("checked", false);
                    });
                    LoadBind(node.id);
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    $('#SearchDlg').dialog('open');
                }
            });
            $("#treeDemo").tree("collapseAll");
        }
        function InitFunction() {
            var h = $(window).height();
            $("#ContainerLeft").css("height", h + "px");
            $("#DivContainer").css("height", h + "px");
        }
        function LoadRoleDataDlg(SortDepCode)
        {
            $.tool.DataGet('MaterialBaseHandle', 'GetLoadRoleData', "SortDepCode=" + SortDepCode,
                function Init() {
                },
                function callback(_Data) {
                    if (_Data != '') {
                        var varHtml = '';
                        var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        var pageSetI = 0;
                        if (varObjects.length > 0)
                            varHtml = '<tr><td colspan="4"><input name="SelAll" type="checkbox" id="SelAll" onclick="checkFormAll(this)"/>全选</td></tr>';

                        for (var i = 0; i < varObjects.length; i++) {
                            if (pageSetI == 0) {
                                varHtml += '<tr><td><input name="cbSel" id="cbSel' + i + '" onclick="checkFormOne(this)" value="' + varObjects[i].RoleCode + ',' + varObjects[i].RoleName + '" type="checkbox"/>' + varObjects[i].RoleName + ' </td>';
                            }
                            else if (pageSetI == 3) {
                                varHtml += '<td><input name="cbSel" id="cbSel' + i + '" onclick="checkFormOne(this)" value="' + varObjects[i].RoleCode + ',' + varObjects[i].RoleName + '" type="checkbox"/>' + varObjects[i].RoleName + ' </td></tr>';
                                pageSetI = -1;
                            }
                            else if (i == varObjects.length - 1) {
                                varHtml += '<td><input name="cbSel" id="cbSel' + i + '" onclick="checkFormOne(this)" value="' + varObjects[i].RoleCode + ',' + varObjects[i].RoleName + '" type="checkbox"/>' + varObjects[i].RoleName + ' </td></tr>';
                                pageSetI = -1;
                            }
                            else {
                                varHtml += '<td><input name="cbSel" id="cbSel' + i + '" onclick="checkFormOne(this)" value="' + varObjects[i].RoleCode + ',' + varObjects[i].RoleName + '" type="checkbox"/>' + varObjects[i].RoleName + ' </td>';
                            }
                            pageSetI++;
                        }
                        if (varObjects.length < 1) {
                            $("#DList").html(varHtml);
                            Column = eval("[[]]");
                        }
                        else
                            $("#DList").html(varHtml);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
            LoadBind("");
        }

        InitFunction();

        $(function ()
        {
            InitLeftTree();
            LoadBind("");
            
        });
    </script>
</body>
</html>
