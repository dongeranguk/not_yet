package muscle.admin.amember.service;

import java.util.List;
import java.util.Map;

public interface  AdminMemberService {
   List<Map<String, Object>> selectMemberList(Map<String, Object> map)throws Exception;
   List<Map<String, Object>> selectMemberSearchList(Map<String, Object> map, String key)throws Exception;
   Map<String, Object> openAdminMemberDetail(Map<String, Object> map)throws Exception;
   void ignoreAdminMember(Map<String, Object> map)throws Exception;
}