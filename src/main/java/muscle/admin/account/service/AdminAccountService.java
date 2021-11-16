package muscle.admin.account.service;

import java.util.List;
import java.util.Map;

public interface AdminAccountService {
	List<Map<String,Object>> adminDailyAccountingList(Map<String,Object>map, String cate1) throws Exception;
	List<Map<String,Object>> adminMonthlyAccountingList(Map<String,Object>map, String cate1) throws Exception;
}

