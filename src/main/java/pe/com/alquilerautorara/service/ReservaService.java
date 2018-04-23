package pe.com.alquilerautorara.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.com.alquilerautorara.dao.ReservaDao;
import pe.com.alquilerautorara.model.Reserva;

@Service
public class ReservaService implements IReservaService {

	@Autowired
	private ReservaDao dao;
	
	@PersistenceContext	
	private EntityManager entityManager;
	
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
	
//	@Override
	public Boolean findByDateReserve(Long id, LocalDate fecIni, LocalDate fechFin) {
		// TODO Auto-generated method stub
		
		List list =entityManager
		.createQuery("select COUNT(*) from Reserva where userInfo.id = :id AND fechaReservaIni BETWEEN :ini AND :fin or fechaReservaFin BETWEEN :ini AND :fin ")
		.setParameter("id", id)
		.setParameter("ini", fecIni)
		.setParameter("fin", fecIni).getResultList();
//		List list = query.list();
		Object result = (Object) list.get(0);
		Long res1 = (Long) result;
	    long count = res1.longValue();
		if (count > 0) return true;
		return null;
	}
	
}
