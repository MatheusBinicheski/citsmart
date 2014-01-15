<%@page import="br.com.citframework.util.Constantes"%>
<%@ taglib uri="/tags/cit" prefix="cit"%>
<%@ taglib uri="/tags/i18n" prefix="i18n" %>
<%@page import="br.com.centralit.citcorpore.util.WebUtil"%>
<%@page import="br.com.centralit.citcorpore.bean.UsuarioDTO"%>
<%@page import="br.com.centralit.citcorpore.bean.ProdutoDTO"%>
<%@page import="java.util.Collection"%>
<!doctype html public "">
<html>
<head>
    <script type="text/javascript" src="<%=br.com.citframework.util.Constantes.getValue("CONTEXTO_APLICACAO")%>/fckeditor/fckeditor.js"></script>
    <%
        response.setHeader("Cache-Control", "no-cache"); 
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", -1);
        String id = request.getParameter("id");
        
        Collection<ProdutoDTO> colProdutos = (Collection<ProdutoDTO>)request.getAttribute("colProdutos");
    %>
    <%@include file="/include/internacionalizacao/internacionalizacao.jsp"%>
    <%@include file="/include/security/security.jsp" %>
    <title><i18n:message key="citcorpore.comum.title"/></title>
    <%@include file="/include/noCache/noCache.jsp" %>
    <%@include file="/include/menu/menuConfig.jsp" %>
    <%@include file="/include/header.jsp" %>
    <%@include file="/include/javaScriptsComuns/javaScriptsComuns.jsp" %>   
    <script type="text/javascript" src="<%=CitCorporeConstantes.CAMINHO_SERVIDOR%><%=request.getContextPath()%>/js/ValidacaoUtils.js"></script>
    <script type="text/javascript" src="<%=CitCorporeConstantes.CAMINHO_SERVIDOR%><%=request.getContextPath()%>/js/PopupManager.js"></script>
    <script type="text/javascript" src="<%=CitCorporeConstantes.CAMINHO_SERVIDOR%><%=request.getContextPath()%>/cit/objects/RequisicaoProdutoDTO.js"></script>
    <script type="text/javascript" src="<%=CitCorporeConstantes.CAMINHO_SERVIDOR%><%=request.getContextPath()%>/cit/objects/ItemRequisicaoProdutoDTO.js"></script>
    <link href="<%=br.com.citframework.util.Constantes.getValue("SERVER_ADDRESS")%><%=br.com.citframework.util.Constantes.getValue("CONTEXTO_APLICACAO")%>/novoLayout/common/theme/css/atualiza-antigo.css" rel="stylesheet" />
    

    <style type="text/css">
        .destacado {
            border:1px solid #ddd;
            padding:4px 10px;
            border-left:none;
            background:#eee;
            font-size: 14px;
        }
        .table {
            border-left:1px solid #ddd;
            width: 100%;
        }
        
        .table th {
            border:1px solid #ddd;
            padding:4px 10px;
            border-left:none;
            background:#eee;
        }
        
        .table td {
            border:1px solid #ddd;
            padding:4px 10px;
            border-top:none;
            border-left:none;
        }
        
        .table1 {
        }
        
        .table1 th {
            border:1px solid #ddd;
            padding:4px 10px;
            background:#eee;
        }
        
        .table1 td {
        }   
