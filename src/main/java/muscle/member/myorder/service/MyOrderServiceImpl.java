   package muscle.member.myorder.service;
   
   import java.util.List;
   import java.util.Map;
   
   import javax.annotation.Resource;
   
   import org.springframework.stereotype.Service;
   
   import muscle.member.myorder.dao.MyOrderDAO;
   
   @Service("myOrderService")
   public class MyOrderServiceImpl implements MyOrderService {
      @Resource(name="myOrderDAO")
      private MyOrderDAO myOrderDAO;
      
      public List<Map<String, Object>> openMyOrderList(Map<String, Object> map)throws Exception{
         return myOrderDAO.openMyOrderList(map);
      }
      
      public Map<String, Object> myOrderStatus(Map<String, Object> map)throws Exception{
         return myOrderDAO.myOrderStatus(map);
      }
      
      public Map<String, Object> openMyOrderDetail(Map<String, Object> map)throws Exception{
         return myOrderDAO.openMyOrderDetail(map);
      }
      
      public List<Map<String, Object>> openMyOrderDetailList(Map<String, Object> map)throws Exception{
         return myOrderDAO.openMyOrderDetailList(map);
      }

       public Map<String, Object> openMyChangeForm(Map<String, Object> map)throws Exception {
         return myOrderDAO.openMyChangeForm(map);
       }
    
       public void updateMyChange(Map<String, Object> map)throws Exception{
          myOrderDAO.updateMyChange(map);
       }
   }