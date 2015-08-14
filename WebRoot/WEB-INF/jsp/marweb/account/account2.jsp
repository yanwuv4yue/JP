<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/marweb/MARZHeader.inc.jsp" %>
  <div id="accountDiv" class="col-sm-12">
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">
            <span class="glyphicon glyphicon-file" style="top: 2px;"></span>
            基本信息
            <span class="panel-sys glyphicon pull-right" style="top: -7px;">
                <button type="button" id="refrushButton" class="btn btn-sm btn-default">刷新</button>
            </span>
            <span class="panel-sys glyphicon pull-right" style="padding-right:10px;">
                <a id="message" style="color:white;">${marzAccountEvt.remark }</a>
            </span>
        </h3>
      </div>
      <div class="panel-body">
        <table class="table table-hover" style="table-layout: fixed;">
            <tdody>
                <tr>
                    <th width="100px;">角色名</th><td>${marzAccountEvt.name }</td>
                    <th width="100px;">状态</th>
		            <td>
			            <s:if test="marzAccountEvt.status == 0">离线 <a id="onlineButton" href="#"><span class="badge">登录</span></a></s:if>
		                <s:elseif test="marzAccountEvt.status == 1">在线 <a id="offlineButton" href="#"><span class="badge">退出</span></a></s:elseif>
		            </td>
                    <th width="100px;">VIP</th>
		            <td>
		                <s:if test="marzAccountEvt.vip == 0">试用</s:if>
		                <s:if test="marzAccountEvt.vip == 1">普通</s:if>
		                <s:if test="marzAccountEvt.vip == 2">白金</s:if>
		                <s:if test="marzAccountEvt.vip == 3">钻石</s:if>
		            </td>
                </tr>
                <tr>
                    <th>等级</th><td>${marzAccountEvt.lv }</td>
                    <th>水晶</th><td>${marzAccountEvt.coin }</td>
                    <th>AP</th><td>${marzAccountEvt.ap }/${marzAccountEvt.apMax }</td>
                </tr>
                <tr>
                    <th>卡片</th><td>${marzAccountEvt.cardNum }/${marzAccountEvt.cardMax }</td>
                    <th>金钱</th><td>${marzAccountEvt.gold }</td>
                    <th>BP</th><td>${marzAccountEvt.bp }/${marzAccountEvt.bpMax }</td>
                </tr>
                <tr>
                    <th>友情点</th><td>${marzAccountEvt.fp }</td>
                    <th>到期时间</th><td><s:date name="marzAccountEvt.endTime" format="yyyy-MM-dd HH:mm:ss"/></td>
                    <th>PVP等级</th><td>?</td>
                </tr>
                <tr>
                    <th>售卡列表</th><td style="word-wrap: break-word;" colspan="5">${marzAccountEvt.sellCardIds }</td>
                </tr>
                <tr>
                    <th>名声列表</th><td style="word-wrap: break-word;" colspan="5">${marzAccountEvt.fameCardIds }</td>
                </tr>
                <tr>
                    <th>道具信息</th><td style="word-wrap: break-word;" colspan="5">${marzAccountEvt.itemInfo }</td>
                </tr>
                <tr>
                    <th>战斗地图</th><td style="word-wrap: break-word;" colspan="5">${marzAccountEvt.bossIds }</td>
                </tr>
            </tdody>
        </table>
      </div>
    </div>
  </div>
<script type="text/javascript">
$(document).ready(function(){
    $("#onlineButton").click(function(){
        var options = { 
                url:"../marweb/accountOnline.action", // 提交给哪个执行
                type:'POST', 
                success: function(){
                    // 执行成功刷新form
                    var table=$.ajax({url:"../marweb/queryMarzAccountByTgksId.action", async:false});
                    $("#mainDiv").html(table.responseText);
                    $("#mainDiv").html(table.responseText);
                },
                error:function(){ 
                    alert("操作失败"); 
                }
            };
            
        //$("#accountDiv").ajaxSubmit(options);
        var table=$.ajax(options);
        $("#accountDiv").html(table.responseText);
        return false;
    });
    
    $("#offlineButton").click(function(){
        var options = { 
                url:"../marweb/accountOffline.action", // 提交给哪个执行
                type:'POST', 
                success: function(){
                    // 执行成功刷新form
                    var table=$.ajax({url:"../marweb/queryMarzAccountByTgksId.action", async:false});
                    $("#mainDiv").html(table.responseText);
                    $("#mainDiv").html(table.responseText);
                },
                error:function(){ 
                    alert("操作失败"); 
                }
            };
            
        //$("#accountDiv").ajaxSubmit(options);
        var table=$.ajax(options);
        $("#accountDiv").html(table.responseText);
        return false;
    });
    
    $("#refrushButton").click(function(){
        var table=$.ajax({url:"../marweb/queryMarzAccountByTgksId.action", async:false});
        $("#mainDiv").html(table.responseText);
        $("#mainDiv").html(table.responseText);
    });
});
</script>