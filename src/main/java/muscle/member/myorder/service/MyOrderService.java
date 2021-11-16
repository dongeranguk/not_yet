package muscle.member.myorder.service;

import java.util.List;
import java.util.Map;

public interface MyOrderService {

   List<Map<String, Object>> openMyOrderList(Map<String, Object> map)throws Exception;
   Map<String, Object> myOrderStatus(Map<String, Object> map)throws Exception; 
   Map<String, Object> openMyOrderDetail(Map<String, Object> map)throws Exception;
   List<Map<String, Object>> openMyOrderDetailList(Map<String, Object> map)throws Exception;
   Map<String, Object> openMyChangeForm(Map<String, Object> map)throws Exception;
   void updateMyChange(Map<String, Object> map)throws Exception;
}