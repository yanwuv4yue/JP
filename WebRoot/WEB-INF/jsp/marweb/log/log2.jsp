<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/marweb/MARZHeader.inc.jsp" %>
<link rel="stylesheet" type="text/css" href="../resources/css/common/form/tgks_pagination.css" />
<script src="../js/common/form/tgks_table.js"></script>
  <div id="marzLogTableDiv" class="col-sm-12">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title">
            <span class="glyphicon glyphicon-comment" style="top: 2px;"></span>
            挂机日志
            <span class="panel-sys glyphicon pull-right" style="top: -7px;">
                <button type="button" id="queryLogButton" class="btn btn-sm btn-primary">刷新</button>
            </span>
        </h3>
      </div>
      <div class="panel-body">
        <table id="marzLogTable" class="table table-hover">
            <thead>
              <tr>
                <th>操作时间</th>
                <th>类型</th>
                <th>日志信息</th>
              </tr>
            </thead>
            <tdody>
        <s:iterator  value="list" var="evt">
                <tr>
                    <td width="150px;"><s:date name="#evt.createTime" format="yyyy-MM-dd HH:mm:ss"/></td>
                    <td width="50px;">
                            <s:if test="#evt.type == 0">
                                系统
                            </s:if>
                            <s:elseif test="#evt.type == 1">
                                战斗
                            </s:elseif>
                            <s:elseif test="#evt.type == 2">
                                探索
                            </s:elseif>
                            <s:elseif test="#evt.type == 3">
                                道具
                            </s:elseif>
                            <s:elseif test="#evt.type == 4">
                                合成
                            </s:elseif>
                            <s:elseif test="#evt.type == 5">
                                出售
                            </s:elseif>
                            <s:elseif test="#evt.type == 6">
                                PVP
                            </s:elseif>
                            <s:elseif test="#evt.type == 7">
                                抽卡
                            </s:elseif>
                            <s:elseif test="#evt.type == 9">
                                充值
                            </s:elseif>
		            </td>
		            <td style="word-wrap: break-word;"><s:property value='#evt.info' escapeHtml="false" /></td>
                </tr>
            </s:iterator>
            </tdody>
        </table>
      </div>
    </div>
  </div>
<script type="text/javascript">
$(function() {
    $("#queryLogButton").click(function(){
        var table=$.ajax({url:"../marweb/queryMarzLogByTgksId.action", async:false});
        $("#logDiv").html(table.responseText);
        $("#logDiv").html(table.responseText);
    });
    
    if ($("tfoot").length == 0)
    {
	    $("#marzLogTable").longtable({
	        "perPage" : 10
	    });
    }
});
</script>
