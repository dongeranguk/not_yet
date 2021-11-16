package muscle.member.join.service;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import muscle.member.join.dao.JoinVO;
public class JoinValidator implements Validator {
	private static final String emailRegExp =
			"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9]+)*@" +
			"[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	
	private Pattern pattern;
	
	@Resource(name="joinVO")
	private JoinVO joinVO;
	
	public JoinValidator() {
		pattern = Pattern.compile(emailRegExp);
	}
	
	@Override
	public boolean supports(Class<?> clazz) {
		return JoinVO.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		JoinVO joinVO = (JoinVO) target;
		
		if(joinVO.getMEM_EMAIL() == null && joinVO.getMEM_EMAIL().trim().isEmpty()) {
			errors.rejectValue("MEM_EMAIL", "required", "필수 정보입니다.");
		} else {
			Matcher matcher = pattern.matcher(joinVO.getMEM_EMAIL());
			if(!matcher.matches()) {
				errors.rejectValue("MEM_EMAIL", "bad", "올바르지 않은 형식입니다.");
			}
		}
		
		if(joinVO.getMEM_ID().length() >= 3 && joinVO.getMEM_ID().length() <= 10) {
			
		} else {
			errors.rejectValue("MEM_ID", "bad");
		}
		
		if(joinVO.getMEM_PW().length() >= 8 && joinVO.getMEM_PW().length() <= 20) {
			
		} else {
			errors.rejectValue("MEM_PW", "bad");
			
		}
	
		
		if(!joinVO.getMEM_PW().isEmpty()) {
			if(joinVO.getMEM_PW() == joinVO.getMEM_PW2()) {
				errors.rejectValue("MEM_PW2", "nomatch", "비밀번호가 일치하지 않습니다.");
			}
		}
		
		if(joinVO.getMEM_PHONE().length() != 10 && joinVO.getMEM_PHONE().length() != 11) {
			errors.rejectValue("MEM_ID", "bad");
		}
		
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEM_ID", "reqired", "필수 정보입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEM_NAME", "reqired", "필수 정보입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEM_PW", "reqired", "필수 정보입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEM_PW2", "reqired", "필수 정보입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEM_PHONE", "reqired", "필수 정보입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEM_ZIPCODE", "reqired", "필수 정보입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEM_ADDRESS1" ,"reqired", "필수 정보입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEM_ADDRESS2", "reqired", "필수 정보입니다.");
		/*
		 * if(!joinVO.getPw().isEmpty()) { if(!joinVO.isPwEqualToCheckPw()) {
		 * errors.rejectValue("pw2", "nomatch", "비밀번호가 일치하지 않습니다."); } }
		 */
	}
}