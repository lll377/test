<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineInvoiceManage.aspx.cs" Inherits="M_Main.ChargesNew.OnlineInvoiceManage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

</head>
<body style="overflow-y: auto;">
    <form id="frmForm" runat="server">
        <%--设置打印参数--%>
        <input id="yylxdm" type="hidden" name="yylxdm" value="1" runat="server" />
        <input id="kplx" type="hidden" name="kplx" value="" runat="server" />
        <input id="tspz" type="hidden" name="tspz" value="" runat="server" />
        <input id="fyxm" type="hidden" name="fyxm" runat="server" />
        <input id="fphxz" type="hidden" name="fphxz" value="" runat="server" />
        <input id="kpjh" type="hidden" name="kpjh" value="" runat="server" />
        <input id="qmcs" type="hidden" name="qmcs" value="" runat="server" />
        <input id="VATType" type="hidden" name="VATType" runat="server" />
        <input id="skpbh" type="hidden" name="skpbh" runat="server" />
        <input id="skpkl" type="hidden" name="skpkl" runat="server" />
        <input id="keypwd" type="hidden" name="keypwd" runat="server" />
        <input id="OPType" type="hidden" name="OPType" runat="server" />
        <input id="kpr" type="hidden" name="kpr" runat="server" />
        <input id="SourceType" size="1" type="hidden" name="SourceType" runat="server">
        <input id="hiBillTypeID" size="1" type="hidden" name="hiBillTypeID" runat="server">
        <input id="TaxDetail" size="1" type="hidden" name="TaxDetail" runat="server" />
        <input id="ReturnXml" size="1" type="hidden" name="ReturnXml" runat="server" />
        <input id="ChkValue" type="hidden" size="1" name="ChkValue" runat="server">
        <input id="allse" type="hidden" name="allse" runat="server" />
        <input id="sl" type="hidden" name="sl" runat="server" />
        <input id="alljs" type="hidden" name="alljs" runat="server" />
        <input id="SelCode" size="1" type="hidden" name="SelCode" runat="server">
        <input id="RetCode" type="hidden" name="RetCode" runat="server" />
        <input id="fplxdm" type="hidden" name="fplxdm" runat="server" />
        <input id="InfoNumber" type="hidden" name="InfoNumber" runat="server" />
        <input id="serverIP" type="hidden" name="服务器IP" value="127.0.0.1" runat="server" />
        <input id="serverPort" type="hidden" name="服务器端口" value="9000" runat="server" />

        <table class="DialogTable" id="DialogTable">
            <%-- <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 20px; text-align: left; font-family: 微软雅黑;">
                    <span style="font-size: 20px" id="ttitle">开据发票</span> </td>
            </tr>--%>
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">销货单位信息</span> </td>
            </tr>
            <tr>
                <td class="TdTitle">销货单位识别号</td>
                <td class="TdContentSearch">
                    <input id="xhdwsbh" type="text" readonly data-options="required:true" name="xhdwsbh" runat="server" /></td>
                <td class="TdTitle">销货单位名称</td>
                <td class="TdContentSearch">
                    <input id="xhdwmc" type="text" readonly data-options="required:true" name="xhdwmc" runat="server" /></td>
            </tr>
            <tr>
                <td class="TdTitle">销货单位地址电话</td>
                <td class="TdContentSearch">
                    <input id="xhdwdzdh" type="text" readonly data-options="required:true" name="xhdwdzdh" runat="server" /></td>
                <td class="TdTitle">销货单位银行帐号</td>
                <td class="TdContentSearch">
                    <input id="xhdwyhzh" type="text" readonly data-options="required:true" name="xhdwyhzh" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">购货单位信息</span> </td>
            </tr>
            <tr>
                <td class="TdTitle">客户名称
                </td>
                <td class="TdContentSearch" colspan="3">
                    <input id="CustName" searcher="SelCust" style="width: 76%;" data-options="required:true"
                        name="CustName" class="easyui-searchbox" runat="server" /><input id="CustID" style="width: 8px; height: 19px" type="hidden"
                            size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                size="1" name="hiCustName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">购货单位识别号</td>
                <td class="TdContent">
                    <input id="ghdwsbh" type="text" class="easyui-validatebox" data-options="required:true" name="ghdwsbh" runat="server" /></td>
                <td class="TdTitle">购货单位名称</td>
                <td class="TdContent">
                    <input id="ghdwmc" type="text" class="easyui-validatebox" data-options="required:true" name="ghdwmc" runat="server" /></td>
            </tr>
            <tr>
                <td class="TdTitle">购货单位地址电话</td>
                <td class="TdContent">
                    <input id="ghdwdzdh" type="text" class="easyui-validatebox" data-options="required:true" name="ghdwdzdh" runat="server" /></td>
                <td class="TdTitle">购货单位银行帐号</td>
                <td class="TdContent">
                    <input id="ghdwyhzh" type="text" class="easyui-validatebox" data-options="required:true" name="ghdwyhzh" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="4">
                    <div id="TableContainer" style="width: 500px; height: 300px; width: 100%">
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">票据信息</span> </td>
            </tr>
            <tr style="display: none;">
                <td class="TdTitle">使用说明</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="SelBillUseCase" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="4">换票</asp:ListItem>
                        <asp:ListItem Value="3">其它</asp:ListItem>
                        <asp:ListItem Value="-1">作废</asp:ListItem>
                    </asp:DropDownList><asp:Label ID="BillUseCaseName" runat="server"></asp:Label></td>
                <td class="TdTitle"></td>
                <td class="TdContentSearch"></td>
            </tr>
            <tr>
                <td class="TdTitle">票据种类</td>
                <td class="TdContentSearch">
                    <select id="BillKind" name="BillKind" runat="server">
                        <option value="0" selected="selected">发票</option>
                    </select>
                    <%--<asp:DropDownList ID="BillKind" runat="server" AutoPostBack="True"></asp:DropDownList>--%>
                </td>
                <td class="TdTitle">票据类别</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="BillTypeID" runat="server"></asp:DropDownList><input style="width: 16px; height: 22px" id="IsFixed" size="1" type="hidden" name="IsFixed"
                        runat="server"><input style="width: 16px; height: 22px" id="FixedAmount" size="1" type="hidden" name="FixedAmount"
                            runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">票 据 号</td>
                <td class="TdContentSearch">
                    <input id="BillsSign" class="easyui-searchbox" searcher="SelBillsSign" data-options="editable:false,required:true" name="BillsSign" runat="server">
                    <input id="btnSelBillsSign" class="button_sel" style="display: none;"
                        value=" " type="button" name="btnSelBillsSign" runat="server"><input style="width: 8px; height: 19px" id="hiBillsSign" size="1"
                            type="hidden" name="hiBillsSign" runat="server"><input style="width: 8px; height: 19px" id="hiBillsSigns" size="1"
                                type="hidden" name="hiBillsSigns" runat="server"></td>
                <td class="TdTitle">
                    <asp:Label ID="lbPaidAmount" runat="server">票据金额</asp:Label></td>
                <td class="TdContentSearch">
                    <input id="PaidAmount" readonly name="PaidAmount" runat="server"></td>
            </tr>
            <tr>
                <%-- <td class="TdTitle">发票类型</td>
                <td class="TdContentSearch">
                    <select id="fplxdm" name="fplxdm" runat="server">
                        <option value="004" selected="selected">发票类型代码004</option>
                        <option value="007">发票类型代码007</option>
                    </select>
                </td>--%>
                <td class="TdTitle">发票类型</td>
                <td class="TdContentSearch">
                    <select id="InfoKind" name="InfoKind" runat="server">
                        <option value="专有发票" selected="selected">专有发票</option>
                        <option value="普通发票">普通发票</option>
                    </select>
                </td>
                <td class="TdTitle"></td>
                <td class="TdContentSearch"></td>
            </tr>
            <tr>
                <td class="TdTitle" colspan="4"></td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <input class="button" id="btnSave"
                        type="button" value="确认开票" name="btnSave" runat="server">&nbsp;&nbsp;
                     <%--<input class="button" id="btnClose"
                         type="button" value="返回" name="btnClose" runat="server">--%>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
