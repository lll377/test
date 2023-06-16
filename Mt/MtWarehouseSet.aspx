<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MtWarehouseSet.aspx.cs" Inherits="M_Main.Mt.MtWarehouseSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>物质仓库设置</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <%-- <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>--%>
     <link href="../css/button.css" type="text/css" rel="stylesheet" />
    	<script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
         <script  src="../jscript/jquery.tool.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
        <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
        <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
       <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

      <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
      <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        .ContainerLeft {
            height:100%;
            float: left; 
            border-right: 1px solid #cccccc;
           
            width:25%;
        }
         body { 
             margin:0px; padding:0px;
            background-color:#ffffff;
        }
        .Container {
            width:64%; float:left; height:auto;margin-top:5px;font-size:12px;font-family:微软雅黑;
            
        }
        .Container ul {
            margin:0px auto;clear:both;
        }

        .Container ul .InputTitle {
            list-style-type:none;
            float:left;
            text-align:center;
            margin-bottom:10px;
            min-height:22px;
            line-height:22px;
            width:120px;
            text-align:right;
        }
        .Container ul .Content {
            list-style-type:none;float:left;text-align:left;margin-bottom:10px;width:80%;
        }
         .Container ul .Title {
            list-style-type:none;float:left;text-align:left;margin-bottom:10px;width:100%;
        }
        .Container ul .ContentBlank {
            list-style-type:none;float:left;width:80%;text-align:left;margin-bottom:10px;
        }
        .Container ul .Submit {
            list-style-type:none;
            text-align:center;
            padding-top:4px;
            width:80%;
            height:40px;
        }
        .Container  textarea {
            width:99%;height:100px;overflow-y:scroll;
            resize:none;
            border:1px solid #cccccc;
            padding-left:2px;
            font-size:12px;

        }
        .Container .Content input {
            width:99%;
            border:1px solid #cccccc;
            height:22px;
            padding-left:2px;
        }
        .Container .Content select {
            height:22px;
        } 
        .Container ul .Submit {
            list-style-type:none;text-align:center;padding-top:4px;width:80%;
            height:40px;
            text-align:center;
        }
        ul .ContentBlank {
            list-style-type:none;float:left;width:65%;text-align:left;margin-bottom:10px;
        }
    </style>


