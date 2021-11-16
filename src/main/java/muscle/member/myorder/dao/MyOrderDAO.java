package muscle.member.myorder.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import muscle.common.dao.AbstractDAO;

@Repository("myOrderDAO")
public class MyOrderDAO extends AbstractDAO{
   
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> openMyOrderList(Map<String, Object> map)throws Exception{
      return (List<Map<String, Object>>) openBoardList("myOrder.openMyOrderList", map);
   }
   
   @SuppressWarnings("unchecked")
   public Map<String, Object> myOrderStatus(Map<String, Object> map)throws Exception{
      return (Map<String, Object>) selectOne("myOrder.status", map);
   }
   
   @SuppressWarnings("unchecked")
   public Map<String, Object> openMyOrderDetail(Map<String, Object> map)throws Exception{
      return (Map<String, Object>) selectOne("myOrder.openMyOrderMap", map);
   }
   
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> openMyOrderDetailList(Map<String, Object> map)throws Exception{
      return (List<Map<String, Object>>) openBoardList("myOrder.openMyOrderDetail", map);
   }
   
   
   @SuppressWarnings("unchecked")
   public Map<String, Object> openMyChangeForm(Map<String, Object> map)throws Exception {
      return (Map<String, Object>) selectOne("myOrder.openMyChangeForm", map);
   }
   
   public void updateMyChange(Map<String, Object> map)throws Exception{
      update("myOrder.updateMyChange", map);
   }

}