<script type="text/javascript">

    var Columns = [[
         { field: 'FeesID', title: 'FeesID', hidden: true },
         { field: 'RecdID', title: 'RecdID', hidden: true },
         {
             field: 'Fids', title: "<input type=\"CheckBox\" id=\"0\" issubmit = \"1\" onclick=\'SelCheck(this);\'>", align: 'left', sortable: false, hidden: true,
             formatter: function (value, row, rowIndex) {
                 return "<input type=\"CheckBox\"  id=\"" + row.VATFeesCode + "\" data-ispro='" + row.ChargeAmount + "' issubmit = \"1\" onclick=\'SelCheck(this);\'>";
             }
         },
         {
             field: 'OnlineInvoiceType', title: '业务类型', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                 var TypeName = '';
                 switch (row.OnlineInvoiceType) {
                     case "1":
                         TypeName = '实收';
                         break;
                     case "2":
                         TypeName = '预收';
                         break;
                     case "3":
                         TypeName = '单项预存';
                         break;
                     case "4":
                         TypeName = '预存冲抵';
                         break;
                     case "5":
                         TypeName = '人工托收';
                         break;
                 }
                 return TypeName;
             }
         },
          {
              field: 'spmc', title: '商品名称', width: 150, align: 'left', sortable: true
          },
          {
              field: 'spsm', title: '商品税目', width: 150, align: 'left', sortable: true
          },
          {
              field: 'ggxh', title: '规格型号', width: 150, align: 'left', sortable: true
          },
          {
              field: 'dw', title: '单位', width: 150, align: 'left', sortable: true
          },
          {
              field: 'spsl', title: '商品数量', width: 150, align: 'left', sortable: true
          },
          {
              field: 'dj', title: '单价', width: 150, align: 'left', sortable: true
          },
            {
                field: 'je', title: '金额', width: 150, align: 'left', sortable: true
            },
          {
              field: 'sl', title: '税率', width: 150, align: 'left', sortable: true
          },
          {
              field: 'se', title: '税额', width: 150, align: 'left', sortable: true
          },
            {
                field: 'ChargeAmount', title: '价税合计', width: 150, align: 'left', sortable: true
            }
    ]];

    var toolbar = [
           {
               text: '选择开票记录',
               iconCls: 'icon-add',
               handler: function () {

                   if ($('#CustID').val() == '') {
                       HDialog.Info('请选择要开票的客户');
                   }
                   else {
                       var w = $(window).width();
                       var h = $(window).height();
                       var conent = "../DialogNew/OnlineInvoiceFeesDlg.aspx?CustID=" + $('#CustID').val();
                       HDialog.Open(w, h, conent, '收费信息', false, function callback(_Data) {
                           if (_Data != "" && _Data != undefined) {
                               var obj = JSON.parse(_Data);
                               var je = 0;
                               var se = 0;
                               var js = 0;
                               $.each(obj.rows, function (key, item) {
                                   je += parseFloat(item.je);
                                   se += parseFloat(item.se);
                                   js += parseFloat(item.ChargeAmount);
                               })
                               $('#PaidAmount').val(ToDecimal(je, 2));
                               $('#allse').val(ToDecimal(se, 2));
                               $('#alljs').val(ToDecimal(js, 2));

                               $('#TableContainer').datagrid('loadData', obj);
                           }

                       });
                   }
               }
           }, '-', {
               text: '删除',
               iconCls: 'icon-cancel',
               handler: function () {
                   var row = $('#TableContainer').datagrid('getSelected');
                   if (row == "" || row == undefined) {
                       HDialog.Info('请选择删除项!');
                       return;
                   }
                   var index = $('#TableContainer').datagrid('getRowIndex', row);
                   $('#TableContainer').datagrid('deleteRow', index);


                   var obj = $('#TableContainer').datagrid('getRows');
                   var je = 0;
                   var se = 0;
                   var js = 0;
                   $.each(obj, function (key, item) {
                       je += parseFloat(item.je);
                       se += parseFloat(item.se);
                       js += parseFloat(item.ChargeAmount);
                   })

                   $('#PaidAmount').val(ToDecimal(je, 2));
                   $('#allse').val(ToDecimal(se, 2));
                   $('#alljs').val(ToDecimal(js, 2));

                   //重新刷新datagrid
                   $('#TableContainer').datagrid('reload', obj);
                   $('#TableContainer').datagrid('reloadFooter', [
                     {
                         Fids: 'footer',
                         spsm: "<span style='color:red'>合计</span>",
                         je: "<span style='color:red'>" + Compute("je") + "</span>",
                         se: "<span style='color:red'>" + Compute("se") + "</span>",
                         ChargeAmount: "<span style='color:red'>" + Compute("ChargeAmount") + "</span>"
                     }
                   ]);
               }
           }

    ];

    //指定列求和
    function Compute(colName) {
        var rows = $('#TableContainer').datagrid('getRows');
        var total = 0;
        for (var i = 0; i < rows.length; i++) {
            total += parseFloat(rows[i][colName]);
        }
        return ToDecimal(total, 2);
    }

    //重写DataGrid,支持更改页脚样式
    var myview = $.extend({}, $.fn.datagrid.defaults.view, {
        renderFooter: function (target, container, frozen) {
            var opts = $.data(target, 'datagrid').options;
            var rows = $.data(target, 'datagrid').footer || [];
            var fields = $(target).datagrid('getColumnFields', frozen);
            var table = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'];

            for (var i = 0; i < rows.length; i++) {
                var styleValue = opts.rowStyler ? opts.rowStyler.call(target, i, rows[i]) : '';
                var style = styleValue ? 'style="' + styleValue + '"' : '';
                table.push('<tr class="datagrid-row" datagrid-row-index="' + i + '"' + style + '>');
                table.push(this.renderRow.call(this, target, fields, frozen, i, rows[i]));
                table.push('</tr>');
            }
            table.push('</tbody></table>');
            $(container).html(table.join(''));
        }
    });

    $("#TableContainer").datagrid({
        nowrap: false,
        title: '开票信息',
        pageSize: top.ListPageSize,
        pageList: top.ListPageList,
        columns: Columns,
        fitColumns: true,
        remoteSort: false,
        singleSelect: true,
        pagination: false,
        width: "100%",
        toolbar: toolbar,
        sortOrder: "asc",
        selectOnCheck: false,
        checkOnSelect: false,
        rownumbers: true,
        border: false,
        showFooter: true,
        view: myview,
        rowStyler: function (index, row) {
            //如果是页脚
            if (row.Fids == 'footer') {
                return 'background-color:#F4F4F4;border:none;'; // return inline style
            }
        },
        onLoadSuccess: function (data) {
            //加载页脚
            $('#TableContainer').datagrid('reloadFooter', [
                  {
                      Fids: 'footer',
                      spsm: "<span style='color:red'>合计</span>",
                      je: "<span style='color:red'>" + Compute("je") + "</span>",
                      se: "<span style='color:red'>" + Compute("se") + "</span>",
                      ChargeAmount: "<span style='color:red'>" + Compute("ChargeAmount") + "</span>"
                  }
            ]);
        }
    });

    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');

        var w = 800;
        var h = 400;

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);


            $.tool.DataGet('ValueAddedTax', 'GetCustVATSetting', "CustID=" + data.CustID,
              function Init() {
              },
              function callback(_Data) {
                  if (_Data != "false") {
                      //varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                      //if (varObjects.length > 0) {
                      //    alert(varObjects);
                      //}
                      var Obj = JSON.parse(_Data)
                      $('#ghdwsbh').val(Obj.ghdwsbh);
                      $('#ghdwmc').val(Obj.ghdwmc);
                      $('#ghdwdzdh').val(Obj.ghdwdzdh);
                      $('#ghdwyhzh').val(Obj.ghdwyhzh);
                  }
              },
              function completeCallback() {
              },
              function errorCallback() {
              });

        });
    }

    function SelBillsSign() {
        var strBillTypeID = getObject("BillTypeID").value;
        var strBillsSigns;

        if ((strBillTypeID == "0") || (strBillTypeID == "")) {
            HDialog.Info("请选择票据类别,此项不能为空!");
            return false;
        }

        var conent = "../DialogNew/BillsSignDlg.aspx?BillTypeID=" + strBillTypeID + "&Rdm=" + Math.random();
        HDialog.Open(680, 460, conent, '选择票据', false, function callback(_Data) {

            if (_Data != "") {
                var data = _Data;
                $('#hiBillsSign').val(data);
                $('#BillsSign').searchbox("setValue", data);
                $('#hiBillsSigns').val(strBillTypeID + "|" + $('#BillsSign').val());

            }

        });
    }

    var fplxdm = "";  //发票类型
    var dataType = "";
    //开票
    $("#btnSave").click(function () {

        var obj = $('#TableContainer').datagrid('getRows');
        var strxml = "";
        $("#TaxDetail").val(JSON.stringify(obj));
        if (obj.length <= 0) {
            HDialog.Info("请选择商品项！");
            return;
        }
        var sl = obj[0].sl * 100;
        $("#sl").val(obj[0].sl);
        var vattype = $("#VATType").val(); //1:成都金税 2:四川航天金穗 
        var count = obj.length;

        switch (vattype) {
            case "1":
                if (wbsocket.readyState == 1) {
                    $.tool.pageLoadInfo("正在开票,请稍等...");


                    if ($("#InfoKind").val() == "专有发票") {
                        fplxdm = 004;
                    } else {
                        fplxdm = 007;
                    }
                    $("#fplxdm").val(fplxdm);
                    //非清单，发票最多有八条发票明细  清单：发票票面上只有金额等信息，商品信息见清单哈
                    //数量>8 清单
                    if (count > 8) {
                        strxml += '<?xml version=\"1.0\" encoding=\"gbk\"?>';
                        strxml += '<business comment=\"发票开具\" id=\"FPKJ\">';
                        strxml += '<body yylxdm=\"1\">';
                        strxml += '<input>';
                        strxml += '<skpbh>' + $("#skpbh").val() + '</skpbh>';  //税控盘编号
                        strxml += '<skpkl>' + $("#skpkl").val() + '</skpkl>';  //税控盘口令
                        strxml += '<keypwd>' + $("#keypwd").val() + '</keypwd>';  //数字证书密码
                        strxml += '<fplxdm>' + fplxdm + '</fplxdm>';  //发票类型代码
                        strxml += '<kplx>0</kplx>'; //开票类型
                        strxml += '<tspz>00<tspz>';  //特殊票种标识
                        strxml += '<xhdwsbh>' + $("#xhdwsbh").val() + '</xhdwsbh>';  //销货单位识别号
                        strxml += '<xhdwmc>' + $("#xhdwmc").val() + '</xhdwmc>';  //销货单位名称
                        strxml += '<xhdwdzdh>' + $("#xhdwdzdh").val() + '</xhdwdzdh>';  //销货单位地址电话
                        strxml += '<xhdwyhzh>' + $("#xhdwyhzh").val() + '</xhdwyhzh>';  //销货单位银行帐号
                        strxml += '<ghdwsbh>' + $("#ghdwsbh").val() + '</ghdwsbh>';  //购货单位识别号
                        strxml += '<ghdwmc>' + $("#ghdwmc").val() + '</ghdwmc>';  //购货单位名称
                        strxml += '<ghdwdzdh>' + $("#ghdwdzdh").val() + '</ghdwdzdh>';  //购货单位地址电话
                        strxml += '<ghdwyhzh>' + $("#ghdwyhzh").val() + '</ghdwyhzh>';  //购货单位地址电话


                        $("#fyxm").val(count);                 //开具清单发票行数
                        strxml += '<qdxm count=' + count + '>';
                        $.each(obj, function (key, item) {
                            strxml += '<group xh=' + parseInt(key + 1) + '>';
                            strxml += '<fphxz>0</fphxz>'; //发票行性质
                            strxml += '<spmc>' + item.spmc + '</spmc>'; //商品名称
                            strxml += '<spsm>' + item.spsm + '</spsm>'; //商品税目
                            strxml += '<ggxh>' + item.ggxh + '</ggxh>';  //规格型号
                            strxml += '<dw>' + item.dw + '</dw>'; //单位
                            strxml += '<spsl>' + item.spsl + '</spsl>';  //商品数量
                            strxml += '<dj>' + item.dj + '</dj>';  //单价
                            strxml += '<je>' + item.ChargeAmount + '</je>';  //金额
                            strxml += '<sl>' + item.sl + '</sl>';  //税率
                            strxml += '<se>' + item.se + '</se>';  //税额
                            strxml += '<hsbz>0</hsbz>'; //含税标志
                            strxml += '</group>';
                        });
                        strxml += '</qdxm>';
                        strxml += '<zhsl></zhsl>';  //增值税税率
                        strxml += '<hjje>' + $('#PaidAmount').val() + '</hjje>';  //合计金额
                        strxml += '<hjse>' + $('#allse').val() + '</hjse>';  //合计税额
                        strxml += '<jshj>' + $('#alljs').val() + '</jshj>';  //价税合计
                        strxml += '<bz></bz>';  //备注
                        strxml += '<skr></skr>';  //收款人
                        strxml += '<fhr></fhr>';  //复核人
                        strxml += '<kpr>' + $("#kpr").val() + '</kpr>';  //开票人
                        strxml += '<jmbbh></jmbbh>';  //加密版本号
                        strxml += '<zyspmc></zyspmc>';  //主要商品名称
                        strxml += '<spsm></spsm>';  //商品税目
                        strxml += '<qdbz>1</qdbz>';  //清单标志
                        strxml += '<ssyf></ssyf>';  //所属月份
                        strxml += '<kpjh>' + $("#kpjh").val() + '</kpjh>';  //开票机号
                        strxml += '<tzdbh></tzdbh>';  //通知单编号
                        strxml += '<yfpdm></yfpdm>';  //原发票代码
                        strxml += '<yfphm></yfphm>';  //原发票号码
                        strxml += '<qmcs>' + $("#qmcs").val() + '</qmcs>';  //签名参数
                        strxml += '</input>';
                        strxml += '</body>';
                        strxml += '</business>';

                    } else {

                        strxml += '<?xml version=1.0 encoding=gbk?>';
                        strxml += '<business comment=发票开具 id=FPKJ>';
                        strxml += '<body yylxdm=1>';
                        strxml += '<input>';
                        strxml += '<skpbh>' + $("#skpbh").val() + '</skpbh>';                   //税控盘编号
                        strxml += '<skpkl>' + $("#skpkl").val() + '</skpkl>';                   //税控盘口令
                        strxml += '<keypwd>' + $("#keypwd").val() + '</keypwd>';                //数字证书密码
                        strxml += '<fplxdm>' + fplxdm + '</fplxdm>';                                       //发票类型代码
                        strxml += '<kplx>0</kplx>';                                             //开票类型
                        strxml += '<tspz>00<tspz>';                                             //特殊票种标识
                        strxml += '<xhdwsbh>' + $("#xhdwsbh").val() + '</xhdwsbh>';             //销货单位识别号
                        strxml += '<xhdwmc>' + $("#xhdwmc").val() + '</xhdwmc>';                //销货单位名称
                        strxml += '<xhdwdzdh>' + $("#xhdwdzdh").val() + '</xhdwdzdh>';          //销货单位地址电话
                        strxml += '<xhdwyhzh>' + $("#xhdwyhzh").val() + '</xhdwyhzh>';          //销货单位银行帐号
                        strxml += '<ghdwsbh>' + $("#ghdwsbh").val() + '</ghdwsbh>';             //购货单位识别号
                        strxml += '<ghdwmc>' + $("#ghdwmc").val() + '</ghdwmc>';                //购货单位名称
                        strxml += '<ghdwdzdh>' + $("#ghdwdzdh").val() + '</ghdwdzdh>';          //购货单位地址电话
                        strxml += '<ghdwyhzh>' + $("#ghdwyhzh").val() + '</ghdwyhzh>';          //购货单位银行帐号
                        strxml += '<bmbbbh>编码表版本号</bmbbbh>'; //编码表版本号
                        strxml += '<hsslbs>含税税率标识</hsslbs>'; //含税税率标识


                        $("#fyxm").val(count);                                                  //开具非清单发票行数
                        strxml += '<fyxm count=' + count + '>';
                        $.each(obj, function (key, item) {
                            strxml += '<group xh=' + parseInt(key + 1) + '>';
                            strxml += '<fphxz>0</fphxz>';                                       //发票行性质
                            strxml += '<spmc>' + item.spmc + '</spmc>';                         //商品名称
                            strxml += '<spsm>' + item.spsm + '</spsm>';                         //商品税目
                            strxml += '<ggxh>' + item.ggxh + '</ggxh>';                         //规格型号
                            strxml += '<dw>' + item.dw + '</dw>';                               //单位
                            strxml += '<spsl>' + item.spsl + '</spsl>';                         //商品数量
                            strxml += '<dj>' + item.dj + '</dj>';                               //单价
                            strxml += '<je>' + item.ChargeAmount + '</je>';                     //金额
                            strxml += '<kcje>' + item.ChargeAmount + '</kcje>';                  //扣除金额
                            strxml += '<sl>' + item.sl + '</sl>';                               //税率
                            strxml += '<se>' + item.se + '</se>';                               //税额
                            strxml += '<hsbz>1</hsbz>';                                         //含税标志
                            strxml += '<spbm>商品编码</spbm>';  //商品编码
                            strxml += '<zxbm>纳税人自行编码</zxbm>';  //纳税人自行编码
                            strxml += '<yhzcbs>优惠政策标识</yhzcbs>';  //优惠政策标识
                            strxml += '<slbs>0税率标识</slbs>'; //0税率标识
                            strxml += '<zzstsgl>增值税特殊管理</zzstsgl>';  //增值税特殊管理

                            strxml += '</group>';
                        })
                        strxml += '</fyxm>';

                        strxml += '<zhsl></zhsl>';                                              //综合税率
                        strxml += '<hjje>' + $('#PaidAmount').val() + '</hjje>';                //合计金额
                        strxml += '<hjse>' + $('#allse').val() + '</hjse>';                     //合计税额
                        strxml += '<jshj>' + $('#alljs').val() + '</jshj>';                     //价税合计
                        strxml += '<bz></bz>';                                                  //备注
                        strxml += '<skr></skr>';                                           //收款人
                        strxml += '<fhr></fhr>';                                           //复核人
                        strxml += '<kpr>' + $("#kpr").val() + '</kpr>';                   //开票人
                        strxml += '<jmbbh></jmbbh>';                                   //加密版本号
                        strxml += '<zyspmc></zyspmc>';                               //主要商品名称
                        strxml += '<spsm></spsm>';                                       //商品税目
                        strxml += '<qdbz>0</qdbz>';                                       //清单标志
                        strxml += '<ssyf></ssyf>';                                       //所属月份
                        strxml += '<kpjh>' + $("#kpjh").val() + '</kpjh>';                     //开票机号
                        strxml += '<tzdbh></tzdbh>';                                   //通知单编号
                        strxml += '<yfpdm></yfpdm>';                                   //原发票代码
                        strxml += '<yfphm></yfphm>';                                   //原发票号码
                        strxml += '<qmcs>' + $("#qmcs").val() + '</qmcs>';             //签名参数
                        strxml += '</input>';
                        strxml += '</body>';
                        strxml += '</business>';

                        //window.location.href = '../include/PrintVat.aspx?param=' + strxml;

                        //var res = '<?xml version="1.0" encoding="gbk"?><business comment="发票开具" id=\"FPKJ\"><body yylxdm=\"1\"><output>';
                        //res += '<fplxdm>1</fplxdm><fpdm>222</fpdm><fphm>333</fphm><kprq>开票日期</kprq><hjje>12</hjje>';
                        //res += '<skm>税控码</skm><returncode>0</returncode><returnmsg>成功</returnmsg></output></body></business>';
                        //$("#ReturnXml").val(res);

                        //var xmlDoc = $.parseXML(res);
                        //$(xmlDoc).find("output:eq(0)").each(function () {
                        //    var field = $(this);
                        //    dataType = field.find("returnmsg").text();//读取子节点的值
                        //});

                        send(strxml);
                    }
                } else if (wbsocket.readyState == 0) {
                    HDialog.Info("请开起客户端开票插件!");
                }
                else {
                    HDialog.Info("请刷新当前页面!");
                }

                break;
            case "2":

                if (wbsocket.readyState == 1) {
                    $.tool.pageLoadInfo("正在开票,请稍等...");

                    //strxml += 'fpkj|' + "◆"; //操作类型
                    //strxml += '' + vattype + '|' + "◆";  //盘类型
                    
                    if ($("#InfoKind").val() == "专有发票") {
                        fplxdm = 0;
                    } else {
                        fplxdm = 2;
                    }
                    $("#fplxdm").val(fplxdm);

                    strxml += '<?xml version=\"1.0\" encoding=\"gbk\"?>';
                    strxml += '<body>';
                    strxml += '<VType>fpkj</VType>';
                    strxml += '<StaticType>' + vattype + '</StaticType>' + "◆";
                    strxml += '<input>';
                    strxml += '<keypwd>' + $("#keypwd").val() + '</keypwd>' + "◆";  //税控盘证书密码
                    strxml += '<InfoKind>' + fplxdm + '</InfoKind>' + "◆";  //发票种类（0：专用发票 1：废旧物资发票 2：普通发票
                    strxml += '<InfoClientName>' + $("#ghdwmc").val() + '</InfoClientName>' + "◆";  //购货单位名称
                    strxml += '<InfoClientTaxCode>' + $("#ghdwsbh").val() + '</InfoClientTaxCode>' + "◆";  //购货单位识别号
                    strxml += '<InfoClientBankAccount>' + $("#ghdwyhzh").val() + '</InfoClientBankAccount>' + "◆"; //购货单位银行帐号
                    strxml += '<InfoClientAddressPhone>' + $("#ghdwdzdh").val() + '</InfoClientAddressPhone>' + "◆"; //购货单位地址电话
                    strxml += '<InfoSellerBankAccount>' + $("#xhdwyhzh").val() + '</InfoSellerBankAccount>' + "◆";  //销货单位银行帐号
                    strxml += '<InfoSellerAddressPhone>' + $("#xhdwdzdh").val() + '</InfoSellerAddressPhone>' + "◆"; //销货单位地址电话 
                    strxml += '<InfoTaxRate>' + sl + '</InfoTaxRate>' + "◆";          //税率
                    strxml += '<InfoNotes></InfoNotes>' + "◆";         //备注
                    strxml += '<InfoInvoicer>' + $("#kpr").val() + '</InfoInvoicer>' + "◆"; //开票人
                    strxml += '<InfoChecker></InfoChecker>' + "◆";    //复核人
                    strxml += '<InfoCashier></InfoCashier>' + "◆";    //收款人
                    strxml += '<InfoListName></InfoListName>' + "◆";    //清单信息
                    strxml += '<InfoBillNumber></InfoBillNumber>' + "◆"; //销售单据编号

                    var count = obj.length;
                    $("#fyxm").val(count);                                                  //开具非清单发票行数
                    strxml += '<fyxm count=\"' + count + '\">';
                    $.each(obj, function (key, item) {
                        strxml += '<group xh=\"' + parseInt(key + 1) + '\">' + "◆";
                        strxml += '<ListGoodsName>' + item.spmc + '</ListGoodsName>' + "◆";       //商品名称
                        strxml += '<ListTaxItem>' + item.spsm + '</ListTaxItem>' + "◆";           //商品税目
                        strxml += '<ListStandard>' + item.ggxh + '</ListStandard>' + "◆";         //规格型号
                        strxml += '<ListUnit>' + item.dw + '</ListUnit>';                  //单位
                        if (item.spsl != undefined) {
                            strxml += '<ListNumber>' + item.spsl + '</ListNumber>';            //商品数量
                        } else {
                            strxml += '<ListNumber></ListNumber>';
                        }
                        if (item.dj != undefined) {
                            strxml += '<ListPrice>' + item.dj + '</ListPrice>';  //单价
                        } else {
                            strxml += '<ListPrice></ListPrice>';
                        }
                        strxml += '<ListAmount>' + item.ChargeAmount + '</ListAmount>' + "◆";    //金额
                        strxml += '<ListPriceKind>1</ListPriceKind>' + "◆";                      //含税标志 1含税
                        strxml += '<ListTaxAmount>' + item.se + '</ListTaxAmount>' + "◆";        //税额
                        strxml += '</group>';
                    })
                    strxml += '</fyxm>';
                    strxml += '</input>';
                    strxml += '</body>' + "◆" + '■';


                    //strxml += '<?xml version=\"1.0\" encoding=\"gbk\"?>' + "◆"; 
                    //strxml += '<body>';
                    //strxml += '<VType>fpkj</VType>';
                    //strxml += '<StaticType>' + vattype + '</StaticType>' + "◆";
                    //strxml += '<input>' + "◆";
                    //strxml += '<InfoKind>0</InfoKind>' + "◆";
                    //strxml += '<InfoClientName>北京畅联电子有限公司</InfoClientName>' + "◆";
                    //strxml += '<InfoClientTaxCode>110101251328321</InfoClientTaxCode>' + "◆";
                    //strxml += '<InfoClientBankAccount>223</InfoClientBankAccount>' + "◆";
                    //strxml += '<InfoClientAddressPhone>北京市海淀区浇灌里231号 62345123</InfoClientAddressPhone>' + "◆";
                    //strxml += '<InfoSellerBankAccount>22</InfoSellerBankAccount>' + "◆";
                    //strxml += '<InfoSellerAddressPhone>22 22</InfoSellerAddressPhone>' + "◆";
                    //strxml += '<InfoTaxRate>13</InfoTaxRate>' + "◆";
                    //strxml += '<InfoNotes>备注</InfoNotes>' + "◆";
                    //strxml += '<InfoInvoicer>张三</InfoInvoicer>' + "◆";
                    //strxml += '<InfoChecker>复核人</InfoChecker><InfoCashier>收款人</InfoCashier>' + "◆";
                    //strxml += '<InfoListName>(详见销货清单)</InfoListName>' + "◆";
                    //strxml += '<InfoBillNumber></InfoBillNumber>' + "◆";
                    //strxml += '<fyxm count=\"1\"><group xh=\"1\">' + "◆";
                    //strxml += '<ListGoodsName>服务费6%</ListGoodsName>' + "◆";
                    //strxml += '<ListTaxItem>4003</ListTaxItem>' + "◆";
                    //strxml += '<ListStandard>1</ListStandard>' + "◆";
                    //strxml += '<ListUnit></ListUnit>' + "◆";
                    //strxml += '<ListNumber></ListNumber>' + "◆";
                    //strxml += '<ListPrice></ListPrice><ListAmount>1</ListAmount>' + "◆";
                    //strxml += '<ListPriceKind>1</ListPriceKind><ListTaxAmount>0.13</ListTaxAmount>' + "◆";
                    //strxml += '</group></fyxm></input></body>' + "◆" + '■';


                    send(strxml);
                } else if (wbsocket.readyState == 0) {
                    HDialog.Info("请开起天问开票插件!");
                }
                else {
                    HDialog.Info("请刷新当前页面!");
                }
                break;

        }


    });

    $('#btnClose').click(function () {
        window.location.href = 'OnlineInvoice.aspx';
    });



    //var socket;
    //function connect() {
    //    var host = "ws://" + $("#serverIP").val() + ":" + $("#serverPort").val() + "/"
    //    socket = new WebSocket(host);
    //    try {

    //        socket.onopen = function (msg) {
    //            //  HDialog.Info("连接成功！");
    //        };

    //        socket.onmessage = function (msg) {
    //            $.tool.pageUnLoading();
    //            if (typeof msg.data == "string") {
    //                displayContent(msg.data);

    //            }
    //            else {
    //                HDialog.Info("开票失败");
    //            }

    //        };

    //        socket.onclose = function (msg) {

    //            HDialog.Info("请开起天问开票插件!");
    //        };

    //    }
    //    catch (ex) {
    //        HDialog.Info("异常:" + ex);
    //        log(ex);

    //    }
    //}

    var wbsocket;

    var IsConn = false;
    var initWebSocket = function () {
        if (window.WebSocket) {
            var host = "ws://" + $('#serverIP').val() + ":" + $('#serverPort').val() + "/"
            wbsocket = new WebSocket(host);
            wbsocket.onmessage = function (event) {
                $.tool.pageUnLoading();

                if (typeof event.data == "string") {
                    displayContent(event.data);

                }
                else {
                    HDialog.Info("开票失败");
                }
            };
            wbsocket.onopen = function (event) {
                if (!IsConn) {
                    IsConn = true;
                    HDialog.Info("开票插件连接成功");
                }
            };
            wbsocket.onclose = function (event) {
                if (IsConn) {
                    HDialog.Info("开票插件连接中断");

                    $.tool.pageUnLoading();
                }
            };
            wbsocket.onerror = function (event) {
                HDialog.Info("开票插件连接失败");

            };
        } else {
            HDialog.Info("你的浏览器不支持");
        }
    }

    //发送消息
    //function send(msg) {
    //    var arry = msg.split('◆')
    //    for (var i = 0; i < arry.length; i++) {
    //        var ss = arry[i];
    //        socket.send(ss);
    //    }
    //}

    var send = function (t) {
        var data = function (t) {
            //发送消息
            function send(msg) {

            }

            var arry = t.split('◆')
            for (var i = 0; i < arry.length; i++) {
                var ss = arry[i];
                wbsocket.send(ss);
            }

        };
        if (wbsocket.readyState !== 1) {
            wbsocket.close();
            initWebSocket();
            setTimeout(function () {
                if (wbsocket.readyState !== 1) {
                    HDialog.Info("未安装/启动开票插件");
                }
                else { data(t); }
            }, 250);
        } else {
            data(t);
        };

    }

    //window.onbeforeunload = function () {
    //    alert(socket.readyState);
    //    try {

    //        socket.close();
    //        socket = null;
    //    }
    //    catch (ex) {
    //    }
    //};

    //接收消息
    function displayContent(msg) {
        if (msg != undefined) {
            var obj = JSON.parse(msg);
            var code = obj.RetCode;
            var InfoNumber = obj.InfoNumber;
            if (code == 4011) {
                dataType = "成功";
                var res = '<?xml version="1.0" encoding="gbk"?><business comment="发票开具" id=\"FPKJ\"><body yylxdm=\"1\"><output>';
                res += '<fplxdm>' + fplxdm + '</fplxdm><fpdm>' + obj.InfoTypeCode + '</fpdm><fphm>' + InfoNumber + '</fphm><hjje></hjje><skm></skm>';
                res += '<kprq>' + obj.InfoDate + '</kprq><ssyf>' + obj.InfoMonth + '</ssyf><hjbhsje>' + obj.InfoAmount + '</hjbhsje>';
                res += '<xhqdbz>' + obj.goodsListFlag + '</xhqdbz><hjse>' + obj.InfoTaxAmount + '</hjse>';
                res += '<returncode>' + code + '</returncode><returnmsg>' + obj.RetMsg + '</returnmsg></output></body></business>';
                $("#ReturnXml").val(res);
                $("#InfoNumber").val(InfoNumber);

                //查询开票号码是否存在
                $.ajax({
                    type: "post",
                    url: "OnlineInvoiceManage.aspx/GetBillsSign",
                    //async: false,
                    data: "{'strInfoNumber':'" + $("#InfoNumber").val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == "true") {

                        } else {
                            alert("税控盘发票号不存在数据库");
                        }
                    },
                    error: function (err) {

                    }
                });

                if (dataType == "成功") {
                    $.tool.DataPostChk('frmForm', 'ValueAddedTax', 'InsertValueAddedTax', $('#frmForm').serialize(),
                      function Init() {
                      },
                      function callback(_Data) {
                          if (_Data == "true") {
                              if (InfoNumber != $("#BillsSign").val()) {
                                  HDialog.Info('开票成功' + ';' + "税控盘发票号与所选号不一致");
                              } else {
                                  HDialog.Info('开票失败');
                              }

                          }
                      },
                      function completeCallback() {
                      },
                      function errorCallback() {

                      });
                }

            }
        }
        else {
            HDialog.Info(obj.RetMsg);
        }
    }

    $(function () {
        initWebSocket();
    });
</script>
