package com.demo.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.demo.service.AccountService;



@EnableWebSecurity
@Configuration
public class SercutityConfiguration {
	@Autowired
	private AccountService accountService;

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
		httpSecurity.cors().and().csrf().disable();

		httpSecurity.authorizeRequests()
				.antMatchers("/home/**", "/aboutus/**").permitAll()
				.antMatchers("/hotel/**").access("hasRole('ROLE_HOTEL')")
				.antMatchers("/customer/**").access("hasRole('ROLE_CUSTOMER')")
				.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
				.antMatchers("/agent/**").access("hasRole('ROLE_AGENTSCS')")
				.and()
				.formLogin()
				.loginPage("/account/login").usernameParameter("username").passwordParameter("password")
				.loginProcessingUrl("/account/processlogin")
				.failureUrl("/account/login?error")
				.defaultSuccessUrl("/account/welcome")
				.and()
				.logout()
				.logoutUrl("/account/logout")
				.logoutSuccessUrl("/account/login")
				.and()
				.exceptionHandling().accessDeniedPage("/account/accessdenie")
				;

		return httpSecurity.build();

	}

	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {

		return new BCryptPasswordEncoder();

	}
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder builder) throws Exception {
		builder.userDetailsService(accountService);
	}
	
	
}
