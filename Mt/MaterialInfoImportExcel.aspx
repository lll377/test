<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialInfoImportExcel.aspx.cs" Inherits="M_Main.Mt.MaterialInfoImportExcel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>物资批量导入</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
     <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script> 
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmForm" runat="server">

          <%--小数位数--%>
    <input type="hidden" id="DecimalNum" name="DecimalNum" runat="server" value="4" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <input type="hidden" id="FilePath" name="FilePath" />
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="hidden" id="DepCode" name="DepCode" />
        <input type="hidden" id="TableName" name="TableName" value="Sheet1$" />
        <input type="file" id="UpFile" name="UpFile" style="left: -9999px; position: absolute;" />
        <input type="hidden" id="PeriodId" name="PeriodId" value="" runat="server" />

        <script language="javascript" type="text/javascript">
            //计算小数位数
            var decimalPos = Number($("#DecimalNum").val());
            function SelDepartment() {
                HDialog.Open('370', '390', "../dialog/DepartmentDlg_hr.aspx?Ram=" + Math.random(), '选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split("\t");
                        $("#DepCode").val(varObjects[0]);
                        $("#DepName").val(varObjects[1]);
                    }
                });
            }

            
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();
            var column = [[
                    { field: '物资类别', title: '物资类别', width: 100, align: 'center', sortable: true },
                    { field: '物资编号', title: '物资编号', width: 100, align: 'center', sortable: true },
                    { field: '物资名称', title: '物资名称', width: 100, align: 'center', sortable: true },
                    { field: '物资简拼', title: '物资简拼', width: 100, align: 'center', sortable: true },
                    { field: '物资单位', title: '物资单位', width: 100, align: 'center', sortable: true },
                    { field: '物资品牌', title: '物资品牌', width: 100, align: 'center', sortable: true },
                    { field: '规格型号', title: '规格型号', width: 100, align: 'center', sortable: true },
                    { field: '物资产地', title: '物资产地', width: 100, align: 'center', sortable: true }
            ]];

            var toolbar = [
            {
                text: '上传模板',
                iconCls: 'icon-cloud-upload',
                handler: function () {
                    $("#UpFile").click();
                }
            }, '-',
            {
                text: '确定导入',
                iconCls: 'icon-save',
                handler: function () {
                    StartImport();
                }
            }
            ];


            function StartImport() {
                var ob = $("#TableContainer").datagrid('getData');
                console.log(ob);
                $.tool.DataPost('MaterialInfoHandle', 'MaterialImport', $('#frmForm').serialize(),
                        function Init() {
                        },
                    function callback(_Data)
                    {
                            if (_Data == "true") {
                                HDialog.Info("导入成功");
                                HDialog.Close();
                            }
                            else {
                                HDialog.Info("导入失败");
                                //$.messager.alert('错误', _Data, 'error');
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
            }

            function LoadList() {
                $.tool.DataPost('MaterialSupplierInfo', 'BindImportSalaryTemplate', $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            //if (_Data != null && _Data != '') {
                            //    var data = eval("(" + _Data + ")")
                            //    if (data.rows.length > 0) { 
                            //        for (var attr in data.rows[0]) {  
                            //            if (attr != '物资名称'&& attr != '含税价' && attr != '税率' && attr != '不含税价' && attr != '物资编号') {
                            //                var json = '{\'field\':\'' + attr + '\',\'title\':\'' + attr + '\',\'width\': \'180\', \'align\': \'left\', \'sortable\': \'true\'}';
                            //                column[0].push(eval("(" + json + ")"));
                            //            } 
                            //        }
                            //    }
                            //}
                            $("#TableContainer").datagrid({
                                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=MaterialSupplierInfo&Command=BindImportSalaryTemplate&' + $('#frmForm').serialize(),
                                method: "get",
                                title: '物资导入列表',
                                loadMsg: '数据加载中,请稍候...',
                                nowrap: false,
                                pageSize: 20,
                                pageList: [20, 50, 100],
                                columns: column,
                                fitColumns: false,
                                singleSelect: true,
                                pagination: true,
                                width: "100%",
                                toolbar: toolbar,
                                sortOrder: "asc"
                            });

                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });

            }
            LoadList();

            function UpLoadFile() {
                var fd = new FormData();
                fd.append("UpFile", $("#UpFile").get(0).files[0]);
                fd.append("IsCompleteAddr", "true");
                $.tool.pageLoadInfo("正在上传模板文件");
                $.ajax({
                    url: "../AjaxUpload.aspx",
                    type: "POST",
                    processData: false,
                    contentType: false,
                    data: fd,
                    success: function (addr) {
                        if (addr != "") {
                            $("#FilePath").val(addr);
                            //绑定上传的列表
                            LoadList();
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.messager.alert('提示', "上传模板失败", "error");
                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.tool.pageUnLoading();
                    }
                });

                var jqObj = $("#UpFile");
                jqObj.val("");
                var domObj = jqObj[0];
                domObj.outerHTML = domObj.outerHTML;
                var newJqObj = jqObj.clone();
                jqObj.before(newJqObj);
                jqObj.remove();
                $("#UpFile").unbind().change(function (e) {
                    UpLoadFile();
                });
            }
            $("#UpFile").change(function (e) {
                UpLoadFile();
            });
            $(function ()
            {
                LoadList();
            })
        </script>
    </form>
</body>
</html>


