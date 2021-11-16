package muscle.member.login.dao;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	
	@NotEmpty
	private String MEM_ID;
	@NotEmpty
	private String MEM_PW;
}