td{
padding-bottom: 0 !important;
}
#btnlimparTelaItem{
	margin-top: 3px!important;
}
    </style>

    <script>
        function desabilitarTela() {
            var f = document.form;
            for(i=0;i<f.length;i++){
                var el =  f.elements[i];
                if (el.type != 'hidden') { 
                    if (el.disabled != null && el.disabled != undefined) {
                        el.disabled = 'disabled';
                    }
                }
            }      
            document.getElementById('divAdicionarItem').style.display = 'none'; 
        }    
        addEvent(window, "load", load, false);
        function load(){        
            document.form.afterLoad = function () {
                if (document.form.editar.value != '' && document.form.editar.value != 'S')
                    desabilitarTela();
                document.form.fireEvent('montaHierarquiaCategoria');
                parent.escondeJanelaAguarde();                    
            }    
        }
        
        $(function() {
            $("#POPUP_ITEM_REQUISICAO").dialog({
                autoOpen : false,
                width : 580,
                height : 450,
                modal : true
            });
        }); 

        function adicionarItem() {
            document.getElementById('descricaoItem').disabled = false;
            document.formItemRequisicao.clear();
            carregarProdutos('');            
            document.getElementById('itemIndex').value = '0';
            redimensionarTamhanho("#POPUP_ITEM_REQUISICAO", "XG")
            $("#POPUP_ITEM_REQUISICAO").dialog("open");
        }    

        validarItemRequisicao = function() {
            var qtde = document.getElementById('item#quantidade');
            if (StringUtils.isBlank(qtde.value) || parseInt(qtde.value) == 0){
                alert(i18n_message("itemRequisicaoProduto.quantidade")+" "+i18n_message("citcorpore.comum.naoInformado"));
                qtde.focus();
                return false;
            }
            if (document.form.tipoIdentificacaoItem.value == 'S') {
                if (StringUtils.isBlank(document.getElementById('item#idProduto').value)){
                    alert(i18n_message("itemRequisicaoProduto.produto")+" "+i18n_message("citcorpore.comum.naoInformado"));
                    document.getElementById('descricaoItem').focus();
                    return false;
                }
                if (StringUtils.isBlank(document.getElementById('item#idUnidadeMedida').value)){
                    alert(i18n_message("unidadeMedida.naoCadastrada"));
                    document.getElementById('descricaoItem').focus();
                    return false;
                }
            }else{
                /*if (StringUtils.isBlank(document.getElementById('item#idCategoriaProduto').value)){
                    alert(i18n_message("itemRequisicaoProduto.categoria")+" "+i18n_message("citcorpore.comum.naoInformado"));
                    document.getElementById('item#idCategoriaProduto').focus();
                    return false;
                }  */
                if (StringUtils.isBlank(document.getElementById('descricaoItem').value)){
                    alert(i18n_message("itemRequisicaoProduto.descricao")+" "+i18n_message("citcorpore.comum.naoInformado"));
                    document.getElementById('descricaoItem').focus();
                    return false;
                }
                if (StringUtils.isBlank(document.getElementById('item#especificacoes').value)){
                    alert(i18n_message("itemRequisicaoProduto.especificacoes")+" "+i18n_message("citcorpore.comum.naoInformado"));
                    document.getElementById('item#especificacoes').focus();
                    return false;
                }
                if (StringUtils.isBlank(document.getElementById('item#idUnidadeMedida').value)){
                    alert(i18n_message("itemRequisicaoProduto.unidadeMedida")+" "+i18n_message("citcorpore.comum.naoInformado"));
                    document.getElementById('item#idUnidadeMedida').focus();
                    return false;
                }
                /*if (StringUtils.isBlank(document.getElementById('item#precoAproximado').value) || parseFloat(document.getElementById('item#precoAproximado').value) == 0){
                    alert(i18n_message("itemRequisicaoProduto.precoAproximado")+" "+i18n_message("citcorpore.comum.naoInformado"));
                    document.getElementById('item#precoAproximado').focus();
                    return false;
                }*/
            }
            return true;
        }
        
        atualizarItem = function(){
            if (document.form.tipoIdentificacaoItem.value == 'S') {
            	posicionarCategoria(document.form.idCategoriaProduto.value);
            	document.getElementById('descricaoItem').value = document.form.identificacao.value;
                document.getElementById('item#marcaPreferencial').value = document.form.nomeMarca.value;
                document.getElementById('item#idUnidadeMedida').value = document.form.idUnidadeMedida.value;
                document.getElementById('item#especificacoes').value = document.form.detalhes.value;
                document.getElementById('item#precoAproximado').value = document.form.precoMercado.value;
            }
            if (!validarItemRequisicao())
                return;

            var indice = parseInt(document.getElementById('itemIndex').value);
            var idUnidade = document.getElementById('item#idUnidadeMedida');
            document.getElementById('item#siglaUnidadeMedida').value = idUnidade[idUnidade.selectedIndex].text;
            if (indice == 0){
                document.getElementById('item#descrSituacao').value = i18n_message("itemRequisicaoProduto.solicitado");
                var obj = new CIT_ItemRequisicaoProdutoDTO();
                HTMLUtils.addRow('tblItensRequisicao', document.formItemRequisicao, 'item', obj, 
                        ["","descricaoItem","quantidade","siglaUnidadeMedida","marcaPreferencial","descrSituacao"], null, '', [gerarImgAlterar], editarItem, null, false);
            }else{
                var obj = HTMLUtils.getObjectByTableIndex('tblItensRequisicao', indice);
                HTMLUtils.updateRow('tblItensRequisicao', document.formItemRequisicao, 'item', obj, 
                        ["","descricaoItem","quantidade","siglaUnidadeMedida","marcaPreferencial","descrSituacao"], null,'', [gerarImgAlterar], editarItem, null, indice);
            }
            
            document.form.idUnidadeMedida.value = "";
            document.form.nomeMarca.value = "";
            
            $("#POPUP_ITEM_REQUISICAO").dialog("close");
        };
               
        function editarItem(row, obj) {
            if (document.form.editar.value == 'N' || obj == null)
                return;

            posicionarCategoria(obj.idCategoriaProduto);
            document.formItemRequisicao.clear();
            HTMLUtils.setValues(document.formItemRequisicao,'item',obj);
            document.getElementById('itemIndex').value = row.rowIndex;
            document.getElementById('btnExcluirItem').style.display = "block";
            document.form.idProduto.value = obj.idProduto; 
            if (obj.idProduto == '')
                document.form.tipoIdentificacaoItem.value = 'D';
            else
                document.form.tipoIdentificacaoItem.value = 'S';
            document.form.fireEvent('preparaTelaItemRequisicao');
        } 

        function validar() {
            return document.form.validate();
        }

        function getObjetoSerializado() {
            var obj = new CIT_RequisicaoProdutoDTO();
            HTMLUtils.setValuesObject(document.form, obj);
            var itensRequisicao = HTMLUtils.getObjectsByTableId('tblItensRequisicao');
            obj.itensRequisicao_serialize = ObjectUtils.serializeObjects(itensRequisicao);
            return ObjectUtils.serializeObject(obj);
        }

        function gerarImgAlterar(row, obj){
            row.cells[0].innerHTML = '<button type="button" class="light">'+i18n_message("dinamicview.editar")+'</button>';
        };

        function excluirItem(linha) {
            if (linha > 0 && confirm(i18n_message("citcorpore.comum.confirmaExclusao"))) {
                HTMLUtils.deleteRow('tblItensRequisicao', linha);
                $("#POPUP_ITEM_REQUISICAO").dialog("close"); 
            }
        }

        function posicionarCategoria(id) {
        	HTMLUtils.setValue('item#idCategoriaProduto', id);		
        	document.form.idCategoriaProduto.value = id;
        }

        function limparTelaItem() {
            carregarProdutos(document.getElementById('item#idCategoriaProduto').options[document.getElementById('item#idCategoriaProduto').selectedIndex].value);   
        }
        
        function carregarProdutos(idCategoria) {
        	if (document.form.tipoIdentificacaoItem.value == 'D') 
        		return;
            document.formItemRequisicao.clear();
            posicionarCategoria(idCategoria);
            document.form.idProduto.value = '';
            document.getElementById('descricaoItem').disabled = false;  
            document.getElementById('divBotoesItem').style.display = 'block';
            document.getElementById('divDigitacao').style.display = 'block';            
            document.getElementById('divProduto').style.display = 'none';
            document.getElementById('divImagemProduto').innerHTML = '';
            document.getElementById('divDetalhesProduto').innerHTML = '';
            document.getElementById('divAcessorios').innerHTML = ''; 
            document.getElementById('btnExcluirItem').style.display = "none";  
            document.getElementById('descricaoItem').focus();
            geraAutoCompleteProduto(idCategoria);
        }

        function verificaDigitacaoProduto(idCategoria) {
            if (document.getElementById('item#idProduto').value == '' && document.getElementById('descricaoItem').value != '') {
                prepararTelaDigitacaoProduto();
                document.getElementById('item#quantidade').focus();
            }
        }
        
        function exibirProduto(id) {
            document.form.idProduto.value = id;
            document.getElementById("item#idProduto").value = id;            
            if (id != '') {
                document.form.tipoIdentificacaoItem.value = 'S';
                document.form.fireEvent('exibeProduto');
            }
        }
        
        function prepararTelaDigitacaoProduto() {
            document.form.idProduto.value = '';  
            document.getElementById('divProduto').style.display = 'none';
            document.getElementById('divDigitacao').style.display = 'block';
            document.getElementById('descricaoItem').disabled = false;             
            document.getElementById('item#idProduto').value = '';
            document.form.tipoIdentificacaoItem.value = 'D';
        }

        function geraAutoCompleteProduto(idCategoria){
            <%if (colProdutos == null) {%>
               return;
            <%}%>
            var availableTags = new Array();
            var iAux = 0;
            <%for (ProdutoDTO produtoDto: colProdutos) {%>
                 if (idCategoria == '' || (idCategoria != '' && parseInt(idCategoria) == <%=produtoDto.getIdCategoria().intValue()%>)){
                     availableTags[iAux] = {value: '<%=produtoDto.getIdProduto().intValue()%>', label: '<%=produtoDto.getIdentificacao()%>'};
                     iAux++;
                 }   
            <%}%>
            $( "#descricaoItem" ).autocomplete({
                source: availableTags,
                select: function(event, ui) {
                    document.getElementById('descricaoItem').value = ui.item.label;
                    exibirProduto(ui.item.value);
                    document.getElementById('item#quantidade').focus();
                    return false;
                },
            }); 
        }
        
        /**
		* Motivo: Redimensiona a popup em tamanho compativel com o tamanho da tela
		* Autor: flavio.santana
		* Data/Hora: 18/11/2013 15:35
		*/
		function redimensionarTamhanho(identificador, tipo_variacao){
			var h;
			var w;
			switch(tipo_variacao)
			{
			case "PEQUENO":
				w = parseInt($(window).width() * 0.25);
				h = parseInt($(window).height() * 0.35);
			  break;
			case "MEDIO":
				w = parseInt($(window).width() * 0.5);
				h = parseInt($(window).height() * 0.6);
			  break;
			case "GRANDE":
				w = parseInt($(window).width() * 0.75);
				h = parseInt($(window).height() * 0.85);
			  break;
			case "XG":
				w = parseInt($(window).width() * 0.95);
				h = parseInt($(window).height() * 0.95);
			  break;
			default:
				w = parseInt($(window).width() * 0.5);
				h = parseInt($(window).height() * 0.6);
			}
			
			$(identificador).dialog("option","width", w)
			$(identificador).dialog("option","height", h)
		}
    </script>
