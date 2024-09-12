package com.boot.project_lupin.dto;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

public class CustomOAuth2User implements OAuth2User {
    private final OAuth2Response oAuth2Response;
    private final String role;

    public CustomOAuth2User(OAuth2Response oAuth2Response, String role) {

        this.oAuth2Response = oAuth2Response;
        this.role = role;
    }

    @Override
    public Map<String, Object> getAttributes() {

        return null;
    }

//    @Override
//    public Collection<? extends GrantedAuthority> getAuthorities() {
//
//        Collection<GrantedAuthority> collection = new ArrayList<>();
//
//        collection.add(new GrantedAuthority() {
//
//            @Override
//            public String getAuthority() {
//
//                return role;
//            }
//        });
//
//        return collection;
//    }
@Override
public Collection<? extends GrantedAuthority> getAuthorities() {
    Collection<GrantedAuthority> collection = new ArrayList<>();
    collection.add(() -> role);
    return collection;
}


    @Override
    public String getName() {

        return oAuth2Response.getName();
    }

    public String getUsername() {

        return oAuth2Response.getProvider()+" "+oAuth2Response.getProviderId();
    }

    // 각 속성에 대한 getter 메서드 추가
    public String getEmail() {
        return oAuth2Response.getEmail();
    }

    public String getGender() {
        return oAuth2Response.getGender();
    }

    public String getBirthday() {
        return oAuth2Response.getBirthday();
    }

    public String getBirthYear() {
        return oAuth2Response.getBirthYear();
    }

    public String getMobile() {
        return oAuth2Response.getMobile();
    }

    public String getRole() {
        return this.role;
    }

    // 추가로 id가 필요하다면 OAuth2Response나 UserEntity에서 가져와야 함
    public String getId() {
        return oAuth2Response.getProviderId();
    }
}
