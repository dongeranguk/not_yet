package muscle.member.join.dao;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import muscle.common.dao.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectJoinList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("member.selectJoinList", map);
	}

	public void insertJoin(Map<String, Object> map) throws Exception{
		insert("member.insertJoin", map);		
	}
	
	public int selectIdCheck(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("member.selectIdCheck",map);
	}
	
	public int selectNickCheck(Map<String, Object> map) throws Exception{
		return (Integer)selectOne("member.selectNickCheck",map);
	}
}
