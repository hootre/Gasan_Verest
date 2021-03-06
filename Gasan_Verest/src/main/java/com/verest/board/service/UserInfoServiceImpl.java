package com.verest.board.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.verest.board.dao.PortDao;
import com.verest.board.dao.ProjectDao;
import com.verest.board.dao.SaleDao;
import com.verest.board.dao.UserInfoDao;
import com.verest.board.model.CommonException;
import com.verest.board.model.Port;
import com.verest.board.model.Project;
import com.verest.board.model.Sale;
import com.verest.board.model.UserInfo;
import com.verest.board.model.UserType;
import com.verest.board.model.UserTypeId;

@Service
public class UserInfoServiceImpl implements UserInfoService {
	
	@Autowired
	private UserInfoDao userInfoDao;

	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private PortDao portdao;
	
	@Autowired
	private ProjectDao prodao;
	
	@Autowired
	private SaleDao saledao;

	@Override
	public UserInfo detail(Integer id) throws CommonException {
		return userInfoDao.select(id);
	}

	@Transactional
	@Override
	public void newUser(UserInfo userInfo) throws CommonException {

		userInfo.setV_password(encoder.encode(userInfo.getV_password()));

		UserType userType = new UserType(UserTypeId.USER.getUserTypeId(), UserTypeId.USER.name());
		Set<UserType> userTypes = new HashSet<>();
		userTypes.add(userType);

		userInfo.setUserTypes(userTypes);

		userInfoDao.insert(userInfo);
		userInfoDao.insertUserTypes(userInfo);
	}

	@Transactional
	@Override
	public void delete(Integer id, String password) throws CommonException {
		
		UserInfo item = userInfoDao.select(id);
		
		boolean isMatched = encoder.matches(password, item.getV_password());
		if (isMatched) {
			userInfoDao.deleteUserTypes(id);
			userInfoDao.delete(id);
		} else {
			throw new CommonException("E60: 비밀번호가 동일하지 않아 삭제 실패");
		}
	}

	@Override
	public void modify(UserInfo userInfo) throws CommonException {
		userInfoDao.update(userInfo);
	}

	@Override
	public boolean isPasswordMatched(Integer id, String rawPassword) throws CommonException {
		
		// 데이터베이스로부터 현재 사용자의 암호화된 비밀번호를 가져온다.
		UserInfo item = userInfoDao.select(id);
		return encoder.matches(rawPassword, item.getV_password());
	}
	
	@Override
	public boolean isPasswordMatched(String email, String rawPassword) throws CommonException {
		
		// 데이터베이스로부터 현재 사용자의 암호화된 비밀번호를 가져온다.
		UserInfo item = userInfoDao.selectByEmail(email);
		return encoder.matches(rawPassword, item.getV_password());
	}

	@Override
	public boolean isPortMatched(Integer no, String rawPassword) throws CommonException {
		/*
		 *  게시물 번호를 이용하여 게시물을 가져온 뒤
		 *  게시물의 작성자 email값을 획득한 후,
		 *  획득한 email값으로 사용자 정보를 가져와
		 *  해당 사용자의 비밀번호를 가져온다.
		 */
		Port port = portdao.select(no);
		UserInfo userInfo = userInfoDao.select(port.getWriter());
		
		// 해당 사용자의 비밀번호와 입력한 비밀번호 비교한 결과 리턴
		return encoder.matches(rawPassword, userInfo.getV_password());
	}
	@Override
	public boolean isProMatched(Integer no, String rawPassword) throws CommonException {
		/*
		 *  게시물 번호를 이용하여 게시물을 가져온 뒤
		 *  게시물의 작성자 email값을 획득한 후,
		 *  획득한 email값으로 사용자 정보를 가져와
		 *  해당 사용자의 비밀번호를 가져온다.
		 */
		Project pro = prodao.select(no);
		UserInfo userInfo = userInfoDao.select(pro.getWriter());
		
		// 해당 사용자의 비밀번호와 입력한 비밀번호 비교한 결과 리턴
		return encoder.matches(rawPassword, userInfo.getV_password());
	}
	@Override
	public boolean isSaleMatched(Integer no, String rawPassword) throws CommonException {
		/*
		 *  게시물 번호를 이용하여 게시물을 가져온 뒤
		 *  게시물의 작성자 email값을 획득한 후,
		 *  획득한 email값으로 사용자 정보를 가져와
		 *  해당 사용자의 비밀번호를 가져온다.
		 */
		Sale sale = saledao.select(no);
		UserInfo userInfo = userInfoDao.select(sale.getWriter());
		
		// 해당 사용자의 비밀번호와 입력한 비밀번호 비교한 결과 리턴
		return encoder.matches(rawPassword, userInfo.getV_password());
	}

	@Override
	public UserInfo detail(String v_email) throws CommonException {
		return userInfoDao.selectByEmail(v_email);
	}

	@Override
	public void delete(String email, String password) throws CommonException {
		UserInfo item = userInfoDao.selectByEmail(email);
		
		boolean isMatched = encoder.matches(password, item.getV_password());
		if (isMatched) {
			userInfoDao.deleteUserTypes(item.getV_id());
			userInfoDao.delete(item.getV_id());
			
		} else {
			throw new CommonException("E61: 비밀번호가 동일하지 않아 삭제 실패");
		}
	}

	@Override
	public List<UserInfo> list() throws CommonException {
		return userInfoDao.selectAll();
	}

	@Override
	public void delete(Integer id) throws CommonException {
		UserInfo item = userInfoDao.select(id);
		userInfoDao.deleteUserTypes(item.getV_id());
		userInfoDao.delete(id);
	}
}
