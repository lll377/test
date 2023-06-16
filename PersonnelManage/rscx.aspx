<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rscx.aspx.cs" Inherits="M_Main.PersonnelManage.rscx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../css/editcss.css" type="text/css" rel="stylesheet" />
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/jquery-datagird-extended.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/Authority.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="../jscript/jquery.ztree.excheck-3.5.js"></script>

    <script language="javascript" src="../jscript/PersonDictionary.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>


    <style type="text/css">
        #SearchDlgWhere {
            border: 1px #D5D5D5 solid;
            width: 400px;
            height: 270px;
            margin: 0 auto;
        }

        #from, #to {
            border-top: none;
            font-size: 14px;
            line-height: 24px;
            border: 1px #D5D5D5 solid;
            width: 150px;
            height: 270px;
            text-align: center;
        }

        #saveId {
            height: 40px;
        }

        .Title {
            width: 100%;
            background-color: #E0ECFF;
            border-bottom: 1px solid #95B8E7;
            font-size: 12px;
            font-family: 'Microsoft YaHei';
            background-color: #E7F0FF;
            font-weight: bold;
            padding: 6px 0px;
        }

        #LeftPanel {
            width: 260px;
            background-color: #ffffff;
            border: 1px solid #95B8E7;
            margin-right: 1px;
            margin-left: 1px;
            float: left;
            overflow: scroll;
        }

        #RilghPanel {
            width: 100%;
            float: left;
            overflow: scroll;
            margin: 0px;
            padding: 0px;
            cursor: e-resize;
            float: left;
        }

        body {
            overflow: hidden;
            margin: 0px;
            padding: 0px;
        }
    </style>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmForm" runat="server">
        <div class="Title">
            &nbsp;&nbsp;人事档案列表
        </div>
        <div>
            <div id="LeftPanel" class="easyui-resizable">
                <ul class="ztree" id="treeDemo">
                </ul>
            </div>
            <div id="RilghPanel">
                <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
                </div>
            </div>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1090px; height: 470px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">姓名
                    </td>
                    <td class="TdContent">
                        <input type="text" id="Name" name="Name" style="width: 140px;" />
                    </td>
                    <td class="TdTitle">性别
                    </td>
                    <td class="TdContent">
                        <select id="Sex" name="Sex" class="easyui-combobox" style="width: 144px;">
                            <option value=""></option>
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </td>
                    <td class="TdTitle">年龄
                    </td>
                    <td class="TdContent">
                        <input type="text" id="StartAge" name="StartAge" style="width: 140px;" />
                    </td>
                    <td class="TdTitle">至
                    </td>
                    <td class="TdContent">
                        <input type="text" id="EndAge" name="EndAge" style="width: 140px;" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">证件名称
                    </td>
                    <td class="TdContent">
                        <select id="PaperType" runat="server" clientidmode="Static" name="PaperType" class="easyui-combobox"
                            data-options=" multiple: true " style="width: 144px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">证件号码
                    </td>
                    <td class="TdContent">
                        <input id="PaperCode" name="PaperCode" type="text" style="width: 140px;" />
                    </td>
                    <td class="TdTitle">证件有效期
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="PaperValidDateStart" name="PaperValidDateStart"
                            style="width: 140px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">至
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="PaperValidDateEnd" name="PaperValidDateEnd"
                            style="width: 140px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">学历
                    </td>
                    <td class="TdContent">
                        <select id="Education" runat="server" clientidmode="Static" name="Education" class="easyui-combobox"
                            data-options=" multiple: true" style="width: 144px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">学位
                    </td>
                    <td class="TdContent">
                        <select id="Degree" runat="server" clientidmode="Static" name="Degree" class="easyui-combobox"
                            data-options=" multiple: true,panelHeight: '300px'" style="width: 144px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">民族
                    </td>
                    <td class="TdContent">
                        <select id="Nation" runat="server" clientidmode="Static" name="Nation" class="easyui-combobox"
                            data-options=" multiple: true " style="width: 144px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">政治面貌
                    </td>
                    <td class="TdContent">
                        <select id="Political" runat="server" clientidmode="Static" name="Political" class="easyui-combobox"
                            data-options=" multiple: true,panelHeight: '300px'" style="width: 144px;">
                            <option value=""></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">人员类别
                    </td>
                    <td class="TdContent">
                        <select id="PersonType" name="PersonType" runat="server" clientidmode="Static" class="easyui-combobox"
                            data-options=" multiple: true,panelHeight: '300px'" style="width: 144px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">户口性质
                    </td>
                    <td class="TdContent">
                        <select id="AccountNature" name="AccountNature" runat="server" clientidmode="Static"
                            class="easyui-combobox" data-options=" multiple: true" style="width: 144px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">籍贯
                    </td>
                    <td class="TdContent">
                        <input id="NativePlace" name="NativePlace" type="text" style="width: 140px;" />
                    </td>
                    <td class="TdTitle">户口地址
                    </td>
                    <td class="TdContent">
                        <input id="AccountAddress" name="AccountAddress" type="text" style="width: 140px;" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">成本归属机构
                    </td>
                    <td class="TdContent">
                        <input type="hidden" id="SalaryDepCode" name="SalaryDepCode" />
                        <input type="text" id="SalaryDepName" name="SalaryDepName" onclick="SelDepartment('Salary')"
                            style="width: 144px;" />
                    </td>
                    <td class="TdTitle">居住地址
                    </td>
                    <td class="TdContent">
                        <input id="LivingAddress" name="LivingAddress" type="text" style="width: 140px;" />
                    </td>
                    <td class="TdTitle">家庭电话
                    </td>
                    <td class="TdContent">
                        <input id="FamilyTel" name="FamilyTel" type="text" style="width: 140px;" />
                    </td>
                    <td class="TdTitle">移动电话
                    </td>
                    <td class="TdContent">
                        <input id="MobilePhone" name="MobilePhone" type="text" style="width: 140px;" />
                    </td>

                </tr>
                <!---SalaryDepName--->
                <tr>
                    <td class="TdTitle">人事所属机构
                    </td>
                    <td class="TdContent">
                        <input type="text" id="DepName" name="DepName" onclick="SelDepartment('')"
                            style="width: 144px;" />
                    </td>
                    <td class="TdTitle">岗位
                    </td>
                    <td class="TdContent">
                        <input type="text" id="RoleName" name="RoleName" onclick="SelRole()"
                            style="width: 144px;" />
                    </td>
                    <td class="TdTitle">参加工作时间
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="WorkStartDateStart" name="WorkStartDateStart"
                            style="width: 140px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">至
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="WorkStartDateEnd" name="WorkStartDateEnd"
                            style="width: 140px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="date" />
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">入职时间
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="StartEntryDate" name="StartEntryDate"
                            style="width: 140px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">至
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="EndEntryDate" name="EndEntryDate" style="width: 140px;"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" />
                    </td>
                    <td class="TdTitle">招聘类型
                    </td>
                    <td class="TdContent">
                        <select id="RecruitType" name="RecruitType" class="easyui-combobox" style="width: 144px;">
                            <option value=""></option>
                            <option value="新聘">新聘</option>
                            <option value="返聘">返聘</option>
                        </select>
                    </td>
                    <td class="TdTitle">招聘渠道
                    </td>
                    <td class="TdContent">
                        <select id="RecruitWay" name="RecruitWay" class="easyui-combobox" style="width: 144px;">
                            <option value=""></option>
                            <option value="线上招聘">线上招聘</option>
                            <option value="线下招聘">线下招聘</option>
                            <option value="推荐入职">推荐入职</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">应聘时间
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="RecruitDateStart" name="RecruitDateStart"
                            style="width: 140px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">至
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="RecruitDateEnd" name="RecruitDateEnd"
                            style="width: 140px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">应聘部门
                    </td>
                    <td class="TdContent">
                        <input id="RecruitDepart" name="RecruitDepart" style="width: 140px;" onclick="SelDepartment1()" />
                    </td>
                    <td class="TdTitle">应聘岗位
                    </td>
                    <td class="TdContent">
                        <input type="text" id="RecruitRole" name="RecruitRole" style="width: 140px;" onclick="SelRole1()" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">试用天数
                    </td>
                    <td class="TdContent">
                        <input id="TrialDaysStart" name="TrialDaysStart" style="width: 140px;" />
                    </td>
                    <td class="TdTitle">至
                    </td>
                    <td class="TdContent">
                        <input id="TrialDaysEnd" name="TrialDaysEnd" style="width: 140px;" />
                    </td>
                    <td class="TdTitle">转正时间
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="FormalDateStart" name="FormalDateStart"
                            style="width: 140px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">至
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="FormalDateEnd" name="FormalDateEnd" style="width: 140px;"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">职务风险金
                    </td>
                    <td class="TdContent">
                        <input id="RoleBondStart" name="RoleBondStart" style="width: 140px;" />
                    </td>
                    <td class="TdTitle">至
                    </td>
                    <td class="TdContent">
                        <input id="RoleBondEnd" name="RoleBondEnd" style="width: 140px;" />
                    </td>
                    <td class="TdTitle">预计离职时间
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="DimissionDateStart" name="DimissionDateStart"
                            style="width: 140px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">至
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="DimissionDateEnd" name="DimissionDateEnd"
                            style="width: 140px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否占编
                    </td>
                    <td class="TdContent">
                        <select id="IsRole" name="IsRole" class="easyui-combobox" style="width: 144px;">
                            <option value=""></option>
                            <option value="否">否</option>
                            <option value="是">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否发薪
                    </td>
                    <td class="TdContent">
                        <select id="IsSalary" name="IsSalary" class="easyui-combobox" style="width: 144px;">
                            <option value=""></option>
                            <option value="否">否</option>
                            <option value="是">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">离职类型
                    </td>
                    <td class="TdContent">
                        <select id="DimissionType" name="DimissionType" class="easyui-combobox" style="width: 144px;">
                            <option value=""></option>
                            <option value="主动离职">主动离职</option>
                            <option value="被动离职">被动离职</option>
                        </select>
                    </td>
                    <td class="TdTitle">离职原因
                    </td>
                    <td class="TdContent">
                        <select id="DimissionReason" name="DimissionReason" runat="server" class="easyui-combobox" style="width: 137px;">
                            <option value=""></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">终止考勤时间
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="StartEndCheckDate" name="StartEndCheckDate"
                            style="width: 140px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">至
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="EndEndCheckDate" name="EndEndCheckDate"
                            style="width: 140px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="date" />
                    </td>
                    <td class="TdTitle">办理离职时间
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="WorkDimissionDateStart" name="WorkDimissionDateStart"
                            style="width: 140px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="date" onclick="WdatePicker()" />
                    </td>
                    <td class="TdTitle">至
                    </td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="WorkDimissionDateEnd" name="WorkDimissionDateEnd"
                            style="width: 140px;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="date" onclick="WdatePicker()" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">职级薪级
                    </td>
                    <td class="TdContent">
                        <input type="text" id="PersonLevel" name="PersonLevel" onclick="SelPersonLevel()"
                            style="width: 144px;" />
                    </td>
                    <td class="TdTitle">是否停薪
                    </td>
                    <td class="TdContent">
                        <select id="IsStopSalary" name="IsStopSalary" class="easyui-combobox" style="width: 144px;">
                            <option value=""></option>
                            <option value="否">否</option>
                            <option value="是">是</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">人员状态
                    </td>
                    <td class="TdContent" colspan="7" style="width: 90%; height: 30px;">
                        <input type="checkbox" id="Chk1" name="checkbox1" value="已建档" style="border: none; width: 15px;" checked="checked" />&nbsp;已建档&nbsp;
                        <input type="checkbox" id="Chk2" name="checkbox1" value="已应聘未入职" style="border: none; width: 15px;" />&nbsp;已应聘未入职&nbsp;
                        <input type="checkbox" id="Chk3" name="checkbox1" value="已入职未转正" style="border: none; width: 15px;" checked="checked" />&nbsp;已入职未转正&nbsp;
                        <input type="checkbox" id="Chk4" name="checkbox1" value="已转正未离职" style="border: none; width: 15px;" checked="checked" />&nbsp;已转正未离职&nbsp;
                        <input type="checkbox" id="Chk5" name="checkbox1" value="已离职" style="border: none; width: 15px;" />&nbsp;已离职&nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList(1,1,'SelectPersonList');">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>


        <div id="SearchDlgWhere" class="easyui-dialog" title="设置显示列" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 430px; height: 360px; padding: 10px;">
            <table align="center" width="288" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="4">
                        <select name="from" ondblclick="removeItem();" id="from" multiple="true">
                            <option value="PersonTypeName">人员类别</option>
                            <option value="PaperTypeName">证件名称</option>
                            <option value="PaperCode">证件号码</option>
                            <option value="PaperValidDate">证件有效期</option>
                            <option value="Birthday">出生日期</option>
                            <option value="RoleBond">职务风险金</option>
                            <option value="DegreeName">学位</option>
                            <option value="NationName">民族</option>
                            <option value="PoliticalName">政治面貌</option>
                            <option value="IsMarry">婚姻状况</option>
                            <option value="AccountNatureName">户口性质</option>
                            <option value="NativePlace">籍贯</option>
                            <option value="AccountAddress">户口地址</option>
                            <option value="LivingAddress">居住地址</option>
                            <option value="MobilePhone">移动电话</option>
                            <%--<option value="WorkStartDate">参加工作时间</option>--%>
                            <%--<option value="LevelName">职级薪级</option>--%>
                            <option value="RecruitType">招聘类型</option>
                            <option value="RecruitWay">招聘渠道</option>
                            <option value="RecommendUser">推荐人</option>
                            <option value="RecruitDate">应聘时间</option>
                            <option value="RecruitDepart">应聘部门</option>
                            <option value="RecruitRole">应聘岗位</option>
                            <option value="RecruitSalary">期望工资</option>
                            <option value="EntryDate">入职时间</option>
                            <option value="TrialDays">试用天数</option>
                            <%--<option value="WorkSign">工号</option>--%>
                            <option value="FormalDate">转正时间</option>
                            <option value="IsRole">是否占编</option>
                            <option value="IsSalary">是否发薪</option>
                            <%--<option value="DepName">机构</option>
                            <option value="RoleName">岗位</option>--%>
                            <%--<option value="RoleBond">职务风险金</option>--%>
                            <%--<option value="DimissionDate">预计离职时间</option>--%>
                            <option value="DimissionType">离职类型</option>
                            <option value="DimissionReasonName">离职原因</option>
                            <option value="EndCheckDate">终止考勤时间</option>
                            <option value="WorkDimissionDate">办理离职时间</option>
                            <option value="IsStopSalary">是否停薪</option>
                            <%--<option value="PersonState">人员状态</option>--%>
                            <option value="GraduateSchool">毕业学校</option>
                            <option value="Professional">专业</option>
                            <option value="Qualifications">专业资质证书</option>
                            <option value="WorkStartDate">参加工作时间</option>
                            <option value="Memo">备注</option>
                            <option value="BlacklistPerson">是否加入黑名单</option>
                            <option value="BlackAddTime">加入黑名单时间</option>
                            <option value="BlackAddUserName">黑名单添加人</option>
                            <option value="BlackAddBecouse">黑名单添加原因</option>
                        </select>
                    </td>
                    <td align="center">
                        <input type="button" id="addAll" value=" >> " onclick="addAll1();" style="width: 50px;" /><br />
                        <input type="button" id="addOne" value=" > " onclick="addOne1();" style="width: 50px;" /><br />
                        <input type="button" id="removeOne" value="&lt;" onclick="removeOne1();" style="width: 50px;" /><br />
                        <input type="button" id="removeAll" value="&lt;&lt;" onclick="removeAll1()" style="width: 50px;" /><br />
                    </td>
                    <td colspan="4">
                        <select name="to" id="to" ondblclick="addItem();" multiple="true" runat="server">
                        </select>
                    </td>
                    <td align="center">
                        <input type="button" id="Top" value="置顶" onclick="Top1();" style="width: 50px;" /><br />
                        <input type="button" id="Up" value="上移" onclick="Up1();" style="width: 50px;" /><br />
                        <input type="button" id="Down" value="下移" onclick="Down1();" style="width: 50px;" /><br />
                        <input type="button" id="Buttom" value="置底" onclick="Buttom1();" style="width: 50px;" /><br />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td colspan="4" id="saveId">
                        <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="HiIFCode" name="HiIFCode" value=" " />
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="hidden" id="DepCode" name="DepCode" />
        <input type="hidden" id="HiIFName" name="HiIFName" value=" " />
        <input type="hidden" id="HiObject" name="HiObject" value=" " />
        <input type="hidden" id="HiSort" name="HiSort" value=" " />
        <input type="hidden" id="HiOrder" name="HiOrder" value=" " />
        <input type="hidden" id="SortDepCode" name="SortDepCode" />
        <input type="hidden" id="RoleCode" name="RoleCode" />
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
            //加载部门树
            var setting = {
                data: {
                    simpleData: {
                        enable: true,
                        idKey: "DepCode",
                        pIdKey: "PrentDepCode",
                    },
                    key: {
                        name: "DepName"
                    }
                }, callback: {
                    onClick: ZtreeClick
                },
                view: {
                    fontCss: getFont,
                    nameIsHTML: true
                }
            };
            function getFont(treeId, node) {
                return node.font ? node.font : {};
            }

            var n =<%= zNodes %>;
					
            var newN = [];
            for (var i = 0; i < n.length; i++) {
                var strData = "";
                newN[i] = { DepCode: n[i]["SortDepCode"], PrentDepCode: n[i]["PrentDepCode"], DepName: n[i]["DepName"], SortDepCode: n[i]["DepCode"], DepCodeTure: n[i]["DepCode"], open: 'true' };
            }
            treeObj = $.fn.zTree.init($("#treeDemo"), setting, newN);
            treeObj.expandAll(true);
            //树点击事件
            function ZtreeClick(event, treeId, treeNode) {
                $("#SortDepCode").val(treeNode.SortDepCode);
                LoadList("", "", 'SelectPersonList');
            }

            function GetParam(sort, order) {
                var str = '';
                if (document.getElementById("Chk1").checked) {
                    str += '&Chk1=true';
                }
                if (document.getElementById("Chk2").checked) {
                    str += '&Chk2=true';
                }
                if (document.getElementById("Chk3").checked) {
                    str += '&Chk3=true';
                }
                if (document.getElementById("Chk4").checked) {
                    str += '&Chk4=true';
                }
                if (document.getElementById("Chk5").checked) {
                    str += '&Chk5=true';
                }

                if (GetQueryString('RoleCode') != undefined && GetQueryString("RoleCode") != null
                    && GetQueryString('RoleCode') != 'null' && GetQueryString("RoleCode") != "") {
                    str += '&RoleCode=' + GetQueryString('RoleCode');
                }

                if ($("#SortDepCode").val() != undefined && $("#SortDepCode").val() != null
                    && $("#SortDepCode").val() != 'null' && $("#SortDepCode").val() != "") {
                    str += '&DepCode=' + $("#SortDepCode").val();
                }

                str += '&Name=' + $('#Name').val();
                var SexArr = $("input:hidden[name='Sex']");
                var Sex = '';
                $.each(SexArr, function (index, item) {
                    Sex += ',' + item.value;
                });
                if (Sex.length > 0);
                {
                    str += '&Sex=' + Sex.substr(1, Sex.length - 1)
                }
                str += '&Sex=' + $('#Sex').val();
                str += '&StartAge=' + $('#StartAge').val();
                str += '&EndAge=' + $('#EndAge').val();

                str += '&RecruitDepart=' + $('#RecruitDepart').val();
                str += '&RecruitRole=' + $('#RecruitRole').val();
                str += '&TrialDaysStart=' + $('#TrialDaysStart').val();
                str += '&TrialDaysEnd=' + $('#TrialDaysEnd').val();

                str += '&RoleBondStart=' + $('#RoleBondStart').val();
                str += '&RoleBondEnd=' + $('#RoleBondEnd').val();
                str += '&DimissionReason=' + $('#DimissionReason').val();

                str += '&PaperCode=' + $('#PaperCode').val();

                str += '&PaperValidDateStart=' + $('#PaperValidDateStart').val();
                str += '&PaperValidDateEnd=' + $('#PaperValidDateEnd').val();

                str += '&WorkStartDateStart=' + $('#WorkStartDateStart').val();
                str += '&WorkStartDateEnd=' + $('#WorkStartDateEnd').val();

                str += '&StartEntryDate=' + $('#StartEntryDate').val();
                str += '&EndEntryDate=' + $('#EndEntryDate').val();


                str += '&RecruitDateStart=' + $('#RecruitDateStart').val();
                str += '&RecruitDateEnd=' + $('#RecruitDateEnd').val();

                str += '&FormalDateStart=' + $('#FormalDateStart').val();
                str += '&FormalDateEnd=' + $('#FormalDateEnd').val();

                str += '&DimissionDateStart=' + $('#DimissionDateStart').val();
                str += '&DimissionDateEnd=' + $('#DimissionDateEnd').val();

                str += '&StartEndCheckDate=' + $('#StartEndCheckDate').val();
                str += '&EndEndCheckDate=' + $('#EndEndCheckDate').val();

                str += '&WorkDimissionDateStart=' + $('#WorkDimissionDateStart').val();
                str += '&WorkDimissionDateEnd=' + $('#WorkDimissionDateEnd').val();
                // 
                str += '&NativePlace=' + $('#NativePlace').val();
                str += '&AccountAddress=' + $('#AccountAddress').val();
                str += '&LivingAddress=' + $('#LivingAddress').val();
                str += '&FamilyTel=' + $('#FamilyTel').val();
                str += '&MobilePhone=' + $('#MobilePhone').val();
                //str += '&DepName=' + $('#DepName').val();
                if ($("#DepCode").val() != undefined && $("#DepCode").val() != null
                    && $("#DepCode").val() != 'null' && $("#DepCode").val() != "") {
                    str += '&DepCode=' + $("#DepCode").val();
                }
                //str += '&DepCode=' + $("#DepCode").val();
                str += '&RoleName=' + $('#RoleName').val();
                str += '&RoleCode=' + $("#RoleCode").val();
                str += '&LevelCode=' + $('#PersonLevel').val();

                var IsStopSalaryArr = $("input:hidden[name='IsStopSalary']");
                var IsStopSalary = '';
                $.each(IsStopSalaryArr, function (index, item) {
                    IsStopSalary += ',' + item.value;
                });
                if (IsStopSalary.length > 0);
                {
                    str += '&IsStopSalary=' + IsStopSalary.substr(1, IsStopSalary.length - 1)
                }

                var DimissionTypeArr = $("input:hidden[name='DimissionType']");
                var DimissionType = '';
                $.each(DimissionTypeArr, function (index, item) {
                    DimissionType += ',' + item.value;
                });
                if (DimissionType.length > 0);
                {
                    str += '&DimissionType=' + DimissionType.substr(1, DimissionType.length - 1)
                }


                var IsSalaryArr = $("input:hidden[name='IsSalary']");
                var IsSalary = '';
                $.each(IsSalaryArr, function (index, item) {
                    IsSalary += ',' + item.value;
                });
                if (IsSalary.length > 0);
                {
                    str += '&IsSalary=' + IsSalary.substr(1, IsSalary.length - 1)
                }

                var IsRoleArr = $("input:hidden[name='IsRole']");
                var IsRole = '';
                $.each(IsRoleArr, function (index, item) {
                    IsRole += ',' + item.value;
                });
                if (IsRole.length > 0);
                {
                    str += '&IsRole=' + IsRole.substr(1, IsRole.length - 1)
                }

                var RecruitWayArr = $("input:hidden[name='RecruitWay']");
                var RecruitWay = '';
                $.each(RecruitWayArr, function (index, item) {
                    RecruitWay += ',' + item.value;
                });
                if (RecruitWay.length > 0);
                {
                    str += '&RecruitWay=' + RecruitWay.substr(1, RecruitWay.length - 1)
                }

                var RecruitTypeArr = $("input:hidden[name='RecruitType']");
                var RecruitType = '';
                $.each(RecruitTypeArr, function (index, item) {
                    RecruitType += ',' + item.value;
                });
                if (RecruitType.length > 0);
                {
                    str += '&RecruitType=' + RecruitType.substr(1, RecruitType.length - 1)
                }


                var AccountNatureArr = $("input:hidden[name='AccountNature']");
                var AccountNature = '';
                $.each(AccountNatureArr, function (index, item) {
                    AccountNature += ',' + item.value;
                });
                if (AccountNature.length > 0);
                {
                    str += '&AccountNature=' + AccountNature.substr(1, AccountNature.length - 1)
                }

                var PersonTypeArr = $("input:hidden[name='PersonType']");
                var PersonType = '';
                $.each(PersonTypeArr, function (index, item) {
                    PersonType += ',' + item.value;
                });
                if (PersonType.length > 0);
                {
                    str += '&PersonType=' + PersonType.substr(1, PersonType.length - 1)
                }


                var PoliticalArr = $("input:hidden[name='Political']");
                var Political = '';
                $.each(PoliticalArr, function (index, item) {
                    Political += ',' + item.value;
                });
                if (Political.length > 0);
                {
                    str += '&Political=' + Political.substr(1, Political.length - 1)
                }


                var NationArr = $("input:hidden[name='Nation']");
                var Nation = '';
                $.each(NationArr, function (index, item) {
                    Nation += ',' + item.value;
                });
                if (Nation.length > 0);
                {
                    str += '&Nation=' + Nation.substr(1, Nation.length - 1)
                }

                var DegreeArr = $("input:hidden[name='Degree']");
                var Degree = '';
                $.each(DegreeArr, function (index, item) {
                    Degree += ',' + item.value;
                });
                if (Degree.length > 0);
                {
                    str += '&Degree=' + Degree.substr(1, Degree.length - 1)
                }

                var PaperTypeArr = $("input:hidden[name='PaperType']");
                var PaperType = '';
                $.each(PaperTypeArr, function (index, item) {
                    PaperType += ',' + item.value;
                });
                if (PaperType.length > 0);
                {
                    str += '&PaperType=' + PaperType.substr(1, PaperType.length - 1)
                }

                var EducationArr = $("input:hidden[name='Education']");
                var Education = '';
                $.each(EducationArr, function (index, item) {
                    Education += ',' + item.value;
                });
                if (Education.length > 0);
                {
                    str += '&Education=' + Education.substr(1, Education.length - 1);
                }
                $("#HiSort").val(sort);
                $("#HiOrder").val(order);
                str += '&HiSort=' + sort + '&HiOrder=' + order;

                if (GetQueryString('SalaryDepCode') != undefined && GetQueryString("SalaryDepCode") != null
                    && GetQueryString('SalaryDepCode') != 'null' && GetQueryString("SalaryDepCode") != "") {
                    str += '&SalaryDepCode=' + GetQueryString('SalaryDepCode');
                }
                else {
                    str += '&SalarySortDepCode=' + $('#SalaryDepCode').val();
                }

                return encodeURI(str);
            }


            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;

            }
            var column = [[
                //{ field: 'Id', title: 'Id', width: 50, align: 'left', sortable: true, hidden: true },
                { field: 'Sex', title: '性别', width: 50, align: 'left', sortable: true },
                { field: 'Age', title: '年龄', width: 50, align: 'left', sortable: true },
                { field: 'EducationName', title: '学历', width: 80, align: 'left', sortable: true },
                //{
                //    field: 'parantDepName', title: '人事所属机构', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                //        var str = '';
                //        if (row.parantDepName != '') {
                //            str = row.parantDepName + '-' + row.DepName
                //        }
                //        else {
                //            str = row.DepName
                //        }
                //        return str;
                //    }
                //},
                { field: 'parantDepName', title: '人事所属机构', width: 150, align: 'left', sortable: true },
                { field: 'DepName', title: '部门', width: 120, align: 'left', sortable: true },
                { field: 'SalaryDepName', title: '成本归属机构', width: 80, align: 'left', sortable: true, hidden: true },

                { field: 'RoleName', title: '岗位', width: 100, align: 'left', sortable: true },
                { field: 'LevelName', title: '职级薪级', width: 100, align: 'left', sortable: true },
                { field: 'WorkSign', title: '工号', width: 90, align: 'left', sortable: true },
                {
                    field: 'WorkStartDate', title: '参加工作时间', width: 100, align: 'left', sortable: true, hidden: true, formatter: function (value, row, index) {
                        var str = row.WorkStartDate.ToCustomizeDate();
                        return str;
                    }
                },
                {
                    field: 'FormalDate', title: '转正时间', width: 100, align: 'left', sortable: true, hidden: true, formatter: function (value, row, index) {
                        var str = row.FormalDate.ToCustomizeDate();
                        return str;
                    }
                },
                { field: 'PersonState', title: '人员状态', width: 90, align: 'left', sortable: true },
                { field: 'IsLock', title: '锁定状态', width: 80, align: 'left', sortable: true },
                {
                    field: 'EntryDate', title: '入职时间', width: 100, align: 'left', sortable: true, hidden: true, formatter: function (value, row, index) {
                        var str = row.EntryDate.ToCustomizeDate();
                        return str;
                    }
                },
                { field: 'PersonTypeName', title: '人员类别', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'PaperTypeName', title: '证件名称', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'PaperCode', title: '证件号码', width: 150, align: 'left', sortable: true, hidden: true },
                {
                    field: 'PaperValidDate', title: '证件有效期', width: 100, align: 'left', sortable: true, hidden: true, formatter: function (value, row, index) {
                        var str = row.PaperValidDate.ToCustomizeDate();
                        if (str.substr(0, 4) == '2099') {
                            str = "长期";
                        }
                        return str;
                    }
                },
                {
                    field: 'Birthday', title: '出生日期', width: 100, align: 'left', sortable: true, hidden: true, formatter: function (value, row, index) {
                        var str = row.Birthday.ToCustomizeDate();
                        return str;
                    }
                },
                { field: 'RoleBond', title: '职务风险金', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'DegreeName', title: '学位', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'NationName', title: '民族', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'PoliticalName', title: '政治面貌', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'IsMarry', title: '婚姻状况', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'AccountNatureName', title: '户口性质', width: 100, align: 'left', sortable: true, hidden: true },
                {
                    field: 'NativePlace', title: '籍贯', width: 150, align: 'left', sortable: true, hidden: true
                },
                { field: 'AccountAddress', title: '户口地址', width: 250, align: 'left', sortable: true, hidden: true },
                { field: 'LivingAddress', title: '居住地址', width: 250, align: 'left', sortable: true, hidden: true },
                { field: 'MobilePhone', title: '移动电话', width: 100, align: 'left', sortable: true, hidden: true },

                //{ field: 'LevelName', title: '职级薪级', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'RecruitType', title: '招聘类型', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'RecruitWay', title: '招聘渠道', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'RecommendUser', title: '推荐人', width: 100, align: 'left', sortable: true, hidden: true },
                {
                    field: 'RecruitDate', title: '应聘时间', width: 100, align: 'left', sortable: true, hidden: true, formatter: function (value, row, index) {
                        var str = row.RecruitDate.ToCustomizeDate();
                        return str;
                    }
                },
                { field: 'RecruitDepart', title: '应聘部门', width: 150, align: 'left', sortable: true, hidden: true },
                { field: 'RecruitRole', title: '应聘岗位', width: 150, align: 'left', sortable: true, hidden: true },

                { field: 'RecruitSalary', title: '期望工资', width: 100, align: 'left', sortable: true, hidden: true },
                //                { field: 'LeftEye', title: '入职时间', width: 50, align: 'left', sortable: true, hidden: true },
                { field: 'TrialDays', title: '试用天数', width: 50, align: 'left', sortable: true, hidden: true },
                { field: 'IsRole', title: '是否占编', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'IsSalary', title: '是否发薪', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'DimissionType', title: '离职类型', width: 150, align: 'left', sortable: true, hidden: true },
                { field: 'DimissionReasonName', title: '离职原因', width: 250, align: 'left', sortable: true, hidden: true },
                {
                    field: 'EndCheckDate', title: '终止考勤时间', width: 100, align: 'left', sortable: true, hidden: true, formatter: function (value, row, index) {
                        var str = row.DimissionDate.ToCustomizeDate();
                        return str;
                    }
                },
                {
                    field: 'WorkDimissionDate', title: '离职时间', width: 100, align: 'left', sortable: true, hidden: true, formatter: function (value, row, index) {
                        var str = row.WorkDimissionDate.ToCustomizeDate();
                        return str;
                    }
                },
                { field: 'IsStopSalary', title: '是否停薪', width: 100, align: 'left', sortable: true, hidden: true },
                //{ field: 'PersonState', title: '人员状态', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'GraduateSchool', title: '毕业学校', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'Professional', title: '专业', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'Qualifications', title: '专业资质证书', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'Memo', title: '备注', width: 200, align: 'left', sortable: true, hidden: true },

                { field: 'BlacklistPerson', title: '是否加入黑名单', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'BlackAddTime', title: '加入黑名单时间', width: 110, align: 'left', sortable: true, hidden: true },
                { field: 'BlackAddUserName', title: '黑名单添加人', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'BlackAddBecouse', title: '黑名单添加原因', width: 200, align: 'left', sortable: true, hidden: true }
            ]];


            //        $(document).ready(function () {
            //            $("input[name='checkColumn']").click(function () {
            //                if (this.checked == true) {
            //                    $("#TableContainer").datagrid("showColumn", this.value);
            //                }
            //                else {
            //                    $("#TableContainer").datagrid("hideColumn", this.value);
            //                }
            //            });
            //        });




            function SelDepartment(str) {
                HDialog.Open('400', '403', "../dialog/DepartmentDlgNew_hr.aspx?Ram=" + Math.random(), '选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split("~");
                        var varDepObj = "";
                        var depName = "";
                        var depCode = "";
                        for (var i = 0; i < varObjects.length; i++) {
                            varDepObj = varObjects[i].split('\t');
                            depName += varDepObj[2] + ",";
                            depCode += varDepObj[0] + ",";
                        }
                        depName = depName.substr(0, depName.length - 1);
                        depCode = depCode.substr(0, depCode.length - 1);
                        //$("#DepName").searchbox("setValue", depName);

                        // $("#DepCode").val(depCode);
                        ////
                        if (str == "Salary") {
                            $("#SalaryDepName").val(depName);
                            $("#SalaryDepCode").val(depCode);
                        }
                        else {
                            $("#DepName").val(depName);
                            $("#DepCode").val(depCode);
                            document.all.DepName.value = depName;
                        }

                    }
                });
            }

            function SelDepartment1() {
                HDialog.Open('400', '400', "../dialog/DepartmentDlg_hr.aspx?Ram=" + Math.random(), '选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split("\t");

                        $("#RecruitDepart").val(varObjects[1]);
                    }
                });
            }
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
            function SelRole1() {
                HDialog.Open('370', '300', "../PersonnelManage/SelRole.aspx?Ram=" + Math.random(), '选择', "", function callback(_Data) {
                    if (_Data != '') {
                        var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        $("#RecruitRole").val(varObjects[0].TypeName);
                    }
                });
            }

            //职级薪级
            function SelPersonLevel() {
                HDialog.Open('600', '400', "../PersonnelManage/SelPersonLevel.aspx?Ram=" + Math.random(), '选择', "", function callback(_Data) {
                    if (_Data != '') {
                        var varObjects = eval("(" + _Data + ")"); //转换为json对象

                        $("#PersonLevel").val(varObjects.Name);
                    }
                });

            }

            function InitTableHeight() {
                //var h = $(window).height();
                //$("#TableContainer").css("height", h + "px");
                var h = $(window).height() - 28;
                $("#LeftPanel").css("height", h + "px");
                $("#TableContainer").css("height", h + "px");
                $("#RightPanel").css("height", h + "px");

                var w = $(window).width();
                var w1 = $("#LeftPanel").width();
                w = w - w1 - 15;
                $("#RilghPanel").css("width", w);
            }
            InitTableHeight();

            var frozenColumns = [[
                {
                    field: 'Name', title: '姓名', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue;\" href=\"rsda_xx.aspx?OpType=edit&show=0&Id=" + row.Id + "\">" + row.Name + "</a>";
                        return str;
                    }
                }
            ]]

            function SavePersonRecord() {
                var varchar = document.getElementById("HiIFCode").value;
                $.tool.DataGet('CSPerson', 'SavePersonRecordItem', 'PersonRecord=' + varchar,
                    function Init() {
                    },
                    function callback(_Data) {

                        if (_Data == "false") {
                            $.messager.alert('错误', '无此权限', 'error');
                        }
                        else {
                            GetPersonRecord(0);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                        $("#DepName").val("");
                        $("#DepCode").val("");
                        $("#SalaryDepName").val("");
                        $("#SalaryDepCode").val("");
                        $("#RoleName").val("");
                        $("#RoleCode").val("");
                        $("#Name").val("");
                        $("#Sex").val("");
                        $("#StartAge").val("");
                        $("#EndAge").val("");
                        $("#WorkSign").val("");
                        treeObj = $.fn.zTree.init($("#treeDemo"), setting, newN);
                        treeObj.expandAll(true);
                    }
                }, '-',
                {
                    text: '设置显示列',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlgWhere').parent().appendTo($("form:first"))
                        $('#SearchDlgWhere').dialog('open');
                    }
                }, '-',
                {
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        window.open("rsdaoutput.aspx?random=" + Math.random() + GetParam());
                    }
                }, '-',
                {
                    text: '派遣员工档案库',
                    iconCls: 'icon-filter',
                    handler: function () {
                        LoadList(1, 1, 'SelectDispatchPersonList');
                    }
                }, '-',
                {
                    text: '离职员工档案库',
                    iconCls: 'icon-filter',
                    handler: function () {
                        LoadList(1, 1, 'SelectQuitPersonList');
                    }
                }, '-',
                {
                    text: '黑名单员工档案库',
                    iconCls: 'icon-filter',
                    handler: function () {
                        LoadList(1, 1, 'SelectBlacklistPersonList');
                    }
                }
            ];
            function GetPersonRecord(bs) {
                $.tool.DataGet('CSPerson', 'GetPersonRecordItem', 'Id=',
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "false") {
                            $.messager.alert('错误', '无此权限', 'error');
                        }
                        else {
                            if (_Data != '[]') {
                                var s = eval("(" + _Data + ")");
                                if (s[0].PersonRecord != undefined && s[0].PersonRecord != null && s[0].PersonRecord != "" && s[0].PersonRecord != "null") {
                                    var ss = s[0].PersonRecord.split(',');
                                    for (var i = 0; i < ss.length; i++) {
                                        if (ss[i] != "" && ss[i] != undefined) {
                                            $("#TableContainer").datagrid("showColumn", ss[i]);
                                        }
                                    }
                                }
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

            }

            //        function SavePersonRecord() {
            //            var items = $("input[name='checkColumn']:checked");
            //            var varchar = '';
            //            $.each(items, function (index, temp) {
            //                if (varchar == '') {
            //                    varchar = temp.value;
            //                }
            //                else {
            //                    varchar += ',' + temp.value;
            //                }
            //            });

            //            $.tool.DataGet('CSPerson', 'SavePersonRecordItem', 'PersonRecord=' + varchar,
            //                            function Init() {
            //                            },
            //                            function callback(_Data) {
            //                                if (_Data == "false") {
            //                                    $.messager.alert('错误', '无此权限', 'error');
            //                                }
            //                                else {
            //                                }
            //                            },
            //                            function completeCallback() {
            //                            },
            //                            function errorCallback() {
            //                            });
            //            $("#ShowColumnsDlg").dialog("close");
            //        }
            function DelRecord(Id) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('CSPerson', 'DelPersonList', 'Id=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "false") {
                                    $.messager.alert('错误', '无此权限', 'error');
                                }
                                else {
                                    LoadList("", "", 'SelectPersonList');
                                }

                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }
            $("#TableContainer").datagrid({
                onSortColumn: function (sort, order) {
                    LoadList(sort, order, 'SelectPersonList');
                }
            })

            function LoadList(sort, order, Command) {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSPerson&Command=' + Command + '' + GetParam(sort, order),
                    method: "get",
                    title: '',
                    nowrap: true,
                    pageSize: 20,
                    pageList: [20, 50, 100],
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        GetPersonRecord(1);
                    }
                });
                $("#SearchDlg").dialog("close");
            }
            LoadList("", "", 'SelectPersonList');

            $(document).ready(function () {
                //获取DataGrid分页组件对象
                var p = $("#TableContainer").datagrid('getPager');
                //设置分页组件参数
                $(p).pagination({
                    onSelectPage: function (pageNumber, pageSize) {
                        $.ajax({
                            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSPerson&Command=SelectPersonList' + GetParam("", ""),
                            type: 'GET',
                            dataType: 'JSON',
                            cache: false,
                            success: function (_Data) {

                                $("#TableContainer").datagrid('loadData', _Data);
                            },
                            complete: function (XMLHttpRequest, textStatus, errorThrown) {

                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                $.messager.alert('错误', '数据读取错误', 'error');
                            }
                        });
                    }
                });
            });


            //以下为设置显示列js方法
            function addOne1() {
                //$("#TableContainer").datagrid("showColumn", $("#from option:selected").val());
                $("#from option:selected").clone().appendTo("#to");
                $("#from option:selected").remove();
            }

            //    //选择全部  
            function addAll1() {
                var obj = $("#from option").clone().appendTo("#to");
                for (var i = 0; i < obj.length; i++) {
                    //$("#TableContainer").datagrid("showColumn", obj[i].value);
                }
                $("#from option").clone().appendTo("#to");
                $("#from option").remove();
            }

            //    //移除一项  
            function removeOne1() {
                //$("#TableContainer").datagrid("hideColumn", $("#from option:selected").val());
                $("#to option:selected").clone().appendTo("#from");
                $("#to option:selected").remove();
            }

            //    //移除全部  
            function removeAll1() {
                var obj = $("#to option").clone().appendTo("#from");
                for (var i = 0; i < obj.length; i++) {
                    //$("#TableContainer").datagrid("hideColumn", obj[i].value);
                }
                $("#to option").clone().appendTo("#from");
                $("#to option").remove();
            }

            //    //移至顶部  
            function Top1() {
                var allOpts = $("#to option");
                var selected = $("#to option:selected");
                if (selected.get(0).index != 0) {
                    for (i = 0; i < selected.length; i++) {
                        var item = $(selected.get(i));
                        var top = $(allOpts.get(0));
                        item.insertBefore(top);
                    }
                }
            }

            //    //上移一行  
            function Up1() {
                var selected = $("#to option:selected");
                if (selected.get(0).index != 0) {
                    selected.each(function () {
                        $(this).prev().before($(this));
                    });
                }
            }

            //    //下移一行  
            function Down1() {
                var allOpts = $("#to option");
                var selected = $("#to option:selected");
                if (selected.get(selected.length - 1).index != allOpts.length - 1) {
                    for (i = selected.length - 1; i >= 0; i--) {
                        var item = $(selected.get(i));
                        item.insertAfter(item.next());
                    }
                }
            }

            //    //移至底部  
            function Buttom1() {
                var allOpts = $("#to option");
                var selected = $("#to option:selected");
                if (selected.get(selected.length - 1).index != allOpts.length - 1) {
                    for (i = selected.length - 1; i >= 0; i--) {
                        var item = $(selected.get(i));
                        var buttom = $(allOpts.get(length - 1));
                        item.insertAfter(buttom);
                    }
                }
            }

            function removeItem() {
                var sltSrc = document.getElementById('from');
                var sltTarget = document.getElementById('to');
                for (var i = 0; i < sltSrc.options.length; i++) {
                    var tempOption = sltSrc.options[i];
                    if (tempOption.selected) {
                        sltSrc.removeChild(tempOption);
                        sltTarget.appendChild(tempOption);
                    }
                }
            }

            function addItem() {
                var sltSrc = document.getElementById('from');
                var sltTarget = document.getElementById('to');
                for (var i = 0; i < sltTarget.options.length; i++) {
                    var tempOption = sltTarget.options[i];
                    if (tempOption.selected) {
                        sltTarget.removeChild(tempOption);
                        sltSrc.appendChild(tempOption);
                    }
                }
            }

            function Save() {
                var str = $("#to option").map(function () { return $(this).val(); }).get().join(",")
                document.getElementById("HiIFCode").value = str;
                SavePersonRecord();
                $('#SearchDlgWhere').dialog('close');
            }
        </script>
    </form>
</body>
</html>
