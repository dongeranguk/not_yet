package muscle.member.join.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import muscle.member.join.dao.JoinDAO;

@Service("joinService")
public class JoinServiceImpl implements JoinService{
	Logger log=Logger.getLogger(this.getClass());
	
	@Resource(name="joinDAO")
	private JoinDAO joinDAO;
	
	@Override
	public List<Map<String, Object>> selectJoinList(Map<String, Object> map)throws Exception{
			return joinDAO.selectJoinList(map);
	}
	
	@Override
	public void insertJoin(Map<String, Object> map) throws Exception{
		joinDAO.insertJoin(map);		
	}

	@Override
	public int selectIdCheck(Map<String, Object> map) throws Exception {
		return joinDAO.selectIdCheck(map);
	}

	@Override
	public int selectNickCheck(Map<String, Object> map) throws Exception {
		return joinDAO.selectNickCheck(map);
	}
}
