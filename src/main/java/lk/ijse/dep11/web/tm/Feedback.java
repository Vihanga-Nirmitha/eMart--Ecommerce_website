package lk.ijse.dep11.web.tm;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Feedback implements Serializable {

    private String feedbackid;
    private String itemid;
    private String username;
    private String comment;
    private int rating;
    private Date date;
}
