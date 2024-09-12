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
                .csrf(csrf -> csrf.disable()); // CSRF 비활성화

        http
                .formLogin(login -> login.disable());  // 폼 로그인 비활성화
        http
                .httpBasic(basic -> basic.disable());  // HTTP Basic 인증 비활성화
        http
                .authorizeHttpRequests(auth -> auth
                        .anyRequest().permitAll()  // 모든 요청에 인증 없이 접근 허용
                );
        http
                .oauth2Login(oauth2 -> oauth2
//                        .loginPage("/loginPage")
                        .defaultSuccessUrl("/main", true)
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
