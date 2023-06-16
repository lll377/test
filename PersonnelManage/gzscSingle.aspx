﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gzscSingle.aspx.cs" Inherits="M_Main.PersonnelManage.gzscSingle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>工资单个生成</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/JSClient.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/Authority.js" type="text/javascript"></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="../Jscript-Ui/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="../Jscript-Ui/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css" />
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="../Jscript-Ui/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
</head>
<body style="padding-left: 2px; padding-right: 2px; margin: 0px; overflow: hidden;">
    <form id="FrmForm" runat="server">
        <div style="height: 2px;"></div>
        <ul class="nav nav-tabs">
            <li role="presentation" class="active"><a href="gzsc.aspx">批量生成</a></li>
            <li role="presentation" class="active"><a href="#" style="background-color: #64ABC9;">单个生成</a></li>
        </ul>
        <br />
        <div class="panel panel-primary" style="width: 60%; margin: 0px auto; text-align: center; height: 320px;">
            <div class="panel-heading">生成查询</div>
            <div class="panel-body" style="text-align: left;">
                <div class="input-group" style="margin-bottom: 10px;">
                    <span class="input-group-addon" id="Span1">机构部门</span>
                    <input type="text" class="form-control" placeholder="请选择需要生成工资的机构" aria-describedby="basic-addon2" onclick="SelDepartment();" id="DepName" />
                    <input type="hidden" id="DepCode" name="DepCode" />
                </div>

                <div class="input-group" style="margin-bottom: 10px;">
                    <span class="input-group-addon" id="Span2">人员</span>
                    <input type="text" class="form-control" placeholder="请选择需要生成工资人员" aria-describedby="basic-addon2" onclick="SelPerson();" id="Name" />
                    <input type="hidden" id="PersonId" name="PersonId" />
                </div>
                <div class="input-group" style="margin-bottom: 10px;">
                    <span class="input-group-addon" id="Span3">账套</span>
                    <input type="text" class="form-control" placeholder="请选择需要生成的工资账套" aria-describedby="basic-addon2" onclick="PmGzztsz();" id="SalaryTemplateName" />
                    <input type="hidden" id="SalaryTemplateId" name="SalaryTemplateId" />
                </div>
                <div class="dropdown" style="margin-bottom: 10px;">

                    <button class="btn btn-default dropdown-toggle" type="button" id="Button1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        生成年份：
                        <span class="caret"></span>&nbsp;&nbsp;<span id="Year"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="margin: 0px auto; text-align: center;" id="DropYear">
                        <li style="cursor: pointer"><a href="#">2015</a></li>
                        <li style="cursor: pointer"><a href="#">2016</a></li>
                        <li style="cursor: pointer"><a href="#">2017</a></li>
                        <li style="cursor: pointer"><a href="#">2018</a></li>
                        <li style="cursor: pointer"><a href="#">2019</a></li>
                        <li style="cursor: pointer"><a href="#">2020</a></li>
                    </ul>
                </div>

                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        生成月份：
                        <span class="caret"></span>&nbsp;&nbsp;<span id="Month"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="margin: 0px auto; height: 160px; overflow: auto; text-align: center;" id="DropMonth">
                        <li style="cursor: pointer"><a href="#">01</a></li>
                        <li style="cursor: pointer"><a href="#">02</a></li>
                        <li style="cursor: pointer"><a href="#">03</a></li>
                        <li style="cursor: pointer"><a href="#">04</a></li>
                        <li style="cursor: pointer"><a href="#">05</a></li>
                        <li style="cursor: pointer"><a href="#">06</a></li>
                        <li style="cursor: pointer"><a href="#">07</a></li>
                        <li style="cursor: pointer"><a href="#">08</a></li>
                        <li style="cursor: pointer"><a href="#">09</a></li>
                        <li style="cursor: pointer"><a href="#">10</a></li>
                        <li style="cursor: pointer"><a href="#">11</a></li>
                        <li style="cursor: pointer"><a href="#">12</a></li>
                    </ul>
                </div>
                <hr />
                <div style="width: 100%; margin: 0px auto; text-align: center;">
                    <button type="button" class="btn btn-default btn-lg" onclick="Save();">
                        <span class="glyphicon" aria-hidden="true"></span>单个生成
                    </button>
                    <br />

                </div>
            </div>
        </div>
        <br />
        <div class="progress" style="margin-bottom: 3px;">
            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="2" style="width: 0%;" id="ProgressBar">
            </div>
        </div>
        <%--生成单个工资详细信息--%>
        <div style="width: 100%; height: 190px; margin-top: -18px;" id="TableContainer">
        </div>

        <input type="hidden" id="TxtYear" name="TxtYear" />
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="hidden" id="TxtMonth" name="TxtMonth" />
        <input type="hidden" id="UserCode" name="UserCode" runat="server" />
        <input type="hidden" id="hidYear" name="hidYear" />
        <input type="hidden" id="hidMonth" name="hidMonth" />
        <input type="hidden" id="DepCode1" name="DepCode1" />

        <script language="javascript" type="text/javascript">
            function SelDepartment() {
                HDialog.Open('370', '390', "../dialog/DepartmentDlg_hr.aspx?Ram=" + Math.random(), '选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split("\t");
                        $("#DepCode").val(varObjects[2]);
                        $("#DepName").val(varObjects[1]);
                        $("#DepCode1").val(varObjects[0]);
                        $("#PersonId").val("");
                        $("#Name").val("");
                        LoadList();
                    }
                });
            }
            function PmGzztsz() {
                HDialog.Open('370', '600', "../DialogNew/PmGzztsz.aspx?Ram=" + Math.random(), '选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split("\t");
                        $("#SalaryTemplateId").val(varObjects[0]);
                        $("#SalaryTemplateName").val(varObjects[1]);
                    }
                });
            }

            //通过机构查询机构下岗位
            function SelPerson() {
                if ($("#DepCode").val() == null || $("#DepCode").val() == "" || $("#DepCode").val() == undefined) {
                    $.messager.alert('提示', '请先选择机构信息', '');
                    return;
                }

                HDialog.Open('700', '500', "../dialog/DepPersonList.aspx?Ram=" + Math.random() + "&DepCode=" + $("#DepCode").val(), '选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(",");
                        $("#PersonId").val(varObjects[1]);
                        $("#Name").val(varObjects[0]);
                        if ($("#Name").val() != null || $("#Name").val() != "" || $("#Name").val() != undefined) {
                            if ($("#hidYear").val() != null || $("#hidYear").val() != "" || $("#hidYear").val() != undefined) {
                                if ($("#hidMonth").text() != null || $("#hidMonth").text() != "" || $("#hidMonth").text() != undefined) {
                                    InitColums();
                                }
                            }
                        }
                    }

                });

                //$.tool.dialog("../dialog/DepPersonList.aspx?Ram=" + Math.random() + "&DepCode=" + $("#DepCode").val(), '700', '500', '', function _callBack(_Data) {
                //    var varObjects = _Data.split(",");
                //    $("#PersonId").val(varObjects[1]);
                //    $("#Name").val(varObjects[0]);
                //    if ($("#Name").val() != null || $("#Name").val() != "" || $("#Name").val() != undefined) {
                //        if ($("#hidYear").val() != null || $("#hidYear").val() != "" || $("#hidYear").val() != undefined) {
                //            if ($("#hidMonth").text() != null || $("#hidMonth").text() != "" || $("#hidMonth").text() != undefined) {
                //                InitColums();
                //            }
                //        }
                //    }
                //});
            }

            //选择月份后查看前三月工资信息
            $("#DropMonth li").click(function () {
                $("#hidMonth").val($(this).text());
                if ($("#Name").val() != null || $("#Name").val() != "" || $("#Name").val() != undefined) {
                    if ($("#hidYear").val() != null || $("#hidYear").val() != "" || $("#hidYear").val() != undefined) {
                        if ($("#hidMonth").text() != null || $("#hidMonth").text() != "" || $("#hidMonth").text() != undefined) {
                            InitColums();
                        }
                    }
                }
            });

            $("#DropYear li").click(function () {
                $("#hidYear").val($(this).text());
                if ($("#Name").val() != null || $("#Name").val() != "" || $("#Name").val() != undefined) {
                    if ($("#hidYear").val() != null || $("#hidYear").val() != "" || $("#hidYear").val() != undefined) {
                        if ($("#hidMonth").text() != null || $("#hidMonth").text() != "" || $("#hidMonth").text() != undefined) {
                            InitColums();
                        }
                    }
                }
            })


            function gzscSingle() {
                window.location.href = "gzscSingle.aspx";
            }
            $("#DropYear li").click(function () {
                $("#Year").html($(this).text());
                $("#TxtYear").val($(this).text());
            });
            $("#DropMonth li").click(function () {
                $("#Month").html($(this).text());
                $("#TxtMonth").val($(this).text());
            });

            var ProgressInterval;
            function Save() {
                CheckAuthority('1010', function callback(_Data) {
                    if (_Data == "true") {
                        if ($("#DepCode").val() == "") {
                            $.alert({
                                confirmButton: "确定",
                                title: '错误',
                                content: '机构部门不能为空',
                                confirm: function () {
                                    return;
                                }
                            });
                            return false;
                        }
                        if ($("#TxtYear").val() == "") {
                            $.alert({
                                confirmButton: "确定",
                                title: '错误',
                                content: '请选择年份',
                                confirm: function () {
                                    return;
                                }
                            });
                            return false;
                        }
                        if ($("#TxtMonth").val() == "") {
                            alert("请选择月份");
                            return false;
                        }

                        var ParamesStr = "SalaryYear=" + $("#TxtYear").val() + "&SalaryMonth=" + $("#TxtMonth").val() + "&PersonId=" + $("#PersonId").val() + "&SalaryTemplateId=" + $("#SalaryTemplateId").val();
                        $.tool.DataPostInfoAsync('CSPerson', 'ValidateGZIsAudit_Single', ParamesStr,
                       function Init() {
                       },
                       function callback(_Data) {
                           if (_Data != "" && _Data == "true") {
                               SaveData();
                           } else {
                               HDialog.Info("已有正在审核或者是已审核的工资，不允许重新生成");
                           }
                       },
                       function _completeCallBack() {
                       },
                       function errorCallback() {
                       }, '正在验证中,请稍侯', false);
                    }
                    else {
                        $.messager.alert('错误', '无此权限', 'error');
                    }
                });
            }
            function SaveData() {
                $("#ProgressBar").attr("aria-valuenow", "0");
                $("#ProgressBar").html("0/0");
                $("#ProgressBar").css("width", "0%");
                var r = window.confirm("请确认是否生成工资数据,生成后会覆盖当月已生成的数据");
                if (r == true) {
                    StartBuildData();
                    //ProgressInterval = setInterval("SetProgress()", 2000);
                }
                else {
                    var x = 1;
                }
            }
            function StartBuildData() {
                $.tool.BootStrapDataGet('CSPerson', 'BuildSalaryDataSingle', $('#FrmForm').serialize(),
                    function Init() {
                        //InitColums();
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            HDialog.Info("生成成功！");
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                        clearInterval(ProgressInterval);
                        $("#ProgressBar").attr("aria-valuenow", "0");
                        $("#ProgressBar").html("0/0");
                        $("#ProgressBar").css("width", "0%");
                        alert("生成失败");
                    });
            }

            function SetProgress() {

                $.tool.BootStrapDataGet('CSPerson', 'TakeProgress', 'PersonId=' + $("#UserCode").val(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data != '[]') {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        var Progress = varObjects[0].NowCount;
                        var TotalProgress = varObjects[0].TotalCount;
                        $("#ProgressBar").attr("aria-valuemax", TotalProgress);
                        $("#ProgressBar").attr("aria-valuenow", Progress);
                        $("#ProgressBar").html(Progress + "/" + TotalProgress);
                        var Percent = Progress / TotalProgress * 100;
                        $("#ProgressBar").css("width", Percent + "%");
                        if (Progress == TotalProgress) {
                            clearInterval(ProgressInterval);
                            alert("生成完成");
                        }
                    }
                },
                function completeCallback() {
                },
                function errorCallback(XMLHttpRequest) {
                    clearInterval(ProgressInterval);
                    $("#ProgressBar").attr("aria-valuenow", "0");
                    $("#ProgressBar").html("0/0");
                    $("#ProgressBar").css("width", "0%");
                    alert("工资生成时发生了错误，错误内容为：" + XMLHttpRequest.responseText);
                });
            }

            function InitColums() {
                $.ajax({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSPerson&Command=SelectSalaryItem&page=1&rows=1000',
                    type: 'GET',
                    dataType: 'JSON',
                    cache: false,
                    success: function (_Data) {
                        for (var i = 0; i < _Data.rows.length; i++) {
                            var json = '{\'field\':\'' + _Data.rows[i].Name + '\',\'title\':\'' + _Data.rows[i].Name + '\',\'width\': \'100\', \'align\': \'left\', \'sortable\': \'true\'}';
                            column[0].push(eval("(" + json + ")"));
                        }
                        LoadList();
                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.messager.alert('错误', '数据读取错误', 'error');
                    }
                });
            }

            var frozenColumns = [[
                 {
                     field: 'Name', title: '姓名', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                         var str = "<a style=\"color:blue;\" href=\"#\" onclick=\"ShowDialog('" + row.PersonId + "')\">" + row.Name + "</a>";
                         return str;
                     }
                 },
                    { field: 'DepName', title: '机构', width: 100, align: 'left', sortable: true },
                    {
                        field: 'SalaryYear', title: '工资年', align: 'center', sortable: true, frozen: true, formatter: function (value, row, index) {
                            var str = "<span style=\"color:blue;\">" + row.SalaryYear + "</span>";
                            return str;
                        }, styler: function (value, row, index) {
                            return 'vertical-align:middle;';
                        }
                    },
                      {
                          field: 'SalaryMonth', title: '工资月', align: 'center', sortable: true, frozen: true, formatter: function (value, row, index) {
                              var str = "<span style=\"color:blue;\">" + row.SalaryMonth + "</span>";
                              return str;
                          }, styler: function (value, row, index) {
                              return 'vertical-align:middle;';
                          }
                      }
            ]]
            var column = [[

                    { field: 'IsDepartCheck', title: '是否审核', width: 100, align: 'left', sortable: true },
                    { field: 'IsCheck', title: '是否终审', width: 100, align: 'left', sortable: true },
                    { field: 'IsAllowGrant', title: '是否发放', width: 100, align: 'left', sortable: true },
                     { field: 'IsCheckOut', title: '是否结账', width: 100, align: 'left', sortable: true },
                    { field: 'BuildDate', title: '生成日期', width: 100, align: 'left', sortable: true }
            ]];

            function LoadList() {

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    title: '员工工资列表',
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: 20,
                    pageList: [20, 50, 100],
                    columns: column,
                    fitColumns: false,
                    frozenColumns: frozenColumns,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CSPerson", "GetSalaryDataListSingle", "TableContainer", param);
                    }
                });
                $("#SearchDlg").dialog("close");
            }
        </script>
    </form>
</body>
</html>
