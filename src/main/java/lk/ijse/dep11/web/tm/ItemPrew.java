package lk.ijse.dep11.web.tm;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemPrew implements Serializable {
    private int itemid;
    private String title;
    private String price;
    private String path;
    private String rating;
}
