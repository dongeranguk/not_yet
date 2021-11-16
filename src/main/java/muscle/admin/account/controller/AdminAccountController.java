package muscle.admin.account.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import muscle.admin.account.service.AdminAccountService;
import muscle.common.common.CommandMap;

@Controller
public class AdminAccountController {
	
	@Resource(name = "adminAccountService")
	private AdminAccountService adminAccountService;

	@RequestMapping(value = "/admin/openDailyAccountingList.do")
	public ModelAndView openDailyAccountingList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/accountingList");
		return mv;
	}
	
	@RequestMapping(value = "/admin/adminDailyAccountingList.do")
	public ModelAndView adminDailyAccountingList(CommandMap commandMap,  @RequestParam(value = "cate1", defaultValue = "") String cate1) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/accountingList");
		String order_price = "";
		System.out.println("commandMap 값 확인: " + commandMap.getMap());
		System.out.println("selectCate 값 확인 " + cate1);
		
		List<Map<String, Object>> revenue = adminAccountService.adminDailyAccountingList(commandMap.getMap(), cate1);
		if(revenue.get(0) != null) {
			order_price = revenue.get(0).get("ORDER_PRICE").toString();
			mv.addObject("order_price", order_price);
		}else {
			order_price = "해당일은 집계될 매출액이 없습니다.";
			mv.addObject("order_price", order_price);
		}
		return mv;
	}
	
	@RequestMapping(value = "/admin/openMonthlyAccountingList.do")
	public ModelAndView openMonthlyAccountingList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/accountingList2");
		return mv;
	}
	
	@RequestMapping(value = "/admin/adminMonthlyAccountingList.do")
	public ModelAndView adminMonthlyAccountingList(CommandMap commandMap,  @RequestParam(value = "cate1", defaultValue = "") String cate1) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/accountingList2");
		String order_price = "";
		System.out.println("commandMap 값 확인: " + commandMap.getMap());
		System.out.println("selectCate 값 확인 " + cate1);
		
		List<Map<String, Object>> revenue = adminAccountService.adminMonthlyAccountingList(commandMap.getMap(), cate1);
		if(revenue.get(0) != null) {
			order_price = revenue.get(0).get("ORDER_PRICE").toString();
			mv.addObject("order_price", order_price);
		}else {
			order_price = "해당일은 집계될 매출액이 없습니다.";
			mv.addObject("order_price", order_price);
		}
		return mv;
	}
}