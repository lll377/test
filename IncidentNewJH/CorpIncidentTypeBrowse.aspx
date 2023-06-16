<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorpIncidentTypeBrowse.aspx.cs" Inherits="M_Main.IncidentNewJH.CorpIncidentTypeBrowse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>报事类别设置</title>
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>

    <script type="text/javascript" src="../jscript/jquery.tool.new.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framedialog_twocol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />

    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
            valign: top;
        }

        .Container {
            width: 100%;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .ContainerLeft {
            float: left;
            width: 26%;
            padding-right: 5px;
            overflow-y: auto;
            border-right: 1px solid #cccccc;
        }

        .ContainerRight {
            float: left;
            width: 73%;
        }
    </style>
</head>
<body style="padding: 0px; margin: 0px;">
    <form id="CorpIncidentTypeBrowse" method="post" runat="server">
        <input id="CostCode" type="hidden" name="CostCode" runat="server" />
        <input id="EditState" type="hidden" name="EditState" runat="server" />
        <input id="hIsBigClass" type="hidden" name="hIsBigClass" runat="server" />
        <input id="SelIndex" type="hidden" name="SelIndex" runat="server" />
        <input id="CorpCostID" type="hidden" name="CorpCostID" runat="server" />
        <input id="IsTreeRoot" type="hidden" name="IsTreeRoot" runat="server" />
        <input id="PrentCostCode" type="hidden" name="PrentCostCode" runat="server" />
        <input id="hiplace" type="hidden" name="hiplace" runat="server" />
        <input id="hiClassID" type="hidden" name="hiClassID" runat="server" />
        <input id="ztreeData" type="hidden" runat="server" name="ztreeData" />
        <input id="isSave" type="hidden" runat="server" name="isSave" value="0" />
        <div class="Container" style="padding-bottom: 1px;">
            <div id="ContainerLeft" class="ContainerLeft">
                <div id="OrganTree" style="border: none; width: 100%;">
                    <ul id="treeDemo" class="ztree" runat="server"></ul>
                </div>
            </div>
            <div id="ContainerRight" class="ContainerRight" style="overflow-y: auto;">
                <div id="OrganCommManage" style="border: none; width: 100%; overflow-y: auto;">
                    <table id="TableCostType" class="DialogTable" style="overflow-y: auto;">
                        <tr>
                            <td class="DialogTdTitle">排序号</td>
                            <td class="DialogTdContent">
                                <input class="easyui-validatebox" id="CorpTypeIndex" maxlength="50" name="CorpTypeIndex" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">报事类型</td>
                            <td class="DialogTdSearchContent">
                                <select id="DrClass" name="DrClass" runat="server">
                                    <option value="1">书面报事</option>
                                    <option value="2">口派报事</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">报事责任</td>
                            <td class="DialogTdSearchContent">
                                <asp:DropDownList ID="Duty" Name="Duty" runat="server">
                                    <asp:ListItem Value="地产类">地产类</asp:ListItem>
                                    <asp:ListItem Value="物业类">物业类</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">报事类别</td>
                            <td class="DialogTdContent">
                                <input class="easyui-validatebox" id="TypeName" maxlength="50" data-options="required: true" name="TypeName" runat="server" />
                            </td>
                        </tr>

                        <tr>
                            <td class="DialogTdTitle">是否大类</td>
                            <td class="DialogTdSearchContent">
                                <select name="IsBigClass" id="IsBigClass" runat="server">
                                    <option value="0">否</option>
                                    <option value="1" selected="selected">是</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">所属专业</td>
                            <td class="DialogTdSearchContent">
                                <select id="BelongProfessional" name="BelongProfessional" runat="server">
                                    <option value="客服">客服</option>
                                    <option value="工程">工程</option>
                                    <option value="环境">环境</option>
                                    <option value="秩序">秩序</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">是否投诉</td>
                            <td class="DialogTdSearchContent">
                                <select name="IsTousu" id="IsTousu" runat="server">
                                    <option selected="selected" value="0">否</option>
                                    <option value="1">是</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">适用范围</td>
                            <td class="DialogTdContent">
                                <asp:CheckBox ID="CKPlace1" runat="server" Text="户内"></asp:CheckBox>
                                <asp:CheckBox ID="CKPlace2" runat="server" Text="公区"></asp:CheckBox></td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">分派时限（小时）</td>
                            <td class="DialogTdContent">
                                <input class="easyui-validatebox" id="DispLimit" data-options="prompt:'请输入数字',validType:'digital'" maxlength="50"
                                    name="DispLimit" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">接单时限（小时）</td>
                            <td class="DialogTdContent">
                                <input class="easyui-validatebox" id="OrderLimit" data-options="prompt:'请输入数字',validType:'digital'" maxlength="50"
                                    name="OrderLimit" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">处理时限（户内，小时）</td>
                            <td class="DialogTdContent">
                                <input class="easyui-validatebox" id="DealLimit" data-options="prompt:'请输入数字',validType:'digital'" maxlength="50"
                                    name="DealLimit" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">处理时限（公区，小时）</td>
                            <td class="DialogTdContent">
                                <input class="easyui-validatebox" data-options="prompt:'请输入数字',validType:'digital'" id="DealLimit2" maxlength="50"
                                    name="DealLimit2" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">关闭时限（小时）</td>
                            <td class="DialogTdContent">
                                <input class="easyui-validatebox" id="CloseLimit" data-options="prompt:'请输入数字',validType:'digital'" maxlength="50"
                                    name="CloseLimit" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">回访时限（小时）</td>
                            <td class="DialogTdContent">
                                <input class="easyui-validatebox" id="ReplyLimit" data-options="prompt:'请输入数字',validType:'digital'" maxlength="50"
                                    name="ReplyLimit" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">预约提示（小时）</td>
                            <td class="DialogTdContent">
                                <input class="easyui-validatebox" id="ReserveHint" data-options="prompt:'请输入数字',validType:'digital'" maxlength="50"
                                    name="ReserveHint" runat="server" /></td>
                        </tr>
                        <tr class="IsSmall">
                            <td class="DialogTdTitle">分派岗位</td>
                            <td class="DialogTdSearchContent">
                                <input id="AssignedPost" style="width: 90%;" name="AssignedPost" data-options="editable:false,searcher:SelAssignedPost" class="easyui-searchbox" runat="server" />
                                <input id="AssignedPostIDs" name="AssignedPostIDs" type="hidden" runat="server" />
                            </td>
                        </tr>
                        <tr class="IsSmall">
                            <td class="DialogTdTitle">处理岗位</td>
                            <td class="DialogTdSearchContent">
                                <input id="ProcessPost" name="ProcessPost" style="width: 90%;" class="easyui-searchbox" data-options="editable:false,searcher:SelProcessPost" runat="server" />
                                <input id="ProcessPostIDs" name="ProcessPostIDs" type="hidden" runat="server" />
                            </td>
                        </tr>
                        <tr class="IsSmall">
                            <td class="DialogTdTitle">关闭岗位</td>
                            <td class="DialogTdSearchContent">
                                <input id="ClosePost" name="ClosePost" style="width: 90%;" class="easyui-searchbox" data-options="editable:false,searcher:SelClosePost" runat="server" />
                                <input id="ClosePostIDs" name="ClosePostIDs" type="hidden" runat="server" />
                            </td>
                        </tr>
                        <tr class="IsSmall">
                            <td class="DialogTdTitle">回访岗位</td>
                            <td class="DialogTdSearchContent">
                                <input id="ReplyPost" name="ReplyPost" style="width: 90%;" class="easyui-searchbox" data-options="editable:false,searcher:SelReplyPost" runat="server" />
                                <input id="ReplyPostIDs" name="ReplyPostIDs" type="hidden" runat="server" />
                            </td>
                        </tr>
                        <tr class="IsSmall">
                            <td class="DialogTdTitle">是否系统派单</td>
                            <td class="DialogTdSearchContent">
                                <select name="IsSysPush" id="IsSysPush" runat="server">
                                    <option selected="selected" value="0">否</option>
                                    <option value="1">是</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">到场是否拍照</td>
                            <td class="DialogTdSearchContent">
                                <select name="IsPresentPhoto" id="IsPresentPhoto" runat="server">
                                    <option selected="selected" value="0">否</option>
                                    <option value="1">是</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">完成是否拍照</td>
                            <td class="DialogTdSearchContent">
                                <select name="IsUploadPictures" id="IsUploadPictures" runat="server">
                                    <option selected="selected" value="0">否</option>
                                    <option value="1">是</option>
                                </select>
                            </td>
                        </tr>
                        <tr class="DIY">
                            <td class="DialogTdTitle">处理额定工时（小时）</td>
                            <td class="DialogTdContent">
                                <input id="RatedWorkHour" name="RatedWorkHour" data-options="prompt:'请输入数字',validType:'digital'" class="easyui-validatebox" runat="server" /></td>
                        </tr>
                        <tr class="DIY">
                            <td class="DialogTdTitle">处理绩效系数</td>
                            <td class="DialogTdContent">
                                <input id="KPIRatio" name="KPIRatio" data-options="prompt:'请输入数字',validType:'digital'" class="easyui-validatebox" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">是否回访</td>
                            <td class="DialogTdSearchContent">
                                <select name="IsReturnVisit" id="IsReturnVisit" runat="server" onchange="upIsReturnVisit()">
                                    <option selected="selected" value="0">否</option>
                                    <option value="1">是</option>
                                </select>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td class="DialogTdTitle">回访率（%）</td>
                            <td class="DialogTdSearchContent">
                                <input type="text" id="ReturnVisitRate" name="ReturnVisitRate" readonly="readonly" disable="disable" runat="server" onchange="upReturnVisitRate()" />
                            </td>
                        </tr>
                        <tr class="DIY">
                            <td class="DialogTdTitle">回访额定工时（小时）</td>
                            <td class="DialogTdContent">
                                <input id="ReplyWorkHour" name="ReplyWorkHour" data-options="prompt:'请输入数字',validType:'digital'" class="easyui-validatebox" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">回访绩效系数</td>
                            <td class="DialogTdSearchContent">
                                <input type="text" id="ReturnPerformance" name="ReturnPerformance" disable="disable" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">公司质保期（天）</td>
                            <td class="DialogTdContent">
                                <input class="easyui-validatebox" data-options="prompt:'请输入数字',validType:'digital'" id="ComWarrantyTime" maxlength="50"
                                    name="ComWarrantyTime" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">行业质保期（天）</td>
                            <td class="DialogTdContent">
                                <input class="easyui-validatebox" data-options="prompt:'请输入数字',validType:'digital'" id="IndustryWarrantyTime" maxlength="50"
                                    name="IndustryWarrantyTime" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">公司返修时限（天）</td>
                            <td class="DialogTdContent">
                                <input class="easyui-validatebox" data-options="prompt:'请输入数字',validType:'digital'" id="ComRepairTime" maxlength="50"
                                    name="ComRepairTime" runat="server" /></td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">行业返修时限（天）</td>
                            <td class="DialogTdContent">
                                <input class="easyui-validatebox" data-options="prompt:'请输入数字',validType:'digital'" id="IndustryRepairTime" maxlength="50"
                                    name="IndustryRepairTime" runat="server" /></td>
                        </tr>

                        <tr>
                            <td class="DialogTdTitle">是否停用</td>
                            <td class="DialogTdSearchContent">
                                <select name="IsEnabled" id="IsEnabled" runat="server">
                                    <option selected="selected" value="0">否</option>
                                    <option value="1">是</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="DialogTdTitle">备注</td>
                            <td class="DialogTdContent">
                                <textarea id="TypeMemo" style="height: 120px;" class="easyui-validatebox" name="TypeMemo" rows="8" cols="31"
                                    runat="server"></textarea></td>
                        </tr>

                        <tr class="CMRDc">
                            <td class="DialogTdTitle">日常处理时限</td>
                            <td class="DialogTdContent">
                                <input class="easyui-validatebox" id="dailyProcessDay" data-options="prompt:'请输入数字',validType:'digital'" maxlength="50"
                                    name="dailyProcessDay" runat="server" />
                            </td>
                        </tr>
                        <tr class="CMRDc">
                            <td class="DialogTdTitle">交互处理时限</td>
                            <td class="DialogTdContent">
                                <input class="easyui-validatebox" id="deliveryProcessDay" data-options="prompt:'请输入数字',validType:'digital'" maxlength="50"
                                    name="deliveryProcessDay" runat="server" />
                            </td>
                        </tr>
                        <tr class="CMRDc">
                            <td class="DialogTdTitle">内验处理时限</td>
                            <td class="DialogTdContent">
                                <input class="easyui-validatebox" id="intsernalProcessDay" data-options="prompt:'请输入数字',validType:'digital'" maxlength="50"
                                    name="intsernalProcessDay" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <table class="DialogTable" runat="server">
                        <tr>
                            <td class="DialogTdSubmit" style="text-align: center" colspan="2">
                                <table class="DialogTable">
                                    <tr>
                                        <td id="TDBarChkRoot" class="DialogTdTitle">
                                            <asp:CheckBox ID="ChkRoot" runat="server" Text="同级"></asp:CheckBox></td>
                                        <td class="TDImgButton" id="TDBarStdInsert" align="right" runat="server">
                                            <table cellspacing="0" cellpadding="0" width="100%">
                                                <tr>
                                                    <td align="center">
                                                        <input class="button" id="btnAdd" type="button" value="新增" name="btnAdd" runat="server" />
                                                        <input class="button" id="btnEdit" type="button" value="修改" name="btnEdit" runat="server" />
                                                        <input class="button" id="btnDelete" type="button" value="删除" name="btnDelete" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="TDImgButton" id="TDBarStdSubmit" align="center" runat="server">
                                            <table cellspacing="0" cellpadding="0" width="100%">
                                                <tr>
                                                    <td align="center">
                                                        <input class="button" id="btnSave" type="button" value="保存" name="btnSave" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <input class="button" id="btnCancel" type="button" value="取消" name="btnCancel" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>


<script type="text/javascript">
    function InitFunction() {
        var h = $(window).height();
        var w = $(window).width() * 0.25 - 1;
        $("#OrganTree").css("width", w + "px");
        $("#OrganTree").css("height", h + "px");
        $("#OrganCommManage").css("height", h + "px");
        var windowH = $(window).height();
        var hh = $("#ContainerRight").height();
        if (windowH > h) {
            hh = windowH;
        }
        $("#ContainerLeft").css("height", hh + "px");
    }
    InitFunction();

    //检查回访
    function upIsReturnVisit() {
        var IsReturnVisit = $("#IsReturnVisit").val();
        var ReturnVisitRate = $("#ReturnVisitRate").val();
        if (IsReturnVisit == 0) {//不回访
            $("#ReturnVisitRate").val("");
            $("#ReturnVisitRate").attr("readonly", true);
        } else if (IsReturnVisit == 1) {
            $("#ReturnVisitRate").attr("readonly", false);
        }
    }

    function upReturnVisitRate() {
        var ReturnVisitRate = document.getElementById("ReturnVisitRate").value;
        var parnt = /^([1-9]\d*(\.\d*[1-9])?)|(0\.\d*[1-9])$/;
        if (parnt.exec(ReturnVisitRate)) {
        } else {
            $("#ReturnVisitRate").val("");
            HDialog.Info('请设置正确的回访率!');
        }
    }


    function Travel(DepCode) {//参数为树的ID，注意不要添加#
        var roots = $('#treeDemo').tree('getRoots'), children, i, j;
        for (i = 0; i < roots.length; i++) {
            if (roots[i].attributes.CorpTypeID == DepCode) {
                $('#treeDemo').tree('select', roots[i].target);
            }
            children = $('#treeDemo').tree('getChildren', roots[i].target);
            for (j = 0; j < children.length; j++) {
                if (children[j].attributes.CorpTypeID == DepCode) {
                    $('#treeDemo').tree('select', children[j].target);
                }
            }
        }
    }

    function InitLeftTree() {
        $.tool.DataGet('IncidentChoose', 'GetIncidentTypeList', "isAll=1",
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

    function GetTree(obj) {
        $('#treeDemo').html("");
        $('#treeDemo').tree({
            data: obj,
            onClick: function (node) {

                $("#EditState").val("Browse");
                $("#SelIndex").val(node.id);
                $("#CostCode").val(node.id);
                $("#CorpCostID").val(node.attributes.CorpTypeID);
                $("#hIsBigClass").val(node.attributes.IsBigClass);
                $("#TypeName").val(node.text);
                $("#IsTreeRoot").val(node.attributes.IsTreeRoot);
                NodeItemClick(node.attributes.CorpTypeID);
                InitControl();
            },
            onLoadSuccess: function (node, data) {
                $('#treeDemo').tree('collapseAll');
            },

        });
    }
    $(function () {
        InitLeftTree();

    });

    function InitControl() {
        if ($("#EditState").val() == "Browse") {
            //TVOrgan.Enabled = true;
            $("#TDBarStdInsert").show();
            $("#TDBarStdSubmit").hide();
            $("#ChkRoot").show();

            $("#btnEdit").attr("disabled", false);
            $("#btnDelete").attr("disabled", false);
            $("#btnDeleteShow").attr("disabled", false);

            $("#TypeName").attr("disabled", false);
            $("#KPIRatio").attr("disabled", false);
            $("#RatedWorkHour").attr("disabled", false);
            $("#ReplyWorkHour").attr("disabled", false);
            $("#DealLimit").attr("disabled", false);

            $("#OrderLimit").attr("disabled", false);
            $("#CloseLimit").attr("disabled", false);

            $("#DealLimit").attr("disabled", false);
            $("#DealLimit2").attr("disabled", false);

            $("#ReserveHint").attr("disabled", false);
            $("#TypeMemo").attr("disabled", false);

            $("#ReplyLimit").attr("disabled", false);
            $("#DispLimit").attr("disabled", false);
            //$("#Warranty").attr("disabled", false);


            //SelIndex.Value = TVOrgan.SelectedNodeIndex;

            //浏览状态

            if ($("#IsTreeRoot").val() != 0 || $("#IsTreeRoot").val() != '0' || $("#IsTreeRoot").val() == "") {
                $(".DIY").hide();
                $(".IsSmall").show();
            }
            else {
                $(".DIY").show();
                $(".IsSmall").hide();
            }

            $("#TypeName").attr("disabled", true);
            $("#DealLimit").attr("disabled", true);
            $("#KPIRatio").attr("disabled", true);
            $("#RatedWorkHour").attr("disabled", true);
            $("#ReplyWorkHour").attr("disabled", true);
            $("#ReserveHint").attr("disabled", true);
            $("#TypeMemo").attr("disabled", true);
            $("#CKPlace1").attr("disabled", true);
            $("#CKPlace2").attr("disabled", true);
            $("#DrClass").attr("disabled", true);
            $("#Duty").attr("disabled", true);
            $("#DealLimit2").attr("disabled", true);
            $("#IsTousu").attr("disabled", true);
            $("#IsUploadPictures").attr("disabled", true);
            $("#IsReturnVisit").attr("disabled", true);
            $("#ReturnVisitRate").attr("disabled", true);
            $("#ReturnPerformance").attr("disabled", true);

            $("#IsEnabled").attr("disabled", true);
            $("#ReplyLimit").attr("disabled", true);
            $("#DispLimit").attr("disabled", true);
            $("#ComWarrantyTime").attr("disabled", true);
            $("#IndustryWarrantyTime").attr("disabled", true);
            $("#ComRepairTime").attr("disabled", true);
            $("#IndustryRepairTime").attr("disabled", true);
            $("#IsBigClass").attr("disabled", true);

            $("#OrderLimit").attr("disabled", true);
            $("#CloseLimit").attr("disabled", true);
        }
        else {
            //新增、修改状态

            //TVOrgan.SelectedNodeIndex = SelIndex.Value;
            //TVOrgan.Enabled = false;
            $("#TDBarStdInsert").hide();
            $("#TDBarStdSubmit").show();
            $("#ChkRoot").show();


            if ($("#EditState").val() == "NewRecord") {
                if ($("#ChkRoot").attr("checked") == true) {
                    if ($("#IsTreeRoot").val() != 0 || $("#IsTreeRoot").val() != '0' || $("#IsTreeRoot").val() == "") {
                        $(".DIY").hide();
                        $(".IsSmall").show();
                    }
                    else {
                        $(".DIY").show();
                        $(".IsSmall").hide();
                    }
                }
            }

            $("#TypeName").attr("disabled", false);
            $("#DealLimit").attr("disabled", false);
            $("#KPIRatio").attr("disabled", false);
            $("#RatedWorkHour").attr("disabled", false);
            $("#ReplyWorkHour").attr("disabled", false);
            $("#ReserveHint").attr("disabled", false);
            $("#TypeMemo").attr("disabled", false);
            $("#CKPlace1").attr("disabled", false);
            $("#CKPlace2").attr("disabled", false);
            $("#DrClass").attr("disabled", false);
            $("#Duty").attr("disabled", false);
            $("#DealLimit2").attr("disabled", false);
            $("#IsTousu").attr("disabled", false);
            $("#IsUploadPictures").attr("disabled", false);
            $("#IsReturnVisit").attr("disabled", false);
            $("#ReturnPerformance").attr("disabled", false);
            $("#BelongProfessional").attr("disabled", false);

            $("#ReturnVisitRate").attr("disabled", false);
            $("#ReturnVisitRate").attr("readonly", false);
            $("#IsEnabled").attr("disabled", false);
            $("#ReplyLimit").attr("disabled", false);
            $("#DispLimit").attr("disabled", false);
            $("#ComWarrantyTime").attr("disabled", false);
            $("#IndustryWarrantyTime").attr("disabled", false);
            $("#ComRepairTime").attr("disabled", false);
            $("#IndustryRepairTime").attr("disabled", false);
            $("#IsBigClass").attr("disabled", false);


            $("#OrderLimit").attr("disabled", false);
            $("#CloseLimit").attr("disabled", false);
        }
    }

    function NodeItemClick(value) {
        $.tool.DataGet('IncidentType', 'GetIncidentType', "CorpTypeID=" + value,
            function Init() {
            },
            function callback(_Data) {

                varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                for (var i = 0; i < varObjects.length; i++) {
                    $("#TypeName").val(varObjects[i].TypeName);
                    $("#DealLimit").val(varObjects[i].DealLimit);
                    $("#DealLimit2").val(varObjects[i].DealLimit2);
                    $("#ReserveHint").val(varObjects[i].ReserveHint);
                    $("#TypeMemo").val(varObjects[i].TypeMemo);
                    $("#IsTousu").val(varObjects[i].IsTousu);
                    $("#IsUploadPictures").val(varObjects[i].IsUploadPictures);
                    $("#IsReturnVisit").val(varObjects[i].IsReturnVisit);
                    $("#ReturnPerformance").val(varObjects[i].ReturnPerformance);
                    $("#BelongProfessional").val(varObjects[i].BelongProfessional);
                    if (varObjects[i].IsReturnVisit == "1") {
                        $("#ReturnVisitRate").val(varObjects[i].ReturnVisitRate);
                    } else {
                        $("#ReturnVisitRate").val("");
                    }
                    $("#hiplace").val(varObjects[i].IncidentPlace);
                    $("#CorpTypeIndex").val(varObjects[i].CorpTypeIndex);
                    $("#RatedWorkHour").val(varObjects[i].RatedWorkHour);
                    $("#KPIRatio").val(varObjects[i].KPIRatio);
                    $("#IsEnabled").val(varObjects[i].IsEnabled);
                    $("#hiClassID").val(varObjects[i].ClassID);
                    $("#AssignedPostIDs").val(varObjects[i].AssignedPostIDs);
                    $("#ProcessPostIDs").val(varObjects[i].ProcessPostIDs);
                    $("#AssignedPost").searchbox('setText', varObjects[i].AssignedPost);
                    $("#ProcessPost").searchbox('setText', varObjects[i].ProcessPost);

                    $("#ClosePostIDs").val(varObjects[i].ClosePostIDs);
                    $("#ReplyPostIDs").val(varObjects[i].ReplyPostIDs);
                    $("#ClosePost").searchbox('setText', varObjects[i].ClosePost);
                    $("#ReplyPost").searchbox('setText', varObjects[i].ReplyPost);
                    $("#IsPresentPhoto").val(varObjects[i].IsPresentPhoto);
                    $("#IsSysPush").val(varObjects[i].IsSysPush);
                    $("#ReplyWorkHour").val(varObjects[i].ReplyWorkHour);

                    $("#ReplyLimit").val(varObjects[i].ReplyLimit);
                    $("#DispLimit").val(varObjects[i].DispLimit);
                    $("#OrderLimit").val(varObjects[i].OrderLimit);
                    $("#CloseLimit").val(varObjects[i].CloseLimit);

                    $("#ComWarrantyTime").val(varObjects[i].ComWarrantyTime);
                    $("#IndustryWarrantyTime").val(varObjects[i].IndustryWarrantyTime);
                    $("#ComRepairTime").val(varObjects[i].ComRepairTime);
                    $("#IndustryRepairTime").val(varObjects[i].IndustryRepairTime);
                    $("#Duty").val(varObjects[i].Duty);
                    //$("#Warranty").val(varObjects[i].Warranty);
                    $("#IsBigClass").val(varObjects[i].IsBigClass);

                    $("#DrClass").val(varObjects[i].ClassID);
                    if (varObjects[i].TypeCode.substring(0, 4) == "0005") {
                        $("#dailyProcessDay").attr("disabled", true);
                        $("#deliveryProcessDay").attr("disabled", true);
                        $("#intsernalProcessDay").attr("disabled", true);
                        $(".CMRDc").show();
                    }
                    else {
                        $(".CMRDc").hide();
                    }
                    //var SelOption = '';
                    //if ($("#hiClassID").val() == "2") {
                    //    SelOption = '口头报事';
                    //}
                    //else {
                    //    SelOption = '书面报事';
                    //}

                    //var select = document.getElementById("DrClass");
                    //for (var i = 0; i < select.options.length; i++) {
                    //    if (select.options[i].innerHTML == SelOption) {
                    //        select.options[i].selected = true;
                    //        break;
                    //    }
                    //}
                    if ($("#hiplace").val() != "") {
                        if ($("#hiplace").val() == "户内") {
                            $("#CKPlace1").attr("checked", true);
                            $("#CKPlace2").attr("checked", false);
                        }
                        else if ($("#hiplace").val() == "公区") {
                            $("#CKPlace2").attr("checked", true);
                            $("#CKPlace1").attr("checked", false);
                        }
                        else {
                            $("#CKPlace1").attr("checked", true);
                            $("#CKPlace2").attr("checked", true);
                        }
                    }
                    else {
                        $("#CKPlace1").attr("checked", false);
                        $("#CKPlace2").attr("checked", false);
                    }
                }
            },
            function completeCallback() {
            },
            function errorCallback() {
            });
    }

    function SelAssignedPost(value, name) {
        if ($('#IsBigClass').val() == "0") {
            return;
        }
        var AssignedPostIds = $("#AssignedPostIDs").val();
        HDialog.Open('800', '500', '../DialogNew/SelCurrencyPost2.aspx?RoleCodes=' + AssignedPostIds, '选择分配岗位', true, function callback(_Data) {
            if (_Data != '') {
                var data = JSON.parse(_Data);
                var valueArray = new Array();
                var textArray = new Array();
                $.each(data, function (index, item) {
                    valueArray.push(item.RoleCode);
                    textArray.push(item.RoleName);
                });
                $("#AssignedPostIDs").val(valueArray.toString());
                $('#AssignedPost').searchbox("setValue", valueArray.toString());
                $('#AssignedPost').searchbox("setText", textArray.toString());
            }
        });
    }

    function SelProcessPost(value, name) {
        var h = $(window).height();
        if ($('#IsBigClass').val() == "0") {
            return;
        }
        var ProcessPostIDs= $("#ProcessPostIDs").val();
        HDialog.Open('800', '500', '../DialogNew/SelCurrencyPost2.aspx?RoleCodes=' + ProcessPostIDs, '选择处理岗位', true, function callback(_Data) {
            if (_Data != '') {
                var data = JSON.parse(_Data);

                var valueArray = new Array();
                var textArray = new Array();
                $.each(data, function (index, item) {
                    valueArray.push(item.RoleCode);
                    textArray.push(item.RoleName);
                });
                $("#ProcessPostIDs").val(valueArray.toString());
                $('#ProcessPost').searchbox("setValue", valueArray.toString());
                $('#ProcessPost').searchbox("setText", textArray.toString());
            }

        });
    }

    function SelClosePost() {
        var h = $(window).height();
        if ($('#IsBigClass').val() == "0") {
            return;
        }
        var ClosePostIDs = $("#ClosePostIDs").val();
        HDialog.Open('800', '500', '../DialogNew/SelCurrencyPost2.aspx?RoleCodes=' + ClosePostIDs, '选择处理岗位', true, function callback(_Data) {
            if (_Data != '') {
                var data = JSON.parse(_Data);

                var valueArray = new Array();
                var textArray = new Array();
                $.each(data, function (index, item) {
                    valueArray.push(item.RoleCode);
                    textArray.push(item.RoleName);
                });
                $("#ClosePostIDs").val(valueArray.toString());
                $('#ClosePost').searchbox("setValue", valueArray.toString());
                $('#ClosePost').searchbox("setText", textArray.toString());
            }

        });
    }

    function SelReplyPost() {
        var h = $(window).height();
        if ($('#IsBigClass').val() == "0") {
            return;
        }
        var ReplyPostIDs = $("#ReplyPostIDs").val();
        HDialog.Open('800', '500', '../DialogNew/SelCurrencyPost2.aspx?RoleCodes=' + ReplyPostIDs, '选择处理岗位', true, function callback(_Data) {
            if (_Data != '') {
                var data = JSON.parse(_Data);

                var valueArray = new Array();
                var textArray = new Array();
                $.each(data, function (index, item) {
                    valueArray.push(item.RoleCode);
                    textArray.push(item.RoleName);
                });
                $("#ReplyPostIDs").val(valueArray.toString());
                $('#ReplyPost').searchbox("setValue", valueArray.toString());
                $('#ReplyPost').searchbox("setText", textArray.toString());
            }
        });
    }

    $(document).ready(
        function () {
            $(".CMRDc").hide();
            $("#btnAdd").click(function () {
                //如果选择的报事类别是大类，新增细类就自动继承大类属性,否则清空
                if ($('#hIsBigClass').val() == "0") {
                    $("#RatedWorkHour").val('0');
                    $("#ReplyWorkHour").val('0');
                    $("#KPIRatio").val('0');
                    $("#DealLimit").val('0');
                    $("#ReserveHint").val('0');
                    $("#TypeMemo").val('0');
                    $("#DispLimit").val('0');
                    $("#DealLimit2").val('0');
                    $("#ReplyLimit").val('0');
                    $("#ComWarrantyTime").val('0');
                    $("#IndustryWarrantyTime").val('0');
                    $("#ComRepairTime").val('0');
                    $("#IndustryRepairTime").val('0');
                    $("#OrderLimit").val('0');
                    $("#CloseLimit").val('0');
                }
                if ($("#hIsBigClass").val() == "1") {
                    $("#IsBigClass").val("1");
                }
                $("#TypeName").val('');

                $("#EditState").val("NewRecord");
                //$("#AssignedPostIDs").val('');
                //$("#ProcessPostIDs").val('');
                //$("#AssignedPost").searchbox('setText', '');
                //$("#ProcessPost").searchbox('setText', '');
                InitControl();
            })

            $("#btnSave").click(function () {

                //if ($('#IsReturnVisit').val() == "1") {
                //    if ($('#ReturnVisitRate').val() == "") {
                //        HDialog.Info('请填写回访率');
                //        return false;
                //    }
                //} else {
                $('#ReturnVisitRate').val("");
                //}

                if ($('#hIsBigClass').val() == "" && $('#IsBigClass').val() == "0") {
                    HDialog.Info('请选择要设置小类的报事类别');
                }
                else if ($('#hIsBigClass').val() == "0" && $('#IsBigClass').val() == "1") {
                    HDialog.Info('报事细类下不能设置报事大类');
                }
                else {
                    $("#Duty").removeAttr("disabled");
                    $("#DrClass").removeAttr("disabled");

                    $.tool.DataPostChk('CorpIncidentTypeBrowse', 'IncidentType', 'Edit', $('#CorpIncidentTypeBrowse').serialize(),
                        function Init() {

                        },
                        function callback(_Data) {
                            if (_Data != '') {
                                varObjects = eval("(" + _Data + ")"); //转换为json对象
                                // GetTree(varObjects);
                                InitLeftTree();
                                var node = $('#treeDemo').tree('find', $("#CostCode").val());
                                if (node != null) $('#treeDemo').tree('select', node.target);
                                else {
                                    //通地DepCode来查找上次点击的节点
                                    Travel($("#CorpCostID").val());
                                }
                                HDialog.Info("保存成功！");
                                $("#EditState").val("Browse");
                                InitControl();
                            } else {
                                HDialog.Info("保存失败！");
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }

            })

            $("#btnEdit").click(function () {
                $("#EditState").val("EditRecord");
                InitControl();
            })

            $("#btnCancel").click(function () {
                $("#EditState").val("Browse");
                InitControl();
                if ($("#CorpCostID").val() != undefined && $("#CorpCostID").val() != "") {
                    NodeItemClick($("#CorpCostID").val());
                }

            })



            $("#btnDelete").click(function () {
                if ($("#CorpCostID").val() != "" && $("#CorpCostID").val() != 0 && $("#CorpCostID").val() != "0") {
                    HDialog.Prompt('是否删除该项', function () {
                        $.tool.DataGet('IncidentType', 'Delete', 'CorpCostID=' + $("#CorpCostID").val(),
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data != "") {
                                    HDialog.Info('删除成功');
                                    $("#TypeName").val('');
                                    $("#RatedWorkHour").val('');
                                    $("#ReplyWorkHour").val('');
                                    $("#KPIRatio").val('');
                                    $("#DealLimit").val('');
                                    $("#ReserveHint").val('');
                                    $("#TypeMemo").val('');
                                    //$("#Warranty").val('');
                                    varObjects = eval("(" + _Data + ")"); //转换为json对象
                                    GetTree(varObjects);
                                }
                                else { HDialog.Info('删除失败'); }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    });
                }
            })
        }
    )



    $("#EditState").val("Browse");
    InitControl();

    $(function () {
        $("#IsBigClass").change(function () {
            if ($(this).val() == 1) {
                $(".DIY").hide();
                $(".IsSmall").show();
                $("#DealLimit").removeAttr("readonly");
                $("#DispLimit").removeAttr("readonly");
                $("#OrderLimit").removeAttr("readonly");
                $("#CloseLimit").removeAttr("readonly");
                $("#DealLimit2").removeAttr("readonly");
                $("#ReplyLimit").removeAttr("readonly");
                $("#ComWarrantyTime").removeAttr("readonly");
                $("#IndustryWarrantyTime").removeAttr("readonly");
                $("#ComRepairTime").removeAttr("readonly");
                $("#IndustryRepairTime").removeAttr("readonly");
                $("#ReserveHint").removeAttr("readonly");
                $("#Duty").removeAttr("disabled");
                $("#DrClass").removeAttr("disabled");

                $("#CKPlace1").removeAttr("disabled");
                $("#CKPlace2").removeAttr("disabled");
            } else {
                $(".DIY").show();
                $(".IsSmall").hide();
                $("#OrderLimit").attr("readonly", "readonly");
                $("#CloseLimit").attr("readonly", "readonly");
                $("#DealLimit").attr("readonly", "readonly");
                $("#DispLimit").attr("readonly", "readonly");
                $("#DealLimit2").attr("readonly", "readonly");
                $("#ReplyLimit").attr("readonly", "readonly");
                $("#ComWarrantyTime").attr("readonly", "readonly");
                $("#IndustryWarrantyTime").attr("readonly", "readonly");
                $("#ComRepairTime").attr("readonly", "readonly");
                $("#IndustryRepairTime").attr("readonly", "readonly");
                $("#ReserveHint").attr("readonly", "readonly");
                $("#Duty").attr("disabled", true);
                $("#DrClass").attr("disabled", true);

                $("#CKPlace1").attr("disabled", true);
                $("#CKPlace2").attr("disabled", true);

            }

        });
    })
</script>
