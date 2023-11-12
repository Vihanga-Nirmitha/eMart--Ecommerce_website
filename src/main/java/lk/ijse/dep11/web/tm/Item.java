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
public class Item implements Serializable {
    private String id;
    private String title;
    private String model;
    private String brand;
    private String price;
    private int qty;
    private int sold;
    private Date date;
    private String rating;
    private String path1;
    private String path2;
    private String path3;
    private String path4;
    private String path5;



}
