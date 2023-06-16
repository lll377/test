<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManage.aspx.cs" Inherits="M_Main.SysNew.UserManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/PinYin.js" type="text/javascript"></script>
    <link href="../css/framedialog_fourcol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <style type="text/css">
        .panel-header {
            background: #f5f5f5 none repeat scroll 0 0;
        }

        .panel-header, .panel-body {
            border-color: #cccccc;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="CommID" name="CommID" runat="server" value="0" />
        <input type="hidden" id="CommIDs" name="CommIDs" runat="server" />
        <input type="hidden" id="OrganId" name="OrganId" runat="server" />
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">人员名称
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true"
                        id="UserName" name="UserName" runat="server" onblur="GetLoginCode();" />
                </td>
                <td class="DialogTdTitle">组织机构
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true"
                        id="DepName" name="DepName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle" style="display: none;">所属公司
                </td>
                <td class="DialogTdContent" style="display: none;">
                    <input type="text" class="easyui-validatebox"
                        id="OrganName" name="OrganName" runat="server" onclick="SelOrgan();" />
                </td>
                <td class="DialogTdTitle">所属项目
                </td>
                <td class="DialogTdContent_2Col" colspan="3">
                    <input type="text" class="easyui-validatebox"
                        id="CommName" name="CommName" onclick="SelComm();" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">登录账号
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true"
                        id="LoginCode" name="LoginCode" runat="server" />
                </td>
                <td class="DialogTdTitle">密码
                </td>
                <td class="DialogTdContent">
                    <input type="password" class="easyui-validatebox"
                        id="LoginPwd" name="LoginPwd" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">呼叫系统工号
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox"
                        id="EmployeeCode" name="EmployeeCode" runat="server" />
                </td>
                <td class="DialogTdTitle">财务制单人编号
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox"
                        id="WorkerSign" name="WorkerSign" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">邮件系统别名
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox"
                        id="Email" name="Email" runat="server" />
                </td>
                <td class="DialogTdTitle">授权机器码
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox"
                        id="MachineCodes" name="MachineCodes" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">移动电话
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox"
                        id="MobileTel" name="MobileTel" runat="server" />
                </td>
                <td class="DialogTdTitle">是否开通员工APP
                </td>
                <td class="DialogTdContent">
                    <select id="IsMobile" name="IsMobile" runat="server">
                        <option value="1" selected>是</option>
                        <option value="0">否</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">员工状态</td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox"
                        id="EmployeeStatus" name="EmployeeStatus" runat="server" readonly />
                </td>
                <td class="DialogTdTitle">员工星级</td>
                <td class="DialogTdContent">
                    <select id="EmployeeStar" name="EmployeeStar" runat="server">
                        <option value="一星">一星</option>
                        <option value="二星">二星</option>
                        <option value="三星">三星</option>
                        <option value="四星">四星</option>
                        <option value="五星">五星</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">员工工种</td>
                <td class="DialogTdContent">
                    <select id="EmployeeProfession" name="EmployeeProfession" runat="server">
                    </select></td>
                <td class="DialogTdTitle">备注</td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="Memo" name="Memo" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">头像</td>
                <td class="DialogTdContent_2Col" colspan="3">
                    <div id="FileList" style="float: left;"></div>
                    <div id="BtnUpFile" style="border: 1px solid #cccccc; width: 100px; height: 120px; text-align: center; float: left;">
                        <img id="ImgSrc" src="../images/nopicture2.jpg" style="margin-top: 10px; width: 80px; height: 80px;" />
                    </div>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">岗位<br />
                </td>
                <td class="DialogTdContent_2Col" colspan="3" id="Tbl">

                    <div id="Container" style="border: 1px solid #cccccc; height: 170px;">
                        <div id="TableContainer"></div>
                    </div>

                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">说明</td>
                <td class="DialogTdContent_2Col" colspan="3">
                    <span style="color: red">1、呼叫中心工号只有在开通呼叫中心时才填，没有开通呼叫中心时不填。2、一个人员可以绑定多个岗位。</span>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center; padding-top: 10px;">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>


        <input id="UpFile" type="file" runat="server" name="UpFile" style="width: 1px; visibility: hidden" accept="image/*" />
        <input id="OpType" type="hidden" name="OpType" runat="server" />
        <input id="UserCode" type="hidden" name="UserCode" runat="server" />
        <input id="DepCode" type="hidden" name="DepCode" runat="server" />
        <input type="hidden" id="HeadImg" name="HeadImg" runat="server" />
        <input type="hidden" id="PassWord" name="PassWord" runat="server" />
        <input type="hidden" id="IsLogin" name="IsLogin" runat="server" />
        <input type="hidden" id="IsDelete" name="IsDelete" runat="server" />
        <input type="hidden" id="OldLoginCode" name="OldLoginCode" runat="server" />
        <input type="hidden" id="OldEmployeeCode" name="OldEmployeeCode" runat="server" />
        <input type="hidden" id="UserRoleList" name="UserRoleList" runat="server" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function GetLoginCode() {
                var Py = codefans_net_CC2PY($("#UserName").val());
                $("#LoginCode").val(Py);
            }

            $("#DepName").click(function (e) {
                SelDep();
            });

            $("#BtnUpFile").click(function (e) {
                $("#UpFile").click();
            });

            $("#UpFile").change(function (e) {
                UpLoadFile();
            });

            function InitSize() {
                var w = $("#Tbl").width();
                var pw = w * 0.94;
                $("#Container").css("width", pw + "px");
            }
            InitSize();

            //加载上次上传的图片
            if ($("#HeadImg").val() != "") {
                $("#FileList").html("<img style='border:1px solid #cccccc;width:100px;height:120px;margin-right:5px;' src='" + $("#HeadImg").val() + "'/>");
            }
            function SelDep() {
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
                    var arrRet = _Data.split(',');
                    $("#DepCode").val(arrRet[0]);
                    $("#DepName").val(arrRet[1]);
                });
            }

            $("#BtnSave").click(function () {
                var LoginPwd = $("#LoginPwd").val();
                //var reg = /^(?=.*[a-zA-Z])(?=.*[~!@#$%^&*()_+`\-={}:";'<>?,.\/]).{6,}$/;
                //var reg = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[~!@#$%^&*()_+`\-={}:";'<>?,.\/])[\da-zA-Z~!@#$%^&*()_+`\-={}:";'<>?,.\/]{8,}$/;
                var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,}$/;

                //当密码为空的时候不检查密码
                if ($("#OpType").val() == "edit") {
                    if (LoginPwd != "") {

                        if (!CheckIsCanEditPsw()) {
                            HDialog.Info("用户每天至多只能修改一次密码!");
                            return;
                        }

                        if (LoginPwd.length > 7) {
                            if (!reg.test(LoginPwd)) {
                                HDialog.Info('密码必须包含数字、字母。');
                                return;
                            }
                        } else {
                            HDialog.Info('密码长度不得少于8位。');
                            return;
                        }
                    }
                } else {
                    if (LoginPwd.length > 7) {
                        if (!reg.test(LoginPwd)) {
                            HDialog.Info('密码必须包含数字、字母。');
                            return;
                        }
                    } else {
                        HDialog.Info('密码长度不得少于8位。');
                        return;
                    }
                }


                $.tool.DataPostChk('frmForm', 'User', 'GetUserCode', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == $("#LoginPwd").val()) {
                            HDialog.Info("新密码不能跟旧密码一致。");
                            return;
                        } else {
                            var row = $("#TableContainer").datagrid("getRows");
                            var UserRoleList = JSON.stringify(row);
                            $("#UserRoleList").val(UserRoleList);
                            $.tool.DataPostChk('frmForm', 'User', 'SaveUser', $('#frmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data.substring(0, 5) == "false") {
                                        HDialog.Info(_Data.substring(6));
                                    }
                                    else {
                                        HDialog.Close('1');
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            });

            function CheckIsCanEditPsw() {
                var isCan = true;
                $.tool.DataPostChk('frmForm', 'User', 'CheckIsCanEditPsw', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "false") {
                            isCan = false;
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
                return isCan;
            }

            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });

            column = [[
                { field: 'DepName', title: '组织机构', width: '300px', align: 'left', sortable: true },
                { field: 'RoleName', title: '岗位名称', width: '120px;', align: 'left', sortable: true },
                { field: 'SysRoleName', title: '通用岗位', width: '120px', align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        HDialog.Open('1024', '600', '../DialogNew/RoleFrame.aspx', '选择岗位', true, function callback(_Data) {
                            var Obj = JSON.parse(_Data);

                            var _AllData = $('#TableContainer').datagrid('getData');
                            var row_index = _AllData.rows.length;

                            $('#TableContainer').datagrid('insertRow', {
                                index: row_index,
                                row: { RoleCode: Obj.RoleCode, DepName: Obj.DepName, RoleName: Obj.RoleName, SysRoleName: Obj.SysRoleName, UserRoleCode: '' }
                            });
                        });
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        var index = $("#TableContainer").datagrid("getRowIndex", row);
                        $('#TableContainer').datagrid('deleteRow', index);
                    }
                }
            ];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=User&Command=RoleList&UserCode=' + $("#UserCode").val(),
                    method: "get",
                    nowrap: true,
                    pageSize: 50,
                    pageList: [50, 150, 300],
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: false,
                    height: 170,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc"
                });
            }
            LoadList();

            function getFileName(o) {
                var pos = o.lastIndexOf("\\");
                return o.substring(pos + 1);
            }
            function UpLoadFile() {
                var file = $("#UpFile").val();
                var fileName = getFileName(file);

                var fd = new FormData();
                fd.append("UpFileData", $("#UpFile")[0].files[0]);
                fd.append("file", fileName);

                $.tool.pageLoadInfo("上传中，请等待");
                $.ajax({
                    url: "../UpLoad/UpFile.aspx",
                    type: "POST",
                    processData: false,
                    contentType: false,
                    data: fd,
                    success: function (addr) {
                        $.tool.pageUnLoading();
                        $("#HeadImg").val(addr);
                        if (addr.length > 200) {
                            HDialog.Info('上传失败啦,重新试试吧');
                            return;
                        }
                        else {
                            $("#FileList").html("<img style='border:1px solid #cccccc;width:100px;height:120px;margin-right:5px;' src='" + addr + "'/>");
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.tool.pageUnLoading();
                        HDialog.Info('上传失败啦,重新试试吧');
                    }
                });
            }

            $(".panel-header").css("background-color", "#f5f5f5");


            //function SelComm() {
            //    HDialog.Open(700, 400, '../DialogNew/SelComm.aspx', "选择管理项目", false, function callback(_Data) {
            //        var arrRet = JSON.parse(_Data);
            //        $("#CommID").val(arrRet.attributes.InPopedom);
            //        $("#CommName").val(arrRet.text);
            //    });
            //}
            function SelComm() {
                var w = $(window).width() * 0.7;
                HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommIDs").val(arrRet.id);
                    $("#CommName").val(arrRet.name);
                });
            }

            function SelOrgan() {
                HDialog.Open(700, 400, '../DialogNew/SelOrgan.aspx', "选择公司", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#OrganId").val(arrRet.attributes.OrganCode);
                    $("#OrganName").val(arrRet.text);
                });
            }

        </script>

    </form>
</body>
</html>
