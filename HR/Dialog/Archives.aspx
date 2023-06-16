<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Archives.aspx.cs" Inherits="M_Main.HR.Dialog.Archives" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户选择</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <style type="text/css">
        .form-horizontal {
            padding: 5px;
        }

            .form-horizontal .form-group {
                margin: 0;
                /*margin-top: 5px;*/
            }

                .form-horizontal .form-group:first-child {
                    margin: 0;
                }

        .panel_lable {
            font-weight: normal;
            color: #159115
        }
    </style>
</head>
<body>
    <%--岗位控权 --%>
    <input id="IsPowerPost" name="IsPowerPost" type="hidden" value="否" />
    <%--层级控权 --%>
    <input id="IsPowerLevel" name="IsPowerLevel" type="hidden" value="否" />
    <%--是否允许多选员工 --%>
    <input id="IsMultiple" name="IsMultiple" type="hidden" value="否" />
    <%--是否选择不是合同工员工 --%>
    <input id="NotSignedContract" name="NotSignedContract" type="hidden" value="否" />
    <input id="SortDepCode" name="SortDepCode" type="hidden" value="" />

    <input id="ToHumanAffairsDepID" name="ToHumanAffairsDepID" type="hidden" />
    <input id="IsDelete" name="IsDelete" value="0" type="hidden" />

    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',border:true,width:325,title:'部门列表',expandMode:'dock'">
            <form class="form-horizontal dialog-fixed-tool-top" style="width: 322px;" role="form">
                <div class="form-group">
                    <div class="col-sm-12 col-xs-12" style="padding: 0">
                        <input id="Name" name="Name" class="easyui-textbox" data-options="prompt:'部门名称',
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:63,plain:false" onclick="LoadTree();">筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:85" onclick="javascript:$('#tree').tree('reload');">清除勾选</a>
                    </div>
                </div>
            </form>
            <div style="height: 40px"></div>
            <ul id="tree" class="easyui-tree"></ul>
        </div>
        <div id="layout_center" data-options="region:'center',split:false,border:true,title:'员工列表 - <lable class=\'panel_lable\'>[ 温馨提示 : 鼠标移动到 (一键添加) 按钮(悬停)查看功能说明 ! ]</lable>',">
            <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="PanelSelect" data-options="region:'south',border:false,iconCls:'icon-ok',title:'已勾选员工 ( 可点击右侧小箭头按钮 隐藏 / 显示 当前界面 )',split:false,expandMode:'dock' "
            style="height: 224px;">
            <table id="dgSelect" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
    </div>
    <div id="toolbar" class="easyui-panel" data-options="closed:true" style="background: #F5F5F5">
        <div>
            <form id="frm" class="form-horizontal" role="form">
                <div class="form-group">
                    <div class="col-sm-12 col-md-12" style="padding: 0">
                        <input id="UserName" name="UserName" class="easyui-textbox" data-options="prompt:'员工姓名',
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:65" onclick="InitDataGrid();">筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:65" onclick="$('#frm').form('clear')">清空</a>
                        <%--<a href="javascript:void(0)" title="功能诠释：<br/>&emsp;&emsp;将当前勾选的员工加到下方已勾选员工列表中!" class="easyui-linkbutton easyui-tooltip" data-options="iconCls:'icon-add',width:85" onclick="AddUser()">添加</a>--%>
                        <a href="javascript:void(0)" id="btn_Batch_Add" title="功能诠释：<br/>&emsp;&emsp;将左侧部门列表勾选的部门下的所有员工添加到下方已勾选员工列表中!" class="easyui-linkbutton easyui-tooltip" data-options="iconCls:'icon-add'" onclick="AddAllUser()">一键添加(勾选部门)</a>
                        <a href="javascript:void(0)" id="btn_Save" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="Save();">确定选择</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <style>
        a:link {
            text-decoration: none;
        }

        a:visited {
            text-decoration: none;
        }

        a:hover {
            text-decoration: none;
        }

        a:active {
            text-decoration: none;
        }

        .panel_btn {
            display: inline-block;
            margin-top: -3px;
            padding: 2px 5px;
            border-radius: 4px;
            background: #e6e6e6;
            -moz-border-radius: 5px 5px 5px 5px;
            -webkit-border-radius: 5px 5px 5px 5px;
            border-radius: 5px 5px 5px 5px;
            cursor: pointer;
            vertical-align: middle;
            border: 1px solid #bbbbbb;
            background: linear-gradient(to bottom,#FBFBFB 0,#E6E6E6 100%);
            /*background: linear-gradient(to bottom,#ffffff 0,#e6e6e6 100%);*/
        }

            .panel_btn:hover {
                background: linear-gradient(to bottom,#e6e6e6 0,#e6e6e6 100%);
                text-decoration: none;
            }

        .panel_btn {
            font-style: normal;
        }

            .panel_btn span {
                color: #444;
                font-weight: 400;
                padding-left: 20px;
                background: url('/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icons/cancel.png') no-repeat left center;
                background-size: 14px 14px;
            }
    </style>
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <script language="javascript" type="text/javascript">
        $(function () {
            var param = $.getUrlParam();
            if (!!param.IsPowerPost) {
                $("#IsPowerPost").val(param.IsPowerPost);
            }
            if (!!param.IsPowerLevel) {
                $("#IsPowerLevel").val(param.IsPowerLevel);
            }
            if (!!param.IsMultiple) {
                $("#IsMultiple").val(param.IsMultiple);
            }
            if (!!param.SortDepCode) {
                $("#SortDepCode").val(param.SortDepCode);
            }
            if ($("#IsMultiple").val() == "否") {
                $("#btn_Batch_Add").hide();
            } else {
                column[0].unshift({ field: 'ck', checkbox: true });
            }
            InitPage()
            LoadTree();
            InitDataGridSelect();
            $("#layout_center").panel({
                onResize: function (width, height) {
                    SetToolbar(width)
                }
            });
        });
        function InitPage() {
            SetToolbar($("#layout_center").width());
            var title = "已勾选员工列表 <a href=\"javascript:void(0)\" onclick=\"DgDataClear()\" class=\"panel_btn\"><span>清空已勾选员工列表</span></a><lable class=\'panel_lable\'> ( 温馨提示:可点击右侧小箭头按钮 隐藏 / 显示 当前界面 )</lable>";
            //加载Panel
            $("#PanelSelect").panel({ title: title, });
        }
        function SetToolbar(w) {
            $('#toolbar').width(w);
        }


        function LoadTree() {
            $("#tree").tree({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                treeField: 'text',
                idField: 'id',
                lines: true,
                animate: true,
                border: false,
                checkbox: true,
                //cascadeCheck: true,
                //onlyLeafCheck: true,
                loadMsg: '加载中,请稍侯...',
                onLoadSuccess: function (node, data) {
                    //console.log(node, data);
                    //InitDataGrid();
                    //$("#tree").tree('collapseAll');
                    $.messager.progress('close');
                    //if (data.length > 0) {
                    //    var dataJson = $("#tree").tree("getChildren");
                    //    $.each(dataJson, function (i, itemNode) {
                    //        //if ($("#tree").tree("isLeaf", itemNode.target)) {
                    //        //默认选中第一个节点
                    //        $("#tree").tree('select', itemNode.target);
                    //        return false;
                    //        //}
                    //    });
                    //} else {
                    InitDataGrid();
                    //}
                    //InitTableHeight();
                },
                onBeforeLoad: function (row, param) {
                    param.Class = "HR_Dialog";
                    param.Method = "GetListDepartment";
                    param.Name = $("#Name").textbox("getValue");
                    param.IsPowerPost = $("#IsPowerPost").val();
                    param.IsPowerLevel = $("#IsPowerLevel").val();
                    param.SortDepCode = $("#SortDepCode").val();
                    $.messager.progress({
                        title: '温馨提示',
                        msg: '正在加载数据,请稍候...',
                        interval: 3000
                    });
                },
                onCheck: function (node, checked) {
                    TreeDelayLoad();
                },
                onBeforeSelect: function (node) {
                    //console.log('单选:' + node.id);
                    //if (node.id != "01" && $("#CurOrganCode").val() != "01") {
                    //    if (!$(this).tree('isLeaf', node.target)) {
                    //        return false;
                    //    }
                    //}
                    if (node.checked) {
                        $('#tree').tree('uncheck', node.target);
                    } else {
                        $('#tree').tree('check', node.target);

                    }
                    //$("#OrganCode").val(node.id);
                },
                onSelect: function (row) {
                    //$('#layout_center').panel('setTitle', '房间列表-' + row.attributes.Location + '( 温馨提示:双击表格一行也可以选择房屋! )');
                    //InitDataGrid();
                },
                onLoadError: function (arguments) {
                    $.messager.progress('close');
                    $.messager.alert("温馨提示", '系统错误!');
                }
            });
        }

        var IntervalID = null;
        //点击树延时执行
        function TreeDelayLoad() {
            if (!!IntervalID) {
                clearInterval(IntervalID);
            }
            IntervalID = setInterval(function () {
                SearchOrgan();
                clearInterval(IntervalID);
            }, 1000);
        }
        function SearchOrgan() {
            var nodes = $('#tree').tree('getChecked');
            var val = "", text = "";
            if (nodes.length > 0) {
                $.each(nodes, function (i, item) {
                    //if ($(this).tree('isLeaf', item.target)) {
                    //if (item.attributes.LastNodeTotal == 0) {
                    val += "," + item.id;
                    text += "," + item.text;
                    //}
                });
                val = val.substr(1);
                text = text.substr(1);
            }
            $("#ToHumanAffairsDepID").val(val);
            //console.log(text);
            InitDataGrid();
        }
        var column = [[
            { field: 'ToHumanAffairsUpDepName', title: '所属人事机构', width: 200, align: 'center', sortable: false},
            { field: 'ToHumanAffairsDepName', title: '所属人事部门', width: 200, align: 'center', sortable: false},
            { field: 'ToHumanAffairsRoleName', title: '所属人事岗位', width: 100, align: 'center', sortable: false},
            { field: 'Sex', title: '性别', width: 60, align: 'center', sortable: false, hidden: true },
            { field: 'NationalityName', title: '国籍', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'CertificateName', title: '证件名称', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'CertificateNO', title: '证件号码', width: 150, align: 'center', sortable: false, hidden: true },
            {
                field: 'CertificateStartDate', title: '证件有效期', width: 170, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    value = $.dateFormat(value) + " 至 ";
                    if (row.IsLongRange == "是") {
                        value += "长期";
                    } else {
                        value += $.dateFormat(row.CertificateEndDate);
                    }
                    return value;
                }
            },
            {
                field: 'BirthDate', title: '出生日期', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'Age', title: '年龄', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'NationName', title: '民族', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'PoliticalStatusName', title: '政治面貌', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'MaritalStatus', title: '婚姻状况', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'GraduateSchool', title: '毕业学校', width: 130, align: 'center', sortable: false, hidden: true },
            {
                field: 'GraduateDate', title: '毕业时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'EducationName', title: '学历', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'EducationMajorName', title: '学历专业', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'AcademicDegreeName', title: '学位', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'AcademicDegreeMajorName', title: '学位专业', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'MandarinProficiencyName', title: '普通话水平', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'ForeignLanguageName', title: '外语语种', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'IsDriverLicense', title: '有无驾照', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'DriverLicenseTypeName', title: '准驾车型', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'IsMilitaryService', title: '是否兵役', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'InterestsName', title: '兴趣特长', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'ArchivesType', title: '建档类型', width: 100, align: 'center', sortable: false, hidden: true },
            {
                field: 'WorkDate', title: '参加工作时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'WorkYear', title: '工龄', width: 100, align: 'center', sortable: false, hidden: true },
            {
                field: 'Remark', title: '备注', width: 200, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    if (value.length > 20) {
                        value = value.substring(0, 20) + "...";
                    }
                    row.Remark = $.intervalAddChar(row.Remark, 50, "<br/>");
                    return '<a href="javascript:void(0)" title="' + row.Remark + '" class="easyui-tooltip">' + value + '</a>';
                }
            },
            { field: 'ArchivesDepartmentName', title: '建档机构', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'ArchivesPerson', title: '建档人', width: 100, align: 'center', sortable: false, hidden: true },
            {
                field: 'ArchivesDate', title: '建档时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'NativePlaceProvince', title: '籍贯', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    value = row.NativePlaceProvince + "-" + row.NativePlaceCity;
                    if (!!row.NativePlaceDistrict) { value += "-" + row.NativePlaceDistrict; }
                    return
                }
            },
            { field: 'AccountNatureName', title: '户口性质', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'AccountAddress', title: '户口地址', width: 200, align: 'center', sortable: false, hidden: true },
            { field: 'ResidentialAddress', title: '现居住地址', width: 200, align: 'center', sortable: false, hidden: true },
            { field: 'Phone', title: '联系电话', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'Email', title: '联系邮箱', width: 130, align: 'center', sortable: false, hidden: true },
            { field: 'EmergencyPerson', title: '紧急联系人', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'EmergencyPersonRelationName', title: '与本人关系', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'EmergencyPersonPhone', title: '紧急联系人电话', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'JobNo', title: '员工工号', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'SystemAccount', title: '系统账号', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'BankTypeName', title: '银行行别', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'BankAccountNo', title: '银行账号', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'Height', title: '身高', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'Weight', title: '体重', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'LeftVision', title: '左眼视力', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'RightVision', title: '右眼视力', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'BloodType', title: '血型', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'IsCheckupReport', title: '有无体检报告', width: 100, align: 'center', sortable: false, hidden: true },
            {
                field: 'MedicalHistory', title: '既往病史', width: 200, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    if (value.length > 20) {
                        value = value.substring(0, 20) + "...";
                    }
                    row.MedicalHistory = $.intervalAddChar(row.MedicalHistory, 50, "<br/>");
                    return '<a href="javascript:void(0)" title="' + row.MedicalHistory + '" class="easyui-tooltip">' + value + '</a>';
                }
            },
            {
                field: 'FamilyMedicalHistory', title: '家族病史', width: 200, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    if (value.length > 20) {
                        value = value.substring(0, 20) + "...";
                    }
                    row.FamilyMedicalHistory = $.intervalAddChar(row.FamilyMedicalHistory, 50, "<br/>");
                    return '<a href="javascript:void(0)" title="' + row.FamilyMedicalHistory + '" class="easyui-tooltip">' + value + '</a>';
                }
            },
            {
                field: 'CheckupResult', title: '体检结果', width: 200, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    if (value.length > 20) {
                        value = value.substring(0, 20) + "...";
                    }
                    row.CheckupResult = $.intervalAddChar(row.CheckupResult, 50, "<br/>");
                    return '<a href="javascript:void(0)" title="' + row.CheckupResult + '" class="easyui-tooltip">' + value + '</a>';
                }
            },
            { field: 'EmployeeTypeName', title: '员工类别', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'EmploymentSourceName', title: '用工来源', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'IsOccupiedOrNot', title: '是否占编', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'IsPayOrNot', title: '是否发薪', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'RecruitmentType', title: '招聘类型', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'RecruitmentChannelsName', title: '招聘渠道', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'ProposedDepartmentName', title: '拟定部门', width: 150, align: 'center', sortable: false, hidden: true },
            { field: 'ProposedRoleName', title: '拟定岗位', width: 150, align: 'center', sortable: false, hidden: true },
            {
                field: 'EmploymentTime', title: '录用时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'ExpectedEntryTime', title: '预计入职时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'EntryDate', title: '入职时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'EstimateFormalDate', title: '预计转正时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'FormalTrialMonth', title: '试用期(月)', width: 100, align: 'center', sortable: false, hidden: true },
            {
                field: 'FormalDate', title: '转正时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'IsProbationPeriod', title: '是否见习', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'IsExpatriate', title: '是否外派', width: 100, align: 'center', sortable: false, hidden: true },
            {
                field: 'ExpatriateDate', title: '外派时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'CompanyAgeYear', title: '司龄(年)', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'CompanyAgeMonth', title: '司龄(月)', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'CompanyAgeDay', title: '司龄(天)', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'ContractSignUnitName', title: '合同签约单位', width: 200, align: 'center', sortable: false, hidden: true },
            {
                field: 'ContractSignUnitChangeDate', title: '合同签约单位<br/>变更时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'ContractExpireDate', title: '合同到期时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'ToCompanyMainBodyName', title: '所属公司主体', width: 200, align: 'center', sortable: false, hidden: true },
            {
                field: 'ToCompanyMainBodyChangeDate', title: '公司主体<br/>变更时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'ToCostDepName', title: '所属成本机构', width: 200, align: 'center', sortable: false, hidden: true },
            {
                field: 'ToCostDepChangeDate', title: '成本机构<br/>变更时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'ToHumanAffairsChangeDate', title: '人事机构/岗位<br/>变更时间', width: 120, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'PartTimerHumanAffairsDepName', title: '兼职人事机构/岗位', width: 200, align: 'center', sortable: false, hidden: true },
            {
                field: 'PartTimerHumanAffairsChangeDate', title: '兼职人事机构/岗位<br/>变更时间', width: 120, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'EstimateQuitJobDate', title: '预计离职时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'IsAgreeQuitJob', title: '是否同意离职', width: 100, align: 'center', sortable: false, hidden: true },
            {
                field: 'QuitJobDate', title: '离职时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'OverWorkAttendanceDate', title: '考勤截止时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'SalaryCutOffDate', title: '工资截止时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'IsBlackList', title: '是否加入黑名单', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'PersonnelStatus', title: '员工状态', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'RankPayScaleName', title: '所属职级薪级', width: 100, align: 'center', sortable: false, hidden: true },
            {
                field: 'RankPayScaleChangeDate', title: '职级薪级<br/>变更时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'IsBuySocialInsurance', title: '是否购买社保', width: 100, align: 'center', sortable: false, hidden: true },
            {
                field: 'SocialInsuranceStartDate', title: '社保开始时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'SocialInsuranceTypeName', title: '社保购买类型', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'SocialInsuranceAddress', title: '社保购买地', width: 200, align: 'center', sortable: false, hidden: true },
            { field: 'SocialInsuranceUnitName', title: '社保购买单位', width: 200, align: 'center', sortable: false, hidden: true },
            {
                field: 'SocialInsuranceUnitChangeDate', title: '社保购买单位<br/>变更时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'SocialInsuranceUnitAccountNo', title: '单位社保账号', width: 150, align: 'center', sortable: false, hidden: true },
            { field: 'SocialInsuranceIndividualAccountNo', title: '个人社保账号', width: 150, align: 'center', sortable: false, hidden: true },
            { field: 'EndowmentiIsurance', title: '养老保险<br/>计费工资', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'MedicalInsurance', title: '医疗保险<br/>计费工资', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'MajorDiseasesSalary', title: '重大疾病医疗<br/>补助计费工资', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'MajorDiseasesUnit', title: '重大疾病医疗补助<br/>公司缴纳金额', width: 120, align: 'center', sortable: false, hidden: true },
            { field: 'MaternityInsurance', title: '生育保险<br/>计费工资', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'MaternityInsuranceUnit', title: '生育保险公司<br/>缴纳金额', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'EmploymentInjuryInsurance', title: '工伤保险<br/>计费工资', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'EmploymentInjuryInsuranceUnit', title: '工伤保险公司<br/>缴纳金额', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'UnemploymentInsurance', title: '失业保险<br/>计费工资', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'IsBuyPublicAccumulationFunds', title: '是否购买公积金', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'PublicAccumulationFundsTypeName', title: '公积金购买类型', width: 150, align: 'center', sortable: false, hidden: true },
            {
                field: 'PublicAccumulationFundsStartDate', title: '公积金开始时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'PublicAccumulationFundsAddress', title: '公积金购买地', width: 200, align: 'center', sortable: false, hidden: true },
            { field: 'PublicAccumulationFundsUnitName', title: '公积金购买单位', width: 200, align: 'center', sortable: false, hidden: true },
            {
                field: 'PublicAccumulationFundsUnitChangeDate', title: '公积金购买单位<br/>变更时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'PublicAccumulationFundsUnitAccountNo', title: '单位公积金社保账号', width: 150, align: 'center', sortable: false, hidden: true },
            { field: 'PublicAccumulationFundsIndividualAccountNo', title: '个人公积金账号', width: 150, align: 'center', sortable: false, hidden: true },
            { field: 'PublicAccumulationFundsSalary', title: '公积金计费工资', width: 100, align: 'center', sortable: false, hidden: true },
            { field: 'IsTradeUnion', title: '是否参加工会', width: 100, align: 'center', sortable: false, hidden: true },
            {
                field: 'TradeUnionDate', title: '参加工会时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'IsLock', title: '是否锁定', width: 100, align: 'center', sortable: false, hidden: true },
            //{
            //    field: 'BeginTime', title: '开始时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
            //        return $.dateFormat(value);
            //    }
            //},
            //{
            //    field: 'EndTime', title: '结束时间', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
            //        return $.dateFormat(value);
            //    }
            //},
            {
                field: 'Opt', title: '操作', width: 100, align: 'center', sortable: false, hidden: true, formatter: function (value, row, index) {
                    value = "<a onclick=\"Detailed('" + row.ID + "')\" href=\"javascript:void(0)\">查看详情</a>";
                    return value;
                }
            },
        ]];

        var IsLoad = true;
        function InitDataGrid() {
            IsLoad = true;
            var IsMultiple = $("#IsMultiple").val() == "是" ? true : false;
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                fit: true,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "ID",
                columns: column,
                frozenColumns: [[{ field: 'Name', title: '姓名', width: 100, align: 'center', sortable: false }]],
                rownumbers: true,
                fitColumns: false,
                checkbox: true,
                singleSelect: !IsMultiple,
                checkOnSelect: true,
                selectOnCheck: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: "#toolbar",
                sortOrder: "desc",
                remoteSort: false,
                onDblClickRow: function (index, row) {
                    if ($("#IsMultiple").val() == "否") {
                        LayerDialog.ReturnIsJson = true;
                        var data = [];
                        data.push(row);
                        LayerDialog.Close(data);
                    }

                },
                onCheckAll: function (rows) {
                    if (!IsLoad) {
                        DgDelayLoad();
                    }
                }, onUncheckAll: function (rows) {
                    if (!IsLoad) {
                        $.each(rows, function (i, item) {
                            var index = $('#dgSelect').datagrid('getRowIndex', item.ID);
                            if (index > -1) {
                                $('#dgSelect').datagrid('deleteRow', index);
                            }
                        });
                    }
                },
                onBeforeSelect: function (index, row) {
                    if (!IsLoad) {
                        var data = $('#dgSelect').datagrid('getData');
                        var idList = "";
                        $.each(data.rows, function (i, item) {
                            idList += "," + item.ID;
                        });
                        if (idList.indexOf(row.ID) == -1) {
                            DgDelayLoad();
                        };
                    }
                    //DgDelayLoad();
                },
                onBeforeUnselect: function (index, row) {
                    if (!IsLoad) {
                        DelUser(row.ID);
                    }
                },
                onSelect: function (index, row) {

                },
                onBeforeLoad: function (param) {
                    param.SortField = "ToHumanAffairsUpDepID,ToHumanAffairsDepID,ToHumanAffairsRoleID";
                    param.SortOrder = 0;
                    param.IsDelete = 0;
                    param.ToHumanAffairsDepID = $("#ToHumanAffairsDepID").val();
                    param.ToHumanAffairsDepSortDepCode = $("#SortDepCode").val();
                    param.IsPowerPost = $("#IsPowerPost").val();
                    param.IsPowerLevel = $("#IsPowerLevel").val();
                    param = $.getDataGridParam("HR_Dialog", "GetListArchives", param);
                    param.Name = $("#UserName").textbox('getValue');
                },
                onLoadSuccess: function (data) {
                    IsLoad = true;
                    $('#dg').datagrid('clearSelections');
                    $('#dg').datagrid('clearChecked');
                    var dataDgSelect = $('#dgSelect').datagrid('getData');
                    if (dataDgSelect.rows.length > 0) {
                        $.each(dataDgSelect.rows, function (i, item) {
                            $('#dg').datagrid('selectRecord', item.ID);
                        });
                    }
                    $(".easyui-tooltip").tooltip({});
                    IsLoad = false;
                },
                onLoadError: function (data) {

                }
            });
            //$('#dg').datagrid('clearSelections');
            //$('#dg').datagrid('clearChecked');
        }
        function DgDataClear() {
            $('#dgSelect').datagrid('loadData', { total: 0, rows: [] });
            $('#dgSelect').datagrid('clearSelections');
            $('#dgSelect').datagrid('clearChecked');
            InitDataGrid();
        }
        var IntervalIDDgSelect = null;
        //点击树延时执行
        function DgDelayLoad() {
            $('#btn_Save').linkbutton('disable').linkbutton({ "text": "正在处理数据..." });
            if (!!IntervalIDDgSelect) {
                clearInterval(IntervalIDDgSelect);
            }
            IntervalIDDgSelect = setInterval(function () {
                $("#btn_Save").linkbutton("enable").linkbutton({ "text": "确认选择" });;
                AddUser();
                clearInterval(IntervalIDDgSelect);
            }, 1000);
        }
        function AddUser() {
            var rows = $('#dg').datagrid('getChecked');
            if (rows.length == 0) {
                $.messager.alert("温馨提示", '请选择员工!');
                return;
            }
            var data = $('#dgSelect').datagrid('getData');
            var idList = "";
            $.each(data.rows, function (i, item) {
                idList += "," + item.ID;
            });
            $.each(rows, function (i, item) {
                if (idList.indexOf(item.ID) == -1) {
                    data.rows.push(item);
                };
            });
            $('#dgSelect').datagrid("loadData", { "total": data.length, "rows": data.rows });
            //$('#dgSelect').datagrid('reload');
            //$('#dg').datagrid('clearSelections');
            //$('#dg').datagrid('clearChecked');
            $.messager.show({
                title: '温馨提示',
                msg: '已选择的数据<br/>添加到已勾选员工列表成功!',
                width: 200,
                height: 90,
                timeout: 2000,
                showType: 'slide'
            });
        }

        function AddAllUser() {
            var nodes = $('#tree').tree('getChecked');
            if (nodes.length > 0) {
                var val = "";
                $.each(nodes, function (i, item) {
                    //if ($(this).tree('isLeaf', item.target)) {
                    val += "," + item.id;
                    //}
                });
                val = val.substr(1);
                var param = {};
                param.ToHumanAffairsDepID = val;
                param.IsDelete = 0;
                param.IsPowerPost = $("#IsPowerPost").val();
                param.IsPowerLevel = $("#IsPowerLevel").val();
                $.dataPostJson('HR_Dialog', 'GetListDataTableArchives', param, true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.length > 0) {
                            var dgData = $('#dgSelect').datagrid('getData');
                            var idList = "";
                            $.each(dgData.rows, function (i, item) {
                                idList += "," + item.ID;
                            })
                            $.each(data, function (i, item) {
                                if (idList.indexOf(item.ID) == -1) {
                                    dgData.rows.push(item);
                                };
                            })
                            $('#dgSelect').datagrid("loadData", { "total": dgData.length, "rows": dgData.rows });
                            //$('#dg').datagrid('clearSelections');
                            //$('#dg').datagrid('clearChecked');
                            //$('#dg').datagrid('reload');
                            $.messager.show({
                                title: '温馨提示',
                                msg: '勾选的部门下的所有员工<br/>添加到勾选员工列表成功!',
                                width: 170,
                                height: 90,
                                timeout: 2000,
                                showType: 'slide'
                            });
                            $(".easyui-tooltip").tooltip('hide');
                            InitDataGrid();
                        }
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
            } else {
                $.messager.alert("温馨提示", '请勾选部门!');
                return;
            }

        }
        function DelUser(ID) {
            var index = $('#dgSelect').datagrid('getRowIndex', ID);
            if (index > -1) {
                $('#dgSelect').datagrid('deleteRow', index);
                index = $('#dg').datagrid('getRowIndex', ID);
                if (index > -1) {
                    $('#dg').datagrid('unselectRow', index);

                }
            }
        }
        var columnSelect = [[
            //{ field: 'ck', checkbox: true },
            { field: 'ToHumanAffairsDepID', hidden: true, },
            { field: 'Name', title: '姓名', width: 100, align: 'center', sortable: false},
            { field: 'ToHumanAffairsUpDepName', title: '所属人事机构', width: 200, align: 'center', sortable: false},
            { field: 'ToHumanAffairsDepName', title: '所属人事部门', width: 200, align: 'center', sortable: false},
            { field: 'ToHumanAffairsRoleName', title: '所属人事岗位', width: 100, align: 'center', sortable: false},
            {
                field: 'Operate', title: '操作', width: 100, align: 'center', sortable: false,  formatter: function (value, row, index) {
                    value = "<a onclick=\"DelUser('" + row.ID + "')\" href=\"javascript:void(0)\">删除</a>";
                    return value;
                }
            }
        ]];

        function InitDataGridSelect() {
            $("#dgSelect").datagrid({
                //url: '/HM/M_Main/HC/DataPost.aspx',
                //method: "post",
                fit: true,
                nowrap: false,
                //pageSize: top.ListPageSize,
                //pageList: top.ListPageList,
                idField: "ID",
                columns: columnSelect,
                rownumbers: true,
                fitColumns: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: true,
                border: false,
                //pagination: true,
                width: "100%",
                sortName: 'ToHumanAffairsUpDepName,ToHumanAffairsDepName,ToHumanAffairsRoleName',
                sortOrder: 'asc',
                remoteSort: false,
                onDblClickRow: function (index, row) {
                    //LayerDialog.ReturnIsJson = true;
                    //LayerDialog.Close(row);
                },
                onSelect: function (index, row) {

                },
                onBeforeLoad: function (param) {
                    //param.SortField = "CommID";
                    //param.SortOrder = 0;
                    //param.IsDelete = 0;
                    //param.OrganCode = $("#OrganCode").val();
                    //param.CommName = $("#CommName").textbox('getValue');
                    //param = $.getDataGridParam("SysDialog", "GetListCommunity", param);
                },
                onLoadSuccess: function (data) {


                },
                onLoadError: function (data) {

                }
            });
        }
        function Save() {
            var data = $('#dgSelect').datagrid('getData');
            if (data.rows.length > 0) {
                LayerDialog.ReturnIsJson = true;
                LayerDialog.Close(data.rows);
            } else {
                $.messager.alert("温馨提示", '请选择需要的员工数据!');
            }
        }


    </script>
</body>
</html>
