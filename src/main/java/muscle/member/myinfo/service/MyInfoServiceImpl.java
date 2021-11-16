package muscle.member.myinfo.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import muscle.member.myinfo.dao.MyInfoDAO;

@Service("myInfoService")
public class MyInfoServiceImpl implements MyInfoService{
   Logger log=Logger.getLogger(this.getClass());
   
   @Resource(name="myInfoDAO")
   private MyInfoDAO myInfoDAO;
      
   @Override
   public Map<String, Object> selectMyInfoForm(Map<String, Object> map)throws Exception{
      return myInfoDAO.selectMyInfo(map);
   }
   
   @Override
   public Map<String, Object> updateMyInfoForm(Map<String, Object> map)throws Exception{
      return myInfoDAO.updateMyInfoForm(map);
   }   
   
   @Override
   public void updateMyInfo(Map<String, Object> map)throws Exception{
      myInfoDAO.updateMyInfo(map);
   }
   
   @Override
   public void deleteMyInfo(Map<String, Object> map)throws Exception{
      myInfoDAO.deleteMyInfo(map);
   }
   
	
	@Override 
	public List<Map<String, Object>> openMyBoardList(Map<String, Object> map) throws Exception { 
		return myInfoDAO.openMyBoardList(map); 
	}
	 
}