<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<input type="hidden" name="marzNoticeEvt.id" id="marzNoticeId" value="${marzNoticeEvt.id }" />
<table>
    <tr>
        <td>标题</td>
        <td><input type="text" name="marzNoticeEvt.title" id="marzNoticeTitle" class="text ui-widget-content ui-corner-all" value="${marzNoticeEvt.title }" /></td>
    </tr>
    <tr>
        <td>URL</td>
        <td><input type="text" name="marzNoticeEvt.url" id="marzNoticeUrl" class="text ui-widget-content ui-corner-all" value="${marzNoticeEvt.url }" /></td>
    </tr>
    <tr>
        <td>级别</td>
        <td>
            <select name="marzNoticeEvt.level">
                <option value="0" <s:if test='marzNoticeEvt.level== 0"'>selected="selected"</s:if>>普通</option>
                <option value="1" <s:if test='marzNoticeEvt.level=="1"'>selected="selected"</s:if>>重要</option>
            </select>
        </td>
    </tr>
</table>
<script type="text/javascript">
</script>