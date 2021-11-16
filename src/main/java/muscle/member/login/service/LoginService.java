package muscle.member.login.service;


import java.util.Map;

public interface LoginService {
	public Map<String, Object> login(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> findIdWithEmail(Map<String, Object> map) throws Exception;

	public int findId(Map<String, Object> map) throws Exception;
	
	public int findPwWithEmail(Map<String, Object> map) throws Exception;

	public void updateTempPw(Map<String,Object> map) throws Exception;
	

	//카카오 로그인시 아이디 중복 검색
	public Map<String, Object> findKakaoId(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> kakaoLogin(Map<String, Object> map) throws Exception;

	public int kakaoUpdate(Map<String, Object> map) throws Exception;
	
	public int kakaoUpdate1(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> finder(Map<String, Object> map) throws Exception;
	
	public void kakaoJoin4(Map<String, Object> map) throws Exception;
}

