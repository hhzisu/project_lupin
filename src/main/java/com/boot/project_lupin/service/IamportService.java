package com.boot.project_lupin.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Service
public class IamportService {

    @Value("${iamport.api.key}")
    private String impKey;

    @Value("${iamport.api.secret}")
    private String impSecret;

    private static final String API_URL = "https://api.iamport.kr";

    // Iamport API를 호출하여 AccessToken을 받아오는 메서드
    public String getAccessToken() {
        String apiUrl = API_URL + "/users/getToken";

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        Map<String, String> request = new HashMap<>();
        request.put("imp_key", impKey);
        request.put("imp_secret", impSecret);

        HttpEntity<Map<String, String>> entity = new HttpEntity<>(request, headers);
        ResponseEntity<Map> response = restTemplate.exchange(apiUrl, HttpMethod.POST, entity, Map.class);

        Map<String, Object> responseBody = (Map<String, Object>) response.getBody().get("response");
        return (String) responseBody.get("access_token");
    }

    // AccessToken을 발급받은 후, 해당 결제 건의 결제 상태를 확인하는 메서드
    public boolean verifyPayment(String impUid) {
        String apiUrl = "https://api.iamport.kr/payments/" + impUid;
        String accessToken = getAccessToken(); // 발급받은 AccessToken 사용

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken);

        HttpEntity<String> entity = new HttpEntity<>(headers);
        ResponseEntity<Map> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, Map.class);

        Map<String, Object> responseBody = (Map<String, Object>) response.getBody().get("response");

        // 결제가 성공적으로 이루어졌는지 확인
        String status = (String) responseBody.get("status");
        return "paid".equals(status); // 'paid'는 결제가 완료된 상태를 나타냅니다.
    }
}
