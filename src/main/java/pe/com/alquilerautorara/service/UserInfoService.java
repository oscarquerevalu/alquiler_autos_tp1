package pe.com.alquilerautorara.service;

import java.util.List;
import java.util.Objects;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import pe.com.alquilerautorara.dao.UserInfoDao;
import pe.com.alquilerautorara.model.UserInfo;

@Service
public class UserInfoService implements IUserInfoService {

	@Autowired
	private UserInfoDao dao;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@PersistenceContext(type = PersistenceContextType.EXTENDED)
	private EntityManager entityManager;

	@Override
	public UserInfo save(UserInfo userInfo) {
//		UserInfo userDb = findByUsername(userInfo.getUsername());
//		if (Objects.nonNull(userDb)) {
//			userInfo.setId(userDb.getId());
//		}
		userInfo.setPassword(encoder.encode(userInfo.getPassword()));
		dao.save(userInfo);
		return userInfo;
	}

	@Override
	public UserInfo findByUsername(String username) {
		List list =entityManager
				.createQuery("select u from UserInfo u where u.username = :username")
				.setParameter("username", username).getResultList();
//				List list = query.list();
		if(list.size()>0) {
			UserInfo result = (UserInfo) list.get(0);
			if (result == null) return null;
			return result;
		}
		else {
			return dao.findByUsername(username);
		}
//		return null;
	}
	
	@Override
	public UserInfo findByEmail(String email) {
		return dao.findByEmail(email);
	}
	
	@Override
	public UserInfo findById(long id) {
		return dao.findOne(id);
	}

	@Override
	public List<UserInfo> list() {
		Iterable<UserInfo> iterable = dao.findAll();
		if(Objects.nonNull(iterable)){
			return (List<UserInfo>) dao.findAll();
		}
		return null;
	}

	@Override
	public void remover(long id) {
		dao.delete(id);
	}
	
	@Override
	public UserInfo getAuthentication() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null) {
			return null;
		}
		return findByUsername(authentication.getName());
	}

}
