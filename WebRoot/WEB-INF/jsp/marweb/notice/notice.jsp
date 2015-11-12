<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
<div id="marzNoticeTableDiv" class="ui-widget">
    <table id="marzNoticeTable">
        <thead>
              <tr>
                <th>发布时间</th>
                <th>公告内容</th>
              </tr>
            </thead>
        <tbody>
            <s:iterator  value="list" var="evt">
                <tr>
                    <td width="150px;"><s:date name="#evt.createTime" format="yyyy-MM-dd HH:mm:ss"/></td>
		            <td>
                        <s:if test="#evt.url == ''">
                            <a href="#"><s:property value='#evt.title' escapeHtml="false" /></a>
                        </s:if>
                        <s:elseif test="#evt.url != ''">
                            <a href="#" onclick="window.open('<s:property value='#evt.url'/>')"><s:property value='#evt.title' escapeHtml="false" /></a>
                        </s:elseif>
                    </td>
                </tr>
            </s:iterator>
            </tdody>
        </table>
      </div>
    </div>
  </div>
<script type="text/javascript">
$(function() {
    $('#marzNoticeTable').longtable({
        'perPage' : 5
    });
});
</script>
  