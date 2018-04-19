package pe.com.alquilerautorara.service;

import java.util.List;

import pe.com.alquilerautorara.model.UserInfo;

public interface IUserInfoService {
	
	UserInfo save(UserInfo userInfo);
	
	UserInfo findByUsername(String username);
	
	UserInfo findByEmail(String email);
	
	List<UserInfo> list();
	
	void remover(long id);

	UserInfo findById(long id);

	UserInfo getAuthentication();
	
}
