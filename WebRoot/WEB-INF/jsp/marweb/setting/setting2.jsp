<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/jsp/marweb/MARZHeader.inc.jsp" %>
<div id="saveSettingDiv"  class="col-sm-12">
  <div class="panel panel-info">
    <div class="panel-heading">
      <h3 class="panel-title">
          <span class="glyphicon glyphicon-file" style="top: 2px;"></span>
          挂机设置
          <span class="panel-sys glyphicon pull-right" style="top: -7px;">
              <button type="button" id="saveSettingButton" class="btn btn-sm btn-info">保存</button>
          </span>
          <span class="panel-sys glyphicon pull-right" style="padding-right:10px;">
              <a id="message" style="color:red;">请在页面上配置挂机方案 点击保存按钮</a>
          </span>
      </h3>
    </div>
    <div class="panel-body">
      <ul class="nav nav-tabs" role="tablist">
              <li role="presentation" class="active">
                  <a href="#tabBattle" role="tab" data-toggle="tab" aria-expanded="true">战斗</a>
              </li>
              <li role="presentation">
                  <a href="#tabPvp" role="tab" data-toggle="tab" aria-expanded="false">PVP</a>
              </li>
              <li role="presentation">
                  <a href="#tabExplore" role="tab" data-toggle="tab" aria-expanded="false">探索</a>
              </li>
              <li role="presentation">
                  <a href="#tabCard" role="tab" data-toggle="tab" aria-expanded="false">卡片</a>
              </li>
              <li role="presentation">
                  <a href="#tabItem" role="tab" data-toggle="tab" aria-expanded="false">道具</a>
              </li>
            </ul>
            <div class="tab-content">
              <!-- TAB Battle start -->
              <div class="tab-pane fade active in" id="tabBattle">
                  <div>
                    <form id="saveSettingForm" action="../marweb/saveSetting.action">
                      <table class="table table-hover" style="table-layout: fixed;">
                          <tbody>
                              <tr>
                                  <th width="100px">战斗总开关</th>
                                  <td>
                                  <select id="marzSettingEvt.battle" name="marzSettingEvt.battle">
				                     <option value="0">关</option>
				                     <option value="1" <s:if test="marzSettingEvt.battle == 1">selected="selected"</s:if>>开</option>
				                  </select>
                                  </td>
                                  <th width="100px">优先练级</th>
                                  <td>
                                      <select id="marzSettingEvt.battleLevelUp" name="marzSettingEvt.battleLevelUp">
					                      <option value="0">关</option>
					                      <option value="1" <s:if test="marzSettingEvt.battleLevelUp == 1">selected="selected"</s:if>>开</option>
					                  </select>
                                  </td>
                                  <th width="100px">优先拿水晶</th>
                                  <td>
                                  <select id="marzSettingEvt.battleGetStone" name="marzSettingEvt.battleGetStone">
				                     <option value="0">关</option>
				                     <option value="1" <s:if test="marzSettingEvt.battleGetStone == 1">selected="selected"</s:if>>开</option>
				                  </select>
                                  </td>
                              </tr>
                              <tr>
                                  <th>不浪费BP</th>
                                  <td>
                                  <select id="marzSettingEvt.battleNowaste" name="marzSettingEvt.battleNowaste">
				                     <option value="0">关</option>
				                     <option value="1" <s:if test="marzSettingEvt.battleNowaste == 1">selected="selected"</s:if>>开</option>
				                  </select>
                                  </td>
                                  <th>不浪费副本</th>
                                  <td>
                                  <select id="marzSettingEvt.battleNowasteBossId" name="marzSettingEvt.battleNowasteBossId">
				                     <option value="0" <s:if test="marzSettingEvt.battleNowasteBossId == 0">selected="selected"</s:if>>每日限定素材</option>
				                     <s:iterator value="noWasteMapList" var="evt" status="idx">
				                        <s:if test="#evt.show == 1">
				                            <option value="<s:property value='#evt.bossId'/>" <s:if test="marzSettingEvt.battleNowasteBossId == #evt.bossId">selected="selected"</s:if>><s:property value='#evt.bossName'/></option>
				                        </s:if>
				                     </s:iterator>
				                   </select>
                                </td>
                              </tr>
                              <tr>
                                  <th>挂机副本</th>
                                  <td colspan="5">
                                      <table class="table table-hover">
                                          <tbody>
                                              <tr>
                                              <s:iterator value="allMapList" var="evt" status="idx">
                                                  <td>
                                               <s:if test="#evt.show == 1">
                                                 <input type="checkbox" name="marzSettingEvt.bossIds" value="<s:property value='#evt.bossId'/>" <s:if test="#evt.check == 1">checked="checked"</s:if> /> <s:property value='#evt.bossName'/>
                                               </s:if>
                                                  </td>
											    <s:if test="#idx.index > 0  && (#idx.index + 1)%5 == 0">
                                                  </tr>
                                                  <tr>
                                                </s:if>
                                              </s:iterator>
                                              </tr>
                                          </tbody>
                                      </table>
                                  </td>
                              </tr>
                          </tbody>
                      </table>
                  </div>
              </div>
              <!-- TAB Battle End -->
              <!-- TAB PVP Start -->
              <div class="tab-pane fade" id="tabPvp">
                  <div>
                      <table class="table table-hover" style="table-layout: fixed;">
                          <tbody>
                              <tr>
                                  <th width="100px">PVP</th>
                                  <td>
                                  <select id="marzSettingEvt.pvp" name="marzSettingEvt.pvp">
				                     <option value="0">关</option>
				                     <option value="1" <s:if test="marzSettingEvt.pvp == 1">selected="selected"</s:if>>开</option>
				                  </select>
                                  </td>
                              </tr>
                          </tbody>
                      </table>
                  </div>
              </div>
              <!-- TAB PVP End -->
              <!-- TAB Explore Start -->
              <div class="tab-pane fade" id="tabExplore">
                  <div>
                      <table class="table table-hover" style="table-layout: fixed;">
                          <tbody>
                              <tr>
                                  <th width="100px">自动探索</th>
                                  <td>
                                  <select id="marzSettingEvt.explore" name="marzSettingEvt.explore">
				                     <option value="0">关</option>
				                     <option value="1" <s:if test="marzSettingEvt.explore == 1">selected="selected"</s:if>>开</option>
				                  </select>
                                  </td>
                              </tr>
                          </tbody>
                      </table>
                  </div>
              </div>
              <!-- TAB Explore End -->
              <!-- TAB Card Start -->
              <div class="tab-pane fade" id="tabCard">
                  <div>
                      <table class="table table-hover" style="table-layout: fixed;">
                          <tbody>
                              <tr>
                                  <th width="100px">自动卖卡</th>
                                  <td>
                                      <select id="marzSettingEvt.cardSell" name="marzSettingEvt.cardSell">
                                           <option value="0">关</option>
                                           <option value="1" <s:if test="marzSettingEvt.cardSell == 1">selected="selected"</s:if>>开</option>
                                      </select>
                                  </td>
                                  <th width="100px">卖普通卡</th>
                                  <td>
                                      <select id="marzSettingEvt.cardSellCommon" name="marzSettingEvt.cardSellCommon">
                                           <option value="0">关</option>
                                           <option value="1" <s:if test="marzSettingEvt.cardSellCommon == 1">selected="selected"</s:if>>开</option>
                                      </select>
                                  </td>
                                  <th width="100px">喂狗粮</th>
                                  <td>
                                      <select id="marzSettingEvt.cardFusion" name="marzSettingEvt.cardFusion">
					                      <option value="0">关</option>
					                      <option value="1" <s:if test="marzSettingEvt.cardFusion == 1">selected="selected"</s:if>>开</option>
					                  </select>
                                  </td>
                              </tr>
                              <tr>
                                  <th>卖卡列表</th>
                                  <td colspan="5">
                                  <s:iterator value="sellCardList" var="evt" status="idx">
                                      <input type="checkbox" name="marzSettingEvt.sellCardIds" value="<s:property value='#evt.cardId'/>" <s:if test="#evt.check == 1">checked="checked"</s:if> /> <img width="35px" style="margin-right: 25px;" onerror="nofind();" src="../resources/mar/marweb/face/chr20_<s:property value="#evt.cardId"/>.png" title="<s:property value="#evt.name"/>" alt="<s:property value="#evt.name"/>" />
                                      <s:if test="(#idx.index + 1)%10 == 0"><br /></s:if>
                                  </s:iterator>
                                  </td>
                              </tr>
                              <tr>
                                  <th>名声合成</th>
                                  <td>
                                  <select id="marzSettingEvt.fameFusion" name="marzSettingEvt.fameFusion">
				                     <option value="0">关</option>
				                     <option value="1" <s:if test="marzSettingEvt.fameFusion == 1">selected="selected"</s:if>>开</option>
				                  </select>
                                  </td>
                              </tr>
                              <tr>
                                  <th>名声列表</th>
                                  <td colspan="5">
                                  <s:iterator value="fameCardList" var="evt" status="idx">
                                      <input type="checkbox" name="marzSettingEvt.fameCardIds" value="<s:property value='#evt.cardId'/>" <s:if test="#evt.check == 1">checked="checked"</s:if> /> <img width="35px" style="margin-right: 25px;" onerror="nofind();" src="../resources/mar/marweb/face/chr20_<s:property value="#evt.cardId"/>.png" title="<s:property value="#evt.name"/>" alt="<s:property value="#evt.name"/>" />
                                      <s:if test="(#idx.index + 1)%10 == 0"><br /></s:if>
                                  </s:iterator>
                                  </td>
                              </tr>
                          </tbody>
                      </table>
                  </div>
              </div>
              <!-- TAB Card End -->
              <!-- TAB Item Start -->
              <div class="tab-pane fade" id="tabItem">
                  <div>
                      <table class="table table-hover" style="table-layout: fixed;">
                          <tbody>
                              <tr>
                                  <th width="100px">自动吃药</th>
                                  <td>
                                      <select id="marzSettingEvt.autoUseBPPotion" name="marzSettingEvt.autoUseBPPotion">
					                      <option value="0">关</option>
					                      <option value="1" <s:if test="marzSettingEvt.autoUseBPPotion == 1">selected="selected"</s:if>>开</option>
					                  </select>
                                  </td>
                                  <th width="100px">BP低于时</th>
                                  <td>
                                      <select id="marzSettingEvt.autoUseBPPotionBPLimit" name="marzSettingEvt.autoUseBPPotionBPLimit">
					                      <option value="15" <s:if test="marzSettingEvt.autoUseBPPotionBPLimit == 15">selected="selected"</s:if>>15</option>
					                      <option value="25" <s:if test="marzSettingEvt.autoUseBPPotionBPLimit == 25">selected="selected"</s:if>>25</option>
					                      <option value="35" <s:if test="marzSettingEvt.autoUseBPPotionBPLimit == 35">selected="selected"</s:if>>35</option>
					                      <option value="45" <s:if test="marzSettingEvt.autoUseBPPotionBPLimit == 45">selected="selected"</s:if>>45</option>
					                  </select>
                                  </td>
                                  <th width="100px">药水类型</th>
                                  <td>
                                  <select id="marzSettingEvt.autoUseBPPotionItemId" name="marzSettingEvt.autoUseBPPotionItemId">
				                     <option value="">不选择</option>
				                     <s:iterator value="allBPRecoverList" var="evt" status="idx">
				                        <option value="<s:property value='#evt.itemId'/>" <s:if test="marzSettingEvt.autoUseBPPotionItemId == #evt.itemId">selected="selected"</s:if>><s:property value='#evt.name' /></option>
				                     </s:iterator>
				                  </select>
                                  </td>
                              </tr>
                              <tr>
                                  <th>自动买药</th>
                                  <td>
                                  <select id="marzSettingEvt.autoBuyBPPotion" name="marzSettingEvt.autoBuyBPPotion">
				                     <option value="0">关</option>
				                     <option value="1" <s:if test="marzSettingEvt.autoBuyBPPotion == 1">selected="selected"</s:if>>开</option>
				                  </select>
                                  </td>
                                  <th>自动抽硬币</th>
                                  <td>
                                  <select id="marzSettingEvt.coinGacha" name="marzSettingEvt.coinGacha">
				                     <option value="0">关</option>
				                     <option value="1" <s:if test="marzSettingEvt.coinGacha == 1">selected="selected"</s:if>>开</option>
				                  </select>
                                  </td>
                                  <th>硬币类型</th>
                                  <td>
                                  <select id="marzSettingEvt.coinGachaGachaId" name="marzSettingEvt.coinGachaGachaId">
					                    <option value="">不选择</option>
					                    <s:iterator value="allCoinGachaList" var="evt" status="idx">
					                        <option value="<s:property value='#evt.param'/>" <s:if test="marzSettingEvt.coinGachaGachaId == #evt.param">selected="selected"</s:if>><s:property value='#evt.gachaName'/></option>
					                    </s:iterator>
					                </select>
                                  </td>
                              </tr>
                          </tbody>
                      </table>
                    </form>
                  </div>
              </div>
              <!-- TAB Item End -->
            </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function(){    
    $("#saveSettingButton").click(function(){
        var options = { 
            url:"../marweb/saveSetting.action",
            data:$("#saveSettingForm").serialize(),
            type:'POST', 
            success: function(result){
                document.getElementById("message").innerHTML= "挂机设置保存成功";
            },
            error: function(result){ 
                document.getElementById("message").innerHTML= "挂机设置保存失败";
            }
        };
        var table=$.ajax(options);
        $("#saveSettingForm").html(table.responseText);
        return false;
    });
});
</script>