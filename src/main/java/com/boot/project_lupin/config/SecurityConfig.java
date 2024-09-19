package com.boot.project_lupin.config;

import com.boot.project_lupin.service.CustomOAuth2UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.firewall.StrictHttpFirewall;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final CustomOAuth2UserService customOAuth2UserService;

    public SecurityConfig(CustomOAuth2UserService customOAuth2UserService) {
        this.customOAuth2UserService = customOAuth2UserService;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
                .csrf(csrf -> csrf.disable())  // CSRF 비활성화

                .formLogin(login -> login
                        .loginPage("/loginPage")  // 로그인 페이지 설정
                        .permitAll())  // 로그인 페이지는 인증 없이 허용
                .httpBasic(basic -> basic.disable())  // HTTP Basic 인증 비활성화

                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/css/**", "/js/**", "/images/**").permitAll()  // 정적 리소스 허용
                        .requestMatchers("/managerAuction", "/managerAuctionRegist", "/managerCommission",
                                         "/managerQuestion", "/userInfo", "/userCommission", "/userBidList",
                                         "/userBuyList", "/userCommissionList", "/userQuestionList",
                                         "/userWishList", "/question")
                        .authenticated()  // 관리자 페이지 인증 요구
                        .anyRequest().permitAll()  // 그 외 요청은 인증 없이 접근 허용
                )

                .oauth2Login(oauth2 -> oauth2
                        .loginPage("/oauth2LoginPage")  // OAuth2 로그인 페이지
                        .defaultSuccessUrl("/main", true)  // 로그인 성공 시 /main 페이지로 이동
                        .userInfoEndpoint(userInfo -> userInfo
                                .userService(customOAuth2UserService)));  // OAuth2 사용자 정보 설정

        return http.build();
    }

    @Bean
    public HttpFirewall allowUrlEncodedDoubleSlashHttpFirewall() {
        StrictHttpFirewall firewall = new StrictHttpFirewall();
        firewall.setAllowUrlEncodedDoubleSlash(true);  // 중복 슬래시 허용
        return firewall;
    }
}
