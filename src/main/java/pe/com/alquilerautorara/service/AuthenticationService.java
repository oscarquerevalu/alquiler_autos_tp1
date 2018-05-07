package pe.com.alquilerautorara.service;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;

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

//	@Autowired
//	private UserInfoDao userDao;
	
	@PersistenceContext(type = PersistenceContextType.EXTENDED)
	private EntityManager entityManager;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		List list =entityManager
				.createQuery("select u from UserInfo u where u.username = :username")
				.setParameter("username", username).getResultList();
//				List list = query.list();
		System.out.println("userinfo" + list.size());
		if(list.size()>0) {
			UserInfo result = (UserInfo) list.get(0);
			if (result == null) return null;
			UserInfo user = (UserInfo) list.get(0);
			if (Objects.nonNull(user)) {
				System.out.println("username ="+ username);
				System.out.println("password ="+ user.getPassword());
				GrantedAuthority authority = new SimpleGrantedAuthority(user.getRole().name());
				UserDetails userDetails = (UserDetails) new User(user.getUsername(), user.getPassword(),
						Arrays.asList(authority));
				return userDetails;
			}
		}

		return null;
	}

}
