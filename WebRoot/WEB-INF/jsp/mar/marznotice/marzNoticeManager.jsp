<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderManager.inc.jsp" %>
<style type="text/css">
#marzNoticeReq{border:0px solid;}
#marzNoticeReq td{border:0px solid;}
#marzNoticeReq input{width:120px;}
#marzNoticeReq select{width:120px;}
</style>
<input type="hidden" id="marzNoticeManagerSubmit" name="marzNoticeManagerSubmit" value="0" />
<div class="ui-widget">
	<form id="marzNoticeReq" action="../mar/queryMarzNotice.action" method="post">
		<table>
			<tr>
				<td><label>标题: </label></td><td><input type="text" name="marzNoticeReq.title" /></td>
				<td>
				
				</td>
				<td>
				<button id="clearMarzNotice">重置</button>
				<button id="queryMarzNotice">查询</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<button id="addMarzNotice">新增</button>
<button id="deleteMarzNotice">删除</button>

<div id="marzNoticeDiv"></div>

<div id="marzNoticeEdit" title="MarzNotice Edit">
	<form id="marzNoticeForm" action="../mar/editMarzNotice.action" method="post"></form>
</div>

<div id="marzNoticeConfirm" title="操作确认" hidden="hidden">
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>记录将被删除且不可恢复，是否确认？</p>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var table=$.ajax({url:"../mar/queryMarzNotice.action",async:false});
	$("#marzNoticeDiv").html(table.responseText);
	
	function query()
	{
		var table=$.ajax({url:"../mar/queryMarzNotice.action", data:$("#marzNoticeReq").formSerialize(), async:false});
		$("#marzNoticeDiv").html(table.responseText);
	}
	
	// 新增/更新窗口
	$( "#marzNoticeEdit" ).dialog({
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
				if (!marzNoticeFormCheck())
				{
					return false;
				}
				var form = $("#marzNoticeForm");
				form.submit();
			}, 
			"关闭": function()
			{
				$("#marzNoticeManagerSubmit").val("0");
				$("#marzNoticeEdit").dialog("close"); 
			} 
		}
	});
	
	// 提交表单
	$("#marzNoticeForm").submit(function()
	{
		if ($("#marzNoticeManagerSubmit").val() == "0")
		{
			return false;
		}
		
		$("#marzNoticeManagerSubmit").val("0");
		
		var options = { 
			url:"../mar/editMarzNotice.action", // 提交给哪个执行
			type:'POST', 
			success: function(){
				$("#marzNoticeEdit").dialog("close");
				// 新增完毕刷新form
				query();
				alert("操作成功");
			},
			error:function(){ 
				$("#marzNoticeEdit").dialog("close"); 
				alert("操作失败"); 
			}
		};
		
		$("#marzNoticeForm").ajaxSubmit(options);
		
		return false; // 为了不刷新页面,返回false，反正都已经在后台执行完了，没事！
	});  
	
	// 新增按钮
	$( "#addMarzNotice" ).button({
		icons: {
			primary: "ui-icon-plus"
			}
		}).click(function() {
		// 请求提交标志
		$("#marzNoticeManagerSubmit").val("1");
		$( "#marzNoticeEdit" ).dialog( "open" );
		var edit=$.ajax({url:"../mar/editMarzNoticePage.action",async:false});
		$("#marzNoticeForm").html(edit.responseText);
		return false;
	});
	
	 // 删除按钮
	$( "#deleteMarzNotice" ).button({
		icons: {
			primary: "ui-icon-minus"
			}
		}).click(function() {
		$("#marzNoticeManagerSubmit").val("1");
		// 获取选中的记录ids
		var ids = "";
		var array = document.getElementsByName("marzNoticeId");
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
			$("#marzNoticeManagerSubmit").val("0");
			return false;
		}
		
		// ajax调用删除action
		var options = { 
			url:"../mar/deleteMarzNotice.action?ids=" + ids , // 提交给哪个执行
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
		$("#marzNoticeConfirm").dialog({
			resizable: false,
            height:160,
            modal: true,
            buttons: {
                "确认": function() {
                	$( this ).dialog( "close" );
                	// 异步请求删除操作
                	$("#marzNoticeConfirm").ajaxSubmit(options);
                },
                "取消": function() {
                    $( this ).dialog( "close" );
                }
            }
		});
		return false;
	});
	 
	 // 启用按钮
	$( "#onMarzNotice" ).button({
		icons: {
			primary: "ui-icon-check"
			}
		}).click(function() {
			$("#marzNoticeManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("marzNoticeId");
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
				$("#marzNoticeManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../mar/changeStatusMarzNotice.action?status=1&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#marzNoticeConfirm").ajaxSubmit(options);
			$("#marzNoticeManagerSubmit").val("0");
			return false;
	});
	 
	 // 停用按钮
	$( "#offMarzNotice" ).button({
		icons: {
			primary: "ui-icon-close"
			}
		}).click(function() {
			$("#marzNoticeManagerSubmit").val("1");
			// 获取选中的记录ids
			var ids = "";
			var array = document.getElementsByName("marzNoticeId");
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
				$("#marzNoticeManagerSubmit").val("0");
				return false;
			}
			
			// ajax调用删除action
			var options = { 
				url:"../mar/changeStatusMarzNotice.action?status=0&ids=" + ids , // 提交给哪个执行
				type:'POST', 
				success: function(){
					// 执行成功刷新form
					query();
				},
				error:function(){ 
					alert("操作失败"); 
				}
			};
			
			$("#marzNoticeConfirm").ajaxSubmit(options);
			$("#marzNoticeManagerSubmit").val("0");
			return false;
	});
	
	 // 刷新按钮
	$( "#queryMarzNotice" ).button().click(function() {
			query();
		return false;
	});
	 
	// 重置按钮
	$( "#clearMarzNotice" ).button().click(function() {
			$("#marzNoticeReq").clearForm();
		return false;
	});
	
	// 页面校验
	function marzNoticeFormCheck()
	{
		return true;
	}
});
</script>