</head>
<body>
    <form id="FrmForm" runat="server">
         <input type="hidden" id="ReturnValue" name="ReturnValue" />
                        <div class="ContainerLeft" id="divTree" >
                            <ul  id="treeDemo" class="easyui-tree">
                            </ul>
                        </div>
                   
                       <div class="Container">
                            <div style="height:5px;"></div>
                            <ul>
                             <li class="InputTitle">序号：</li>
                             <li class="Content">
                                <input id="Sort" name="Sort" class="easyui-validatebox"  onkeyup="this.value=this.value.replace(/\D/g,'')" data-options="required:true" />
                             </li>
                             <%--<li class="InputTitle">所属项目：</li>
                             <li class="Content">
                                 <input id="CommID"  name="CommID"  type="hidden" />
                                <input id="CommName" name="CommName" type="text" onclick="SelItem();"/>
                             </li>--%>
                             <li class="InputTitle">仓库名称：</li>
                             <li class="Content">
                                    <input id="Name" name="Name" class="easyui-validatebox" data-options="required:true" />
                             </li>
                             <li class="InputTitle">零星采购限额（元）：</li>
                             <li class="Content">
                                 <input type="text" class="easyui-validatebox" id="PurchaseLimit"  onkeyup="javascript:CheckInputIntFloat(this);"  name="PurchaseLimit" />
                             </li>
                            <li class="InputTitle">备注：</li>
                            <li class="Content">
                                  <textarea id="Memo" name="Memo" class="easyui-validatebox" ></textarea>
                            </li>
                            <li class="InputTitle">所属项目：</li>
                                <li class="ContentBlank"><input name="CommName" type="text" id="CommName" class="easyui-searchbox" data-options="editable:false,panelHeight: &#39;auto&#39;" style="width:30%; height:24px;" searcher="SelCommName" />
                            </li>
                            <li class="InputTitle">上级仓库：</li>
                            <li class="ContentBlank"><input name="LastSortName" type="text" id="LastSortName" class="easyui-searchbox" data-options="editable:false,panelHeight: &#39;auto&#39;" style="width:30%; height:24px;" searcher="SelLastWarehouse" />
                                &nbsp;<span style="color:#cccccc;">备注：需调整仓库所在位置填取</span>
                            </li>
                              <li class="Submit">
                                <table style="margin:auto;">
                                    <tr>
                                        <td style="height:25px;"><input type="checkbox" id="IsRoot" name="IsRoot" value="1" style="width:auto;line-height:20px;"/></td>
                                        <td style="height:25px;line-height:25px;">是否根目录</td>
                                        <td>
                                            <input type="button" butttonGroup="1" class="button" value="新增" id="BtnAdd"  onclick="AddItemView();" />
                                            <input type="button" butttonGroup="2" class="button" style="display:none;" value="确定添加" id="BtnSave"  onclick="AddItemClick();" />
                                            <input type="button" butttonGroup="2" class="button" style="display:none;"  value="返回" id="BtnCancel"  onclick="CancelClick();" />
                                     
                                        </td>
                                        <td>
                                            <input type="button" butttonGroup="3" class="button" value="修改" id="BtnUpdate"  onclick="UpdateItemClick();" />
                                        </td>
                                        <td>
                                            <input type="button" butttonGroup="3" class="button" value="删除" id="BtnDelete"  onclick="DeleteItemClick();" />
                                        </td>
                                    </tr>
                                </table>
                            </li>
                            </ul>
                       </div>
                   
        <input type="hidden" id="Id" name="Id" />
        <input type="hidden" id="LastSortCode" name="LastSortCode" /><%----定义的上级仓库------%>
        <input type="hidden" id="CommID" name="CommID" />
        <input type="hidden" id="OpType" name="OpType" />
        <input type="hidden" id="SortCode" name="SortCode" runat="server" value="" />
        <script type="text/javascript">
            function SelLastWarehouse()
            {
                HDialog.Open('500', '500', '../DialogNew/MtWarehouseDlg.aspx?LastWarehouseCode=' + $("#SortCode").val(), '选择上级部门', true, function callback(_Data) {
                    var arrRet = _Data.split(',');
                    console.log(arrRet);
                    $("#LastSortCode").val(arrRet[0]);
                    $("#LastSortName").searchbox("setValue", arrRet[1]);
                });

            }
            function SelCommName() {
                HDialog.Open('500', '500', '../DialogNew/SelComm.aspx', '选择项目', true, function callback(_Data) {
                    var ob = JSON.parse(_Data);
                    console.log(ob);
                    $("#CommID").val(ob.id);
                    $("#CommName").searchbox("setValue", ob.name);
                });

            }

            function CheckInputIntFloat(oInput)
            {
                if ('' != oInput.value.replace(/\d{1,}\.{0,1}\d{0,}/, '')) {
                    oInput.value = oInput.value.match(/\d{1,}\.{0,1}\d{0,}/) == null ? '' : oInput.value.match(/\d{1,}\.{0,1}\d{0,}/);
                }
            }
            function AddItemView()
            {
                $("input[butttonGroup='1']").css("display", "none");
                $("input[butttonGroup='2']").css("display", "");
                $("input[butttonGroup='3']").css("display", "none");
                //$("#LastSortCode").val(arrRet[0]);
                var Name = $("#Name").val();
                ClearTxt();
                $("#LastSortName").searchbox("setValue", Name);
            }

            function CancelClick() {
                $("input[butttonGroup='1']").css("display", "");
                $("input[butttonGroup='2']").css("display", "none");
                $("input[butttonGroup='3']").css("display", "");
                //加载选择的部门
                zTreeOnClick($("#SortCode").val());
            }
            function CancelClick2() {
                $("input[butttonGroup='1']").css("display", "");
                $("input[butttonGroup='2']").css("display", "none");
                $("input[butttonGroup='3']").css("display", "");
            }
            InitTableHeight();
            //项目
            //function SelItem() {
            //    HDialog.Open('370', '360', '../DialogNew/SelComm.aspx', '选择项目', true, function callback(_Data)
            //    {
            //        if (_Data != "")
            //        {//**获得返回的参数信息
            //            var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
            //            //$("#CommID").val(varObjects.attributes.OrganCode);//SelItemNew
            //            $("#CommID").val(varObjects.attributes.InPopedom);
            //            $("#CommName").val(varObjects.text);
            //        }
            //    });
            //}
            function ClearTxt()
            {
                $("#Sort").val("");
                $("#CommID").val("");
                $("#CommName").searchbox("setValue", "");
                $("#Name").val("");
                $("#PurchaseLimit").val("");
                $("#Memo").val("");
                $("#LastSortCode").val("");
                $("#LastSortName").searchbox("setValue", "");
            }
            function InitTableHeight() {
                var h = $(window).height() ;
                $("#divTree").css({ "height": (h+1) + "px" });
            }
            function zTreeOnClick(SortCode) {
                ClearTxt();
                $("#SortCode").val(SortCode);
                $("#LastSortCode").val("");
                $("#LastSortName").searchbox("setValue", "");
                $.tool.DataPostAsync('MaterialBaseHandle', 'SelMtWarehouseTree', "SortCode=" + SortCode,
                 function Init() {
                   },
                function callback(_Data) {
                    if (_Data != "") {
                    var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    if (varObjects.length > 0) {
                        console.log(varObjects);
                            $.JQForm._Data = _Data;
                            $.JQForm.FillForm();
                            $("#FrmForm").form('validate');
                            $("#CommID").val(varObjects[0].CommID);
                            $("#CommName").searchbox("setValue", varObjects[0].CommName);
                            $("#LastSortName").searchbox("setValue", varObjects[0].ShangJiName);
                            CancelClick2();
                            }
                            else {
                            // document.getElementById("ItemType").value = "";
                            }
                        }
                    },
                function completeCallback() {
                },
                function errorCallback() {
                },
                    false
                );
            }

            function InitTree() {
                $.tool.DataGet('MaterialBaseHandle', 'GetMtWarehouseTree', "",
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
            InitTree();
            function GetTree(obj) {
                $('#treeDemo').html("");
                $('#treeDemo').tree({
                    data: obj,
                    onClick: function (node) {
                        zTreeOnClick(node.attributes.SortCode);
                    }
                });
                //收起
                $('#treeDemo').tree('collapseAll');
            }
			    

            function AddItemClick() {
               
               
                if ($("#Sort").val() == "")
                {
                    HDialog.Info("序号不能为空！");
                    return false;
                } 
                //if ($("#CommID").val() == "") {
                //    HDialog.Info("所属项目不能为空！");
                //    return false;
                //}
                if ($("#Name").val() == "")
                {
                    HDialog.Info("仓库名称不能为空！");
                    return false;
                }
			        $("#OpType").val("insert");
			        //$.tool.DataPostChk('FrmForm', 'MaterialBaseHandle', 'AddRank', $('#FrmForm').serialize(),
			        $.tool.DataGet('MaterialBaseHandle', 'SaveMtWarehouse', $('#FrmForm').serialize(),
                                                        function Init() {
                                                        },
                                                        function callback(_Data) {
                                                            $("#treeDemo").html("");
                                                            if (_Data != '') {
                                                                varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                                                GetTree(varObjects);
                                                                $("#SortCode").val("");
                                                                $("#LastSortName").searchbox("setValue","");
                                                            }
                                                        },
                                                        function completeCallback() {
                                                        },
                                                        function errorCallback() {
                                                        });
			    }
            function UpdateItemClick() {
                if ($("#SortCode").val() == "") {
                    HDialog.Info("请选择仓库！");
                    return false;
                }
                if ($("#Sort").val() == "") {
                    HDialog.Info("序号不能为空！");
                    return false;
                }
                //if ($("#CommID").val() == "") {
                //    HDialog.Info("所属项目不能为空！");
                //    return false;
                //}
                if ($("#Name").val() == "") {
                    HDialog.Info("仓库名称不能为空！");
                    return false;
                }
			        $("#OpType").val("update");
			        $.tool.DataGet('MaterialBaseHandle', 'SaveMtWarehouse', $('#FrmForm').serialize(),
                                                        function Init() {
                                                        },
                                                        function callback(_Data) {
                                                            $("#treeDemo").html("");
                                                            if (_Data != '') {
                                                                $("#SortCode").val("");
                                                                HDialog.Info("修改成功!");
                                                                varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                                                console.log(varObjects);
                                                                GetTree(varObjects);
                                                                ClearTxt();
                                                            }
                                                        },
                                                        function completeCallback() {
                                                        },
                                                        function errorCallback() {
                                                        });
			    }
	        function DeleteItemClick() {
			        HDialog.Prompt('是否确定删除!', function () {
			           
			            $.tool.DataGet('MaterialBaseHandle', 'DelMtWarehouse', $('#FrmForm').serialize(),
                                                                        function Init() {
                                                                        },
                                                                        function callback(_Data) {
                                                                            ClearTxt();
                                                                            if (_Data != '') {
                                                                                $("#SortCode").val("");
                                                                                varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                                                                GetTree(varObjects);
                                                                            }
                                                                            else {
                                                                                GetTree('');
                                                                            }
                                                                        },
                                                                        function completeCallback() {
                                                                        },
                                                                        function errorCallback() {
                                                                        });
			            
			        });
			    }
        </script>
       
    </form>
</body>
</html>
