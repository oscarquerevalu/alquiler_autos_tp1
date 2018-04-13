package pe.com.alquilerautorara.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import pe.com.alquilerautorara.model.Auto;
import pe.com.alquilerautorara.model.Reserva;

/**
 * Interface de abstrcao do crud.
 * @author hlandim
 *
 */
@Repository
public interface ReservaDao extends CrudRepository<Reserva, Long>{

	public Reserva findById(Long id);
	
}
