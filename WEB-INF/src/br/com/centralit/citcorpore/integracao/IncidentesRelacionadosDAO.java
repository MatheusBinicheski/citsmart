package br.com.centralit.citcorpore.integracao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import br.com.centralit.citcorpore.bean.IncidentesRelacionadosDTO;
import br.com.citframework.dto.IDto;
import br.com.citframework.integracao.Condition;
import br.com.citframework.integracao.CrudDaoDefaultImpl;
import br.com.citframework.integracao.Field;
import br.com.citframework.util.Constantes;

public class IncidentesRelacionadosDAO extends CrudDaoDefaultImpl {

    private static final long serialVersionUID = -2983316142102074344L;

    public IncidentesRelacionadosDAO() {
	super(Constantes.getValue("DATABASE_ALIAS"), null);
    }

    public Class getBean() {
	return IncidentesRelacionadosDTO.class;
    }

    public Collection getFields() {
	Collection listFields = new ArrayList();

	listFields.add(new Field("IDINCIDENTESRELACIONADOS", "idIncidentesRelacionados", true, true, false, false));
	listFields.add(new Field("IDINCIDENTE", "idIncidente", false, false, false, false));
	listFields.add(new Field("IDINCIDENTERELACIONADO", "idIncidenteRelacionado", false, false, false, false));
	return listFields;
    }

    public String getTableName() {
	return "incidentesrelacionados";
    }

    @Override
    public Collection find(IDto arg0) throws Exception {
	return null;
    }

    @Override
    public Collection list() throws Exception {
	return null;
    }
    
	public Collection<IncidentesRelacionadosDTO> findByIdIncidente(Integer idIncidente) throws Exception {
		List condicao = new ArrayList();
		condicao.add(new Condition("idIncidente", "=", idIncidente));
		
		return super.findByCondition(condicao, null);
	}		
    

}
