<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderManager.inc.jsp" %>
<style type="text/css">
#marzServerReq{border:0px solid;}
#marzServerReq td{border:0px solid;}
#marzServerReq input{width:120px;}
#marzServerReq select{width:120px;}
</style>
<input type="hidden" id="marzServerManagerSubmit" name="marzServerManagerSubmit" value="0" />
<div class="ui-widget">
	<form id="marzServerReq" action="../mar/queryMarzServer.action" method="post">
		<table>
			<tr>
				<td><label>服务器名称: </label></td><td><input type="text" name="marzServerReq.serverName" /></td>
				<td><label>本地IP: </label></td><td><input type="text" name="marzServerReq.loaclIp" /></td>
                <td><label>类型: </label></td>
                <td>
                    <select name="marzServerReq.status">
                        <option value="">全部</option>
                        <option value="0">已停止</option>
                        <option value="1">启动中</option>
                    </select>
                </td>
                <td><label>分流: </label></td>
                <td>
                    <select name="marzServerReq.accept">
                        <option value="">全部</option>
                        <option value="0">禁止</option>
                        <option value="1">允许</option>
                    </select>
                </td>
				<td>
				<button id="clearMarzServer">重置</button>
				<button id="queryMarzServer">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<button id="addMarzServer">新增</button>
<button id="deleteMarzServer">删除</button>
<button id="onMarzServer">启用</button>
<button id="offMarzServer">禁用</button>

<div id="marzServerDiv"></div>

<div id="marzServerEdit" title="MarzServer Edit">
	<form id="marzServerForm" action="../mar/editMarzServer.action" method="post"></form>
</div>

<div id="marzServerConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var table=$.ajax({url:"../mar/queryMarzServer.action",async:false});
	$("#marzServerDiv").html(table.responseText);
	
	function query()
	{
		var table=$.ajax({url:"../mar/queryMarzServer.action", data:$("#marzServerReq").formSerialize(), async:false});
		$("#marzServerDiv").html(table.responseText);
	}
	
	// 新增/更新窗口
	$( "#marzServerEdit" ).dialog({
		modal: true,
		height:500,
		width:750,
		autoOpen: false,
		show: "fold",
		hide: "fold",
		buttons:
		{ 
			"确定":function()
			{
				// 页面校验
				if (!marzServerFormCheck())
				{
					return false;
				}
				var form = $("#marzServerForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#marzServerManagerSubmit").val("0");
				$("#marzServerEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#marzServerForm").submit(function()
	{
		if ($("#marzServerManagerSubmit").val() == "0")
		{
			return false;
		}
		
		$("#marzServerManagerSubmit").val("0");
		
		var options = { 
			url:"../mar/editMarzServer.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#marzServerEdit").dialog("close");
				// 新增完毕刷新form
				query();
				alert("操作成功");
			},
			error:function(){ 
				$("#marzServerEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#marzServerForm").ajaxSubmit(options);
		
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addMarzServer" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		// 请求提交标志
		$("#marzServerManagerSubmit").val("1");
		$( "#marzServerEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../mar/editMarzServerPage.action",async:false});
		$("#marzServerForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteMarzServer" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		$("#marzServerManagerSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("marzServerId");
		for (var i=0; i<array.length; i++)
	   	{
	   		if (array[i].checked)
  			{
	   			if (ids == "")
   				{
	   				ids += array[i].value;
   				}
	   			else
	   			{
	   				ids += "," + array[i].value;
	   			}
  			}
	   	}
		
		// 操作验证
		if (ids == "")
		{
			alert("请选择至少一条记录");
			$("#marzServerManagerSubmit").val("0");
			return false;
		}
		
		// ajax调用删除action
		var options = { 
			url:"../mar/deleteMarzServer.action?ids=" + ids , // 提交给哪个执行
			type:'POST', 
			success: function(){
				alert("删除成功");
				// 执行成功刷新form
				query();
			},
			error:function(){ 
				alert("删除失败"); 
			}
		};
		
		// 确认操作
		$("#marzServerConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#marzServerConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
		return false;
	});
	 
	 // 启用按钮
	$( "#onMarzServer" ).button({
		icons: {
			primary: "ui-icon-check"
			}
		}).click(function() {
			$("#marzServerManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("marzServerId");
			for (var i=0; i<array.length; i++)
		   	{
		   		if (array[i].checked)
	  			{
		   			if (ids == "")
	   				{
		   				ids += array[i].value;
	   				}
		   			else
		   			{
		   				ids += "," + array[i].value;
		   			}
	  			}
		   	}
			
			// 操作验证
			if (ids == "")
			{
				alert("请选择至少一条记录");
				$("#marzServerManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../mar/changeStatusMarzServer.action?status=1&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#marzServerConfirm").ajaxSubmit(options);
			$("#marzServerManagerSubmit").val("0");
			return false;
	});
	 
	 // 停用按钮
	$( "#offMarzServer" ).button({
		icons: {
			primary: "ui-icon-close"
			}
		}).click(function() {
			$("#marzServerManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("marzServerId");
			for (var i=0; i<array.length; i++)
		   	{
		   		if (array[i].checked)
	  			{
		   			if (ids == "")
	   				{
		   				ids += array[i].value;
	   				}
		   			else
		   			{
		   				ids += "," + array[i].value;
		   			}
	  			}
		   	}
			
			// 操作验证
			if (ids == "")
			{
				alert("请选择至少一条记录");
				$("#marzServerManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../mar/changeStatusMarzServer.action?status=0&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#marzServerConfirm").ajaxSubmit(options);
			$("#marzServerManagerSubmit").val("0");
			return false;
	});
	
	 // 刷新按钮
	$( "#queryMarzServer" ).button().click(function() {
			query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearMarzServer" ).button().click(function() {
			$("#marzServerReq").clearForm();
		return false;
	});
	
	// 页面校验
	function marzServerFormCheck()
	{
		return true;
	}
});
</script>
