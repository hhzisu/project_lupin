package com.boot.project_lupin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuctionScheduleDTO {
    private int auctionSchedule_id;
    private String auctionSchedule_start;
    private String auctionSchedule_end;
}
