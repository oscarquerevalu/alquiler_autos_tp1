package pe.com.alquilerautorara.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import pe.com.alquilerautorara.model.UserInfo;

/**
 * Interface de abstrcao do crud.
 * @author hlandim
 *
 */
@Transactional
public interface UserInfoDao extends CrudRepository<UserInfo, Long>{

	public UserInfo findByUsername(String username);
	
	public UserInfo findByEmail(String email);
	
}
