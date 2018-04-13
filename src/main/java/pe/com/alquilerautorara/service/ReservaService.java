package pe.com.alquilerautorara.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import pe.com.alquilerautorara.dao.AutoDao;
import pe.com.alquilerautorara.dao.ReservaDao;
import pe.com.alquilerautorara.model.Auto;
import pe.com.alquilerautorara.model.Reserva;
import pe.com.alquilerautorara.model.UserInfo;

@Service
public class ReservaService implements IReservaService {

	@Autowired
	private ReservaDao dao;
	
	@Override
	public Reserva save(Reserva reserva) {
		dao.save(reserva);
		return reserva;
	}

	@Override
	public Reserva findById(long id) {
		return dao.findOne(id);
	}

	@Override
	public List<Reserva> list() {
		Iterable<Reserva> iterable = dao.findAll();
		if(Objects.nonNull(iterable)){
			return (List<Reserva>) dao.findAll();
		}
		return null;
	}

	@Override
	public void remover(long id) {
		dao.delete(id);
	}

	@Override
	public Reserva findById(Long id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}
	
}
