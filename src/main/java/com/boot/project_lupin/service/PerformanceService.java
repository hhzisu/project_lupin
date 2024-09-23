package com.boot.project_lupin.service;

import com.boot.project_lupin.dto.ApiExplorer;
import com.boot.project_lupin.dto.PerformanceDTO;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PerformanceService {

    private final ApiExplorer apiExplorer;

    public PerformanceService(ApiExplorer apiExplorer) {
        this.apiExplorer = apiExplorer;
    }

    public List<PerformanceDTO> getPerformancesByRealm(String from, String to, int page, int rows, String realmCode) {
        try {
            return apiExplorer.getPerformancesByRealm(from, to, page, rows, realmCode);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
