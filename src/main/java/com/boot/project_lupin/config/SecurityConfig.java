package com.boot.project_lupin.config;

import com.boot.project_lupin.service.CustomOAuth2UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

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
                        .requestMatchers("/css/**", "/js/**", "/images/**").permitAll()  // 정적 리소스 허용
                        .anyRequest().permitAll()  // 그 외 요청은 인증 없이 접근 허용
                );
        http
                .oauth2Login(oauth2 -> oauth2
//                        .loginPage("/loginPage")
                        .defaultSuccessUrl("/main", true)
                        .userInfoEndpoint(userInfo -> userInfo
                                .userService(customOAuth2UserService)));  // OAuth2 사용자 정보 설정

        return http.build();
    }


}
