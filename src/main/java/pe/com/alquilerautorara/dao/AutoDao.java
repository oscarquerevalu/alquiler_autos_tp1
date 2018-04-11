package pe.com.alquilerautorara.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import pe.com.alquilerautorara.model.Auto;

/**
 * Interface de abstrcao do crud.
 * @author hlandim
 *
 */
@Repository
public interface AutoDao extends CrudRepository<Auto, Long>{

	public Auto findByNombre(String username);
	
}
