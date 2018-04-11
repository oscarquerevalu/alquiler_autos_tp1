package pe.com.alquilerautorara.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import pe.com.alquilerautorara.model.UserInfo;

/**
 * Interface de abstrcao do crud.
 * @author hlandim
 *
 */
@Repository
public interface UserInfoDao extends CrudRepository<UserInfo, Long>{

	public UserInfo findByUsername(String username);
	
}
