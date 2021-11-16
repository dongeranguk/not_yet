package muscle.admin.acs.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import muscle.admin.acs.dao.AcsDAO;


@Service("acsService")
public class AcsServiceImpl implements AcsService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="acsDAO")
	private AcsDAO acsDAO;
	
	@Override
	public List<Map<String, Object>> acsBoardList(Map<String, Object> map)throws Exception{
		return acsDAO.acsBoardList(map);
	}
	
	@Override
	public Map<String, Object> acsDetail(Map<String, Object> map)throws Exception{
		acsDAO.updateHitCnt(map);
		Map<String, Object> resultMap = acsDAO.acsDetail(map);
		return resultMap; 
	}
	
	@Override
	public void insertAcs(Map<String, Object> map)throws Exception{
		acsDAO.insertAcs(map);
	}
	
	@Override
	public Map<String, Object> updateAcsForm(Map<String, Object> map)throws Exception{
		return acsDAO.updateAcsForm(map);
	}
	
	@Override
	public void updateAcs(Map<String, Object> map)throws Exception{
		acsDAO.updateAcs(map);
	}
	
	@Override
	public void deleteAcs(Map<String, Object> map)throws Exception{
		acsDAO.deleteAcs(map);
	}
	
	@Override
	   public List<Map<String, Object>> allList(Map<String, Object> map)throws Exception{
	      return acsDAO.allList(map);
	   }
	
	@Override
	   public List<Map<String, Object>> notice(Map<String, Object> map)throws Exception{
	      return acsDAO.notice(map);
	   }
	
	@Override
	   public List<Map<String, Object>> event(Map<String, Object> map)throws Exception{
	      return acsDAO.event(map);
	   }
	
	@Override
	public List<Map<String, Object>> SearchAcs(Map<String, Object> map)throws Exception{
		return acsDAO.SearchAcs(map);
	}
	
	@Override
	public List<Map<String, Object>> faqBoardList(Map<String, Object> map)throws Exception{
		return acsDAO.faqBoardList(map);
	}
	
	@Override
	public void insertFaq(Map<String, Object> map)throws Exception{
		acsDAO.insertFaq(map);
	}
	
	@Override
	public Map<String, Object> updateFaqForm(Map<String, Object> map)throws Exception{
		return acsDAO.updateFaqForm(map);
	}
	
	@Override
	public void updateFaq(Map<String, Object> map)throws Exception{
		acsDAO.updateFaq(map);
	}
}
