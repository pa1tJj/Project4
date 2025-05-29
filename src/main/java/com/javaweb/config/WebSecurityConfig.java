package com.javaweb.config;

import com.javaweb.security.CustomSuccessHandler;
import com.javaweb.service.impl.CustomUserDetailService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    //tìm kiếm user theo username ở trong database khi người dùng đăng nhập...kiểm tra xem tài khoản có tồn tại hay không...nếu có thì kiểm tra ROLE của tài khoản đấy
    @Bean
    public UserDetailsService userDetailsService() {
        return new CustomUserDetailService();
    }

    //mã hóa mật khẩu theo một thuật toán mã hóa nào đó...ở đây theo BCryptPasswordEncoder()
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService());
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) {
        auth.authenticationProvider(authenticationProvider());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
                http.csrf().disable()
                .authorizeRequests()
                .antMatchers("/admin/building-edit","/admin/user-edit", "/admin/customer-edit").hasRole("MANAGER")//những api này chỉ có role MANAGER được quyền truy cập
                .antMatchers("/admin/**").hasAnyRole("MANAGER","STAFF","ADMIN")
                .antMatchers("/login", "/resource/**", "/trang-chu", "/api/**").permitAll()//k cần đăng nhập vẫn có thể truy cập đc những api này
                .and()
                .formLogin().loginPage("/login").usernameParameter("j_username").passwordParameter("j_password").permitAll()
                .loginProcessingUrl("/j_spring_security_check")
                .successHandler(myAuthenticationSuccessHandler())
                .failureUrl("/login?incorrectAccount").and()
                .logout().logoutUrl("/logout").deleteCookies("JSESSIONID")
                .and().exceptionHandling().accessDeniedPage("/access-denied").and()
                .sessionManagement().maximumSessions(1).expiredUrl("/login?sessionTimeout");
    }

    @Bean
    public AuthenticationSuccessHandler myAuthenticationSuccessHandler(){
        return new CustomSuccessHandler();
    }
}
