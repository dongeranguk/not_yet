package muscle.admin.account.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import muscle.admin.account.dao.AdminAccountDAO;

@Service("adminAccountService")
public class AdminAccountServiceImpl implements AdminAccountService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "adminAccountDAO")
	private AdminAccountDAO adminAccountDAO;
	
	@Override
	public List<Map<String, Object>> adminDailyAccountingList(Map<String, Object> map, String cate1) throws Exception {
		map.put("cate1", cate1);
		return adminAccountDAO.adminDailyAccountingList(map);
	}

	@Override
	public List<Map<String, Object>> adminMonthlyAccountingList(Map<String, Object> map, String cate1) throws Exception {
		map.put("cate1", cate1);
		return adminAccountDAO.adminMonthlyAccountingList(map);
	}
}
