package br.com.centralit.citcorpore.rh.integracao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import br.com.centralit.citcorpore.rh.bean.RequisicaoFormacaoAcademicaDTO;
import br.com.citframework.dto.IDto;
import br.com.citframework.integracao.Condition;
import br.com.citframework.integracao.CrudDaoDefaultImpl;
import br.com.citframework.integracao.Field;
import br.com.citframework.integracao.Order;
import br.com.citframework.util.Constantes;

//Substituir NomeDaClasseDao
public class RequisicaoFormacaoAcademicaDao extends CrudDaoDefaultImpl {
	
	public RequisicaoFormacaoAcademicaDao() {
		super(Constantes.getValue("DATABASE_ALIAS"), null);
	}

	public Collection find(IDto arg0) throws Exception {
		return null;
	}

	public Collection getFields() {
		Collection listFields = new ArrayList();
		
		listFields.add(new Field("idSolicitacaoServico", "idSolicitacaoServico", true, false, false, false));
		listFields.add(new Field("idFormacaoAcademica", "idFormacaoAcademica", true, false, false, false));
		listFields.add(new Field("obrigatorio", "obrigatorio", false, false, false, false));
		
		return listFields;
	}
	
	// Substituir NomeDaTabela
	public String getTableName() {
		return "RH_RequisicaoFormacaoAcademica";
	}

	
	// Substituir NomeDoDTO
	public Class getBean() {
		
		return RequisicaoFormacaoAcademicaDTO.class;
	}


    public Collection list() throws Exception {
        List list = new ArrayList();
        list.add(new Order("idFormacaoAcademica"));
        return super.list(list);
    }

	public Collection findByIdSolicitacaoServico(Integer idSolicitacaoServico) throws Exception {
		List lstCondicao = new ArrayList();
		List lstOrder = new ArrayList();
		
		lstCondicao.add(new Condition("idSolicitacaoServico", "=", idSolicitacaoServico));
		lstOrder.add(new Order("idFormacaoAcademica"));
		
		return super.findByCondition(lstCondicao, lstOrder);
	}    
	
	public void deleteByIdSolicitacaoServico(Integer idSolicitacaoServico) throws Exception{
		Condition cond = new Condition("idSolicitacaoServico", "=", idSolicitacaoServico);
		List lstCond = new ArrayList();
		lstCond.add(cond);
		
		super.deleteByCondition(lstCond);
	}	
}
