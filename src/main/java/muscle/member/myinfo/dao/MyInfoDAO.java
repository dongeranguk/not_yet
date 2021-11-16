package muscle.member.myinfo.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import muscle.common.dao.AbstractDAO;

@Repository("myInfoDAO")
public class MyInfoDAO extends AbstractDAO{
   
   public Map<String, Object> selectMyInfo(Map<String, Object> map)throws Exception{
      return (Map<String, Object>) selectOne ("myInfo.selectMyInfo", map); //마이페이지 닉네임 보여주기
   }
   
   public Map<String, Object> updateMyInfoForm(Map<String, Object> map)throws Exception{
      return (Map<String, Object>) selectOne ("myInfo.selectMyInfoModifyForm", map); //마이페이지 수정 폼 보여주기
   }
   
   public void updateMyInfo(Map<String, Object> map)throws Exception{
      update("myInfo.updateMyInfo", map);//회원정보 수정
   }
   
   public void deleteMyInfo(Map<String, Object> map)throws Exception{
      update("myInfo.deleteMyInfo", map);//회원탈퇴 우리는 삭제가 아닌 컬럼 N -> Y로 고로, update
   }
   
	
   public List<Map<String, Object>> openMyBoardList(Map<String, Object> map) throws Exception{ 
	   return (List<Map<String, Object>>)selectList("myInfo.selectMyBoardList", map); 
   }
}