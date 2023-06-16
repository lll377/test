<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rsdaht.aspx.cs" Inherits="M_Main.PersonnelManage.rsdaht" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server" clientidmode="Static">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/editcss.css" type="text/css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmForm" runat="server" clientidmode="Static">
        <input id="HomePageWhere" value="Other" type="hidden" runat="server" />
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1024px; height: 180px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">姓名
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="Name" name="Name" />
                    </td>
                    <td class="TdTitle">人事所属机构
                    </td>
                    <td class="TdContent">
                        <input id="PDepName" name="PDepName" class="easyui-searchbox" searcher="SelDepartment"
                            style="width: 138px" />
                    </td>
                    <td class="TdTitle">合同类型
                    </td>
                    <td class="TdContent">
                        <select id="TypeName" name="TypeName" class="easyui-combobox" data-options=" multiple: true "
                            style="width: 138px">
                            <option value=""></option>
                            <option value="员工劳动合同">员工劳动合同</option>
                            <option value="员工其它合同">员工其它合同</option>
                        </select>
                    </td>
                    <td class="TdTitle">合同期限
                    </td>
                    <td class="TdContent">
                        <select id="Years" name="Years" class="easyui-combobox" data-options=" multiple: true "
                            style="width: 138px">
                            <option value=""></option>
                            <option value="1">1年</option>
                            <option value="2">2年</option>
                            <option value="3">3年</option>
                            <option value="4">4年</option>
                            <option value="5">5年</option>
                            <option value="6">6年</option>
                            <option value="7">7年</option>
                            <option value="8">8年</option>
                            <option value="9">9年</option>
                            <option value="99">长期</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">开始时间
                    </td>
                    <td class="TdContent">
                        <input id="StartDateStart" name="StartDateStart" type="text" class="easyui-datebox" />
                    </td>
                    <td class="TdTitle">至
                    </td>
                    <td class="TdContent">
                        <input id="StartDateEnd" name="StartDateEnd" type="text" class="easyui-datebox" />
                    </td>
                    <td class="TdTitle">结束时间
                    </td>
                    <td class="TdContent">
                        <input id="EndDateStart" name="EndDateStart" type="text" class="easyui-datebox" />
                    </td>
                    <td class="TdTitle">至
                    </td>
                    <td class="TdContent">
                        <input id="EndDateEnd" name="EndDateEnd" type="text" class="easyui-datebox" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">合同说明
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="Memo" name="Memo" />
                    </td>
                    <td class="TdTitle">合同状态
                    </td>
                    <td class="TdContent">
                        <select id="StateName" name="StateName" class="easyui-combobox" data-options=" multiple: true "
                            style="width: 138px">
                            <option value="有效">有效</option>
                            <option value="无效">无效</option>
                        </select>
                    </td>
                    <td class="TdTitle">预警天数
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="Num" name="Num" value="30" runat="server" />
                    </td>
                    <td class="TdTitle">人员状态
                    </td>
                    <td class="TdContent">
                        <select id="PPersonState" name="PPersonState" class="easyui-combobox" data-options=" multiple: true "
                            style="width: 138px">
                            <option value=""></option>
                            <option value="已建档">已建档</option>
                            <option value="已入职未转正">已入职未转正</option>
                            <option value="已转正未离职">已转正未离职</option>
                            <option value="已离职">已离职</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="loadlist" onclick="LoadYdList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="hidden" id="DepCode" name="DepCode" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function SelDepartment() {
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
                        $("#PDepName").searchbox("setValue", depName);
                        document.all.PDepName.value = depName;
                        $("#DepCode").val(depCode);
                    }
                });
            }


            function GetParam() {

                var str = '';
                str += '&Name=' + $('#Name').val().trim();
                str += '&PDepName=' + $('#PDepName').val().trim();
                str += '&PPersonState=' + $('#PPersonState').val().trim();

                var strTypeName = $("input:hidden[name='TypeName']");
                var TypeName = '';
                $.each(strTypeName, function (index, item) {
                    TypeName += ',' + item.value;
                });
                if (TypeName.length > 0);
                {
                    str += '&TypeName=' + TypeName.substr(1, TypeName.length - 1)
                }

                var strYears = $("input:hidden[name='Years']");
                var Years = '';
                $.each(strYears, function (index, item) {
                    Years += ',' + item.value;
                });
                if (Years.length > 0);
                {
                    str += '&Years=' + Years.substr(1, Years.length - 1)
                }

                var strStateName = $("input:hidden[name='StateName']");
                var StateName = '';
                $.each(strStateName, function (index, item) {
                    StateName += ',' + item.value;
                });
                if (StateName.length > 0);
                {
                    str += '&StateName=' + StateName.substr(1, StateName.length - 1)
                }

                str += '&Memo=' + $('#Memo').val().trim();
                str += '&Num=' + $('#Num').val().trim();
                str += '&DepCode=' + $("#DepCode").val();
                if ($("input:hidden[name='StartDateStart']").val() != undefined)
                    str += '&StartDateStart=' + $("input:hidden[name='StartDateStart']").val();
                else
                    str += '&StartDateStart=';

                if ($("input:hidden[name='StartDateEnd']").val() != undefined)
                    str += '&StartDateEnd=' + $("input:hidden[name='StartDateEnd']").val();
                else
                    str += '&StartDateEnd=';

                if ($("input:hidden[name='EndDateStart']").val() != undefined)
                    str += '&EndDateStart=' + $("input:hidden[name='EndDateStart']").val();
                else
                    str += '&EndDateStart=';

                if ($("input:hidden[name='EndDateEnd']").val() != undefined)
                    str += '&EndDateEnd=' + $("input:hidden[name='EndDateEnd']").val();
                else
                    str += '&EndDateEnd=';

                //var TypeNameArr = $("input:hidden[name='BussTypeNameType']");
                //var TypeName = '';
                //$.each(TypeNameArr, function (index, item) {
                //    TypeName += ',' + item.value;
                //});
                //if (TypeName.length > 0);
                //{
                //    str += '&TypeName=' + TypeName.substr(1, TypeName.length - 1)
                //}
                $('#Name').val("")
                $('#Memo').val("");
                //alert(str);
                return encodeURI(str);

            }
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h - 3 + "px");
            }
            InitTableHeight();
            var frozenColumns = [[
                {
                    field: 'Name', title: '姓名', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue;\" href=\"rsda_xx.aspx?OpType=edit&Id=" + row.Pid + "\">" + row.Name + "</a>";
                        return str;
                    }
                }
            ]]
            var YdToolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        //window.open("rshtoutput.aspx?" + $("#frmForm").serialize());
                        window.open("rshtoutput.aspx?random=" + Math.random() + GetParam());
                    }
                }
            ];
            //列表
            var YdColumn = [[
                 { field: 'Id', title: 'Id', width: 50, align: 'left', sortable: true, hidden: true },
                    { field: 'Sex', title: '性别', width: 50, align: 'left', sortable: true },
                    { field: 'Age', title: '年龄', width: 50, align: 'left', sortable: true },
                    //{
                    //    field: 'PrentDepName', title: '人事所属机构', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                    //        var str = row.PrentDepName + "-" + row.PDepName;
                    //        return str;
                    //    }
                    //},
                    { field: 'parantDepName', title: '人事所属机构', width: 150, align: 'left', sortable: true },
                    { field: 'PDepName', title: '部门', width: 120, align: 'left', sortable: true },
                    { field: 'PRoleName', title: '岗位', width: 100, align: 'left', sortable: true },
                     {
                         field: 'TypeName', title: '合同类别', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                             var str = "";
                             if (row.CheckId != "")
                                 str = "<a style=\"color:blue;\" target='_blank' href=\"../OAWorkFlow/OAWorkDetail.aspx?Id=" + row.CheckId + "\">" + row.TypeName + "</a>";
                             else
                                 str = row.TypeName;
                             return str;
                         }
                     },

                {
                    field: 'Name1', title: '合同说明', width: 260, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str3 = row.TypeName + "-" + row.FlowSortName + "-" + row.Name;
                        return str3;
                    }
                },
                { field: 'Years', title: '合同期限', width: 100, align: 'left', sortable: true },
                {
                    field: 'StartDate', title: '开始时间', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        return formatDate(value, "yyyy-MM-dd");
                    }
                },
                {
                    field: 'EndDate', title: '结束时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        return formatDate(value, "yyyy-MM-dd");
                    }
                },
                {
                    field: 'EndDate1', title: '合同状态', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var enddate = new Date(row.EndDate);
                        var now = new Date();
                        var str = "有效";
                        if (now > enddate || row.PPersonState == "已离职")
                            str = "无效";
                        return str;
                    }
                },
                {
                    field: 'RegDate', title: '发起时间', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        return formatDate(value, "yyyy-MM-dd");
                    }
                },
                { field: 'CheckState', title: '审核状态', width: 80, align: 'left', sortable: true },
                {
                    field: 'IsRemind', title: '是否提示', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var enddate1 = new Date(row.EndDate.ToCustomizeDate());
                        var now1 = new Date();
                        if (now1 > enddate1) {
                            return "";
                        } else if (row.IsRemind == 1) {
                            return "";
                        }
                        else {
                            var str = '<a style="color:blue;" href="#" onclick="IsRemindClick(' + "'" + row.Id + "'" + ');">不再提示</a>';
                            return str;
                        }
                    }
                }
            ]];

            function IsRemindClick(Id) {
                $.tool.DataGet('CSPerson', 'GetContractUpdateIsRemind', 'Id=' + Id,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            LoadYdList();
                            //document.getElementById("loadlist").click();
                        } else {
                            $.messager.alert("错误", "无此权限", "error");
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function getNewDay(dateTemp, days) {
                var dateTemp = dateTemp.split("-");
                var nDate = new Date(dateTemp[0] + '-' + dateTemp[1] + '-' + dateTemp[2]); //转换为MM-DD-YYYY格式   

                var millSeconds = Math.abs(nDate) + (days * 24 * 60 * 60 * 1000);
                var rDate = new Date(millSeconds);
                var year = rDate.getFullYear();
                var month = rDate.getMonth() + 1;
                if (month < 10) month = "0" + month;
                var date = rDate.getDate();
                if (date < 10) date = "0" + date;
                return (year + "-" + month + "-" + date);
            }


            //加载数据
            function LoadYdList() {
                //GetPersonContract= CSPerson_基础配置.cs 的 GetContractList 
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSPerson&Command=GetPersonContract&' + $("#frmForm").serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: 20,
                    pageList: [20, 50, 100],
                    columns: YdColumn,
                    fitColumns: false,
                    frozenColumns: frozenColumns,
                    title: "合同查询(即将到期的合同显示为红色)",
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: YdToolbar,
                    sortOrder: "asc",
                    rowStyler: function (index, row) {
                        var date = new Date(row.EndDate);
                        var now = new Date();
                        var num = $("#Num").val();
                        var month = now.getMonth() + 1;
                        if (month < 10) month = "0" + month;
                        var strdate = now.getFullYear() + '-' + month + "-" + now.getDate();

                        var d1 = getNewDay(strdate, num);

                        var now1 = new Date(d1);
                        if (date < now1) {
                            if (now > date) {
                                return '';
                            }
                            return 'background-color:#FFB43F;';
                        }
                    }
                });
                $("#PersonState").val("");
                $('#SearchDlg').dialog('close');
            }



            LoadYdList();

            function DelYdRecord(Id) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('BussFlowControl', 'Del', 'ClassName=PmChange&Id=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {

                                if (_Data == "true") {
                                    LoadYdList();
                                }
                                else {
                                    $.messager.alert('错误', '无此权限', 'error');
                                }

                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }


        </script>
    </form>
</body>
</html>
