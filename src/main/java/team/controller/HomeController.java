package team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/")
public class HomeController {
    
//    @ResponseBody//tells the controller to serialize the object into JSON and send it back to the HttpResponse object
//    @RequestMapping
//    public String showMessage(){
//        return "Hello from Spring Boot";
//    }
    
    @RequestMapping
    public String showHome(){
        return "home";
    }
    
    
    
//    @ResponseBody//tells the controller to serialize the object into JSON and send it back to the HttpResponse object
//    @RequestMapping("/person")
//    public Person showPerson(){
//        Person p = new Person(1, "Jack", 30);
//        return p;
//    }
}
