package pe.com.alquilerautorara.service;

import java.util.List;

import pe.com.alquilerautorara.model.Auto;

public interface IAutoService {
	
	Auto save(Auto auto);
	
	Auto findByNombre(String nombre);
	
	List<Auto> list();
	
	void remover(long id);

	Auto findById(long id);
	
}