</head>

<body style="overflow: hidden;">  
    <div class="box grid_16 tabs" style='margin: 0px 0px 0px 0px;'>
        <div class="toggle_container">
            <div id="tabs-2" class="block" style="overflow: hidden;">
                        <form name='form' action='<%=CitCorporeConstantes.CAMINHO_SERVIDOR%><%=request.getContextPath()%>/pages/requisicaoProduto/requisicaoProduto'>
                                <input type='hidden' name='idSolicitacaoServico' id='idSolicitacaoServico' /> 
                                <input type='hidden' name='editar' id='editar' /> 
                                <input type='hidden' name='acao' id='acao'/> 
                                <input type='hidden' name='idCategoriaProduto' id='idCategoriaProduto'/> 
                                <input type='hidden' name='idProduto' id='idProdutoForm'/> 
                                <input type='hidden' name='tipoIdentificacaoItem' id='tipoIdentificacaoItem'/> 
                                <input type='hidden' name='identificacao' id='identificacaoItemForm'/>
                                <input type='hidden' name='nomeMarca' id='nomeMarca'/>
                                <input type='hidden' name='precoMercado' id='precoMercado'/>
                                <input type='hidden' name='idUnidadeMedida' id='idUnidadeMedida'/>
                                <input type='hidden' name='siglaUnidadeMedida' id='siglaUnidadeMedida'/>
                                <input type='hidden' name='detalhes' id='detalhes'/>
                                <input type='hidden' name='itemIndex'/>

                                <div class="col_100">
                                    <div class="col_50">
                                        <fieldset>
                                            <label class="campoObrigatorio"><i18n:message key="requisicaoProduto.finalidade" /></label>
                                            <div>
                                                <select name='finalidade' id='finalidade' class="Valid[Required] Description[requisicaoProduto.finalidade]"></select>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div class="col_50">
                                         <fieldset>
                                             <label class="campoObrigatorio"><i18n:message key="centroResultado.custo" /></label>
                                             <div>
                                                 <select name='idCentroCusto' class="Valid[Required] Description[centroResultado.custo]"></select>
                                             </div>
                                         </fieldset>
                                    </div>  
                                </div>                              
                                <div class="col_100">
                                    <div class="col_50">
                                         <fieldset>
                                             <label class="campoObrigatorio"><i18n:message key="requisicaoProduto.projeto" /></label>
                                             <div>
                                                 <select name='idProjeto' class="Valid[Required] Description[requisicaoProduto.projeto]"></select>
                                             </div>
                                         </fieldset>
                                    </div>
                                    <div class="col_50">
                                         <fieldset>
                                             <label class="campoObrigatorio"><i18n:message key="requisicaoProduto.enderecoEntrega" /></label>
                                             <div>
                                                 <select name='idEnderecoEntrega' class="Valid[Required] Description[requisicaoProduto.enderecoEntrega]"></select>
                                             </div>
                                         </fieldset>
                                    </div>
                                </div>

                                <div class="col_100">
                                    <div class="col_50">
                                        <h2 class="section">
                                            <i18n:message key="requisicaoProduto.itens" />
                                        </h2>
                                    </div>
                                    <div id="divAdicionarItem" class="col_50" style="width: 100%; float: center;" align="right" >
                                        <label  style="cursor: pointer;" onclick='adicionarItem();'>
                                            <img  src="<%=br.com.citframework.util.Constantes.getValue("CONTEXTO_APLICACAO")%>/imagens/add.png" /><span><b><i18n:message key="requisicaoProduto.adicionarItem" /></b></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="col_100" style="overflow:auto; height:300px">
                                    <table id="tblItensRequisicao" class="table">
                                        <tr>
                                            <th width="1%">&nbsp;</th>
                                            <th width="40%"><i18n:message key="itemRequisicaoProduto.descricao" /></th>
                                            <th width="5%"><i18n:message key="itemRequisicaoProduto.quantidade" /></th>
                                            <th width="5%"><i18n:message key="itemRequisicaoProduto.unidadeMedida" /></th>
                                            <th><i18n:message key="itemRequisicaoProduto.marcaPreferencial" /></th>
                                            <th width="20%"><i18n:message key="citcorpore.comum.situacao" /></th>
                                        </tr>
                                    </table>
                                </div>
                        </form>
                    </div>
            </div>  
        </div>

