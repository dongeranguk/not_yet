package muscle.admin.amember.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import muscle.common.dao.AbstractDAO;

@Repository("adminMemDao")
public class AdminMemberDao extends AbstractDAO {
   
      @SuppressWarnings("unchecked")
      public List<Map<String, Object>> selectMemberList(Map<String, Object> map)throws Exception{
         return (List<Map<String, Object>>)selectPagingList("adminMem.selectMemberList", map); 
      }
      
      @SuppressWarnings("unchecked")
      public List<Map<String, Object>> selectMemberSearchList(Map<String, Object> map)throws Exception{
    	  System.out.println("AdminMemberDao.selectMemberSearchList map°ª È®ÀÎ: " + map);
    	  return (List<Map<String, Object>>)selectPagingList("adminMem.selectMemberSearchList", map);
      }
      
      @SuppressWarnings("unchecked")
      public Map<String, Object> openAdminMemberDetail(Map<String, Object> map)throws Exception{
         return (Map<String, Object>)selectOne("adminMem.openAdminMemberDetail", map);
      }
      
      public void ignoreAdminMember(Map<String, Object> map)throws Exception{
         update("adminMem.ignoreAdminMember", map);
      }
}