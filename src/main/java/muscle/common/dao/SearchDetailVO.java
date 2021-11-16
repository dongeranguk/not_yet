
package muscle.common.dao;

import org.springframework.stereotype.Repository;

import lombok.*;

@Repository("searchDetailVO")
@Getter
@Setter
public class SearchDetailVO {
	private String[] category1;
	private String[] category2;
	private String[] size;
	private String[] color;
	
}