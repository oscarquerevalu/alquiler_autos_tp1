package pe.com.alquilerautorara.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import pe.com.alquilerautorara.dao.AutoDao;
import pe.com.alquilerautorara.model.Auto;
import pe.com.alquilerautorara.model.UserInfo;

@Service
public class AutoService implements IAutoService {

	@Autowired
	private AutoDao dao;
	
	@Autowired
	private PasswordEncoder encoder;

	@Override
	public Auto save(Auto auto) {
		dao.save(auto);
		return auto;
	}

	@Override
	public Auto findByNombre(String nombre) {
		return dao.findByNombre(nombre);
	}
	
	@Override
	public Auto findById(long id) {
		return dao.findOne(id);
	}

	@Override
	public List<Auto> list() {
		Iterable<Auto> iterable = dao.findAll();
		if(Objects.nonNull(iterable)){
			return (List<Auto>) dao.findAll();
		}
		return null;
	}

	@Override
	public void remover(long id) {
		dao.delete(id);
	}
	
}
