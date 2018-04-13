package pe.com.alquilerautorara.service;

import java.util.List;

import pe.com.alquilerautorara.model.Auto;
import pe.com.alquilerautorara.model.Reserva;

public interface IReservaService {
	
	Reserva save(Reserva reserva);
	
	Reserva findById(Long id);
	
	List<Reserva> list();
	
	void remover(long id);

	Reserva findById(long id);
	
}
