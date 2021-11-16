package muscle.admin.aorder.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import muscle.admin.aorder.dao.AdminOrdersDAO;
import muscle.common.common.CommandMap;

@Service("adminOrdersService")
public class AdminOrdersServiceImpl implements AdminOrdersService {
	Logger log=Logger.getLogger(this.getClass());
	
	@Resource(name="adminOrdersDAO")
	private AdminOrdersDAO adminOrdersDAO;

	@Override
	public List<Map<String, Object>> selectAdminOrdersList(Map<String, Object> map) throws Exception {
		return adminOrdersDAO.selectMainList(map);
	}
	
	@Override
	public List<Map<String, Object>> order_admin_a(CommandMap map) throws Exception { //주문/배송-신규주문
		// TODO Auto-generated method stub
		return adminOrdersDAO.order_admin_a(map);
	}
	
	@Override
	public List<Map<String, Object>> order_detail(CommandMap commandMap) throws Exception {
		return adminOrdersDAO.order_detail(commandMap);
	}
	
	@Override
	public List<Map<String, Object>> order_detail_sub(CommandMap commandMap) throws Exception {
		return adminOrdersDAO.order_detail_sub(commandMap);
	}
	
	@Override
	public void order_state(CommandMap map) throws Exception { // 주문상태 변경
		adminOrdersDAO.order_state(map);
	}

	@Override
	public void order_state_ex(CommandMap map) throws Exception {  // 주문상태에 배송도 변경
		adminOrdersDAO.order_state_ex(map);
	}
	
	@Override
	public List<Map<String, Object>> as_admin_list(CommandMap commandMap) throws Exception {
		// TODO Auto-generated method stub
		return adminOrdersDAO.as_admin_list(commandMap);
	}
	
	@Override
	public void as_cancle_a(CommandMap commandMap) throws Exception {
		adminOrdersDAO.as_cancle_a(commandMap);
	}
	
	@Override
	public void as_ok_a(CommandMap commandMap) throws Exception {
		if(commandMap.get("AORDER_STATE").equals("6")) {
		adminOrdersDAO.as_ok_orderState(commandMap);
		}else {
			adminOrdersDAO.as_ok_state(commandMap);
			adminOrdersDAO.as_ok_orderState(commandMap);
		}
	}
	
}
