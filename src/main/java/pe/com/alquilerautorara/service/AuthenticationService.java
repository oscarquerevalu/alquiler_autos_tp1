package pe.com.alquilerautorara.service;

import java.util.Arrays;
import java.util.Objects;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;

import org.hibernate.CacheMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import pe.com.alquilerautorara.dao.UserInfoDao;
import pe.com.alquilerautorara.model.UserInfo;

@Service
public class AuthenticationService implements UserDetailsService {

	@Autowired
	private UserInfoDao userDao;
	
	@PersistenceContext(type = PersistenceContextType.EXTENDED)
	private EntityManager entityManager;
	
//	@Autowired
//    private SessionFactory sessionFactory;
// 
//    protected Session getSession(){
//        return sessionFactory.getCurrentSession();
//    }

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		entityManager.getEntityManagerFactory().getCache().evictAll();
//		entityManager.flush();
//		entityManager.clear();
//		List list =entityManager
//				.createQuery("select u from UserInfo u where u.username = :username")
//				.setHint("org.hibernate.cacheMode", "IGNORE")
//				.setParameter("username", username).getResultList();
//				List list = query.list();
		
//		System.out.println("userinfo" + list.size());
//		if(list.size()>0) {
//			UserInfo result = (UserInfo) list.get(0);
			UserInfo user = userDao.findByUsername(username);
//			entityManager.refresh(user);
//			Session session2 = getSession().;
//			getSession().setCacheMode(CacheMode.REFRESH);
//			
//			UserInfo user2 = (UserInfo) getSession().get(UserInfo.class, user.getId());
			
//			System.out.println("user2 pass=" + user2.getPassword());
		    
			if (user == null) return null;
//			UserInfo user = (UserInfo) list.get(0);
			if (Objects.nonNull(user)) {
				System.out.println("username ="+ username);
				System.out.println("password ="+ user.getPassword());
				GrantedAuthority authority = new SimpleGrantedAuthority(user.getRole().name());
				UserDetails userDetails = (UserDetails) new User(user.getUsername(), user.getPassword(),
						Arrays.asList(authority));
				return userDetails;
			}
//		}

		return null;
	}

}
