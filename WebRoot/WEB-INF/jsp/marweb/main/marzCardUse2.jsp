<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/marweb/MARZHeader.inc.jsp" %>
  <div id="marzCardUseDiv" class="col-sm-12">
    <div class="panel panel-success">
      <div class="panel-heading">
        <h3 class="panel-title">
            <span class="glyphicon glyphicon-file" style="top: 2px;"></span>
            点卡充值
            <span class="panel-sys glyphicon pull-right" style="top: -7px;">
                <button type="button" id="marzCardUseButton" class="btn btn-sm btn-success">充值</button>
            </span>
            <span class="panel-sys glyphicon pull-right" style="padding-right:10px;">
                <a id="message" style="color:red;">请在框中输入点卡号码 点击充值按钮</a>
            </span>
        </h3>
      </div>
      <div class="panel-body">
        <table class="table table-hover" style="table-layout: fixed;">
            <tdody>
                <tr>
                    <th width="100px;">点卡号码</th>
                    <td>
                        <input type="text" id="marzCardUsePassword" />
                    </td>
                </tr>
            </tdody>
        </table>
      </div>
    </div>
  </div>
<script type="text/javascript">
$(document).ready(function(){
    $( "#marzCardUseButton" ).click(function() {
        if ($("#marzCardUsePassword").val() == "")
        {
            document.getElementById("message").innerHTML= "请填入点卡号码";
            return false;
        }
        
        var options = { 
            url:"../marweb/marzCardUse.action?password=" + $("#marzCardUsePassword").val() , // 提交给哪个执行
            type:'POST', 
            success: function(result){
                dealResult(result);
                var table2=$.ajax({url:"../marweb/queryMarzLogByTgksIdOnlyMarzCard.action", async:false});
                $("#logDiv").html(table2.responseText);
            },
            error:function(){ 
                document.getElementById("message").innerHTML= "充值失败";
            }
        };
        
        var table=$.ajax(options);
        $("#marzCardUseDiv").html(table.responseText);
        var table2=$.ajax({url:"../marweb/queryMarzLogByTgksIdOnlyMarzCard.action", async:false});
        $("#logDiv").html(table2.responseText);
        return false;
    });
    
    function dealResult(result)
    {
        if ("success!" == result)
        {
            document.getElementById("message").innerHTML= "充值成功";
        }
        else
        {
            document.getElementById("message").innerHTML= "点卡错误或已使用";
            return false;
        }
    }
});
</script>