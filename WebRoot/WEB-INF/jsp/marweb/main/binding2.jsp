<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/common/TGKSHeaderList.inc.jsp" %>
  <div id="marzAccountBindingDiv" class="col-sm-12">
    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">
            <span class="glyphicon glyphicon-file" style="top: 2px;"></span>
            账号未绑定（请勿充值）
            <span class="panel-sys glyphicon pull-right" style="top: -7px;">
                <button type="button" id="bindAccountButton" class="btn btn-sm btn-default">绑定</button>
            </span>
            <span class="panel-sys glyphicon pull-right" style="padding-right:10px;">
                <a id="message" style="color:red;">${marzAccountEvt.remark }</a>
            </span>
        </h3>
      </div>
      <div class="panel-body">
        <table class="table table-hover" style="table-layout: fixed;">
            <tdody>
                <tr>
                    <th width="150px;">代码</th><td><input type="text" id="bandingAccountId" /></td>
                </tr>
            </tdody>
        </table>
      </div>
    </div>
  </div>
<script type="text/javascript">
$(document).ready(function(){
    $( "#bindAccountButton" ).click(function() {
            if ($("#bandingAccountId").val() == "")
            {
                alert("请填入绑定的账号ID");
                return false;
            }
            var options = { 
                url:"../marweb/marzAccountBinding.action?accountId=" + $("#bandingAccountId").val() , // 提交给哪个执行
                type:'POST', 
                success: function(result){
                    dealResult(result);
                    main();
                },
                error:function(){ 
                    alert("绑定失败"); 
                }
            };
            
            //$("#marzAccountBinding").ajaxSubmit(options);
            var table=$.ajax(options);
            $("#marzAccountBindingDiv").html(table.responseText);
            return false;
    });
    
    function dealResult(result)
    {
        if ("success!" == result)
        {
            alert("绑定成功");
        }
        else
        {
            alert("绑定失败");
        }
    }
});
</script>