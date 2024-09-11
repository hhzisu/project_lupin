package com.boot.project_lupin.service;

import com.boot.project_lupin.dto.CustomOAuth2User;
import com.boot.project_lupin.dto.NaverResponse;
import com.boot.project_lupin.dto.OAuth2Response;
import com.boot.project_lupin.entity.UserEntity;
import com.boot.project_lupin.repository.UserRepository;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {
    //DefaultOAuth2UserService OAuth2UserService의 구현체

    private final UserRepository userRepository;

    public CustomOAuth2UserService(UserRepository userRepository) {

        this.userRepository = userRepository;
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

        OAuth2User oAuth2User = super.loadUser(userRequest);
        System.out.println(oAuth2User.getAttributes());

        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        OAuth2Response oAuth2Response = null;
        if (registrationId.equals("naver")) {

            oAuth2Response = new NaverResponse(oAuth2User.getAttributes());
        }
        else {

            return null;
        }

        String name = oAuth2Response.getName();
        System.out.println("사용자 이름: " + name);  // 이름 출력
        String gender = oAuth2Response.getGender();
        System.out.println("사용자 성별: " + gender);  // 성별 출력
        String birthday = oAuth2Response.getBirthday();
        System.out.println("사용자 생일: " + birthday);  // 월일 출력
        String birthyear = oAuth2Response.getBirthYear();
        System.out.println("사용자 출생년도: " + birthyear);  // 출생년도 출력
        String mobile = oAuth2Response.getMobile();
        System.out.println("사용자 휴대폰번호: " + mobile);  // 출생년도 출력

        String username = oAuth2Response.getProvider()+" "+oAuth2Response.getProviderId();
//        사용자가 있는지 조회
        UserEntity existData = userRepository.findByUsername(username);

        String role = "ROLE_USER";
        if (existData == null) {

            UserEntity userEntity = new UserEntity();
            userEntity.setUsername(username);
            userEntity.setName(name);
            userEntity.setGender(gender);
            userEntity.setBirthday(birthday);
            userEntity.setBirthyear(birthyear);
            userEntity.setMobile(mobile);
            userEntity.setEmail(oAuth2Response.getEmail());
            userEntity.setRole(role);

            userRepository.save(userEntity);
            // 자동 생성된 사용자 ID 출력
            System.out.println("새로 생성된 사용자 ID: " + userEntity.getId());
        }
        else {

            existData.setUsername(username);
            existData.setEmail(oAuth2Response.getEmail());
            existData.setName(name);           // 이름 업데이트
            existData.setGender(gender);       // 성별 업데이트
            existData.setBirthday(birthday);   // 생일 업데이트
            existData.setBirthyear(birthyear); // 출생년도 업데이트
            existData.setMobile(mobile);

            role = existData.getRole();

            userRepository.save(existData);
        }

        return new CustomOAuth2User(oAuth2Response, role);
    }
}
