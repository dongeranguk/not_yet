package muscle.member.login.service;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import muscle.member.login.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService{
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;

	@Override
	public Map<String, Object> login(Map<String, Object> map) throws Exception {
		System.out.println("로그인 처리 값: "+loginDAO.selectId(map));
		return loginDAO.selectId(map);
	}
	
	@Override
	public Map<String, Object> findIdWithEmail(Map<String, Object> map) throws Exception {
		return loginDAO.findIdWithEmail(map);
	}
	
	@Override
	public int findId(Map<String, Object> map) throws Exception {
		return loginDAO.findId(map);
	}

	@Override
	public int findPwWithEmail(Map<String, Object> map) throws Exception {
		return loginDAO.findPwWithEmail(map);
	}

	@Override
	public void updateTempPw(Map<String,Object> map) throws Exception {
		loginDAO.updateTempPw(map);
	}
	
	@Override
	public Map<String, Object> findKakaoId(Map<String, Object> map) throws Exception {
		return loginDAO.findKakaoId(map);
	}
	
	@Override
	public Map<String, Object> kakaoLogin(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)loginDAO.kakaoLogin(map);
	}
	
	@Override
	public int kakaoUpdate(Map<String, Object> map) throws Exception {
		return loginDAO.kakaoUpdate(map);
	}
	
	@Override
	public int kakaoUpdate1(Map<String, Object> map) throws Exception {
		return loginDAO.kakaoUpdate1(map);
	}
	
	@Override
	public Map<String, Object> finder(Map<String, Object> map) throws Exception {
		return loginDAO.finder(map);
	}
	
	@Override
	public void kakaoJoin4(Map<String, Object> map) throws Exception {
		loginDAO.kakaoJoin4(map);
	}
}

