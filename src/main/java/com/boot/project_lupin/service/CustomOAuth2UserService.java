package com.boot.project_lupin.service;

import com.boot.project_lupin.dto.CustomOAuth2User;
import com.boot.project_lupin.dto.NaverResponse;
import com.boot.project_lupin.dto.OAuth2Response;
import com.boot.project_lupin.entity.UserEntity;
import com.boot.project_lupin.repository.UserRepository;
import jakarta.servlet.http.HttpSession; // HttpSession 사용
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    private final UserRepository userRepository;
    private final HttpSession session;  // HttpSession 주입

    public CustomOAuth2UserService(UserRepository userRepository, HttpSession session) {
        this.userRepository = userRepository;
        this.session = session;  // HttpSession 초기화
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

        OAuth2User oAuth2User = super.loadUser(userRequest);
        System.out.println(oAuth2User.getAttributes());

        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        OAuth2Response oAuth2Response;

        // Naver 로그인일 경우 처리
        if ("naver".equals(registrationId)) {
            oAuth2Response = new NaverResponse(oAuth2User.getAttributes());
        } else {
            return null;
        }

        // 사용자 정보 출력
        printUserInfo(oAuth2Response);

        // 사용자 이름과 OAuth2 공급자 ID로 username 생성
        String username = oAuth2Response.getProvider() + " " + oAuth2Response.getProviderId();

        // DB에서 사용자 조회
        UserEntity existData = userRepository.findByUsername(username);
        String role = "1";

        if (existData == null) {
            // 사용자 정보 DB에 저장
            UserEntity newUser = new UserEntity();
            newUser.setUsername(username);
            newUser.setName(oAuth2Response.getName());
            newUser.setGender(oAuth2Response.getGender());
            newUser.setBirthday(oAuth2Response.getBirthday());
            newUser.setBirthyear(oAuth2Response.getBirthYear());
            newUser.setMobile(oAuth2Response.getMobile());
            newUser.setEmail(oAuth2Response.getEmail());
            newUser.setRole(role);

            userRepository.save(newUser);
            System.out.println("새로 생성된 사용자 ID: " + newUser.getId());
        } else {
            // 기존 사용자 정보 업데이트
            existData.setEmail(oAuth2Response.getEmail());
            existData.setName(oAuth2Response.getName());
            existData.setGender(oAuth2Response.getGender());
            existData.setBirthday(oAuth2Response.getBirthday());
            existData.setBirthyear(oAuth2Response.getBirthYear());
            existData.setMobile(oAuth2Response.getMobile());
            role = existData.getRole();

            userRepository.save(existData);
        }

        // 사용자 정보 SecurityContext에 저장
        CustomOAuth2User customOAuth2User = new CustomOAuth2User(oAuth2Response, role);
        UsernamePasswordAuthenticationToken authentication =
                new UsernamePasswordAuthenticationToken(customOAuth2User, null, customOAuth2User.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);

        // 사용자 정보 세션에 저장
        session.setAttribute("user", customOAuth2User);  // 세션에 사용자 정보 저장

        return customOAuth2User;
    }

    // 사용자 정보를 출력하는 메서드
    private void printUserInfo(OAuth2Response oAuth2Response) {
        System.out.println("사용자 이름: " + oAuth2Response.getName());
        System.out.println("사용자 성별: " + oAuth2Response.getGender());
        System.out.println("사용자 생일: " + oAuth2Response.getBirthday());
        System.out.println("사용자 출생년도: " + oAuth2Response.getBirthYear());
        System.out.println("사용자 휴대폰번호: " + oAuth2Response.getMobile());
    }
}
