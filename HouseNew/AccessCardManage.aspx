<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccessCardManage.aspx.cs" Inherits="M_Main.HouseNew.AccessCardManage" %>

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
    <link href="../css/framedialog_fourcol_pic.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/ajax.js"></script>

    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            font-size: 12px;
            overflow-y: auto;
        }

        .panel-header {
            background: #f5f5f5 none repeat scroll 0 0;
        }

        .panel-header, .panel-body {
            border-color: #cccccc;
        }

        .TopHead {
            background-color: #f5f5f5;
            width: 100%;
            height: 40px;
            font-size: 12px;
            border-bottom: 1px solid #cccccc;
        }

            .TopHead input {
                float: left;
                border: none;
                border-right: 1px solid #cccccc;
                text-align: center;
                width: 84px;
                height: 40px;
                line-height: 40px;
                background-color: #f5f5f5;
                cursor: pointer;
            }

                .TopHead input:hover {
                    background-color: #ffffff;
                }
    </style>

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
    <form id="frmForm" runat="server" enctype="multipart/form-data">
        <input type="hidden" id="Id" name="Id" runat="server" />
        <input type="hidden" id="HoldID" name="HoldID" runat="server" />

        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="CustID" name="CustID" runat="server" />
        <input type="hidden" id="AddCompany" name="AddCompany" runat="server" />
        <input type="hidden" id="AuditingUser" name="AuditingUser" runat="server" />
        <input type="hidden" id="AuditingDate" name="AuditingDate" runat="server" />
        <input type="hidden" id="OptType" name="OptType" runat="server" />
        <input type="hidden" id="CreateDate" name="CreateDate" runat="server" />


        <input type="hidden" id="IsDelete" name="IsDelete" runat="server" />

        <input type="hidden" id="RelationshipsName" name="RelationshipsName" runat="server" />


        <input type="hidden" id="CommID" name="CommID" runat="server" />


        <div class="TopHead">
            <input type="button" id="BtnClose" value="关闭" />
            <input type="button" id="Save" value="保存" runat="server" />
            <input type="button" id="SaveClose" value="保存并关闭" runat="server" />
            <input type="button" id="ImportFees" value="费用输入" runat="server" />
        </div>
        <div style="height: 4px;"></div>
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">&nbsp;</td>
                <td class="DialogTdContent">
                    <input class="button" id="btnReadPaperCode" onclick="ReadPaperCode()" type="button" value="读取身份证信息" runat="server"></td>
                <td class="DialogTdTitle">&nbsp;</td>
                <td class="DialogTdContent">&nbsp;</td>
                <td class="DialogTdTitle">&nbsp;</td>
                <td class="DialogTdContent">&nbsp;</td>
            </tr>
            <tr>
                <td class="DialogTdTitle">户主名称
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="CustName" name="CustName" readonly runat="server" />
                </td>
                <td class="DialogTdTitle">成员名称
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="MemberName" name="MemberName" runat="server" />
                </td>
                <td class="DialogTdTitle" rowspan="8" style="color: #cccccc; font-weight: bold;">照片
                </td>
                <td class="DialogTdContent" rowspan="8" style="text-align: center;">
                    <div id="BtnUpFile" style="border: 1px solid #cccccc; width: 183px; height: 228px; text-align: center; float: left; line-height: 258px;">
                        <%--<img id="ImgSrc" src="../images/newfile.png"/>--%>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">成员房号
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox"
                        id="RoomSign" name="RoomSign" runat="server" readonly />
                </td>
                <td class="DialogTdTitle">与户主关系
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox"
                        id="RelationshipName" name="RelationshipName" runat="server" readonly />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">证件名称
                </td>
                <td class="DialogTdContent">
                    <asp:DropDownList ID="PaperName" disabled="disabled" runat="server"></asp:DropDownList>
                </td>
                <td class="DialogTdTitle">证件号码
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox"
                        id="PaperCode" name="PaperCode" runat="server" readonly />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">性别
                </td>
                <td class="DialogTdContent">
                    <select id="Sex" name="Sex" runat="server">
                    </select>
                </td>
                <td class="DialogTdTitle">出生日期
                </td>
                <td class="DialogTdContent">
                    <input id="Birthday" type="text" name="Birthday" readonly runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">国籍
                </td>
                <td class="DialogTdContent">
                    <asp:DropDownList ID="Nationality" runat="server" Enabled="false"></asp:DropDownList>
                </td>
                <td class="DialogTdTitle">移动电话
                </td>
                <td class="DialogTdContent">
                    <input type="text" id="MobilePhone" name="MobilePhone" readonly runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">办理卡种
                </td>
                <td class="DialogTdContent">
                    <select id="CardType" name="CardType" runat="server" class="easyui-validatebox" data-options="required:true">
                        <option value="业主卡">业主卡</option>
                        <option value="住户卡">住户卡</option>
                        <option value="租户卡">租户卡</option>
                        <option value="佣人卡">佣人卡</option>
                        <option value="临时卡">临时卡</option>
                        <option value="其它卡">其它卡</option>

                    </select>
                </td>
                <td class="DialogTdTitle">办理卡类
                </td>
                <td class="DialogTdContent">
                    <select id="CardStyle" name="CardStyle" runat="server" class="easyui-validatebox" data-options="required:true"></select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">原卡编号
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="OldCardNum" name="OldCardNum" readonly runat="server" />
                </td>
                <td class="DialogTdTitle">原卡状态
                </td>
                <td class="DialogTdContent">
                    <select id="OldCardState" name="OldCardState" disabled="disabled" class="easyui-validatebox" data-options="required:true" runat="server">
                        <option value="有效">有效</option>
                        <option value="失效" selected>失效</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">办卡日期
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true"
                        id="CardDate" name="CardDate" onclick="WdatePicker()" runat="server" />
                </td>
                <td class="DialogTdTitle">收费日期
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="ChargeDate" name="ChargeDate" onclick="WdatePicker()" runat="server" /></td>
            </tr>
            <tr>
                <td class="DialogTdTitle">制卡日期
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true"
                        id="MadeDate" name="MadeDate" onclick="WdatePicker()" runat="server" />
                </td>
                <td class="DialogTdTitle">是否发卡
                </td>
                <td class="DialogTdContent">
                    <select id="IsCardIssuing" name="IsCardIssuing" runat="server">
                        <option value="是">是</option>
                        <option value="否">否</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">发卡日期
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true"
                        id="IssueDate" name="IssueDate" onclick="WdatePicker()" runat="server" />
                </td>
                <td class="DialogTdTitle">有效日期
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true"
                        id="EffectiveDate" name="EffectiveDate" onclick="WdatePicker()" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">当前卡号
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true"
                        id="CardNum" name="CardNum" runat="server" />
                </td>
                <td class="DialogTdTitle">当前状态
                </td>
                <td class="DialogTdContent">
                    <select id="CardState" name="CardState" runat="server">
                        <option value="有效">有效</option>
                        <option value="失效">失效</option>
                    </select>

                </td>
            </tr>

            <tr>
                <td class="DialogTdTitle">业主经办人
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox"
                        id="Managers" name="Managers" runat="server" />
                </td>
                <td class="DialogTdTitle">担保人
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox"
                        id="Guarantor" name="Guarantor" runat="server" /></td>
            </tr>
            <tr>
                <td class="DialogTdTitle">物业经办人
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox"
                        id="PropertyManagers" name="PropertyManagers" runat="server" />
                </td>
                <td class="DialogTdTitle">经办日期
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox"
                        id="PropertyIssueDate" name="PropertyIssueDate" onclick="WdatePicker()" runat="server" /></td>
            </tr>
            <tr>
                <td class="DialogTdTitle">是否领取
                </td>
                <td class="DialogTdContent">
                    <select id="CardGet" name="CardGet" runat="server">
                        <option value="否">否</option>
                        <option value="是">是</option>
                    </select>
                </td>
                <td class="DialogTdTitle">领取日期
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox"
                        id="CardGetDate" name="CardGetDate" onclick="WdatePicker()" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">领取经办人
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox"
                        id="CardGetManagers" name="CardGetManagers" runat="server" />
                </td>
                <td class="DialogTdTitle">办卡状态
                </td>
                <td class="DialogTdContent">
                    <select id="AuditingState" name="AuditingState" runat="server" onchange="AuditingStateChange()" class="easyui-validatebox"></select>
                    <input type="hidden" id="OldAuditingState" name="OldAuditingState" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">备注</td>
                <td class="DialogTdContent_2Col" colspan="5">
                    <textarea id="Memo" name="Memo" runat="server"></textarea>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">驳回类型</td>
                <td class="DialogTdContent">
                    <select id="ReasonType" name="ReasonType" onchange="ReasonTypeChange()" runat="server">
                        <option value="" checked="checked"></option>
                        <option value="1001">大头照不通过</option>
                        <option value="1002">证件照片不通过</option>
                        <option value="1003">大头照和证件照片不通过</option>
                        <option value="1004">其他</option>
                    </select>
                </td>
                <td class="DialogTdTitle">驳回原因</td>
                <td class="DialogTdContent_2Col" colspan="3">
                    <textarea id="Reason" name="Reason" runat="server"></textarea>
                </td>
            </tr>
        </table>


        <input id="UpFile" type="file" runat="server" name="UpFile" style="width: 1px; visibility: hidden" accept="image/*" />
        <input type="hidden" id="HeadImg" name="HeadImg" runat="server" />

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                ReasonTypeChange();

                //限制
                var OpType = $("#OpType").val();
                if (OpType == "Search") {
                    $("#Save").hide();
                    $("#SaveClose").hide();
                    $("#ImportFees").hide();
                }

            });
            //驳回类型改变事件
            function ReasonTypeChange() {
                if ($('#ReasonType').val() == '1004') {
                    $("#CardState").val("失效");
                    $('#Reason').removeAttr('disabled');
                } else {
                    $("#CardState").val("有效");
                    $('#Reason').val($("#ReasonType").find("option:selected").text());
                    $('#Reason').attr('disabled', 'disabled');
                };
            }
            //办卡状态改变事件
            function AuditingStateChange() {
                //判断 如果选择的是“”就把状态修改回去
                var OldAuditingState = $('#OldAuditingState').val(), AuditingState = $('#AuditingState').val();
                if (AuditingState == "") {
                    $('#AuditingState').val(OldAuditingState);
                    return;
                }
                if (OldAuditingState != "") {
                    var isBool = false;
                    if (OldAuditingState == "0001" || OldAuditingState == "0006") {
                        isBool = true;
                    }
                    else if (OldAuditingState == "0002") {
                        if (AuditingState == "0003" || AuditingState == "0004" || AuditingState == "0005") {
                            isBool = true;
                        }
                    }
                    else if (OldAuditingState == "0003") {
                        if (AuditingState == "0004" || AuditingState == "0005") {
                            isBool = true;
                        }
                    }
                    else if (OldAuditingState == "0004") {
                        if (AuditingState == "0005") {
                            isBool = true;
                        }
                    }
                    else if (OldAuditingState == "0005") {
                        if (AuditingState == "0005") {
                            isBool = true;
                        }
                    }
                    if (!isBool) {
                        HDialog.Info('办卡状态不可逆向修改!');
                        $('#AuditingState').val(OldAuditingState);
                        if (OldAuditingState == "") {
                            $('#AuditingState').val("0001");
                        }
                        return;
                    }
                }
                ValidateAduti();

            }
            function ValidateAduti() {
                $.tool.DataPost('Customer', 'ValidateChangeIsRight', $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data != "true") {
                        HDialog.Info(_Data);
                        if ($("#OpType").val() == "Insert") {
                            $('#AuditingState').val("0001");
                        } else {
                            $('#AuditingState').val($('#OldAuditingState').val());
                        }
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
            }
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
                $("#BtnUpFile").html("<img style='width:100%;height:100%;' src='" + $("#HeadImg").val() + "'/>");
            }
            function SelDep() {
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
                    var arrRet = _Data.split(',');
                    $("#DepCode").val(arrRet[0]);
                    $("#DepName").val(arrRet[1]);
                });
            }



            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });

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
                        if (addr.length > 500) {
                            HDialog.Info('上传失败啦,重新试试吧');
                            return;
                        }
                        else {
                            $("#BtnUpFile").html("<img style='width:100%;height:100%;' src='" + addr + "'/>");
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.tool.pageUnLoading();
                        HDialog.Info('上传失败啦,重新试试吧');
                    }
                });
            }

            $(".panel-header").css("background-color", "#f5f5f5");

            $("#BtnClose").click(function (e) {
                HDialog.Close('');
            });

            $("#Save").click(function () {

                if ($("#OldCardState").val() == "有效") {
                    HDialog.Info("已有相同的卡片在使用中,原卡有效时不允许办理新卡");
                    return;
                }
                if ($('#AuditingState').val() == "0006") {
                    if ($("#ReasonType").val() == "") {
                        HDialog.Info("请在驳回原因类型栏里选择原因类型!");
                        return;
                    }
                    if ($("#Reason").val() == "") {
                        HDialog.Info("请在驳回原因栏里填写原因!");
                        return;
                    }
                }

                $("#RelationshipsName").val($("#Relationships").find("option:selected").text());

                $.tool.DataPostChk('frmForm', 'Customer', 'SaveCustCard', $.JQForm.GetStrParam(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data.substring(0, 5) == "false") {
                            HDialog.Info(_Data.substring(6));
                        }
                        else {
                            HDialog.Info('保存成功!');
                            $("#OpType").val("Edit");
                            $("#Id").val(_Data);
                            $('#OldAuditingState').val($('#AuditingState').val());
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            });

            $("#SaveClose").click(function () {

                if ($("#OldCardState").val() == "有效") {
                    HDialog.Info("已有相同的卡片在使用中,原卡有效时不允许办理新卡");
                    return;
                }

                if ($('#AuditingState').val() == "0006") {
                    if ($("#ReasonType").val() == "") {
                        HDialog.Info("请在驳回原因类型栏里选择原因类型!");
                        return;
                    }
                    if ($("#Reason").val() == "") {
                        HDialog.Info("请在驳回原因栏里填写原因!");
                        return;
                    }
                }


                $("#RelationshipsName").val($("#Relationships").find("option:selected").text());

                $.tool.DataPostChk('frmForm', 'Customer', 'SaveCustCard', $.JQForm.GetStrParam(),
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
            });

            $("#ImportFees").click(function () {

                var Id = $("#Id").val();
                if (Id == "") {
                    HDialog.Info("保存后才允许输入费用");
                    return;
                }

                var CardState = $("#CardState").val();
                if (CardState == "失效") {
                    HDialog.Info("卡状态为有效才允许输入费用");
                    return;
                }

                var HoldID = $("#HoldID").val();

                HDialog.Open('900', '450', "../ChargesNew/FeesSporadicManage.aspx?BK=FALSE&CostGeneType=2&CustCardID=" + $("#Id").val() + "&RoomSign=" + $("#RoomSign").val() + "&HoldID=" + HoldID + "&CustID=" + $('#CustID').val() + "&CustName=" + $('#CustName').val(), '新增费用', false, function callback(_Data) {
                    if (_Data != "") {
                        HDialog.Info(_Data);
                    }
                });
            });

            $("#CardType").change(function () {
                GetLastNum();
                //判断 如果不是业主卡 并且是新增的时候 就默认审核中
                if ($('#OpType').val() == "Insert" && $('#CardStyle').val() != "业主卡") {
                    //默认状态是审核中
                    $('#AuditingState').val("0001");
                } else if ($('#OpType').val() == "Edit" && $('#CardStyle').val() != "业主卡") {
                    $('#AuditingState').val($('#OldAuditingState').val());
                }
            });
            $("#CardStyle").change(function () {
                GetLastNum();
            });

            function GetLastNum() {
                var Id = $("#Id").val();
                var HoldID = $("#HoldID").val();
                var CardType = $("#CardType").val();
                var CardStyle = $("#CardStyle").val();
                $.tool.DataPost('Customer', 'GetLastCardNum', 'Id=' + $("#Id").val() + '&HoldID=' + HoldID + '&CardType=' + CardType + '&CardStyle=' + CardStyle,
                function Init() {
                },
                function callback(_Data) {
                    if (_Data != '') {
                        var Obj = JSON.parse(_Data);
                        $("#OldCardNum").val(Obj.CardNum);
                        $("#OldCardState").val(Obj.CardState);
                    }

                },
                function completeCallback() {
                },
                function errorCallback() {
                });

            }


            function ReadPaperCode() {


                var Height = 400;
                var Width = 700;

                var iTop2 = (window.screen.height - 400) / 2;
                var iLeft2 = (window.screen.width - 700) / 2;
                var sFeatures = "status:no;help:no;resizable:no;scroll:no;dialogHeight:" + Height + "px;modal=yes;dialogWidth:" + Width + "px;dialogLeft=" + iLeft2 + "px;dialogTop=" + iTop2 + "px";

                window.showModalDialog('PaperCodeRead.aspx', "", sFeatures);




                Request.sendPOST("PaperCodeReadInfo.aspx", "", callbackPaperCodeInfo);

            }
            function callbackPaperCodeInfo(xmlHttp) {


                var varReturn = xmlHttp.responseText;

                if (varReturn != "") {
                    var strName = varReturn.split('|')[0];
                    var strSex = varReturn.split('|')[1];
                    var strNation = varReturn.split('|')[2];
                    var strBorn = varReturn.split('|')[3];
                    var strAddress = varReturn.split('|')[4];
                    var strCardNo = varReturn.split('|')[5];
                    var strPicSrc = varReturn.split('|')[6];
                    strBorn = strBorn.replace('年', '-').replace('月', '-').replace('日', '');
                    $('#MemberName').val(strName);
                    $('#PaperCode').val(strCardNo);


                    $('#Sex').val(strSex);

                    if (strPicSrc != "") {

                        var file = strPicSrc;
                        var fileName = getFileName(file);


                        var fd = new FormData($("#frmForm")[0]);

                        //fd.append("UpFileData", $("input[name='UpFile']"));

                        $.tool.pageLoadInfo("上传中，请等待");
                        $.ajax({
                            url: "../UpLoad/UpFile.aspx",
                            type: "POST",
                            data: { file: file },
                            success: function (addr) {
                                $.tool.pageUnLoading();
                                $("#HeadImg").val(addr);
                                if (addr.length > 200) {
                                    alert(1)
                                    HDialog.Info('上传失败啦,重新试试吧');
                                    return;
                                }
                                else {
                                    $("#BtnUpFile").html("<img style='width:100%;height:100%;' src='" + addr + "'/>");
                                }
                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                $.tool.pageUnLoading();
                                HDialog.Info('上传失败啦,重新试试吧');
                            }
                        });
                    }
                }
            }
        </script>

    </form>
</body>
</html>