<div id="POPUP_ITEM_REQUISICAO" title="<i18n:message key="requisicaoProduto.itens" />"  style="overflow: hidden;">
    <form name='formItemRequisicao'>
        <input type='hidden' name='item#idItemRequisicaoProduto'/>
        <input type='hidden' name='item#siglaUnidadeMedida'/>
        <input type='hidden' name='item#descrSituacao'/>
        <input type='hidden' name='item#idProduto'/>

		<div class="columns clearfix">
	        <div class="col_100">
				<fieldset>
                	<label><i18n:message key="itemRequisicaoProduto.categoria" /></label>
                    <div>
                    	<select id='item#idCategoriaProduto' name='item#idCategoriaProduto'  
                    			onchange="carregarProdutos(document.getElementById('item#idCategoriaProduto').options[document.getElementById('item#idCategoriaProduto').selectedIndex].value)"></select>
 					</div>
				</fieldset>
	        </div>
	        <div class="col_100">	        
	            <div class="col_70">
	                 <fieldset>
	                      <label class="campoObrigatorio"><i18n:message key="itemRequisicaoProduto.produto" /></label>
	                     <div>
							<input type='text' name='item#descricaoItem' id='descricaoItem' maxlength='120' onblur='verificaDigitacaoProduto("")'/>
	                      </div>
	                  </fieldset>
				</div>
	         
	            <div class="col_15">
	                <fieldset>
	                    <label class="campoObrigatorio"><i18n:message key="itemRequisicaoProduto.quantidade" /></label>
	                    <div>
	                        <input id="item#quantidade" type="text"  maxlength="15" name='item#quantidade' class="Format[Moeda]"/>
	                    </div>
	                </fieldset>
	            </div>
	            <div class="col_15">
	                     <label>&nbsp;</label>
							<button type="button" class="light" name='btnlimparTelaItem' onclick='this.form.reset();limparTelaItem();'>
		                     	<i18n:message key="citcorpore.ui.botao.rotulo.Limpar" />
			                </button>
				</div>
			</div>
            <div id='divProduto' style='display:none' class="col_100">
                <div class="col_25">
                    <fieldset>
                        <div id='divImagemProduto' style='padding:10px 10px;'>
                        </div>
                    </fieldset>
                </div>                        
                <div class="col_50">
                    <fieldset>
                        <div id='divDetalhesProduto' style='padding:10px 10px;'>
                        </div>
                    </fieldset>
                </div>                        
                 <div class="col_25">
                        <fieldset>
                            <div id='divAcessorios' style='padding:10px 10px;'>
                            </div>
                        </fieldset>
                 </div>
            </div>
            <div id='divDigitacao' class="col_100">
                  <div class="col_100">
                      <fieldset>
                          <label class="campoObrigatorio"><i18n:message key="itemRequisicaoProduto.especificacoes" /></label>
                          <div>
                               <textarea id="item#especificacoes" name="item#especificacoes" cols='60'  ></textarea>                               
                          </div>
                      </fieldset>
                   </div>
                   <div class="col_100">
                       <div class="col_40">
                           <fieldset>
                               <label><i18n:message key="itemRequisicaoProduto.marcaPreferencial" /></label>
                               <div>
                                   <input id="item#marcaPreferencial"  type='text'  name="item#marcaPreferencial" maxlength="100" />
                               </div>
                           </fieldset>
                       </div>
                       <div class="col_20">
                           <fieldset>
                               <label class="campoObrigatorio"><i18n:message key="itemRequisicaoProduto.unidadeMedida" /></label>
                               <div>
                                   <select id='item#idUnidadeMedida'  name='item#idUnidadeMedida' ></select>
                               </div>
                           </fieldset>
                       </div>
                       <div class="col_40">
                           <fieldset>
                               <label><i18n:message key="itemRequisicaoProduto.precoAproximado" /></label>
                               <div>
                                   <input id="item#precoAproximado" type="text"  maxlength="15" name='item#precoAproximado' class="Format[Moeda]"/>
                               </div>
                           </fieldset>
                       </div>
                   </div>
            </div> 
        </div>
        
         <div id='divBotoesItem'>
             <div class="col_40">
                <label>&nbsp;</label>
             </div>   
             <div class="col_60">
                 <button type="button" class="light" onclick='this.form.reset();limparTelaItem();'>
                     <i18n:message key="citcorpore.comum.limpar" />
                 </button>
                 <button type="button" class="light" onclick='atualizarItem()'>
                     <i18n:message key="citcorpore.comum.confirmar" />
                 </button>
                 <button type="button" class="light" style='display:none' id='btnExcluirItem' name='btnExcluirItem' onclick='excluirItem(document.getElementById("itemIndex").value)'>
                     <i18n:message key="itemRequisicaoProduto.excluir" />
                 </button>
                 <button type="button" class="light" onclick='$("#POPUP_ITEM_REQUISICAO").dialog("close");'>
                     <i18n:message key="citcorpore.comum.fechar" />
                 </button>
             </div>   
         </div>
    </form>
</div>

<div id="POPUP_INFO_PRODUTOS" title="Produtos" style="overflow: hidden;">
        <div id='divInfoProdutos' style="overflow: auto; font-size: 14px; width: 100%; height: 100%">
            <i18n:message key="itemRequisicaoProduto.filtroselecionado" />
        </div>
</div>

</body>

</html>
