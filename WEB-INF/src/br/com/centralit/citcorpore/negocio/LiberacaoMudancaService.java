package br.com.centralit.citcorpore.negocio;
import java.util.ArrayList;
import java.util.Collection;

import br.com.centralit.citcorpore.bean.LiberacaoMudancaDTO;
import br.com.citframework.excecao.ServiceException;
import br.com.citframework.service.CrudServiceEjb2;
@SuppressWarnings({"unused","rawtypes"})
public interface LiberacaoMudancaService extends CrudServiceEjb2 {

	public Collection findByIdLiberacao(Integer parm) throws Exception;
	public void deleteByIdLiberacao(Integer parm) throws Exception;
	public Collection<LiberacaoMudancaDTO> listAll() throws ServiceException, Exception;
	public Collection findByIdRequisicaoMudanca(Integer idLiberacao, Integer idRequisicaoMudanca) throws Exception;
}
