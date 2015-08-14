<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/marweb/MARZHeader.inc.jsp" %>
<input id="tgksId" type="hidden" value="#session.user_info.username"/>
<div class="container">
  <div class="navbar-header">
      <ul class="nav navbar-nav">
      <li><a>欢迎登陆：<s:property value="#session.user_info.username"/></a></li>
    </ul>
  </div>
  <div id="navbar" class="navbar-collapse collapse">
    <ul class="nav navbar-nav">
      <li class="single active"><a id="marzOfflineGuaji" href="#">首页</a></li>
      <li class="single"><a id="marzSettingPageA" href="#">挂机设置</a></li>
      <li class="single"><a id="marzCardUsePageA" href="#">点卡充值</a></li>
      <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">购买 <span class="caret"></span></a>
          <ul class="dropdown-menu">
          <li><a href="#" onclick="window.open('http://item.taobao.com/item.htm?id=44113254052')">购买月卡</a></li>
          <li role="separator" class="divider"></li>
          <li><a href="#" onclick="window.open('http://item.taobao.com/item.htm?id=44170824620')">购买周卡</a></li>
          <li role="separator" class="divider"></li>
          <li><a href="#" onclick="window.open('http://item.taobao.com/item.htm?id=44171112012')">购买日卡</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">其他 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#" onclick="window.open('http://www.moemao.com/index.php/marweb-help')">挂机说明</a></li>
          <li role="separator" class="divider"></li>
          <li><a href="#" onclick="window.open('http://www.kairisei-ma.jp/')">活动公告</a></li>
          <li role="separator" class="divider"></li>
          <li><a href="#" onclick="window.open('http://tieba.baidu.com/f?kw=%E4%B9%96%E7%A6%BB%E6%80%A7ma&ie=utf-8&fr=wwwt')">百度贴吧</a></li>
          <li role="separator" class="divider"></li>
          <li><a href="#" onclick="window.open('http://www.moemao.com')">卡组模拟器</a></li>
        </ul>
      </li>
      <li><a></a></li>
      <li><a href="<%=basePath%>marweb">离开</a></li>
    </ul>
  </div><!--/.nav-collapse -->
</div>

<script type="text/javascript">
$(document).ready(function(){
    //  顶部工具栏选中class
    $("ul.navbar-nav li.single").click(function(){
        $("ul.navbar-nav li.single").attr("class", "single");
        $(this).attr("class", "single active");
    });
    
    $("#marzOfflineGuaji").click(function(){
        var table=$.ajax({url:"../marweb/queryMarzAccountByTgksId.action", async:false});
        $("#mainDiv").html(table.responseText);
        var table2=$.ajax({url:"../marweb/queryMarzLogByTgksId.action", async:false});
        $("#logDiv").html(table2.responseText);
    });
    
    $("#marzSettingPageA").click(function(){
        var table=$.ajax({url:"../marweb/settingPage.action", async:false});
        $("#mainDiv").html(table.responseText);
        var table2=$.ajax({url:"../marweb/queryMarzLogByTgksId.action", async:false});
        $("#logDiv").html(table2.responseText);
    });
    
    $("#marzCardUsePageA").click(function(){
        var table=$.ajax({url:"../marweb/marzCardUsePage.action", async:false});
        $("#mainDiv").html(table.responseText);
        var table2=$.ajax({url:"../marweb/queryMarzLogByTgksIdOnlyMarzCard.action", async:false});
        $("#logDiv").html(table2.responseText);
    });
    
    // 页面禁止右键
   $(document).bind("contextmenu",function(e){  
        return false;  
    }); 
});
</script>