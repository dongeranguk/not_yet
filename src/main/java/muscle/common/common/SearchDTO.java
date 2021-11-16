package muscle.common.common;
import org.springframework.stereotype.Repository;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Repository("searchDTO")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SearchDTO {
	private String searchType, keyword, replaceKeyword;
	
	public void setReplaceKeyword(String keyword) {
		replaceKeyword = keyword;
	}
	public String getReplaceKeyword() {
		return replaceKeyword.replace("%", "");
	}
}