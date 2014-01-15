<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/tags/cit" prefix="cit"%>
<%@page import="br.com.centralit.citcorpore.util.WebUtil"%>
<%@page import="br.com.centralit.citcorpore.bean.UsuarioDTO"%>
<%@page import="br.com.citframework.dto.Usuario"%>
<%@ taglib uri="/tags/i18n" prefix="i18n"%>
<%@ taglib uri="/tags/menuPadrao" prefix="menu" %>

<html>
	<head>	
	<%
	response.setHeader( "Cache-Control", "no-cache");
	response.setHeader( "Pragma", "no-cache");
	response.setDateHeader ( "Expires", -1);
	String iframe = "";
	iframe = request.getParameter("iframe");
	
	String idSolicitacaoServico = UtilStrings.nullToVazio((String)request.getParameter("idSolicitacaoServico"));
	
	%>
		<%@include file="/novoLayout/common/include/libCabecalho.jsp" %>
		<link type="text/css" rel="stylesheet" href="../../novoLayout/common/include/css/template.css"/>
		<script type="text/javascript">
		fechar = function(){
			parent.fecharModalSuspensao();
		}
		
		gravar = function() {
			if (document.form.idJustificativa.value == '') {
				alert(i18n_message("citcorpore.comum.justificativa") + ': ' + i18n_message("citcorpore.comum.campo_obrigatorio"));
				document.form.idJustificativa.focus();
				return;
			}
			if (confirm(i18n_message("gerenciaservico.suspensaosolicitacao.confirm.suspensao"))) {
				document.form.save();
			}
		}	

		</script>
		 <style type="text/css">
		 	.campoObrigatorio:after {
				color: #FF0000;
				content: "*";
			}
		 	
		 </style>
	</head>
	<body>
		<div class="<%=(iframe == null) ? "container-fluid fixed" : "" %>">
			
			<!-- Top navbar (note: add class "navbar-hidden" to close the navbar by default) -->
			<div class="navbar <%=(iframe == null) ? "main" : "nomain" %> hidden-print">
			
				<% if(iframe == null) { %>
					<%@include file="/novoLayout/common/include/cabecalho.jsp" %>
					<%@include file="/novoLayout/common/include/menuPadrao.jsp" %>					
				<% } %>
				
			</div>
	
			<div id="wrapper" class="<%=(iframe == null) ? "" : "nowrapper" %>">
					
				<!-- Inicio conteudo -->
				<div id="content">
					<h3><i18n:message key="solicitacaoServico.solicitacao"/>&nbsp;N�&nbsp;<%=idSolicitacaoServico%></h3>
					<div class="box-generic">
						<form class="form-horizontal" name='form' id='form' action='<%=CitCorporeConstantes.CAMINHO_SERVIDOR%><%=request.getContextPath()%>/pages/suspensaoSolicitacao/suspensaoSolicitacao'>
							<input type='hidden' name='idSolicitacaoServico' id='idSolicitacaoServico'/> 
							<div class="row-fluid">
								<div class="span12">
									<label  class="strong campoObrigatorio"><i18n:message key="citcorpore.comum.justificativa"/></label>
									  	<select placeholder="" class="span10" id="idJustificativa" required="required"  type="text" name="idJustificativa"></select>
								</div>
							</div>
							<div class="control-group row-fluid">
								<div class="span12">
									<label  class="strong"><i18n:message key="gerenciaservico.mudarsla.complementojustificativa"/></label>
									  	<textarea placeholder="" rows="5" class="span10" id="complementoJustificativa" required="required"  type="text" name="complementoJustificativa"></textarea>
								</div>
							</div>
							<div style="margin: 0;" class="form-actions">
								<button class="btn btn-icon btn-primary glyphicons circle_ok" type="button" onclick='gravar();'><i></i><i18n:message key="citcorpore.comum.gravar" /></button>
								<button class="btn btn-icon btn-default glyphicons cleaning" type="button" onclick='document.form.clear();'><i></i><i18n:message key="citcorpore.comum.limpar" /></button>
							</div>
						</form>
					</div>
				</div>
				<!--  Fim conteudo-->
				
				<%@include file="/novoLayout/common/include/rodape.jsp" %>
				
			</div>
		</div>
	</body>
</html>