/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package team;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import team.service.UserService;

@EnableWebSecurity
public class MyWebSecurityConfigurer extends WebSecurityConfigurerAdapter {

    @Autowired
    UserService userService;
    
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
//        auth.inMemoryAuthentication()
//                .withUser("user").password("{noop}1234").roles("USER")
//                .and()
//                .withUser("admin").password("{noop}1234").roles("USER", "ADMIN");
//        
    }
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()//Restrict access based on HttpServletRequest
                //                 .antMatchers(HttpMethod.DELETE,"/admin/product").hasRole("ADMIN") //Πάραδειγμα για το πώς θα έχει πρόσβασει σε μία μέθοδο μόνο ένα συγκεκριμένο account (πχ. στη μέθοδο DELETE για το view ProduceCRUD θα έχει μονο ο admin πρόσβαση)
                //                .antMatchers("/product/manage").hasAnyRole("ADMIN", "TEACHER")
                //                 .antMatchers("product/view").hasAnyRole("USER")
                .antMatchers("/admin/**").hasRole("ADMIN")//Only Admin has access to /admin                
                .antMatchers("/user/**").hasAnyRole("USER", "ADMIN")
                .antMatchers("/").permitAll()
                
                .and()
                .formLogin()//We are changing the process of login
                .loginPage("/loginpage")//Show my form at this URL
                .loginProcessingUrl("/authenticate")//When submit button is pressed the request will be sent to this URL
                .permitAll()//Allow everyone to see login page. Don't have to be logged in.

                .and()
                .logout()
                .permitAll()
                .logoutSuccessUrl("/")
                
                .and().exceptionHandling().accessDeniedPage("/access-denied");
    }

    
    
    
     @Bean
    public DaoAuthenticationProvider authenticationProvider(){
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userService);
        provider.setPasswordEncoder(passwordEncoder());
        return provider;
    }
    
    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
}
