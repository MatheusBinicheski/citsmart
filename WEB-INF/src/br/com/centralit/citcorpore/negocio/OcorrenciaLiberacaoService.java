package br.com.centralit.citcorpore.negocio;

import java.util.Collection;

import br.com.citframework.service.CrudServicePojo;

/**
 * @author breno.guimaraes
 *
 */
public interface OcorrenciaLiberacaoService extends CrudServicePojo {
    public Collection findByIdRequisicaoLiberacao(Integer idRequisicaoLiberacao) throws Exception;
}
