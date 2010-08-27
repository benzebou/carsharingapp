<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div id="list2"> 
	<s:iterator value="listMessageReceive" id="listMessageReceive" >
	 	<h3>
	 		<a href="#" title="<s:property value="%{#listMessageReceive.message.id}" />"
				<s:if test="%{#listMessageReceive.message.isRead==0}"> 
				style="font-weight:bold;"
				</s:if>
			>

	    			<s:property value="%{#listMessageReceive.customerAccount.firstName}" />
		    		<s:property value="%{#listMessageReceive.message.dateTimeWrited}" />
		    		<s:property value="%{#listMessageReceive.message.title}" />
	 		</a>
	 	</h3>

		<div class="content" >
			<s:property value="%{#listMessageReceive.message.content}" /><br />
			<div id="sending<s:property value="%{#listMessageReceive.message.id}" />"
				 name="sending<s:property value="%{#listMessageReceive.message.id}" />" 
				 style="background-color:#009ACF; display:none;">
				Message en cours d envoi
			</div>
			<form id="form_sendResponse<s:property value="%{#listMessageReceive.message.id}" />">
				<input id="idMessage" name="idMessage" style="display:none;" type="text" value="<s:property value="%{#listMessageReceive.message.id}" />" />
				<textarea name="content" id="content" style="width:90%; height:100px;"></textarea>
				<input type="button" value="envoyer" class="sendResponse" onclick="ajaxSendResponse(<s:property value="%{#listMessageReceive.message.id}" />)"/>
			</form>
		</div>
	</s:iterator>
</div>