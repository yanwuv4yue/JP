<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<!--
                       ::
                      :;J7, :,                        ::;7:
                      ,ivYi, ,                       ;LLLFS:
                      :iv7Yi                       :7ri;j5PL
                     ,:ivYLvr                    ,ivrrirrY2X,
                     :;r@Wwz.7r:                :ivu@kexianli.
                    :iL7::,:::iiirii:ii;::::,,irvF7rvvLujL7ur
                   ri::,:,::i:iiiiiii:i:irrv177JX7rYXqZEkvv17
                ;i:, , ::::iirrririi:i:::iiir2XXvii;L8OGJr71i
              :,, ,,:   ,::ir@mingyi.irii:i:::j1jri7ZBOS7ivv,
                 ,::,    ::rv77iiiriii:iii:i::,rvLq@huhao.Li
             ,,      ,, ,:ir7ir::,:::i;ir:::i:i::rSGGYri712:
           :::  ,v7r:: ::rrv77:, ,, ,:i7rrii:::::, ir7ri7Lri
          ,     2OBBOi,iiir;r::        ,irriiii::,, ,iv7Luur:
        ,,     i78MBBi,:,:::,:,  :7FSL: ,iriii:::i::,,:rLqXv::
        :      iuMMP: :,:::,:ii;2GY7OBB0viiii:i:iii:i:::iJqL;::
       ,     ::::i   ,,,,, ::LuBBu BBBBBErii:i:i:i:i:i:i:r77ii
      ,       :       , ,,:::rruBZ1MBBqi, :,,,:::,::::::iiriri:
     ,               ,,,,::::i:  @arqiao.       ,:,, ,:::ii;i7:
    :,       rjujLYLi   ,,:::::,:::::::::,,   ,:i,:,,,,,::i:iii
    ::      BBBBBBBBB0,    ,,::: , ,:::::: ,      ,,,, ,,:::::::
    i,  ,  ,8BMMBBBBBBi     ,,:,,     ,,, , ,   , , , :,::ii::i::
    :      iZMOMOMBBM2::::::::::,,,,     ,,,,,,:,,,::::i:irr:i:::,
    i   ,,:;u0MBMOG1L:::i::::::  ,,,::,   ,,, ::::::i:i:iirii:i:i:
    :    ,iuUuuXUkFu7i:iii:i:::, :,:,: ::::::::i:i:::::iirr7iiri::
    :     :rk@Yizero.i:::::, ,:ii:::::::i:::::i::,::::iirrriiiri::,
     :      5BMBBBBBBSr:,::rv2kuii:::iii::,:i:,, , ,,:,:i@petermu.,
          , :r50EZ8MBBBBGOBBBZP7::::i::,:::::,: :,:,::i;rrririiii::
              :jujYY7LS0ujJL7r::,::i::,::::::::::::::iirirrrrrrr:ii:
           ,:  :@kevensun.:,:,,,::::i:i:::::,,::::::iir;ii;7v77;ii;i,
           ,,,     ,,:,::::::i:iiiii:i::::,, ::::iiiir@xingjief.r;7:i,
        , , ,,,:,,::::::::iiiiiiiiii:,:,:::::::::iiir;ri7vL77rrirri::
         :,, , ::::::::i:::i:::i:i::,,,,,:,::i:i:::iir;@Secbone.ii:::
         
-->
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>乖离性MA 日服挂机 账号托管系统——猫萌公社</title>
    <meta charset="utf-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0"> 
    <meta http-equiv="keywords" content="幻影帝国,猫盟公社,乖离性MA,账号托管,挂机">
    <link href="https://d2e1xl20cw0m26.cloudfront.net/pre/assets/favicon-5862cadf3d85c514f2068142cfb97eb3.ico" rel="icon" type="image/png">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <%@ include file="/WEB-INF/jsp/marweb/main/toolbar.jsp" %>
    </nav>

    <div class="container theme-showcase" role="main">
        <!-- 公告信息div -->
        <div id="noticeDiv" class="row">
          <div class="col-sm-12">
            <div class="panel panel-danger">
              <div class="panel-heading">
                <h3 class="panel-title">
                    <span class="glyphicon glyphicon-bullhorn" style="top: 2px;"></span>
                    公告信息
                </h3>
              </div>
              <div class="panel-body">
                _(:з」∠)_ 我是公告 但是不太想说啥...
              </div>
            </div>
          </div>
        </div>
        
        <!-- 基本信息div -->
        <div id="mainDiv" class="row">
            _(:з」∠)_ 我是主界面
        </div>
        
            
        <!-- 日志信息div -->
        <div id="logDiv" class="row">
            _(:з」∠)_ 我是日志
        </div>
            
    </div> <!-- /container -->

    <img src="http://i1.tietuku.com/636cbc19cf96d2f5.png" style="position: fixed; right: 0; bottom: 0; z-index: 9999;" onclick="$(this).hide();">
    <!-- Bootstrap core JavaScript -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script language="javascript" type="text/javascript">
         main();
         log();
         
         function main()
         {
             var table=$.ajax({url:"../marweb/queryMarzAccountByTgksId.action", async:false});
             $("#mainDiv").html(table.responseText);
         }
         
         function log()
         {
             var table=$.ajax({url:"../marweb/queryMarzLogByTgksId.action", async:false});
             $("#logDiv").html(table.responseText);
         }
         
         function nofind()
         {
             var img=event.srcElement;
             img.src="../resources/mar/marweb/face/default.png";
             img.onerror=null;
         }
    </script>
  </body>
</html>