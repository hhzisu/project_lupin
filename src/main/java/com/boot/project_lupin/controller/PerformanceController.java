package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.PerformanceDTO;
import com.boot.project_lupin.service.PerformanceService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import java.util.List;

@Controller
public class PerformanceController {

    private final PerformanceService performanceService;

    public PerformanceController(PerformanceService performanceService) {
        this.performanceService = performanceService;
    }

    @GetMapping("/performances")
    public String getPerformancesByRealm(
            @RequestParam(defaultValue = "20240923") String from,
            @RequestParam(defaultValue = "20241231") String to,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "100") int rows,
            @RequestParam(defaultValue = "D000") String realmCode,  // 기본값 설정
            Model model) {

        List<PerformanceDTO> performances = performanceService.getPerformancesByRealm(from, to, page, rows, realmCode);
        model.addAttribute("performances", performances);

        return "performances";
    }


}
