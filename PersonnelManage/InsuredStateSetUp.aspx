<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsuredStateSetUp.aspx.cs" Inherits="M_Main.PersonnelManage.InsuredStateSetUp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
</head>
<body style="margin: 0px 0px;padding:0px 0px;" scroll="no">
    <form id="FrmForm" runat="server">
        <%--操作权限--%>
        <input id="IsOpAuthority" name="IsOpAuthority" type="hidden" runat="server"/>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="InsuredDetail" class="easyui-dialog" title="参保详情" data-options="iconCls:'icon-search',closed: true,modal:true" style="width:600px; height:200px; padding: 10px;">
            <table style="width: 100%;height:100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">姓名</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" style="width: 144px" id="Name" name="Name"  readonly="readonly"/>
                        <input type="hidden" id="ID" name="ID"/>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否参保</td>
                    <td class="TdContent">
                        <select id="IsInsured" name="IsInsured" style="width: 148px">
                            <option value="0" selected="selected">未设置</option>
                            <option value="1">否</option>
                            <option value="2">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">参保类型</td>
                    <td class="TdContent">
                        <select id="InsuredTypeID" name="InsuredTypeID" runat="server" style="width: 148px">
                            
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="SaveInsured();" id="save">保存</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="CloseInsured();">取消</a>
                    </td>
                </tr>
            </table>
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 600px; height: 200px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">名字</td>
                    <td class="TdContent">
                       <input id="PersonName" name="PersonName"  style="width: 144px;"/>
                       <input id="PersonID" name="PersonID"  type="hidden"/>
                    </td>
                    <td class="TdTitle">人事机构</td>
                    <td class="TdContent">
                         <input type="text" id="DepName" name="DepName" onclick="SelDepartment('')"
                            style="width: 144px;" />
                        <input type="hidden" id="SortDepCode" name="SortDepCode"/>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">岗位</td>
                    <td class="TdContent">
                    <input type="text" id="RoleName" name="RoleName" onclick="SelRole()"
                            style="width: 144px;" />
                        <input type="hidden" id="RoleCode" name="RoleCode"/>
                     </td>
                    <td class="TdTitle">证件号码
                    </td>
                    <td class="TdContent">
                        <input id="PaperCode" name="PaperCode" type="text" style="width: 144px;" />
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">是否参保</td>
                    <td class="TdContent">
                        <select id="IsInsured1" name="IsInsured1" style="width: 146px;">
                            <option value="" selected="selected">全部</option>
                            <option value="0">未设置</option>
                            <option value="1">否</option>
                            <option value="2">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">参保类型</td>
                    <td class="TdContent">
                        <select id="InsuredTypeID1" name="InsuredTypeID1" runat="server" style="width: 146px;" >
                            
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">人员状态
                    </td>
                    <td class="TdContent" colspan="7" style="width: 90%; height: 30px;">
                        <input type="checkbox" id="Chk1" name="checkbox1" value="已建档" style="border: none; width: 15px;" checked="checked" />&nbsp;已建档&nbsp;
                        <%--<input type="checkbox" id="Chk2" name="checkbox1" value="已应聘未入职" style="border: none; width: 15px;" />&nbsp;已应聘未入职&nbsp;--%>
                        <input type="checkbox" id="Chk3" name="checkbox1" value="已入职未转正" style="border: none; width: 15px;" checked="checked" />&nbsp;已入职未转正&nbsp;
                        <input type="checkbox" id="Chk4" name="checkbox1" value="已转正未离职" style="border: none; width: 15px;" checked="checked" />&nbsp;已转正未离职&nbsp;
                        <input type="checkbox" id="Chk5" name="checkbox1" value="已离职" style="border: none; width: 15px;" />&nbsp;已离职&nbsp;
                    </td>
                    
                </tr>
                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a></td>
                </tr>
            </table>
        </div>
        
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
            //所属人事机构
            function SelDepartment(str) {
                var LableTitle = "";
                   LableTitle = "人事所属机构";
                HDialog.Open('400', '403', "../dialog/DepartmentDlgNew_hr.aspx?Ram=" + Math.random() + "&LableTitle=" + LableTitle, '选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息

                        var varObjects = _Data.split("~");
                        var varDepObj = "";
                        var depName = "";
                        var depCode = "";
                        var depCode = "";
                        for (var i = 0; i < varObjects.length; i++) {
                            varDepObj = varObjects[i].split('\t');
                            depName += varDepObj[2] + ",";
                            depCode += varDepObj[0] + ",";
                        }
                        depName = depName.substr(0, depName.length - 1);
                        depCode = depCode.substr(0, depCode.length - 1);
                        $("#DepName").val(depName);
                        $("#SortDepCode").val(depCode);
                    }
                });
            }
            //岗位
            function SelRole() {
                HDialog.Open('370', '300', "../PersonnelManage/SelRoleNew.aspx?Ram=" + Math.random(), '选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var varObjects = _Data.split("~");
                        var varRoleObj = "";
                        var roleName = "";
                        var roleCode = "";
                        for (var i = 0; i < varObjects.length; i++) {
                            varRoleObj = varObjects[i].split('\t');
                            roleName += varRoleObj[0] + ",";
                            roleCode += varRoleObj[2] + ",";
                        }
                        roleCode = roleCode.substr(0, roleCode.length - 1);
                        roleName = roleName.substr(0, roleName.length - 1);
                        $("#RoleCode").val(roleCode);
                        $("#RoleName").val(roleName);
                    }
                });

            }


            function InitTableHeight() {
                var h = $(window).height();
                var w = $(window).width();
                $("#TableContainer").css("height", h-1.5+"px");
            }
           
            InitTableHeight();
            var column = [[
                { field: 'parantDepName', title: '人事所属机构', width: '180px', align: 'left', sortable: true },
                { field: 'DepName', title: '部门', width: 120, align: 'left', sortable: true },
                { field: 'RoleName', title: '岗位', width: 100, align: 'left', sortable: true },
                {
                    field: 'Name', title: '姓名', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"InsuredDetail('" + row.ID + "','" + row.Name + "','" + row.PersonID + "','" + row.IsInsured + "','" + row.InsuredTypeID + "','" + row.InsuredTypeName + "')\">" + row.Name + "</a>";
                        return str;
                    }
                },
                { field: 'Sex', title: '性别', width: 50, align: 'left', sortable: true },
                { field: 'PaperCode', title: '证件号码', width: 180, align: 'left', sortable: true },
                { field: 'MobilePhone', title: '移动电话', width: 150, align: 'left', sortable: true},
                {
                    field: 'IsInsured', title: '是否参保', width: 80, align: 'left', sortable: true,  formatter: function (value, row, index) {
                        var html = "";//0=未设置(绿色),1=否(红色),2=是(黑色)
                        if (row.IsInsured == "2") {
                            html = " <span>是</span> ";
                        } else if (row.IsInsured == "1") {
                            html = " <span style=\"color:red;\">否</span> ";
                        } else {
                             html = " <span style=\"color:green;\">未设置</span> ";
                        }
                        return html;
                    }
                },
                { field: 'InsuredTypeName', title: '参保类型', width: 100, align: 'left', sortable: true },
                { field: 'PersonState', title: '人员状态', width: 100, align: 'left', sortable: true }
            ]];

            function InsuredDetail(ID,Name,PersonID,IsInsured,InsuredTypeID,InsuredTypeName) {
                $("#ID").val(ID);
                $("#Name").val(Name);
                $("#PersonID").val(PersonID);
                if (IsInsured == "") {
                    IsInsured = "0";
                }
                $("#IsInsured").val(IsInsured);
                $("#InsuredTypeID").val(InsuredTypeID);

                if ($("#IsOpAuthority").val() == "0") {
                    $("#Name").attr("disabled", true);
                    $("#IsInsured").attr("disabled", true);
                    $("#InsuredTypeID").attr("disabled", true);
                    $("#save").css("display", "none");
                } else {
                    $("#Name").attr("disabled", false);
                    $("#IsInsured").attr("disabled", false);
                    $("#InsuredTypeID").attr("disabled", false);
                    $("#save").css("display", "inline-block");

                }
                $("#SearchDlg").dialog("close");
                $('#InsuredDetail').parent().appendTo($("form:first"))
                $('#InsuredDetail').dialog('open');
                
            }

            function SaveInsured() {
               var ID = $("#ID").val();
               var IsInsured = $("#IsInsured").val();
               var InsuredTypeID = $("#InsuredTypeID").val();
               var PersonID = $("#PersonID").val();
                $.messager.confirm('确定', '是否修改参保类型', function (r) {
                    if (r) {
                        $.tool.DataGet('CSPerson', 'SaveInsured', 'ID=' + ID+'&IsInsured='+IsInsured+'&InsuredTypeID='+InsuredTypeID+'&PersonID='+PersonID,
                            function Init() {
                            },
                            function callback(_Data) {
                               HDialog.Info(_Data);
                                 $("#SearchDlg").dialog("close");
                                 $("#InsuredDetail").dialog("close");
                                LoadList();

                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

             function CloseInsured() {
                $("#ID").val("");
                $("#Name").val("");
                $("#IsInsured").val("");
                $("#InsuredTypeID").val("");
                 $("#SearchDlg").dialog("close");
                $("#InsuredDetail").dialog("close");
            }

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var url = "../PersonnelManage/InsuredStateExecl.aspx?MathNumber="+Math.round();
                        window.open(url);
                    }
                }, '-',
                {
                    text: '<font color=red>&nbsp;&nbsp;&nbsp;&nbsp; *点击人员设置参保类型。</font>'
                }
            ];

           
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSPerson&Command=InsuredTypeList&' + $('#FrmForm').serialize(),
                    method: "get",
                    nowrap: true,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc"
                });

                $("#SearchDlg").dialog("close");
                $("#InsuredDetail").dialog("close");
            }

            LoadList();

        </script>
    </form>
</body>
</html>
