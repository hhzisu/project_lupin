package com.boot.project_lupin.dto;

import java.util.Map;

public class NaverResponse implements OAuth2Response {

    private final Map<String, Object> attribute;

    public NaverResponse(Map<String, Object> attribute) {
        // 네이버 응답에서 "response" 객체를 추출
        this.attribute = (Map<String, Object>) attribute.get("response");
    }

    @Override
    public String getProvider() {
        return "naver";
    }

    @Override
    public String getProviderId() {
        return attribute.get("id").toString();
    }

    @Override
    public String getEmail() {
        return (String) attribute.get("email");
    }

    @Override
    public String getName() {
        return (String) attribute.get("name");
    }

    @Override
    public String getMobile() {
        return (String) attribute.get("mobile");
    }

    @Override
    public String getGender() {
        return (String) attribute.get("gender");
    }

    @Override
    public String getBirthYear() {
        return (String) attribute.get("birthyear");
    }

    @Override
    public String getBirthday() {
        return (String) attribute.get("birthday");
    }

}
