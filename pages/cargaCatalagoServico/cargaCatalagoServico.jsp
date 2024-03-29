<%@ taglib uri="/tags/cit" prefix="cit"%>
<%@page import="br.com.centralit.citcorpore.util.WebUtil"%>
<%@page import="br.com.centralit.citcorpore.bean.UsuarioDTO"%>
<%@page import="br.com.citframework.util.Constantes"%>
<%@ taglib uri="/tags/i18n" prefix="i18n"%>

<!doctype html public "">
<html>
<head>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
    String iframe = "";
    iframe = request.getParameter("iframe");
%>

<%@include file="/include/security/security.jsp"%>
<title><i18n:message key="citcorpore.comum.title" /></title>
<%@include file="/include/noCache/noCache.jsp"%>
<%@include file="/include/menu/menuConfig.jsp"%>
<%@include file="/include/header.jsp"%>

<%@include file="/include/javaScriptsComuns/javaScriptsComuns.jsp"%>
<%
    //se for chamado por iframe deixa apenas a parte de cadastro da p�gina
    if (iframe != null) {
%>
<style>
div#main_container {
	margin: 10px 10px 10px 10px;
}
</style>
<%
    }
%>

<script>
		var popup;
		addEvent(window, "load", load, false);
		function load() {
				popup = new PopupManager(800, 600, "<%=CitCorporeConstantes.CAMINHO_SERVIDOR%><%=request.getContextPath()%>/pages/");
			   document.form.afterRestore = function() {
				$('.tabs').tabs('select', 0);
			}  
		}
		
	    carregouIFrameAnexo = function() {
	    	//POPUP_ADD_IMAGEM.hide();
			HTMLUtils.removeEvent(document.getElementById("frameUpload"),"load", carregouIFrameAnexo);
	    };
		
		
	    carregouIFrameAnexo = function() {    
	    	JANELA_AGUARDE_MENU.hide();
			HTMLUtils.removeEvent(document.getElementById("frameUploadAnexo"),"load", carregouIFrameAnexo);
	    };
	    
		submitFormAnexo = function(){	
			//HTMLUtils.addEvent(document.getElementById("frameUploadAnexo"),"load", carregouIFrameAnexo, true);
		    //document.form.setAttribute("target","frameUploadAnexo");
		    document.form.setAttribute("method","post"); 
		    document.form.setAttribute("enctype","multipart/form-data"); 
		    document.form.setAttribute("encoding","multipart/form-data"); 
		    
		    //submetendo 
		    document.form.submit();
		};
		
		setaInfoImagens = function(){
			document.formAnexo.idContrato.value = document.formProntuario.idContrato.value;
			document.formProntuario.funcaoUpload.value = 'anexos';
			document.getElementById('divEnviarArquivo').style.display='block';
			document.getElementById('frameUploadCertificadoApplet').style.display='none';
			document.getElementById('divMsgCertDigApplet').style.display='none';
			document.getElementById('frameUploadCertificadoApplet').src = 'about:blank';		
			POPUP_ANEXO.showInYPosition({top:30});
		};
		
		function enviarDados(){
			JANELA_AGUARDE_MENU.show();
			submitFormAnexo();
		}
		

		
</script>

</head>
<!-- Definicoes Comuns -->
<cit:janelaAguarde id="JANELA_AGUARDE_MENU"  title="" style="display:none;top:325px;width:300px;left:500px;height:50px;position:absolute;">
</cit:janelaAguarde>
<body>

	<div id="wrapper">
		<%
		    if (iframe == null) {
		%>
		<%@include file="/include/menu_vertical.jsp"%>
		<%
		    }
		%>
		<!-- Conteudo -->
		<div id="main_container" class="main_container container_16 clearfix">
			<%
			    if (iframe == null) {
			%>
			<%@include file="/include/menu_horizontal.jsp"%>
			<%
			    }
			%>
			
			
			<div class="flat_area grid_16">
				<h2>
					 <i18n:message key="cargaCatalogoServico.Carga" />
					
				</h2>
			</div>
				<div class="box grid_16 tabs">
				<ul class="tab_header clearfix">
					<li><a href="#tabs-1"><i18n:message	key="cargaCatalogoServico.cadastro" /></a></li>
					<%-- <li><a href="#tabs-2" class="round_top"><i18n:message key="categoriaServico.pesquisaCategoriaServico" /></a></li> --%>
				</ul>
				<a href="#" class="toggle">&nbsp;</a>
				<div class="toggle_container">
					<div id="tabs-1" class="block">
						<div class="section">
								
						<div class="columns clearfix">

							<iframe name='frameUploadCertificadoAnexos' id='frameUploadCertificado' src='about:blank' height="0" width="0" style='display:none'/></iframe>
						
						
							<iframe name='frameUploadCertificadoAnexosApplet' id='frameUploadCertificadoApplet' style='display:none' src='about:blank' height="250" width="800"/></iframe>	
							<form name='formListaCertificadosAnexos' method="POST" action='<%=br.com.citframework.util.Constantes.getValue("SERVER_ADDRESS")%><%=br.com.citframework.util.Constantes.getValue("CONTEXTO_APLICACAO")%>/contratoQuestionarios/contratoQuestionarios'>
								<input type='hidden' name='divAtualizarCertificado' value='divCertificadosAnexos'/>
							</form>
							
							<iframe name='frameUploadAnexo' id='frameUploadAnexo' src='about:blank' height="0" width="0" style="display: none" frameborder="0"/></iframe>
							
							<div id='divEnviarArquivo' style='display:block; padding: 5px;'>
									<form name='form' method="post" ENCTYPE="multipart/form-data" action='<%=Constantes.getValue("SERVER_ADDRESS")%><%=br.com.citframework.util.Constantes.getValue("CONTEXTO_APLICACAO")%>/pages/cargaCatalagoServico/cargaCatalagoServico.load'>
										<input type='hidden' name='idContrato'/>
										<input type='hidden' name='aba' id='abaImagens'/>
										<table>
											<tr>
												<td class="campoEsquerda">
													<label class="campoObrigatorio"><i18n:message key="citcorpore.comum.ArquivoAnexo" /></label>:
												</td>
												<td>
													<input type='file' name='arquivo' size="60" class="Valid[Required] Description[citcorpore.comum.ArquivoAnexo]"/>
												</td>
											</tr>
												
											<tr>
												<td>
													<table>
														<tr>
															<td>								
																<button type='button' name='btnUpDate' class="light" onclick='enviarDados();'>
																		<img src="<%=br.com.citframework.util.Constantes.getValue("CONTEXTO_APLICACAO")%>/template_new/images/icons/small/grey/paperclip.png">
																		<span><i18n:message key="citSmart.comum.enviar" /></span>
																</button>									
															</td>
								
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</form>
							</div>
					</div>
				</div>
				<!-- ## FIM - AREA DA APLICACAO ## -->
			</div>
		</div>
	</div>
	</div>
	<!-- Fim da Pagina de Conteudo -->
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>
