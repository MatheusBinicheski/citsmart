package br.com.centralit.citcorpore.integracao;

import java.util.ArrayList;
import java.util.Collection;

import br.com.centralit.citcorpore.bean.StartDTO;
import br.com.citframework.dto.IDto;
import br.com.citframework.integracao.CrudDaoDefaultImpl;
import br.com.citframework.integracao.Field;
import br.com.citframework.util.Constantes;

public class StartDAO extends CrudDaoDefaultImpl {
	
	private static final long serialVersionUID = 1L;

	public StartDAO() {
		super(Constantes.getValue("DATABASE_ALIAS"), null);
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public Collection find(IDto obj) throws Exception {
		return null;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Collection getFields() {
		Collection listFields = new ArrayList();
		listFields.add(new Field("idStart", "idStart", true, true, false, false));
		listFields.add(new Field("passoInstalacao", "passoInstalacao", false, false, false, false));
		listFields.add(new Field("dataInicio", "dataInicio", false, false, false, false));
		listFields.add(new Field("dataFim", "dataFim", false, false, false, false));
		return listFields;
	}

	@Override
	public String getTableName() {
		return "start";
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Collection list() throws Exception {
		return null;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Class getBean() {
		return StartDTO.class;
	}

}
