<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" name="marzServerEvt.id" id="marzServerId" value="${marzServerEvt.id }" />
<input type="hidden" name="marzServerEvt.updateTime" id="marzServerUpdateTime value="${marzServerEvt.updateTime }" />
<table>
	<tr>
		<td>服务器名称</td>
		<td><input type="text" name="marzServerEvt.serverName" id="marzServerServerName" value="${marzServerEvt.serverName }" /></td>
		<td>用户数量</td>
		<td><input type="text" name="marzServerEvt.userNum" id="marzServerUserNum" value="${marzServerEvt.userNum }" /></td>
	</tr>
	<tr>
		<td>状态</td>
		<td>
            <select name="marzServerEvt.status">
                <option value="0" <s:if test="marzServerEvt.status == 0">selected="selected"</s:if>>已停止</option>
                <option value="1" <s:if test="marzServerEvt.status == 1">selected="selected"</s:if>>启动中</option>
             </select>
        </td>
		<td>分流</td>
		<td>
            <select name="marzServerEvt.accept">
                <option value="0" <s:if test="marzServerEvt.accept == 0">selected="selected"</s:if>>禁止</option>
                <option value="1" <s:if test="marzServerEvt.accept == 1">selected="selected"</s:if>>允许</option>
             </select>
        </td>
	</tr>
	<tr>
		<td>本地IP</td>
		<td><input type="text" name="marzServerEvt.loaclIp" id="marzServerLoaclIp" value="${marzServerEvt.loaclIp }" /></td>
		<td>外网IP</td>
		<td><input type="text" name="marzServerEvt.netIp" id="marzServerNetIp" value="${marzServerEvt.netIp }" /></td>
	</tr>
</table>
<script type="text/javascript">
</script>