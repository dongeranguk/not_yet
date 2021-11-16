package muscle.member.join.service;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
public interface JoinService {
	
	List<Map<String, Object>> selectJoinList(Map<String, Object> map)throws Exception;
	void insertJoin(Map<String, Object> map)throws Exception;
	
	public int selectIdCheck(Map<String, Object> map) throws Exception;
	
	public int selectNickCheck(Map<String, Object> map) throws Exception;
}