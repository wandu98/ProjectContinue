package crawling;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CrawlingDTO {

    private String gm_code;
    private String gm_name;
    private int gm_price;
    private String gm_level;
    private String gm_category;

} // class end
