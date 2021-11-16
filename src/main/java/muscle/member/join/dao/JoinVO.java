package muscle.member.join.dao;
import org.springframework.stereotype.Repository;
import lombok.*;
@Getter
@Setter
@ToString
@Repository("joinVO")
public class JoinVO {
	private String MEM_ID;
	private String MEM_PW;
	private String MEM_PW2;
	private String MEM_NAME;
	private String MEM_NICK;
	private String MEM_EMAIL;
	private String MEM_PHONE;
	private String MEM_ZIPCODE;
	private String MEM_ADDRESS1;
	private String MEM_ADDRESS2;	
	
}