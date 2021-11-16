package muscle.admin.account.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import muscle.common.dao.AbstractDAO;

@Repository("adminAccountDAO")
public class AdminAccountDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminDailyAccountingList(Map<String, Object> map) throws Exception{
		System.out.println("AdminAccountDAO.adminDailyAccountingList map값 확인: " + map);
		return (List<Map<String, Object>>)selectList("account.adminDailyAccountingList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminMonthlyAccountingList(Map<String, Object> map) throws Exception{
		System.out.println("AdminAccountDAO.adminMonthlyAccountingList map값 확인: " + map);
		return (List<Map<String, Object>>)selectList("account.adminMonthlyAccountingList", map);
	}
}
