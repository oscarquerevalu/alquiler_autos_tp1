package pe.com.alquilerautorara.service;

import java.time.LocalDate;
import java.util.List;

import pe.com.alquilerautorara.model.Reserva;

public interface IReservaService {
	
	Reserva save(Reserva reserva);
	
	Reserva findById(Long id);
	
	List<Reserva> list();
	
	List<Reserva> listByUser(Long id);
	
	void remover(long id);

	Reserva findById(long id);

	Boolean findByDateReserve(Long id, LocalDate fecIni, LocalDate fechFin);
	
}
