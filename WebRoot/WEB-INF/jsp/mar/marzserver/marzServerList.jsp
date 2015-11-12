<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" id="marzServerListSubmit" name="marzServerListSubmit" value="0" />
<div id="marzServerTableDiv" class="ui-widget">
    <table id="marzServerTable" class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
                <th width="20"><input type="checkbox" id="allMarzServerId" name="allMarzServerId"  /></th>
				<th>服务器名称</th>
				<th>用户数量</th>
				<th>状态</th>
				<th>分流</th>
				<th>本地IP</th>
				<th>外网IP</th>
				<th>更新时间</th>
            </tr>
        </thead>
        <tbody>
			<s:iterator  value="list" var="evt">
				<tr <s:if test="#evt.status == 0 || #evt.accept == 0">style="background-color: #ddd"</s:if>>
					<td width="20"><input type="checkbox" name="marzServerId" value="<s:property value='#evt.id'/>" /></td>
					<td><b id="<s:property value='#evt.id'/>" class="marzServerUpdate"><s:property value="#evt.serverName"/></b></td>
					<td><s:property value="#evt.userNum"/></td>
					<td>
						<s:if test="#evt.status == 0">已停止</s:if>
                        <s:elseif test="#evt.status == 1">启动中</s:elseif>
					</td>
					<td>
						<s:if test="#evt.accept == 0">禁止</s:if>
                        <s:elseif test="#evt.accept == 1">允许</s:elseif>
					</td>
					<td><s:property value="#evt.loaclIp"/></td>
                    <td><s:property value="#evt.netIp"/></td>
                    <td><s:date name="#evt.updateTime" format="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
			</s:iterator>
		</tbody>
    </table>
</div>
<script type="text/javascript">
	$(function() {
		$('#marzServerTable').longtable({
			'perPage' : 10
		});

		// 点击记录首栏进入更新操作
		$(".marzServerUpdate").click(function() {
			$("#marzServerManagerSubmit").val("1");
			$("#marzServerEdit").dialog("open");
			var edit = $.ajax({
				url : "../mar/editMarzServerPage.action?id=" + this.id,
				async : false
			});
			$("#marzServerForm").html(edit.responseText);
		});

		// 全选
		$("#allMarzServerId").click(function() {
			var checkbox = $("#marzServerTable :checkbox");
			for ( var i = 1; i < checkbox.length; i++) {
				if (checkbox[i].hidden == "") {
					checkbox[i].checked = checkbox[0].checked;
				}
			}
		});
	});
</script>
