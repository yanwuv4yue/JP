<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" id="marzNoticeListSubmit" name="marzNoticeListSubmit" value="0" />
<div id="marzNoticeTableDiv" class="ui-widget">
    <table id="marzNoticeTable" class="ui-widget ui-widget-content">
        <thead>
            <tr class="ui-widget-header ">
                <th width="20"><input type="checkbox" id="allMarzNoticeId" name="allMarzNoticeId"  /></th>
                <th>ID</th>
                <th>标题</th>
                <th>级别</th>
                <th>创建时间</th>
            </tr>
        </thead>
        <tbody>
			<s:iterator  value="list" var="evt">
				<tr>
					<td width="20"><input type="checkbox" name="marzNoticeId" value="<s:property value='#evt.id'/>" /></td>
					<td><b id="<s:property value='#evt.id'/>" class="marzNoticeUpdate"><s:property value="#evt.id"/></b></td>
                    <td>
                        <s:if test="#evt.url == ''">
                            <a><s:property value='#evt.title' escapeHtml="false" /></a>
                        </s:if>
                        <s:elseif test="#evt.url != ''">
                            <a href="#" onclick="window.open('<s:property value='#evt.url'/>')"><s:property value='#evt.title' escapeHtml="false" /></a>
                        </s:elseif>
                    </td>
                    <td>
                        <s:if test="#evt.level == 0">
                            普通
                        </s:if>
                        <s:elseif test="#evt.level == 1">
                            重要
                        </s:elseif>
                    </td>
                    <td><s:date name="#evt.createTime" format="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
			</s:iterator>
		</tbody>
    </table>
</div>
<script type="text/javascript">
	$(function() {
		$('#marzNoticeTable').longtable({
			'perPage' : 10
		});

		// 点击记录首栏进入更新操作
		$(".marzNoticeUpdate").click(function() {
			$("#marzNoticeManagerSubmit").val("1");
			$("#marzNoticeEdit").dialog("open");
			var edit = $.ajax({
				url : "../mar/editMarzNoticePage.action?id=" + this.id,
				async : false
			});
			$("#marzNoticeForm").html(edit.responseText);
		});

		// 全选
		$("#allMarzNoticeId").click(function() {
			var checkbox = $("#marzNoticeTable :checkbox");
			for ( var i = 1; i < checkbox.length; i++) {
				if (checkbox[i].hidden == "") {
					checkbox[i].checked = checkbox[0].checked;
				}
			}
		});
	});
</script>
